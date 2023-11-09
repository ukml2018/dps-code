import os, logging, json
import time
import boto3
from pathlib import Path
from botocore.exceptions import ClientError

from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient, ContentSettings

logging.basicConfig(level=logging.INFO, format='%(asctime)s-%(name)s-%(levelname)s %(message)s')
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
        
    def copy_files(self, source_bucket: str, source_dir: str, target_bucket: str, target_dir: str, file_list = []) -> list:
        """Copy ${source_bucket}/${source_dir}/* to ${target_bucket}/${target_dir}/ if file_list was empty
        otherwise only copy files from file_list
        Two locations must be in same storage account.

        Args:
            source_bucket (str): source container
            source_dir (str): source dir
            target_bucket (str): target container
            target_dir (str): target dir
            file_list (list): Optional, a files filter list
        Return:
            copied_list: copied files list
        """
        s3_client = boto3.client('s3', aws_access_key_id=self.s3_key,
                                 aws_secret_access_key=self.s3_token,)
        
        #List all objects in the source bucket
        files, folders = self.get_file_folders(s3_client=s3_client, bucket_name=source_bucket, prefix=source_dir)
        
        copied_list = []
        #Loop through the objects and copy them to the destination bucket, ignore sub-folder
        for file in files:
            file_name = file.split('/')[-1]
            if len(file_list) == 0 or file_name in file_list: 
                # Copy the object
                s3_client.copy_object(
                    CopySource={'Bucket': source_bucket, 'Key': file},
                    Bucket=target_bucket,
                    Key=f'{target_dir}/{file_name}'
                )
                logger.info(f"{source_bucket}/{source_dir}/{file_name} copied to {target_bucket}/{target_dir}/{file_name}")
                copied_list.append(f"{target_bucket}/{target_dir}/{file_name}")
        
        return copied_list

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

    def upload_file(self, container_name: str, file_path: str, blob_path: str, content_type='text/html'):
        blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
        container_client = blob_service_client.get_container_client(container= container_name)
        cnt_settings = ContentSettings(content_type=content_type)

        logger.info(f'try to upload file {file_path}')
        try:
            with open(file_path, "rb") as data:
                container_client.upload_blob(name=blob_path, data=data, overwrite=True, content_settings=cnt_settings)   
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
    
    def copy_file(self, source_url, target_container, target_blob_with_path):
        """Copy ${source_url}/* to ${target_container}/${target_blob_path}
        Two locations must be in same storage account.

        Args:
            source_url (str): source url
            target_container (str): target container
            target_blob_with_path (str): target blob object with path

        """
        try:
            blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
            copied_blob = blob_service_client.get_blob_client(target_container, target_blob_with_path)
            # Copy started
            copied_blob.start_copy_from_url(source_url)
            for i in range(3):
                props = copied_blob.get_blob_properties()
                status = props.copy.status
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
        except Exception as e:
            logger.error("cp_container_dir error: " + str(e))
    
    
    def copy_files(self, source_container: str, source_dir: str, target_container: str, target_dir: str, file_list = []) -> list:
        """Copy ${source_container}/${source_dir}/* to ${target_container}/${target_dir}/ if file_list was empty
        otherwise only copy files from file_list
        Two locations must be in same storage account.

        Args:
            source_container (str): source container
            source_dir (str): source dir
            target_container (str): target container
            target_dir (str): target dir
            file_list (list): Optional, a files filter list
        Return:
            copied_list: copied files list
        """
        copied_list = []
        try:
            blob_service_client = BlobServiceClient.from_connection_string(self.az_blob_conn_str)
            source_container_client = blob_service_client.get_container_client(container= source_container)
            blob_list = source_container_client.list_blobs(name_starts_with = source_dir, include=['metadata'])
            
            for item in blob_list:
                if not item.metadata :
                    blob_client = blob_service_client.get_blob_client(source_container, item.name)
                    file_name = item.name.split('/')[-1]
                    if file_name in file_list or len(file_list) == 0:

                        source_url = blob_client.url
                        logger.info(f"Copy from {source_container}/{source_dir}/{file_name} to {target_container}/{target_dir}/{file_name}")
                        target_blob_path = f'{target_dir}/{file_name}'
                        copied_blob = blob_service_client.get_blob_client(target_container, target_blob_path)
                        # Copy started
                        copied_blob.start_copy_from_url(source_url)
                        for _ in range(3):
                            props = copied_blob.get_blob_properties()
                            status = props.copy.status
                            if status == "success":
                                # Copy finished
                                copied_list.append(target_blob_path)
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
                    
        except Exception as ex:
            logger.error(ex)
            
        return copied_list

def main():
    # s3_key = os.environ.get("s3_key")
    # s3_secret = os.environ.get("s3_secret")
    
    # s3utils = S3Utils(s3_key=s3_key, s3_token=s3_secret)
    
    # l = s3utils.copy_files(source_bucket="demo-bdw", source_dir="source", target_bucket="demo-bdw", target_dir="test")
    # logger.info(l)
    
    az_blob_conn_str = os.environ['AZURE_STORAGE_CONNECTION_STRING']
    azb = AzureBlobUtils(az_blob_conn_str=az_blob_conn_str)
    
    azb.upload_file(container_name='$web', file_path='/Users/aaron/workspace/dip/bdw-poc/dbts/bdw_consumption/target/index.html', blob_path='index.html')
if __name__ == '__main__':
    main()