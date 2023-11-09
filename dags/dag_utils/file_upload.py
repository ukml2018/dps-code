import os
import logging, json
from dag_utils.db_utils import COS_TYPE
from dag_utils.cos_utils import AzureBlobUtils, S3Utils
from dag_utils.kafka_utils import Kafka_Util

from cryptography.fernet import Fernet

logging.basicConfig(level=logging.INFO, format='%(asctime)s-%(name)s-%(levelname)s %(message)s')
logger = logging.getLogger(__name__)

def send_kafka_msg(batch_id: str, topic: str, files_list: list, pipeline_id: str, kafka_config_str: str, cos_conn_dict: dict, db_conn_dict: dict, bck_container: str, bck_dir: str) -> None:
    """Send a file copy message to kafka.

    Args:
        batch_id (str): batch id
        topic (str): topic name
        files_list (list): files path list
        pipeline_id: pipeline id from config table
        kafka_config_str (str): kafka connection string
        cos_conn_dict (dict): cos config dict
        db_conn_dict (dict): db config dict
        bck_container (str): backup cos container|bucket
        bck_dir (str): backup dir
    """
    content = {
                "pipeline_id": pipeline_id,
                "batch_id" : batch_id,
                "cos_conn_dict" : cos_conn_dict,
                "files_list": files_list,
                "db_conn_dict": db_conn_dict,
                "bck_container": bck_container,
                "bck_dir": bck_dir
                
            }
    
    kafka_util = Kafka_Util(kafka_config_str)
    logger.info("Try to send uploaded files list: {} to kafka topic: {} ".format(content, topic))
    kafka_util.send_message(msg_content=json.dumps(content), topic=topic)
    

def upload_files_to_cos(cos_type: str, cos_container: str, cos_dir: str, batch_id: str, file_list: list, options : dict) -> None:
    """Upload local files to a dir in Cloud Object Storage container/bucket

    Args:
        cos_type (str): Cloud type
        cos_container (str): Container/Bucket name
        cos_dir (str): COS directory
        file_list (list): A list contains local file path to be uploaded
        options (dict): Dict contains COS connection credentials and optional a kafka topic name and config string for COS and DB
    """
    
    if cos_type == COS_TYPE.Azure.name:
        upload_files_to_az(cos_container=cos_container, cos_dir= cos_dir, batch_id=batch_id, file_list=file_list, options=options)
    

def upload_files_to_az(cos_container: str, cos_dir: str, batch_id: str, file_list: list, options : dict) -> None:    
    """Upload local files to a directory from Azure Blob Storage container

    Args:
        cos_container (str): Blob container name
        cos_dir (str): Container directory
        file_list (list): A list contains local file path to be uploaded
        options (dict): {
                        'topic_name': 'kafka topic name(optional)',
                        'kafka_conf_str': kafka config string(optional),
                        'cos_conn_str': Azure Blob connection string,
                        'db_conn_str': sqlalchemy DB connection string,
                        'db_schema': db schema name     
                        } 
    """
    if 'cos_conn_str' not in options:
        logger.error("cos_conn_str is required but not provided!")
        return
    else:
        blob = AzureBlobUtils(options['cos_conn_str'])
        sent_files = []
        for file in file_list:
            try:
                if os.path.isfile(file):
                    file_name = os.path.basename(file)
                    cos_file_path = f'{cos_dir}/{file_name}'
                    blob.upload_file(container_name= cos_container, file_path= file, blob_path=cos_file_path)
                    logger.info("File: {} uploaded to container: {} path: {}.".format(file, cos_container, cos_file_path))
                    sent_files.append(cos_file_path)
                else:
                    logger.info("File: {} not existed.".format(file))
            except Exception as err:
                logger.error(err)
                
        if len(sent_files)>0 and ('topic_name' in options) and ('kafka_conf_str' in options):
            f = Fernet(options['encrypt_key'].encode())
            
            #Send a message to kafka topic
            cos_conn_dict = {
                "type": COS_TYPE.Azure.name, 
                "container": cos_container, 
                "conn_str": f.encrypt(options['cos_conn_str'].encode()).decode(),
                "url": options['cos_url']
            }
            
            db_conn_dict = {
                "conn_str": f.encrypt(options['db_conn_str'].encode()).decode(),
                "schema": options['db_schema']
            }
            
            
            send_kafka_msg(batch_id= batch_id, topic=options['topic_name'], files_list= sent_files, kafka_config_str=options['kafka_conf_str'], cos_conn_dict=cos_conn_dict, db_conn_dict=db_conn_dict, bck_container=options['bck_container'], bck_dir=options['bck_dir'])

def copy_files(cos_type: str, source_container: str, source_dir: str, cos_container: str, cos_dir: str, batch_id: str, files_list: list, pipeline_id: str, options : dict) -> None:
    """Copy files between two location from cloud storage account.

    Args:
        cos_type (str): COS type: Azure|AWS|GCP
        source_container (str): source container
        source_dir (str): source dir
        cos_container (str): target container
        cos_dir (str): target dir
        batch_id (str): batch id
        files_list (list): files to be copied
        pipeline_id: pipeline id in config table
        options (dict): {
                        'topic_name': 'kafka topic name(optional)',
                        'kafka_conf_str': kafka config string(optional),
                        'cos_conn_str': Azure Blob connection string,
                        'cos_key': S3 key,
                        'cos_key_secret': S3 key secrect,
                        'db_conn_str': sqlalchemy DB connection string,
                        'db_schema': db schema name     
                        } 
    """
    if cos_type == COS_TYPE.Azure.name:
        copy_files_az(source_container=source_container, source_dir=source_dir, cos_container=cos_container,  cos_dir=f'{cos_dir}/{batch_id}', batch_id=batch_id, files_list=files_list, pipeline_id=pipeline_id, options=options)
    elif cos_type == COS_TYPE.AWS.name:
        copy_files_aws(source_container=source_container, source_dir=source_dir, cos_container=cos_container,  cos_dir=f'{cos_dir}/{batch_id}', batch_id=batch_id, files_list=files_list, pipeline_id=pipeline_id, options=options)

def copy_files_az(source_container: str, source_dir: str, cos_container: str, cos_dir: str, batch_id: str, files_list: list, pipeline_id: str, options : dict) -> None:
    """Copy files between two location in same Azure storage account

    Args:
        source_container (str): source container
        source_dir (str): source dir
        cos_container (str): target container
        cos_dir (str): target dir
        batch_id (str): batch id
        files_list (list): files to be copied
        pipeline_id: pipeline id in config table
        options (dict): {
                        'topic_name': 'kafka topic name(optional)',
                        'kafka_conf_str': kafka config string(optional),
                        'cos_conn_str': Azure Blob connection string,
                        'db_conn_str': sqlalchemy DB connection string,
                        'db_schema': db schema name     
                        } 
    """
    if 'cos_conn_str' not in options:
        logger.error("cos_conn_str is required but not provided!")
        return
    else:
        blob = AzureBlobUtils(options['cos_conn_str'])
        sent_files = blob.copy_files(source_container=source_container, source_dir=source_dir, target_container=cos_container, target_dir=cos_dir, file_list=files_list)
                
        if len(sent_files)>0 and ('topic_name' in options) and ('kafka_conf_str' in options):
            f = Fernet(options['encrypt_key'].encode())
            
            #Send a message to kafka topic
            cos_conn_dict = {
                "type": COS_TYPE.Azure.name, 
                "container": cos_container, 
                "conn_str": f.encrypt(options['cos_conn_str'].encode()).decode(),
                "url": options['cos_url']
            }
            
            db_conn_dict = {
                "conn_str": f.encrypt(options['db_conn_str'].encode()).decode(),
                "schema": options['db_schema']
            }
            
            
            send_kafka_msg(batch_id= batch_id, topic=options['topic_name'], files_list= sent_files, pipeline_id=pipeline_id, kafka_config_str=options['kafka_conf_str'], cos_conn_dict=cos_conn_dict, db_conn_dict=db_conn_dict, bck_container=options['bck_container'], bck_dir=options['bck_dir'])

def copy_files_aws(source_container: str, source_dir: str, cos_container: str, cos_dir: str, batch_id: str, files_list: list, pipeline_id: str, options : dict) -> None:
    """Copy files between two location in AWS S3 

    Args:
        source_container (str): source container
        source_dir (str): source dir
        cos_container (str): target container
        cos_dir (str): target dir
        batch_id (str): batch id
        files_list (list): files to be copied
        pipeline_id: pipeline id in config table
        options (dict): {
                        'topic_name': 'kafka topic name(optional)',
                        'kafka_conf_str': kafka config string(optional),
                        'cos_conn_str': The iam_role used by copy sql,
                        'cos_key': S3 key,
                        'cos_key_secret': S3 key secrect,
                        'db_conn_str': sqlalchemy DB connection string,
                        'db_schema': db schema name     
                        } 
    """
    if 'cos_key' not in options:
        logger.error("cos_key is required but not provided!")
        return
    
    if 'cos_key_secret' not in options:
        logger.error("cos_key_secret is required but not provided!")
        return
    
    if 'cos_conn_str' not in options:
        logger.error("cos_conn_str is required but not provided!")
        return
    else:
        s3 = S3Utils(s3_key=options['cos_key'], s3_token=options['cos_key_secret'])
        sent_files = s3.copy_files(source_bucket=source_container, source_dir=source_dir, target_bucket=cos_container, target_dir=cos_dir, file_list=files_list)
                
        if len(sent_files)>0 and ('topic_name' in options) and ('kafka_conf_str' in options):
            f = Fernet(options['encrypt_key'].encode())
            
            #Send a message to kafka topic
            cos_conn_dict = {
                "type": COS_TYPE.AWS.name, 
                "container": cos_container, 
                "conn_str": f.encrypt(options['cos_conn_str'].encode()).decode(), #The iam_role used by COPY
            }
            
            db_conn_dict = {
                "conn_str": f.encrypt(options['db_conn_str'].encode()).decode(),
                "schema": options['db_schema']
            }
            
            
            send_kafka_msg(batch_id= batch_id, topic=options['topic_name'], files_list= sent_files, pipeline_id=pipeline_id, kafka_config_str=options['kafka_conf_str'], cos_conn_dict=cos_conn_dict, db_conn_dict=db_conn_dict, bck_container=options['bck_container'], bck_dir=options['bck_dir'])
            