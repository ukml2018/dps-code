import logging
from apscheduler.schedulers.blocking import BlockingScheduler
import requests

from model.batch_info import BatchInfo

# import sqlalchemy as sa
from sqlalchemy import func
from sqlalchemy import orm as sa_orm
from sqlalchemy import create_engine

from constant import *

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


"""
    Trigger client custom dag once data insertion finished
"""

def trigger_dag():
    datamesh_airflow_dagruns = f"{datamesh_backend_url}dags/{CUSTOM_DAG_ID}/dagRuns"

    headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
    }
    auth = (os.getenv("AIRFLOW_USER", "admin"), os.getenv("AIRFLOW_PWD", "admin"))

    result = requests.post(url=datamesh_airflow_dagruns,
                           headers=headers,
                           auth=auth,
                           json={},
                           verify=False)
    logger.info(f"Post connections to data mesh url {datamesh_airflow_dagruns} results: {result.content}")
    if result.status_code >= 200 and result.status_code < 300:
        return True
    else:
        return False


"""
    delete records by batch_id
"""

def delete_by_batchid(meta_session, batch_id):
    meta_session.query(BatchInfo).filter(BatchInfo.batch_id == batch_id).delete()
    meta_session.commit()

"""
    synchronize total count inserted rows of each table to metadata db
"""

def sync_batch_info(meta_session):
    # query batch info table from postgres

    tb_count_result = meta_session.query(BatchInfo.batch_id, func.count(BatchInfo.tb_name).label('cnt')).group_by(
        BatchInfo.batch_id).subquery()

    batch_id_result = meta_session.query(tb_count_result.c.batch_id).filter(tb_count_result.c.cnt == 19)

    meta_session.commit()

    for batch_id_row in batch_id_result:
        batch_id = batch_id_row[0]
        logger.info(f"batch_id: {batch_id}")
        loaded_count_result = meta_session.query(BatchInfo.tb_name, BatchInfo.loaded_count).filter(
            BatchInfo.batch_id == batch_id)
        is_trigger = True
        for loaded_count_row in loaded_count_result:
            tb_name = loaded_count_row[0]
            loaded_count = loaded_count_row[1]
            logger.info(f"tb_name: {tb_name}, loaded_count: {loaded_count}, total_target:{TABLE_COUNT_MAP[tb_name]}")
            if TABLE_COUNT_MAP[tb_name] != loaded_count:
                is_trigger = False
        if is_trigger and trigger_dag():
            # remove batch info records of batch_id
            delete_by_batchid(meta_session, batch_id)

    # for item in table_count_map.items():
    #     logger.info(f'{item[0]}:{item[1]}')
    #     meta_session.query(Txn.batch_id, func.count(Txn.batch_id).label('c')).group_by(Txn.batch_id).all()

if __name__ == '__main__':

    meta_engine = create_engine(os.getenv('PG_URL', 'postgresql://dpsdev:rdsPssw0rd!dps@dps-dev-rds-common.cf5vyqhifn0n.us-east-1.rds.amazonaws.com:5432/bdw-demo'))
    MataSession = sa_orm.sessionmaker()
    MataSession.configure(bind=meta_engine)
    meta_session = MataSession()

    scheduler = BlockingScheduler()
    s3_sync_job = scheduler.add_job(sync_batch_info, trigger='interval', seconds=10,
                                    kwargs={'meta_session': meta_session})
    scheduler.start()

    # scheduler = BackgroundScheduler()
    # s3_sync_job = scheduler.add_job(query_batch_count, trigger='interval', seconds=5 , kwargs={'session': session, 'schema': schema, 'table_name': 'completedtrans'})
    # scheduler.start()