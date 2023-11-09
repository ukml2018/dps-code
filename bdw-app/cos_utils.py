import os, logging, json
import time
import boto3
from pathlib import Path
from botocore.exceptions import ClientError

from azure.storage.blob import BlobServiceClient

logging.basicConfig(level=logging.INFO, format='%(asctime)s-%(name)s-%(levelname)s-%(message)s')
logger = logging.getLogger(__name__)

class S3Utils:
    def __init__(self, s3_key: str, s3_token: str) -> None:
        self.s3_key = s3_key
        self.s3_token = s3_token

    def upload_file(self, file_name, bucket, object_name=None):
        """Upload a file to an S3 bucket

        :param file_name: File to upload
        :param bucket: Bucket to upload to
        :param object_name: S3 object name. If not specified then file_name is used
        :return: True if file was uploaded, else False
        """

        # If S3 object_name was not specified, use file_name
        if object_name is None:
            object_name = os.path.basename(file_name)

        # Upload the file
        s3_client = boto3.client('s3', aws_access_key_id=self.s3_key,
                                 aws_secret_access_key=self.s3_token,)
        try:
            response = s3_client.upload_file(file_name, bucket, object_name)
        except ClientError as e:
            logging.error(e)
            return False
        return True
    
    def download_file(self, bucket_name: str, object_name: str, file_name: str):
        s3_client = boto3.client('s3', aws_access_key_id=self.s3_key,
                                 aws_secret_access_key=self.s3_token,)
        s3_client.download_file(bucket_name, object_name, file_name)
        
    def put_object(self, object, bucket_name: str, object_name=None):
        s3_client = boto3.client('s3', aws_access_key_id=self.s3_key,
                                 aws_secret_access_key=self.s3_token,)
        try:
            response = s3_client.put_object(Body=object, Bucket=bucket_name, Key=object_name)
        except ClientError as e:
            logging.error(e)
            return False
        return True
    
    def get_file_folders(self, s3_client, bucket_name, prefix=""):
        file_names = []
        folders = []

        default_kwargs = {
            "Bucket": bucket_name,
            "Prefix": prefix
        }
        next_token = ""

        while next_token is not None:
            updated_kwargs = default_kwargs.copy()
            if next_token != "":
                updated_kwargs["ContinuationToken"] = next_token

            response = s3_client.list_objects_v2(**default_kwargs)
            contents = response.get("Contents")

            for result in contents:
                key = result.get("Key")
                if key[-1] == "/":
                    folders.append(key)
                else:
                    file_names.append(key)

            next_token = response.get("NextContinuationToken")

        return file_names, folders


    def _download_files(self, s3_client, bucket_name, local_path, file_names, folders):

        local_path = Path(local_path)

        for folder in folders:
            folder_path = Path.joinpath(local_path, folder)
            folder_path.mkdir(parents=True, exist_ok=True)

        for file_name in file_names:
            file_path = Path.joinpath(local_path, file_name)
            file_path.parent.mkdir(parents=True, exist_ok=True)
            s3_client.download_file(
                bucket_name,
                file_name,
                str(file_path)
            )


    def download_files(self, bucket_name, local_path):
        s3_client = boto3.client('s3', aws_access_key_id=self.s3_key,
                                 aws_secret_access_key=self.s3_token,)

        file_names, folders = self.get_file_folders(s3_client, bucket_name)
        self._download_files(
            s3_client,
            bucket_name,
            local_path,
            file_names,
            folders
        )

class AzureBlobUtils:
    def __init__(self, az_blob_conn_str: str) -> None:
        self.az_blob_conn_str = az_blob_conn_str
        
    def store_dir_files_to_local(self, container_name: str, dir: str, local_root = 'blob'):
        try:
            blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
            container_client = blob_service_client.get_container_client(container= container_name) 
            blob_list = container_client.list_blobs(name_starts_with = dir, include=['metadata'])
            for blob in blob_list:
                logger.info(f"Name: {blob.name}, Meta: {blob.metadata}")
                if blob.metadata and blob.metadata['hdi_isfolder']:
                    folder = os.path.join(local_root, blob.name)
                    if not os.path.isdir(folder):
                        logger.info(f"Try to create folder: {folder}")
                        os.makedirs(folder)
                else:
                    blob_client = blob_service_client.get_blob_client(container=container_name, blob=blob.name)
                    with open(file=os.path.join(local_root, blob.name), mode="wb") as sample_blob:
                        download_stream = blob_client.download_blob()
                        sample_blob.write(download_stream.readall())
        
        except Exception as ex:
            logger.error(ex)
    
    def upload_dir_files(self, container_name: str, dir: str, excepts = []):
        blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
        container_client = blob_service_client.get_container_client(container= container_name)

        except_list = ['.user.yml', '.gitkeep', '.gitignore', 'target', 'logs']
        full_except = except_list + excepts

        for root, dirs, files in os.walk(dir):
            for file in files:
                file_path = os.path.join(root, file)
                file_name = os.path.basename(file_path)
                if full_except.count(file_name) == 0:
                    logger.info(f'try to upload file {file_path}')
                    blob = container_client.get_blob_client(file_path)
                    try:
                        with open(file_path, "rb") as data:
                            blob.upload_blob(data)   
                    except Exception as ex:
                        logger.error(ex)

    def upload_file(self, container_name: str, file_path: str, blob_path: str):
        blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
        container_client = blob_service_client.get_container_client(container= container_name)

        logger.info(f'try to upload file {file_path}')
        blob = container_client.get_blob_client(blob_path)
        try:
            with open(file_path, "rb") as data:
                blob.upload_blob(data)   
        except Exception as ex:
            logger.error(ex)
    
    def upload_data(self, container_name: str, name: str, data: str):
        blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
        container_client = blob_service_client.get_container_client(container= container_name)

        logger.info(f'try to upload blob name: {name}')
        try:
            container_client.upload_blob(name=name, data=data)   
        except Exception as ex:
            logger.error(ex)
    
    def delete_object(self, container_name: str, object_name: str):
        blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
        blob_client = blob_service_client.get_blob_client(container= container_name, blob=object_name)
        try:
            blob_client.delete_blob()
        except Exception as ex:
            logger.error(ex)
            
    def list_container_dir(self, container_name: str) -> list:
        """Return directories in the container.

        Args:
            container_name (str): container name

        Returns:
            list: dir list
        """
        dirs = []
        try:
            blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
            container_client = blob_service_client.get_container_client(container= container_name) 
            blob_list = container_client.list_blobs(include=['metadata'])
            for blob in blob_list:
                if blob.metadata and blob.metadata['hdi_isfolder']:
                    dirs.append(blob.name)
            
        except Exception as e:
            logger.error("list_container_dir error: " + str(e))
        
                
        return dirs
    
    def copy_file(self, source_url, target_container, target_blob_with_path) -> bool:
        try:
            blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
            copied_blob = blob_service_client.get_blob_client(target_container, target_blob_with_path)
            # Copy started
            copied_blob.start_copy_from_url(source_url)
            for i in range(3):
                props = copied_blob.get_blob_properties()
                status = props.copy.status
                logger.info("Copy file status: " + status)
                if status == "success":
                    # Copy finished
                    break
                time.sleep(1)

            if status != "success":
                # if not finished after 100s, cancel the operation
                props = copied_blob.get_blob_properties()
                logger.error(props.copy.status)
                copy_id = props.copy.id
                copied_blob.abort_copy(copy_id)
                props = copied_blob.get_blob_properties()
                logger.error(props.copy.status)
                return False
            return True
        except Exception as e:
            logger.error("cp_container_dir error: " + str(e))
            return False

if __name__ == '__main__':
    CONNECTION_STRING = 'xxx'
    source_url = 'https://adlsmdadmshdeveastus001.blob.core.windows.net/demo-bdw/landing-zone/20230926190717483117/completed_account.csv'
    azureBlobClient = AzureBlobUtils(CONNECTION_STRING)
    azureBlobClient.cp_file(source_url, 'raw-layer', 'bdw/2023/09/26/19/07/completed_account.csv')