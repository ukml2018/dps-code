import logging
from datetime import datetime

from airflow import DAG
from airflow.decorators import task
from airflow.models import Variable

from dag_utils import file_upload, db_utils
from dag_utils.db_utils import COS_TYPE

PROJECT_NAME = "bdw-poc"
BRANCH = "dev"
DBTS_DIR = "/opt/airflow/dbts"
DBT_PROJECT_DIR = f"{DBTS_DIR}/{PROJECT_NAME}"
DAGS_DIR = "/opt/airflow/dags/repo"

conf_db_conn_str = Variable.get("conf_db_conn_str_secret")
encrypt_key = Variable.get("encrypt_secret", "ThisIsAVeryLongKeyToEncryptsomthingforU!?2023092618150000")

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@task
def copy_csv(dag_run=None):
    batch_id = datetime.now().strftime('%Y%m%d%H%M%S%f')
    conf = dag_run.conf
    if not conf or not conf['pipeline_id']:
        logger.info("use default pipeline_id: 0")
        pipeline_id = 0
    else:
        pipeline_id = conf['pipeline_id']
    
    app_config = db_utils.load_config(conn_str=conf_db_conn_str, pipeline_id=pipeline_id)
    logger.info("App config: \n {}".format(app_config))
    
    conf_check = 0
    if 'files_list' not in app_config:
        logger.error("files_list must be provided in conf!")
        conf_check +=1
    
    if 'cos_container' not in app_config:
        logger.error("cos_container must be provided in conf!")
        conf_check +=1
    
    if 'cos_dir' not in app_config:
        logger.error("cos_dir must be provided in conf!")
        conf_check +=1

        
    if 'cos_type' not in app_config:
        logger.error("cos_type must be provided in conf!")
        conf_check +=1
    
    if conf_check > 0:
        logger.error("Missed required config, do nothing!")
        return
    
    files_list = app_config['files_list']
    source_container = app_config['source_container']
    cos_container = app_config['cos_container']
    cos_dir = app_config['cos_dir']
    source_dir = app_config['source_dir']
    cos_type = app_config['cos_type']
    cos_conn_str = app_config.get('cos_conn_str','')
    cos_key = app_config.get('cos_key', '')
    cos_key_secret = app_config.get('cos_key_secret', '')
    cos_url = app_config['cos_url']
    kafka_topic = app_config['kafka_topic']
    db_conn_str = db_utils.get_db_conn_str(db_type=app_config['conformed_db_type'], db_name=app_config['conformed_db_name'], db_server=app_config['conformed_db_server'], db_port=app_config['conformed_db_port'], db_user=app_config['conformed_db_user'], db_psw=app_config['conformed_db_psw'])
    bck_container = app_config['bck_container']
    bck_dir = app_config['bck_dir']
    kafka_bootstrap_server = app_config['kafka_bootstrap_server']
    
    if 'kafka_security_protocal' in app_config and app_config['kafka_security_protocal']:
        kafka_security_protocal = app_config['kafka_security_protocal']
        kafka_sasl_mechanisms = app_config['kafka_sasl_mechanisms']
        kafka_sasl_user = app_config['kafka_sasl_user']
        kafka_sasl_psw = app_config['kafka_sasl_psw']
        kafka_conf_str = f'{{"bootstrap.servers":"{kafka_bootstrap_server}","security.protocol":"{kafka_security_protocal}","sasl.mechanisms":"{kafka_sasl_mechanisms}","sasl.username":"{kafka_sasl_user}","sasl.password":"{kafka_sasl_psw}"}}'
    else:
        kafka_conf_str = f'{{"bootstrap.servers":"{kafka_bootstrap_server}"}}'
        
    logger.info("kafka conf str: {}".format(kafka_conf_str))
    
    if cos_type == COS_TYPE.Azure.name:
        options = {
            'cos_conn_str': cos_conn_str,
            'cos_url': cos_url,
            'topic_name': kafka_topic,
            'kafka_conf_str': kafka_conf_str,
            'db_conn_str': db_conn_str,
            'db_schema':'rawdata',
            'bck_container': bck_container,
            'bck_dir': bck_dir,
            'encrypt_key': encrypt_key
            }
        
        file_upload.copy_files(cos_type=COS_TYPE.Azure.name, source_container=source_container, source_dir=source_dir, cos_container=cos_container,  cos_dir=f'{cos_dir}', batch_id=batch_id, files_list=files_list, pipeline_id=pipeline_id, options=options)
    elif cos_type == COS_TYPE.AWS.name:
        options = {
            'cos_key': cos_key,
            'cos_key_secret': cos_key_secret,
            'cos_conn_str': cos_conn_str, #The iam_role used by copy sql
            'topic_name': kafka_topic,
            'kafka_conf_str': kafka_conf_str,
            'db_conn_str': db_conn_str,
            'db_schema':'rawdata',
            'bck_container': bck_container,
            'bck_dir': bck_dir,
            'encrypt_key': encrypt_key
            }
        
        file_upload.copy_files(cos_type=COS_TYPE.AWS.name, source_container=source_container, source_dir=source_dir, cos_container=cos_container,  cos_dir=f'{cos_dir}', batch_id=batch_id, files_list=files_list, pipeline_id=pipeline_id, options=options)
    
    
    
with DAG(
    "{}_{}_FullLoad".format(PROJECT_NAME, BRANCH),
    start_date=datetime(2022, 10, 1),
    description="Start to load all bdw csvs",
    schedule_interval=None,
    tags=[PROJECT_NAME, 'main'],
    catchup=False,
    max_active_runs=1,
    is_paused_upon_creation=False,
) as dag:
    copy_csv()