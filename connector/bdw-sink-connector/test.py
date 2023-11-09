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

from sqlalchemy import create_engine


from model.batch_info import BatchInfo

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

from constant import *

# build the sqlalchemy URL

# if SINK_DRIVER == 'snowflake':
#     from snowflake.sqlalchemy import URL

#     url = URL(
#         account=SINK_DB_ACCOUNT,
#         user=SINK_DB_USERNAME,
#         password=SINK_DB_PASSWORD,
#         database=SINK_DB_DATABASE,
#         schema=SINK_DRIVER,
#         warehouse=SINK_DB_WAREHOUSE,
#         role=SINK_DB_ROLE
#     )
# else:
#     from sqlalchemy.engine.url import URL

#     url = URL.create(
#         drivername=SINK_DRIVER,  # indicate redshift_connector driver and dialect will be used
#         host=SINK_DB_HOST,  # Amazon Redshift/Azure Synapse host
#         port=int(SINK_DB_PORT),  # Amazon Redshift/Azure Synapse port
#         database=SINK_DB_DATABASE,  # Amazon Redshift/Azure Synapse database
#         username=SINK_DB_USERNAME,  # Amazon Redshift/Azure Synapse username
#         password=SINK_DB_PASSWORD,  # Amazon Redshift/Azure Synapse password
#         query={
#             "driver": "ODBC Driver 18 for SQL Server",
#             "autocommit": "True",
#             # "TrustServerCertificate": "yes",
#             # "authentication": "ActiveDirectoryIntegrated",
#         } if SINK_DRIVER == 'mssql+pyodbc' else {}
#     )

meta_engine = create_engine(
    'postgresql://dpsdev:rdsPssw0rd!dps@dps-dev-rds-common.cf5vyqhifn0n.us-east-1.rds.amazonaws.com:5432/bdw-demo')

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
    session.add_all(rec_list)
    session.commit()
    # loaded_count = query_count(session, batch_id, table_bo_map[table_name])
    session.remove()
    logger.info(f'---finish_bulk_insertion of {table_name}---')


def my_consumer_error_cb(e):
    logger.error(f'consumer error callback:{e}')

def consume_messages(schema):
    # create sqlalchemy session for bulk insertion

    schema = SINK_DB_SCHEMA
    max_thread_pool_workers = int(os.getenv("MAX_WORKERS", "32"))
    pool = concurrent.futures.ThreadPoolExecutor(max_workers=int(max_thread_pool_workers/2))

    futures = []

    kafka_topic_list = list(TOPIC_MAP.values())
    logger.info(f"Start consuming messages of {kafka_topic_list}......")
    kafka_group_id = os.getenv('kafka_group_id', 'GROUP_LOCAL')
    # Create Kafka consumer configuration
    consumer_config = {
        'bootstrap.servers': 'PLAINTEXT://localhost:9092',
        'group.id': kafka_group_id,
        # 'security.protocol': 'PLAINTEXT',
        # 'sasl.mechanisms': 'PLAIN',
        # # 'sasl.jaas.config': 'org.apache.kafka.common.security.plain.PlainLoginModule required username="admin" password="admin-secret";': 
        # 'sasl.username': 'admin',
        # 'sasl.password': 'admin',
        # 'max.poll.interval.ms': 600000,
        # 'error_cb': my_consumer_error_cb
    }

    # from confluent_kafka import Consumer
    # class KafkaConsumer:
    #     def __init__(self, brokers, group):
    #         config = dict()
    #         config['bootstrap.servers'] = brokers
    #         config['group.id'] = group
    #         config['auto.offset.reset'] = 'earliest'
    #         self.consumer = Consumer(config)
    #         def subscribe(self, topics):self.consumer.subscribe(topics=topics)def pull(self):while True:msg = self.consumer.poll(1.0)if msg is None:continueif msg.error():print("Consumer error: {}".format(msg.error()))continueprint('Received message: {}'.format(msg.value().decode('utf-8')))def close(self):self.consumer.close()if __name__ == "__main__":consumer = KafkaConsumer("127.0.0.1:9092", "test_group1")consumer.subscribe(['test001'])consumer.pull()consumer.close()


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
                # table_name = create_tb_on_demand(engine, schema, msg.topic())
                # if 'rows' in data and isinstance(data['rows'], list):
                    # If data is a JSON array, perform a bulk insert
                # logger.info(f'engine status: {engine.pool.status()}')
                futures.append(pool.submit(simulate_wait, period=5.0))
                logger.info(f'thread pool max workers size:{pool._max_workers}')
                logger.info(f'thread pool work queue size:{pool._work_queue.qsize()}')

                # else:
                    # If data is a single JSON object, insert it into Redshift
                    # insert_to_db(engine, schema, msg.topic(), msg.timestamp()[1], data)
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
def simulate_wait(period):
    time.sleep(period)


if __name__ == '__main__':

    # absolute_path = os.path.dirname(__file__)
    # full_path = os.path.join(absolute_path, "config/bigquery_keyfile.json")
    # if SINK_DRIVER == 'bigquery':
    #     if os.path.isfile(full_path):
    #         engine = sa.create_engine('bigquery://', credentials_path=full_path, 
    #                                   ignore_no_transaction_on_rollback=True, 
    #                                   pool_size=int(os.getenv("MAX_WORKERS", "10")), 
    #                                   max_overflow=0)
    # else:
    #     if SINK_DRIVER == 'mssql+pyodbc':
    #         import pyodbc
    #         pyodbc.pooling = False
    #     engine = sa.create_engine(url, ignore_no_transaction_on_rollback=True, 
    #                               pool_size=int(os.getenv("MAX_WORKERS", "10")), 
    #                               max_overflow=0)

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
    logger.info(f'------finish sink connector testing within {datetime.now() - start_time}------')
    
