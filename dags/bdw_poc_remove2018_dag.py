import logging
from datetime import datetime

from sqlalchemy import create_engine, text

from airflow import DAG
from airflow.decorators import task
from airflow.models import Variable
from airflow.operators.bash import BashOperator

from dag_utils import db_utils

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
def clean_up(dag_run=None):
    """
    Clear up 2018 transactions from both conformed and consumption tables
    """
    batch_id = datetime.now().strftime('%Y%m%d%H%M%S%f')
    conf = dag_run.conf
    if not conf or not conf['pipeline_id']:
        logger.info("use default pipeline_id: 1")
        pipeline_id = 1
    else:
        pipeline_id = conf['pipeline_id']
    
    app_config = db_utils.load_config(conn_str=conf_db_conn_str, pipeline_id=pipeline_id)
    logger.info("App config: \n {}".format(app_config))
    
    db_conn_str = db_utils.get_db_conn_str(db_type=app_config['conformed_db_type'], db_name=app_config['conformed_db_name'], db_server=app_config['conformed_db_server'], db_port=app_config['conformed_db_port'], db_user=app_config['conformed_db_user'], db_psw=app_config['conformed_db_psw'])
    # Create the SQLAlchemy engine
    if app_config['conformed_db_type'] == db_utils.DB_TYPE.Synapse.value:
        engine = create_engine(db_conn_str, future=True, ignore_no_transaction_on_rollback=True)
    else:
        engine = create_engine(db_conn_str, future=True)
    
    with engine.connect() as connection:
        del_sql = f"delete from conformed.txn where txn_dt >= '2018-01-01' and txn_dt <= '2018-12-31'"
        try:
            connection.execute(text(del_sql))
            connection.commit()
            logger.info("2018 trans deleted from conformed.")
        except Exception as err:
            logger.error(err)
            connection.rollback()
            
    db_conn_str = db_utils.get_db_conn_str(db_type=app_config['consumption_db_type'], db_name=app_config['consumption_db_name'], db_server=app_config['consumption_db_server'], db_port=app_config['consumption_db_port'], db_user=app_config['consumption_db_user'], db_psw=app_config['consumption_db_psw'])
    # Create the SQLAlchemy engine
    if app_config['consumption_db_type'] == db_utils.DB_TYPE.Synapse.value:
        engine = create_engine(db_conn_str, future=True, ignore_no_transaction_on_rollback=True)
    else:
        engine = create_engine(db_conn_str, future=True)
    
    with engine.connect() as connection:
        del_sql = f"delete from consumption.transactions where trans_date >= '2018-01-01' and trans_date <= '2018-12-31'"
        try:
            connection.execute(text(del_sql))
            connection.commit()
            logger.info("2018 trans deleted from consumption.")
        except Exception as err:
            logger.error(err)
            connection.rollback()
    
with DAG(
    "{}_{}_Remove2018".format(PROJECT_NAME, BRANCH),
    start_date=datetime(2022, 10, 1),
    description="Clear up 2018 transactions",
    schedule_interval=None,
    tags=[PROJECT_NAME, 'main'],
    catchup=False,
    max_active_runs=1,
    is_paused_upon_creation=False,
) as dag:
    
    clean_up()