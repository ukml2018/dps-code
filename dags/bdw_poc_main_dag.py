import logging, json, requests
from datetime import datetime, timedelta
from sqlalchemy import create_engine, text
import subprocess, os

from airflow import DAG
from airflow.decorators import task
from airflow.models import Variable
from airflow.operators.bash import BashOperator

from dag_utils.cos_utils import AzureBlobUtils
from dag_utils.db_utils import COS_TYPE
from dag_utils import airflow_utils, db_utils

from cryptography.fernet import Fernet

PROJECT_NAME = "bdw-poc"
BRANCH = "dev"

conf_db_conn_str = Variable.get("conf_db_conn_str_secret")
encrypt_key = Variable.get("encrypt_secret", "ThisIsAVeryLongKeyToEncryptsomthingforU!?2023092618150000")

DBTS_DIR = "/opt/airflow/dbts"
DAGS_DIR = "/opt/airflow/dags/repo"

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
        
@task
def prepare_dbt_project(dag_run=None):
    conf = dag_run.conf
    if 'pipeline_id' not in conf or 'batch_id' not in conf:
        logger.error("pipeline_id and batch_id should be provided from dag run conf!")
    
    else:
        pipeline_id = conf['pipeline_id']
        app_config = db_utils.load_config(conn_str=conf_db_conn_str, pipeline_id=pipeline_id)
        conformed_project = app_config['conformed_dbt_project']
        consumption_project = app_config['consumption_dbt_project']
        cmd = f"rm -fr {DBTS_DIR}/* && cp -fr {DAGS_DIR}/dbts/*  {DBTS_DIR}/ \
                && ls -l {DBTS_DIR} && . ~/.dbt-env/bin/activate \
                && dbt deps --project-dir {DBTS_DIR}/{conformed_project} \
                && dbt deps --project-dir {DBTS_DIR}/{consumption_project}"
        result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        logger.info("stdout: {}".format(result.stdout))
    
@task
def build_conformed(dag_run=None):
    conf = dag_run.conf
    if 'pipeline_id' not in conf or 'batch_id' not in conf:
        logger.error("pipeline_id and batch_id should be provided from dag run conf!")
    
    else:
        pipeline_id = conf['pipeline_id']
        app_config = db_utils.load_config(conn_str=conf_db_conn_str, pipeline_id=pipeline_id)
        logger.debug(app_config)
        batch_nbr = conf['batch_id']
        db_type = app_config['conformed_db_type']
        secrets = {
            'DB_SERVER': app_config['conformed_db_server'],
            'DB_NAME': app_config['conformed_db_name'], 
            'DB_PORT': app_config['conformed_db_port'],
            'DB_USER': app_config['conformed_db_user'],
            'DB_PASSWORD': app_config['conformed_db_psw'],
            'DB_SCHEMA': 'conformed'
        }
    
        dbt_env = airflow_utils.get_dbt_env(db_type = db_type, secrets= secrets)
        conformed_project = app_config['conformed_dbt_project']
        conformed_dbt_models : str = app_config['conformed_dbt_models']
        new_envs = os.environ.copy()
        new_envs.update(dbt_env)
        logger.debug("dbt_env: {}".format(new_envs))
        
        if conformed_dbt_models:
            conformed_dbt_models = conformed_dbt_models.replace(","," ")
            select_str = conformed_dbt_models
        else:
            select_str = "./models/conformed"
        cmd = f". /home/airflow/.dbt-env/bin/activate \
                && dbt run -s \"{select_str}\" --vars '{{batch_nbr: {batch_nbr} }}'" + f" --profiles-dir {DBTS_DIR}/{conformed_project}/config --project-dir {DBTS_DIR}/{conformed_project} \
                && dbt docs generate -s package:{conformed_project}" + f" --profiles-dir {DBTS_DIR}/{conformed_project}/config --project-dir {DBTS_DIR}/{conformed_project}"
        
        logger.info("dbt cmd: {}".format(cmd))
        
        result = subprocess.run(cmd, env=new_envs, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        print("DBT done. \n{}".format(result.stdout.decode()))
        
        cos_type = app_config['cos_type']
        file_list = ['/opt/airflow/dbts/bdw_conformed/target/index.html', '/opt/airflow/dbts/bdw_conformed/target/catalog.json', '/opt/airflow/dbts/bdw_conformed/target/manifest.json']
        # container = app_config['cos_container']
        container = '$web'
        cos_path = 'conformed'
        if cos_type == COS_TYPE.Azure.name:
            cos_conn_str = app_config.get('cos_conn_str','')
            blob = AzureBlobUtils(cos_conn_str)
            
            # Upload dbt docs to static folder in container
            for file in file_list:
                try:
                    if os.path.isfile(file):
                        file_name = os.path.basename(file)
                        cos_file_path = f'{cos_path}/{file_name}'
                        blob.upload_file(container_name= container, file_path= file, blob_path=cos_file_path)
                        logger.info("File: {} uploaded to container: {} path: {}.".format(file, container, cos_file_path))
                    else:
                        logger.info("File: {} not existed.".format(file))
                except Exception as err:
                    logger.error(err)
            
  
    
@task    
def send_conformed(dag_run=None):
    conf = dag_run.conf
    if 'pipeline_id' not in conf or 'batch_id' not in conf:
        logger.error("pipeline_id and batch_id should be provided from dag run conf!")
    
    else:
        pipeline_id = conf['pipeline_id']
        app_config = db_utils.load_config(conn_str=conf_db_conn_str, pipeline_id=pipeline_id)
        el_rest = app_config['el_rest'] + '/api/trigger'
        f = Fernet(encrypt_key.encode())
        conformed_db_user = f.encrypt(app_config['conformed_db_user'].encode()).decode()
        conformed_db_psw = f.encrypt(app_config['conformed_db_psw'].encode()).decode()
        
        consumption_db_user = f.encrypt(app_config['consumption_db_user'].encode()).decode()
        consumption_db_psw = f.encrypt(app_config['consumption_db_psw'].encode()).decode()
        
        conformed_dbt_models = app_config['conformed_dbt_models']
        
        if conformed_dbt_models:
            models = conformed_dbt_models.split(",")
        else:
            models = []
        
        content = {
                "pipeline_id": pipeline_id,
                "batch_id" : conf['batch_id'],
                "files_list": app_config['files_list'].split(","),
                "conformed_db_server": app_config['conformed_db_server'],
                "conformed_db_name": app_config['conformed_db_name'], 
                "conformed_db_port": app_config['conformed_db_port'],
                "conformed_db_user": conformed_db_user,
                "conformed_db_psw": conformed_db_psw,
                "conformed_db_schema": "conformed",
                "conformed_dbt_models": models,
                "consumption_db_server": app_config['consumption_db_server'],
                "consumption_db_name": app_config['consumption_db_name'], 
                "consumption_db_port": app_config['consumption_db_port'],
                "consumption_db_user": consumption_db_user,
                "consumption_db_psw": consumption_db_psw,
                "consumption_db_schema": "conformed"
            }
        
        json_body = json.dumps(content)
        
        logger.info("el_rest api: {}".format(el_rest))
        logger.info("el_rest body: {}".format(json_body))
        response = requests.post(el_rest, timeout=300, json=content)
        logger.info("Send conformed response: {}".format(response))

@task
def build_consumption(dag_run=None):
    conf = dag_run.conf
    if 'pipeline_id' not in conf or 'batch_id' not in conf:
        logger.error("pipeline_id and batch_id should be provided from dag run conf!")
    
    else:
        batch_nbr = conf['batch_id']
        pipeline_id = conf['pipeline_id']
        app_config = db_utils.load_config(conn_str=conf_db_conn_str, pipeline_id=pipeline_id)
        logger.debug(app_config)
        consumption_project = app_config['consumption_dbt_project']
        consumption_dbt_models = app_config['consumption_dbt_models']
        db_type = app_config['consumption_db_type']
        secrets = {
            'DB_SERVER': app_config['consumption_db_server'],
            'DB_NAME': app_config['consumption_db_name'], 
            'DB_PORT': app_config['consumption_db_port'],
            'DB_USER': app_config['consumption_db_user'],
            'DB_PASSWORD': app_config['consumption_db_psw'],
            'DB_SCHEMA': 'consumption'
        }
        dbt_env = airflow_utils.get_dbt_env(db_type = db_type, secrets= secrets)
        new_envs = os.environ.copy()
        new_envs.update(dbt_env)
        logger.debug("dbt_env: {}".format(new_envs))
        
        if consumption_dbt_models:
            consumption_dbt_models = consumption_dbt_models.replace(","," ")
            select_str = consumption_dbt_models
        else:
            select_str = "./models/consumption"
        cmd = f". /home/airflow/.dbt-env/bin/activate \
                && dbt run -s \"{select_str}\" --vars '{{batch_nbr: {batch_nbr} }}'" + f" --profiles-dir {DBTS_DIR}/{consumption_project}/config --project-dir {DBTS_DIR}/{consumption_project} \
                && dbt docs generate -s package:{consumption_project}" + f" --profiles-dir {DBTS_DIR}/{consumption_project}/config --project-dir {DBTS_DIR}/{consumption_project}"
        
        logger.info("dbt cmd: {}".format(cmd))
        
        result = subprocess.run(cmd, env=new_envs, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        print("DBT done. \n{}".format(result.stdout.decode()))
        
        cos_type = app_config['cos_type']
        file_list = ['/opt/airflow/dbts/bdw_consumption/target/index.html', '/opt/airflow/dbts/bdw_consumption/target/catalog.json', '/opt/airflow/dbts/bdw_consumption/target/manifest.json']
        # container = app_config['cos_container']
        container = '$web'
        cos_path = 'consumption'
        if cos_type == COS_TYPE.Azure.name:
            cos_conn_str = app_config.get('cos_conn_str','')
            blob = AzureBlobUtils(cos_conn_str)
            
            # Upload dbt docs to static folder in container
            for file in file_list:
                try:
                    if os.path.isfile(file):
                        file_name = os.path.basename(file)
                        cos_file_path = f'{cos_path}/{file_name}'
                        # cos_file_path = file_name
                        blob.upload_file(container_name= container, file_path= file, blob_path=cos_file_path)
                        logger.info("File: {} uploaded to container: {} path: {}.".format(file, container, cos_file_path))
                    else:
                        logger.info("File: {} not existed.".format(file))
                except Exception as err:
                    logger.error(err)
    
with DAG(
    "{}_{}_main_dag".format(PROJECT_NAME, BRANCH),
    start_date=datetime(2022, 10, 1),
    description="Build conformed and consumption models.",
    schedule_interval=None,
    tags=[PROJECT_NAME, 'main'],
    catchup=False,
    max_active_runs=1,
    is_paused_upon_creation=False,
) as dag:    
    prepare_dbt_project() >> build_conformed() >> send_conformed() >> build_consumption()