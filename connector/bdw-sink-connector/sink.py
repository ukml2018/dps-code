import argparse
from concurrent.futures import as_completed
from datetime import datetime
import os, time
import concurrent.futures

import json, logging
from confluent_kafka import Consumer, KafkaError, KafkaException
from confluent_kafka.error import ConsumeError

# from apscheduler.schedulers.background import BackgroundScheduler

import sqlalchemy as sa
from sqlalchemy import func
from sqlalchemy import orm as sa_orm
from sqlalchemy import exc

from sqlalchemy import create_engine
# from sqlalchemy.schema import CreateTable
from sqlalchemy.ext.declarative import declarative_base

from model.batch_info import BatchInfo

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

from constant import *

# build the sqlalchemy URL

if SINK_DRIVER == 'snowflake':
    from snowflake.sqlalchemy import URL

    url = URL(
        account=SINK_DB_ACCOUNT,
        user=SINK_DB_USERNAME,
        password=SINK_DB_PASSWORD,
        database=SINK_DB_DATABASE,
        schema=SINK_DRIVER,
        warehouse=SINK_DB_WAREHOUSE,
        role=SINK_DB_ROLE
    )
else:
    from sqlalchemy.engine.url import URL

    url = URL.create(
        drivername=SINK_DRIVER,  # indicate redshift_connector driver and dialect will be used
        host=SINK_DB_HOST,  # Amazon Redshift/Azure Synapse host
        port=int(SINK_DB_PORT),  # Amazon Redshift/Azure Synapse port
        database=SINK_DB_DATABASE,  # Amazon Redshift/Azure Synapse database
        username=SINK_DB_USERNAME,  # Amazon Redshift/Azure Synapse username
        password=SINK_DB_PASSWORD,  # Amazon Redshift/Azure Synapse password
        query={
            "driver": "ODBC Driver 18 for SQL Server",
            "LongAsMax": "Yes",
            "autocommit": "True"
            # "TrustServerCertificate": "yes",
            # "authentication": "ActiveDirectoryIntegrated",
        } if SINK_DRIVER == 'mssql+pyodbc' else {}
    )

meta_engine = create_engine(
    'postgresql://dpsdev:rdsPssw0rd!dps@dps-dev-rds-common.cf5vyqhifn0n.us-east-1.rds.amazonaws.com:5432/bdw-demo')

"""
    query row count of the specific batch
"""


def query_count(session, batch_id, bo_class):
    result = session.query(bo_class).filter(bo_class.batch_id == batch_id).count()
    # session.commit()
    logger.info(f'------count result of {bo_class.__tablename__}------')
    logger.info(result)
    return result


# def query_batch_count(session, schema, table_name):
#     loaded_count = {}

#     if sa.inspect(engine).has_table(table_name, schema=schema):
#         result = session.query(Txn.batch_id, func.count(Txn.batch_id).label('c')).group_by(Txn.batch_id).all()

#         logger.info('------batch count result------')
#         if result is not None:
#             for item in result:
#                 logger.info(f'Batch ID {item[0]} count: {item[1]}')
#                 loaded_count[item[0]] = item[1]
#     return loaded_count

"""
    bulk insertion of rows
"""

def create_tb_on_demand(engine, schema, topic) -> str:
    # create table if not exists
    table_name = ''
    for key, value in TOPIC_MAP.items():
        if value == topic:
            table_name = key

    logger.info(schema + "," + topic + "," + table_name)
    logger.info(f"Is schema {schema} contains {table_name}? {sa.inspect(engine).has_table(table_name, schema=schema)}")
    if (not sa.inspect(engine).has_table(table_name, schema=schema)) and (not sa.inspect(engine).has_table(table_name.lower(), schema=schema.lower())):
        table_bo_map[table_name].__table__.create(engine)
        logger.info(f"{table_name} has been created.")

    return table_name

def insert_to_db_bulk(engine, data_list, table_name, msg_ts, batch_id):

    session_factory = sa_orm.sessionmaker(bind=engine)
    session = sa_orm.scoped_session(session_factory)

    rec_list = []
    for index, data in enumerate(data_list):
        data['batch_id'] = batch_id
        data['loaded_time'] = msg_ts
        data['id'] = f"{msg_ts}-{index}"
        new_rec = table_bo_map[table_name](data)
        rec_list.append(new_rec)
    logger.info(f'---start_bulk_insertion of {table_name}---')
    try:
        session.add_all(rec_list)
        session.commit()
        # loaded_count = query_count(session, batch_id, table_bo_map[table_name])
        session.remove()
        logger.info(f'---finish_bulk_insertion of {table_name}---')
    except exc.SQLAlchemyError as e:
        logger.error(f'SQLAlchemyError when bulk insert:{e}')
    

    # update loaded_count number in metadata db
    
    # meta_session_factory = sa_orm.sessionmaker(bind=meta_engine, autocommit=True)
    # meta_session = sa_orm.scoped_session(meta_session_factory)

    # if sa.inspect(meta_engine).has_table('batch_info', schema='metadata'):
    #     result = meta_session.query(BatchInfo).filter(BatchInfo.batch_id == batch_id,
    #                                                   BatchInfo.tb_name == table_name).all()
    #     logger.info(f"meta result count: {len(result)}")
    #     if len(result) == 0:
    #         batch_info_rec = BatchInfo(batch_id=batch_id, tb_name=table_name, total_count=TABLE_COUNT_MAP[table_name],
    #                                    loaded_count=loaded_count)
    #         meta_session.add(batch_info_rec)
    #     else:
    #         meta_session.query(BatchInfo).filter(BatchInfo.batch_id == batch_id,
    #                                              BatchInfo.tb_name == table_name).update(
    #             {BatchInfo.total_count: TABLE_COUNT_MAP[table_name], BatchInfo.loaded_count: loaded_count},
    #             synchronize_session=False)
    #     # meta_session.commit()

    # meta_session.remove()


def insert_to_db(engine, schema, topic, msg_ts, data):
    Session = sa_orm.sessionmaker()
    Session.configure(bind=engine)
    session = Session()

    table_name = ''
    for key, value in TOPIC_MAP.items():
        if value == topic:
            table_name = key

    logger.info(schema + "," + topic + "," + table_name)

    if not sa.inspect(engine).has_table(table_name, schema=schema):
        table_bo_map[table_name].__table__.create(engine)

    data['loaded_time'] = msg_ts
    data['id'] = msg_ts
    new_rec = table_bo_map[table_name](data)

    # new_rec = Txn(
    #         trans_id = data['trans_id'],
    #         type = data['type'],
    #         bank = data['bank'] if data['bank'] != 'NULL' else None,
    #         account_id = data['account_id'],
    #         operation = data['operation'],
    #         k_symbol = data['k_symbol'],
    #         account = data['account'],
    #         year = data['year'],
    #         month = data['month'],
    #         day = data['day'],
    #         amount = data['amount'],
    #         fulltime = data['fulltime'],
    #         fulldate = data['fulldate'],
    #         fulldatewithtime = data['fulldatewithtime'],
    #         balance = data['balance'],
    #         batch_id = data['batch_id']
    # )
    session.add(new_rec)
    session.commit()
    session.close()


# # parse message
# def parse_message(message):
#     # Try to parse the message as a JSON array
#     try:
#         message_list = json.loads(message)
#         # If the message is a JSON array, return the list of messages
#         return message_list
#     except json.JSONDecodeError:
#         # If parsing as a JSON array fails, try parsing as a single JSON object
#         try:
#             single_message = json.loads(message)
#             # Wrap the single message in a list and return
#             return [single_message]
#         except json.JSONDecodeError:
#             # If parsing both as a JSON array and a single object fails,
#             # handle the error here, e.g., log and skip the message
#             return []


# """
#     Trigger client custom dag once data insertion finished
# """


# def trigger_dag():
#     datamesh_airflow_dagruns = f"{datamesh_backend_url}dags/{CUSTOM_DAG_ID}/dagRuns"

#     headers = {
#         "Accept": "application/json",
#         "Content-Type": "application/json"
#     }
#     auth = (os.getenv("AIRFLOW_USER", "admin"), os.getenv("AIRFLOW_PWD", "admin"))

#     result = requests.post(url=datamesh_airflow_dagruns,
#                            headers=headers,
#                            auth=auth,
#                            json={},
#                            verify=False)
#     logger.info(f"Post connections to data mesh url {datamesh_airflow_dagruns} results: {result.content}")
#     if result.status_code >= 200 and result.status_code < 300:
#         return True
#     else:
#         return False

"""
    consume kafka message of all source connector topics
"""
def my_consumer_error_cb(e):
    logger.error(f'consumer error callback:{e}')

def consume_messages(schema):
    # create sqlalchemy session for bulk insertion

    # Session = sa_orm.sessionmaker()
    # Session.configure(bind=engine)
    # session = Session()

    schema = SINK_DB_SCHEMA
    max_thread_pool_workers = int(os.getenv("MAX_WORKERS", "2"))
    pool = concurrent.futures.ThreadPoolExecutor(max_workers=int(max_thread_pool_workers/2))

    futures = []

    kafka_topic_list = list(TOPIC_MAP.values())
    logger.info(f"Start consuming messages of {kafka_topic_list}......")
    kafka_group_id = os.getenv('kafka_group_id', 'GROUP_BDW_K8S')
    # Create Kafka consumer configuration
    consumer_config = {
        'bootstrap.servers': KAFKA_BOOTSTRAP_SERVERS,
        'group.id': kafka_group_id,
        'security.protocol': KAFKA_SECURITY_PROTOCOL,
        'sasl.mechanisms': KAFKA_SASL_MECHANISM,
        'sasl.username': KAFKA_SASL_USERNAME,
        'sasl.password': KAFKA_SASL_PASSWORD,
        'max.poll.interval.ms': 600000,
        'error_cb': my_consumer_error_cb
    }

    consumer = Consumer(consumer_config)

    # Subscribe to the topic
    # logger.info(kafka_topic_list)
    consumer.subscribe(kafka_topic_list)

    try:
        while True:
            msg = consumer.poll(0.0)

            if msg is None:
                if len(futures) > 0:
                    for future in as_completed(futures):
                        futures.remove(future)
                        logger.info(f'After remove - thread pool work queue size :{pool._work_queue.qsize()}')
                        logger.info(f'future length:{len(futures)}')
                        logger.info(f'After remove - engine status: {engine.pool.status()}')
                        # if pool._work_queue.qsize() > 0:
                        #     futures.append(pool._work_queue.get())
                        #     logger.info(f'After retrieve - thread pool work queue size :{pool._work_queue.qsize()}')
                continue
            if msg.error():
                if msg.error().code() == KafkaError._PARTITION_EOF:
                    logger.info('End of partition reached, exiting...')
                else:
                    logger.error('Error while consuming message: {}'.format(msg.error()))
                continue
            else:
                try:
                    json_text = msg.value().decode('utf-8')
                    # logger.info('Received message: {}'.format(json_text))
                    logger.info('msg metadata:')
                    logger.info(msg.timestamp()[1])
                    # logger.info(msg.headers())
                    data = json.loads(json_text)
                except json.JSONDecodeError as e:
                    logger.error('Error decoding JSON message: {}'.format(e))
                    continue  # Skip processing this message
                # logger.info("------data------")
                # logger.info(data)
                # logger.info("------")
                table_name = create_tb_on_demand(engine, schema, msg.topic())
                if 'rows' in data and isinstance(data['rows'], list):
                    # If data is a JSON array, perform a bulk insert
                    logger.info(f'engine status: {engine.pool.status()}')
                    futures.append(pool.submit(insert_to_db_bulk, engine=engine,
                                         table_name=table_name, data_list=data['rows'], msg_ts=msg.timestamp()[1],
                                         batch_id=data['batch_id']))
                    logger.info(f'thread pool max workers size:{pool._max_workers}')
                    logger.info(f'thread pool work queue size:{pool._work_queue.qsize()}')

                else:
                    # If data is a single JSON object, insert it into Redshift
                    insert_to_db(engine, schema, msg.topic(), msg.timestamp()[1], data)
                # for f in as_completed(futures):
                #     result = f.result()
                #     futures.remove(f)
                #     logger.info('Future done {}'.format(f))

    except ConsumeError as e:
        logger.error(f'consumer exception:{e}')

    except KafkaException as e:
        logger.error(f'Kafka exception:{e}')
    except KeyboardInterrupt:
        print('User interrupted, stopping consumer...')

    finally:
        consumer.close()
        # session.close()


"""
    local test function without dependency on kafka
"""


def test(pool, engine, schema, topic):
    # create sqlalchemy session for bulk insertion

    # Session = sa_orm.sessionmaker()
    # Session.configure(bind=engine, autocommit=True)
    # session = Session()

    schema = 'rawdata'

    data = '{"batch_id": "20230824143828831676", "total": 29, "sequence": 1, "rows": [{"row": 734044, "trans_id": "T00733597", "account_id": "A00002507", "type": "Debit", "operation": "Cash Withdrawal", "amount": 1300, "balance": 30951.4, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "13:56:36", "fulldatewithtime": "2018-01-01T13:56:36"}, {"row": 734045, "trans_id": "T00799525", "account_id": "A00002726", "type": "Debit", "operation": "Cash Withdrawal", "amount": 2760, "balance": 79264.4, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "13:43:30", "fulldatewithtime": "2018-01-01T13:43:30"}, {"row": 734046, "trans_id": "T00799963", "account_id": "A00002728", "type": "Debit", "operation": "Cash Withdrawal", "amount": 3200, "balance": 62735.6, "k_symbol": null, "bank": null, "account": 0.0, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "0.542118056", "fulldatewithtime": "2018-01-01T12:60:39"}, {"row": 734047, "trans_id": "T00801636", "account_id": "A00002733", "type": "Debit", "operation": "Cash Withdrawal", "amount": 390, "balance": 35140.8, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "11:37:58", "fulldatewithtime": "2018-01-01T11:37:58"}, {"row": 734048, "trans_id": "T00799151", "account_id": "A00002724", "type": "Debit", "operation": "Cash Withdrawal", "amount": 8700, "balance": 41905.2, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "16:43:14", "fulldatewithtime": "2018-01-01T16:43:14"}, {"row": 734049, "trans_id": "T01042058", "account_id": "A00003564", "type": "Debit", "operation": "Cash Withdrawal", "amount": 2100, "balance": 33402.0, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "11:27:06", "fulldatewithtime": "2018-01-01T11:27:06"}, {"row": 734050, "trans_id": "T00651882", "account_id": "A00002227", "type": "Credit", "operation": "Credit in Cash", "amount": 7000, "balance": 71977.9, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "15:27:03", "fulldatewithtime": "2018-01-01T15:27:03"}, {"row": 734051, "trans_id": "T00655158", "account_id": "A00002240", "type": "Debit", "operation": "Cash Withdrawal", "amount": 6000, "balance": 60148.4, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "16:07:23", "fulldatewithtime": "2018-01-01T16:07:23"}, {"row": 734052, "trans_id": "T00656458", "account_id": "A00002243", "type": "Debit", "operation": "Cash Withdrawal", "amount": 3480, "balance": 42781.7, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "8:24:52", "fulldatewithtime": "2018-01-01T08:24:52"}, {"row": 734053, "trans_id": "T00654848", "account_id": "A00002239", "type": "Debit", "operation": "Cash Withdrawal", "amount": 1000, "balance": 42039.9, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "14:09:17", "fulldatewithtime": "2018-01-01T14:09:17"}, {"row": 734054, "trans_id": "T00654348", "account_id": "A00002237", "type": "Debit", "operation": "Cash Withdrawal", "amount": 13700, "balance": 50914.4, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "16:13:39", "fulldatewithtime": "2018-01-01T16:13:39"}, {"row": 734055, "trans_id": "T00692249", "account_id": "A00002365", "type": "Debit", "operation": "Cash Withdrawal", "amount": 720, "balance": 25074.0, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "12:30:08", "fulldatewithtime": "2018-01-01T12:30:08"}, {"row": 734056, "trans_id": "T00696478", "account_id": "A00002381", "type": "Debit", "operation": "Cash Withdrawal", "amount": 700, "balance": 43109.6, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "15:40:23", "fulldatewithtime": "2018-01-01T15:40:23"}, {"row": 734057, "trans_id": "T02356986", "account_id": "A00007774", "type": "Debit", "operation": "Cash Withdrawal", "amount": 9600, "balance": 91757.0, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "11:13:07", "fulldatewithtime": "2018-01-01T11:13:07"}, {"row": 734058, "trans_id": "T02314937", "account_id": "A00007636", "type": "Debit", "operation": "Cash Withdrawal", "amount": 15400, "balance": 61856.4, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "8:57:52", "fulldatewithtime": "2018-01-01T08:57:52"}, {"row": 734059, "trans_id": "T02343761", "account_id": "A00007733", "type": "Debit", "operation": "Cash Withdrawal", "amount": 7200, "balance": 67167.0, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "8:08:20", "fulldatewithtime": "2018-01-01T08:08:20"}, {"row": 734060, "trans_id": "T02309021", "account_id": "A00007618", "type": "Debit", "operation": "Cash Withdrawal", "amount": 4800, "balance": 14085.6, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "15:50:01", "fulldatewithtime": "2018-01-01T15:50:01"}, {"row": 734061, "trans_id": "T02308009", "account_id": "A00007614", "type": "Debit", "operation": "Cash Withdrawal", "amount": 4500, "balance": 58620.9, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "8:20:51", "fulldatewithtime": "2018-01-01T08:20:51"}, {"row": 734062, "trans_id": "T02343745", "account_id": "A00007733", "type": "Debit", "operation": "Cash Withdrawal", "amount": 23400, "balance": 43767.0, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "15:49:31", "fulldatewithtime": "2018-01-01T15:49:31"}, {"row": 734063, "trans_id": "T02699037", "account_id": "A00008931", "type": "Debit", "operation": "Cash Withdrawal", "amount": 5100, "balance": 27887.0, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "16:23:36", "fulldatewithtime": "2018-01-01T16:23:36"}, {"row": 734064, "trans_id": "T02715678", "account_id": "A00008982", "type": "Credit", "operation": "Credit in Cash", "amount": 33231, "balance": 105867.0, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "10:03:23", "fulldatewithtime": "2018-01-01T10:03:23"}, {"row": 734065, "trans_id": "T03424371", "account_id": "A00011362", "type": "Debit", "operation": "Cash Withdrawal", "amount": 2700, "balance": 25148.2, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "11:35:03", "fulldatewithtime": "2018-01-01T11:35:03"}, {"row": 734066, "trans_id": "T03431174", "account_id": "A00011382", "type": "Debit", "operation": "Cash Withdrawal", "amount": 7200, "balance": 60315.2, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "13:33:31", "fulldatewithtime": "2018-01-01T13:33:31"}, {"row": 734067, "trans_id": "T00919672", "account_id": "A00003134", "type": "Debit", "operation": "Cash Withdrawal", "amount": 840, "balance": 53455.0, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "9:12:20", "fulldatewithtime": "2018-01-01T09:12:20"}, {"row": 734068, "trans_id": "T00917930", "account_id": "A00003129", "type": "Debit", "operation": "Cash Withdrawal", "amount": 480, "balance": 25237.2, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "13:59:50", "fulldatewithtime": "2018-01-01T13:59:50"}, {"row": 734069, "trans_id": "T00919281", "account_id": "A00003133", "type": "Debit", "operation": "Cash Withdrawal", "amount": 2280, "balance": 25014.4, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "16:59:13", "fulldatewithtime": "2018-01-01T16:59:13"}, {"row": 734070, "trans_id": "T00920494", "account_id": "A00003136", "type": "Debit", "operation": "Cash Withdrawal", "amount": 2500, "balance": 62900.5, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "11:53:50", "fulldatewithtime": "2018-01-01T11:53:50"}, {"row": 734071, "trans_id": "T00964800", "account_id": "A00003287", "type": "Debit", "operation": "Cash Withdrawal", "amount": 19500, "balance": 33814.5, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "10:03:43", "fulldatewithtime": "2018-01-01T10:03:43"}, {"row": 734072, "trans_id": "T01064425", "account_id": "A00003636", "type": "Debit", "operation": "Cash Withdrawal", "amount": 4100, "balance": 59551.4, "k_symbol": null, "bank": null, "account": null, "year": 2018, "month": 1, "day": 1, "fulldate": "1/1/2018", "fulltime": "12:18:19", "fulldatewithtime": "2018-01-01T12:18:19"}]}'
    data = json.loads(data)

    table = create_tb_on_demand(engine, schema, topic=topic)
    if 'rows' in data and isinstance(data['rows'], list):
        # If data is a JSON array, perform a bulk insert
        # insert_to_db_bulk(engine, data['rows'], table, datetime.now(), data['batch_id'])
        pool.submit(insert_to_db_bulk, engine=engine,
                                table_name=table, data_list=data['rows'], msg_ts=datetime.now(),
                                batch_id=data['batch_id'])
        logger.info(f'thread pool max workers size:{pool._max_workers}')
        logger.info(f'thread pool work queue size:{pool._work_queue.qsize()}')
        logger.info(f'thread pool threads:{pool._threads}')
    else:
        # If data is a single JSON object, insert it into Redshift
        insert_to_db(engine, schema, table, datetime.now(), data)

    # session.close()

    # TODO: upload batch data without batch_id to S3 storage


# """
#     delete records by batch_id
# """


# def delete_by_batchid(meta_session, batch_id):
#     meta_session.query(BatchInfo).filter(BatchInfo.batch_id == batch_id).delete()
#     meta_session.commit()


# """
#     scheduled synchorization of batch info in metadata postgre DB
# """


# def sync_batch_info(meta_session):
#     # query batch info table from postgres

#     tb_count_result = meta_session.query(BatchInfo.batch_id, func.count(BatchInfo.tb_name).label('cnt')).group_by(
#         BatchInfo.batch_id).subquery()

#     batch_id_result = meta_session.query(tb_count_result.c.batch_id).filter(tb_count_result.c.cnt == 19)

#     meta_session.commit()

#     for batch_id_row in batch_id_result:
#         batch_id = batch_id_row[0]
#         loaded_count_result = meta_session.query(BatchInfo.tb_name, BatchInfo.loaded_count).filter(
#             BatchInfo.batch_id == batch_id)
#         is_trigger = True
#         for loaded_count_row in loaded_count_result:
#             tb_name = loaded_count_row[0]
#             loaded_count = loaded_count_row[1]
#             logger.info(f"tb_name: {tb_name}, loaded_count: {loaded_count}, total_target:{TABLE_COUNT_MAP[tb_name]}")
#             if TABLE_COUNT_MAP[tb_name] == loaded_count:
#                 is_trigger = False
#         if is_trigger and trigger_dag():
#             # remove batch info records of batch_id
#             delete_by_batchid(meta_session, batch_id)

# for item in table_count_map.items():
#     logger.info(f'{item[0]}:{item[1]}')
#     meta_session.query(Txn.batch_id, func.count(Txn.batch_id).label('c')).group_by(Txn.batch_id).all()


if __name__ == '__main__':

    # parser = argparse.ArgumentParser(description='Consume Kafka messages and insert into Redshift.')
    # parser.add_argument('kafka_topic', type=str, default='DEMO_BDW_TXN',
    #                     help='The Kafka topic to consume messages from.')
    # parser.add_argument('schema', type=str, default='rawdata',
    #                     help='The schema name in Redshift to insert data into.')
    # parser.add_argument('table', type=str, default='completedtrans',
    #                     help='The table name in Redshift to insert data into.')
    # args = parser.parse_args()
    absolute_path = os.path.dirname(__file__)
    full_path = os.path.join(absolute_path, "config/bigquery_keyfile.json")
    if SINK_DRIVER == 'bigquery':
        if os.path.isfile(full_path):
            engine = sa.create_engine('bigquery://', credentials_path=full_path, 
                                      ignore_no_transaction_on_rollback=True, 
                                      pool_size=int(os.getenv("MAX_WORKERS", "10")), 
                                      max_overflow=0)
    else:
        if SINK_DRIVER == 'mssql+pyodbc':
            import pyodbc
            pyodbc.pooling = False
        engine = sa.create_engine(url, 
                                  ignore_no_transaction_on_rollback=True, 
                                  fast_executemany=True,
                                  pool_size=int(os.getenv("MAX_WORKERS", "10")), 
                                  max_overflow=0)

    # # create sqlalchemy session for scheduler
    # Session = sa_orm.sessionmaker()
    # Session.configure(bind=engine)
    # session = Session()

    # schema = 'rawdata'

    # scheduler = BackgroundScheduler()
    # s3_sync_job = scheduler.add_job(query_batch_count, trigger='interval', seconds=5 , kwargs={'session': session, 'schema': schema, 'table_name': 'completedtrans'})
    # scheduler.start()

    # create metadata pg session for scheduler

    # meta_engine = create_engine('postgresql://dpsdev:rdsPssw0rd!dps@dps-dev-rds-common.cf5vyqhifn0n.us-east-1.rds.amazonaws.com:5432/bdw-demo')
    # MataSession = sa_orm.sessionmaker()
    # MataSession.configure(bind=meta_engine)
    # meta_session = MataSession()

    # scheduler = BackgroundScheduler()
    # s3_sync_job = scheduler.add_job(sync_batch_info, trigger='interval', seconds=10,
    #                                 kwargs={'meta_session': meta_session})
    # scheduler.start()

    # consume_messages(args.kafka_topic, args.schema, args.table)
    start_time = datetime.now()
    logger.info(f'------start sink connector------')

    consume_messages('rawdata')
    # pool = concurrent.futures.ThreadPoolExecutor(max_workers=int(os.getenv("MAX_WORKERS", "10")))

    
    # for k,v in TOPIC_MAP.items():
    #     logger.info(engine.pool.status())
    #     test(pool, engine, 'rawdata', v)
    # trigger_dag(batch_id='20230901154715860113')
    logger.info(f'------finish sink connector testing within {datetime.now() - start_time}------')
    while True:
        time.sleep(10)
    # scheduler.shutdown()
    # meta_session.close()
