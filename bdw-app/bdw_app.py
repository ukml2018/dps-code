from datetime import datetime
import os

import json, logging, requests

from db_utils import *
from confluent_kafka import Consumer, KafkaError, KafkaException
from confluent_kafka.error import ConsumeError

from azure.storage.blob import ContainerClient
from azure.storage.blob import BlobClient
from azure.storage.blob import BlobType

from cryptography.fernet import Fernet

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

from constants import *
from cos_utils import *

fernet_key = os.getenv("FERNET_KEY", "xxx")
fernet = Fernet(fernet_key.encode())

def trigger_airflow_dag(batch_id, pipeline_id) -> bool:
    # Once finished triggering with Response status 200

    payload = {}
    payload['conf'] = {
        'batch_id': batch_id,
        'pipeline_id': pipeline_id
    }

    airflow_dagrun_url = f"{AIRFLOW_URL}/api/v1/dags/{MAIN_DAG_ID}/dagRuns"

    headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
    }
    auth = (os.getenv("AIRFLOW_USER", "admin"), os.getenv("AIRFLOW_PWD", "xxx"))

    result = requests.post(url=airflow_dagrun_url,
                           headers=headers,
                           auth=auth,
                           json=payload,
                           verify=False)
    logger.info(f"Post connections to airflow {airflow_dagrun_url} results: {result.content}")
    if result.status_code >= 200 and result.status_code < 300:
        return True
    else:
        return False
    

# def backup_to_cos(data, project_dir, connection_string, source_container_name, target_container_name):
#     batch_id = data['batch_id']
#     files_list = data['files_list']
#     target_subpath = f"{project_dir}/{batch_id[0:4]}/{batch_id[4:6]}/{batch_id[6:8]}/{batch_id[8:10]}/{batch_id[10:12]}"
    
#     container = ContainerClient.from_connection_string(conn_str=connection_string,
#                                             container_name=source_container_name)
#     blob_list = container.list_blobs()
#     logger.info("----source blobs----")
#     for blob in blob_list:
#         if blob.blob_type == BlobType.BLOCKBLOB:
#             logger.info(blob.name)

#     for file in files_list:
#         file_name = file.split('/')[2]
#         blob = BlobClient.from_connection_string(conn_str=connection_string, container_name=source_container_name, blob_name=file)
#         with open(f"./{file_name}", "wb") as file:
#             blob_data = blob.download_blob()
#             blob_data.readinto(file)

#         target_file = f"{target_subpath}/{file_name}"
#         blob = BlobClient.from_connection_string(conn_str=connection_string, container_name=target_container_name, blob_name=target_file)

#         with open(f"./{file_name}", "rb") as data:
#             blob.upload_blob(data, overwrite=True)

#     container = ContainerClient.from_connection_string(conn_str=connection_string,
#                                             container_name=target_container_name)
#     blob_list = container.list_blobs()
#     logger.info("----target blobs----")
#     for blob in blob_list:
#         if blob.blob_type == BlobType.BLOCKBLOB:
#             logger.info(blob.name)


def backup_to_cos(data, project_dir, connection_string, source_cos_path, target_container_name):
    batch_id = data['batch_id']
    files_list = data['files_list']
    target_subpath = f"{project_dir}/{batch_id[0:4]}/{batch_id[4:6]}/{batch_id[6:8]}/{batch_id[8:10]}/{batch_id[10:12]}"

    for file in files_list:
        file_name = file.split('/')[2]
        source_url = f'{source_cos_path}/{file_name}'

        logger.info(f"backup_source_cos_path: {source_cos_path}")
        logger.info(f"target_container_name: {target_container_name}")
        logger.info(f"target_subpath_with_filename: {target_subpath}/{file_name}")
        logger.info(f"connection_string: {connection_string}")
        logger.info(f"source_url: {source_url}")

        azureBlobClient = AzureBlobUtils(connection_string)
        if not azureBlobClient.copy_file(source_url, target_container_name, f'{target_subpath}/{file_name}'):
            return False
        
    return True


def my_consumer_error_cb(e):
    logger.error(f'consumer error callback:{e}')


"""
    consume kafka message of all source connector topics
"""
def consume_messages():

    kafka_topic_list = list(KAFKA_TOPIC_LIST)
    logger.info(f"Start consuming messages of {kafka_topic_list}......")
    kafka_group_id = KAFKA_CONSUMER_GROUP
    # Create Kafka consumer configuration
    consumer_config = {
        'bootstrap.servers': KAFKA_BOOTSTRAP_SERVERS,
        'group.id': kafka_group_id,
        # 'security.protocol': KAFKA_SECURITY_PROTOCOL,
        # 'sasl.mechanisms': KAFKA_SASL_MECHANISM,
        # 'sasl.username': KAFKA_SASL_USERNAME,
        # 'sasl.password': KAFKA_SASL_PASSWORD,
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
                    logger.info('Received message: {}'.format(json_text))
                    logger.info('msg metadata:')
                    logger.info(msg.timestamp()[1])
                    # logger.info(msg.headers())
                    data = json.loads(json_text)
                except json.JSONDecodeError as e:
                    logger.error('Error decoding JSON message: {}'.format(e))
                    continue  # Skip processing this message
                
                """
                sample msg:
                {
                    "batch_id": "20230920063528572311",
                    "cos_conn_dict": {"type": "Azure", "container": "demo-bdw", "conn_str":"", "url": ""},
                    "files_list": [
                        "landing-zone/20230920063528572311/completed_account.csv",
                        "landing-zone/20230920063528572311/completed_card.csv",
                        "landing-zone/20230920063528572311/completed_client.csv"
                    ],
                    "db_conn_dict":{"conn_str":"","schema":""},
                    "bck_container":"raw-layer",
                    "bck_dir":"bdw"
                }
                """    

                if 'batch_id' in data and \
                    'pipeline_id' in data and \
                    'cos_conn_dict' in data and \
                    'db_conn_dict' in data and \
                    isinstance(data['files_list'], list):

                    logger.info(f'batch_id: {data["batch_id"]}')

                    raw_csv_list = []
                    path_suffix = ""
                    for file in data['files_list']:
                        if len(file.split('/')) == 3:
                            raw_csv_list.append(file.split('/')[2])
                            path_suffix = f"{file.split('/')[0]}/{file.split('/')[1]}"

                    start_time = datetime.now()
                    logger.info(f'------start sink connector------')

                    source_cos_path = f"{data['cos_conn_dict']['url']}/{data['cos_conn_dict']['container']}/{path_suffix}"
                    load_csv_from_cos(data['cos_conn_dict']['type'],
                                      rawdata_schema=data['db_conn_dict']['schema'], 
                                      conn_str=fernet.decrypt(data['db_conn_dict']['conn_str'].encode()).decode(), 
                                      csv_list=raw_csv_list, cos_path=source_cos_path)
                    
                    trigger_airflow_dag(data["batch_id"], data["pipeline_id"])

                    backup_to_cos(data, 
                                  project_dir=data['bck_dir'], 
                                  connection_string=fernet.decrypt(data['cos_conn_dict']['conn_str'].encode()).decode(),
                                  source_cos_path = source_cos_path,
                                  target_container_name=data['bck_container'])

                    logger.info(f'------finish sink connector testing within {datetime.now() - start_time}------')
                    

    except ConsumeError as e:
        logger.error(f'consumer exception:{e}')

    except KafkaException as e:
        logger.error(f'Kafka exception:{e}')
    except KeyboardInterrupt:
        print('User interrupted, stopping consumer...')

    finally:
        consumer.close()
        # session.close()


if __name__ == '__main__':

    # server_name = os.environ.get("SYNAPSE_DB_SERVER", "synps-ws-mda-dev-eastus-001.sql.azuresynapse.net")
    # database_name = os.environ.get("SYNAPSE_DB_NAME", "BDW")
    # username = os.environ.get("SYNAPSE_DB_USER", "sqladminuser")
    # password = os.environ.get("SYNAPSE_DB_PASSWORD", "xxx")

    # Specify the connection string
    # db_connection_string = f"mssql+pyodbc://{username}:{password}@{server_name}/{database_name}?driver=ODBC+Driver+18+for+SQL+Server"
    
    consume_messages()
   

