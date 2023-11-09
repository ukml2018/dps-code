import json, logging, os, uuid
import numpy as np
import pyodbc
from pathlib import Path
import concurrent.futures

import pandas as pd
from pandas.errors import EmptyDataError

import boto3
from botocore.exceptions import ClientError
from requests import Response

import sqlalchemy as sa
from sqlalchemy import func
from sqlalchemy import orm as sa_orm
from sqlalchemy import exc

from sqlalchemy import create_engine
from constant import *
from datetime import datetime

# from airflow.models import Variable

import pyspark, sys, logging
from pyspark.sql import SparkSession
from pyspark import SparkContext
import pyspark.sql.functions as F

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

logger.info("pyspark version: {}".format(pyspark.__version__))
logger.info("Python version : {}".format(sys.version))

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

# s3_key = Variable.get("s3_key", "s3key")
# s3_secret = Variable.get("s3_secret", "s3secret")

# s3_key = os.environ.get("s3_key")
# s3_secret = os.environ.get("s3_secret")

s3_key = "AKIAXREGA2DOFQOLHHXY"
s3_secret = "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"
bucket = 'demo-bdw-dev'
        
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
    
    def get_df(self, bucket_name: str, object_name=None) -> pd.DataFrame:
        s3_client = boto3.client('s3', aws_access_key_id=self.s3_key,
                                 aws_secret_access_key=self.s3_token,)
        try:
            response = s3_client.get_object(Bucket=bucket_name, Key=object_name)
            status = response.get("ResponseMetadata", {}).get("HTTPStatusCode")
            logger.info(f'status:{status}')
            if status == 200:
                response_df = pd.read_csv(response.get("Body"))
                logger.info(response_df.shape)
            else:
                logger.error(f"Unsuccessful S3 get_object response. Status - {status}")
        except ClientError as e:
            logging.error(f's3 client error:{e}')
            return None
        return response_df


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


def pandas_to_synapse(bucket_name, table_name, batch_id): 
    s3 = S3Utils(s3_key, s3_secret)
    csv_file = "completed_transaction.csv"
    df = s3.get_df(bucket_name, csv_file)

    # if SINK_DRIVER == 'mssql+pyodbc':
    #     import pyodbc
    #     pyodbc.pooling = False
    # engine = sa.create_engine(url, 
    #                             ignore_no_transaction_on_rollback=True, 
    #                             fast_executemany=True,
    #                             pool_size=int(os.getenv("MAX_WORKERS", "10")), 
    #                             max_overflow=0)
    
    # data_list = json.loads(df.to_json(orient="records"))
    # insert_to_db_bulk(engine, data_list, table_name, datetime.now(), batch_id)

    sparkSession = SparkSession.builder \
        .appName("Insert to Synapse using Spark") \
        .config('spark.jars.packages', 'com.microsoft.azure:spark-mssql-connector_2.12:1.3.0-BETA,com.microsoft.sqlserver:mssql-jdbc:12.4.1.jre11') \
        .getOrCreate()

    logger.info("Spark version: {}".format(sparkSession.sparkContext.version))


    # .config('spark.jars.packages', 'com.microsoft.azure:spark-mssql-connector_2.12_3.0:1.0.0-alpha,com.microsoft.sqlserver:mssql-jdbc:8.4.1.jre8') \
    # .config('spark.jars', '/Users/dianadu/opt/miniconda3/envs/synapse/lib/python3.9/site-packages/pyspark/jars/mssql-jdbc-12.4.1.jre8.jar') \

    SINK_DB_USERNAME = os.getenv("SINK_DB_USERNAME", "sqladminuser")
    SINK_DB_PASSWORD = os.getenv("SINK_DB_PASSWORD", "xxx")
    SINK_DB_HOST = os.getenv("SINK_DB_HOST", "synps-ws-mda-dev-eastus-001.sql.azuresynapse.net")
    SINK_DB_DATABASE = os.getenv("SINK_DB_DATABASE", "BDW")

    SINK_DB_PORT = 1433

    DB_SCHEMA = 'rawdata'

    url = 'jdbc:sqlserver://{}:{};database={}'.format(
        SINK_DB_HOST,
        SINK_DB_PORT,
        SINK_DB_DATABASE
    )

    # df = sparkSession.read \
    #     .format("com.microsoft.sqlserver.jdbc.spark") \
    #     .option("url", url) \
    #     .option("dbtable", f'{DB_SCHEMA}."crm_reviews"') \
    #     .option("user", SINK_DB_USERNAME) \
    #     .option("driver", "com.microsoft.sqlserver.jdbc.SQLServerDriver") \
    #     .option("password", SINK_DB_PASSWORD).load()  
    # from pyspark.sql.functions import monotonically_increasing_id
    # df = df.withColumn("id", monotonically_increasing_id())
    # logger.info(type(df))
    # df.printSchema()

    df = df.drop('date').drop('stars').drop('reviews').drop('product').drop('loaded_time').drop('batch_id')
    # sparkSession.conf.set(
    #     "fs.azure.account.key.adlsmdadmshdeveastus001.dfs.core.windows.net",
    #     "j1tvqEWD/fE95lhbrRiZy+blnUNi5v1Oe0aD2SFiGTmO4WvHNf0ZBfCm6p4orXuyFHKLs7NcJQ5l+AStGvs6bQ==")
    df = sparkSession.createDataFrame(df)
    df.printSchema()
    # df = df.pandas_api()
    # logger.info(type(df))

    # df.index = np.arange(0, df.shape[0])

    # df.write.mode("overwrite").option("url", url) \
    #     .option("user", SINK_DB_USERNAME) \
    #     .option("dbtable", f'{DB_SCHEMA}."test_table"') \
    #     .option("mssqlIsolationLevel", "READ_UNCOMMITTED") \
    #     .option("password", SINK_DB_PASSWORD).saveAsTable("test_table")

    df.write.format("com.microsoft.sqlserver.jdbc.spark") \
        .option("tableOptions","heap,distribution=HASH(id)") \
        .mode("overwrite") \
        .option("url", url) \
        .option("user", SINK_DB_USERNAME) \
        .option("dbtable", f'{DB_SCHEMA}."test_table"') \
        .option("mssqlIsolationLevel", "READ_UNCOMMITTED") \
        .option("password", SINK_DB_PASSWORD).save()
    # .mode("overwrite") \
    # .option("jdbcDriver", "com.microsoft.sqlserver.jdbc.SQLServerDriver") \

    # df.write \
    #     .format("com.databricks.spark.sqldw") \
    #     .option("url", url) \
    #     .option("forwardSparkAzureStorageCredentials", "true") \
    #     .option("dbTable", "rawdata.crm_reviews") \
    #     .option("tempDir", "abfss://bdw-demo@adlsmdadmshdeveastus001.dfs.core.windows.net/test") \
    #     .save()

# def insert_db_bulk_sql(engine, data_list, table_name, msg_ts, batch_id):
    # insert_to_tmp_tbl_stmt = f"INSERT INTO tbl_california_housing \
    # ([MedInc],[HouseAge],[AveRooms],[AveBedrms],[Population],[AveOccup],[Latitude],[Longitude],[target] ) \
    # values(?,?,?,?,?,?,?,?,?)"
    # conn = pyodbc.connect(driver='{ODBC Driver 18 for SQL Server}',
    #     server='<mydatabaseserver.database.windows.net>',
    #     database='<mydatabase>',
    #     uid='<my database user>', pwd='<my database password>')
    # cursor = conn.cursor() #create a cursor

    # cursor.fast_executemany = True  #Set fast_executemany  = True

    # start = time.time() #Note start time
    # cursor.executemany(insert_to_tmp_tbl_stmt, df.values.tolist()) #load data into azure sql db
    # end = time.time() #Note end time

    # print(f'{len(df)} rows inserted in pd_df_california_housing table')
    # print(f'{(end - start)/60} minutes elapsed') 

    # cursor.commit() #Close the cursor and connection
    # cursor.close()
    # conn.close()

if __name__ == '__main__':
    start_time = datetime.now()
    logger.info(f'------start transfering data------')

    batch_id = datetime.now()

    # for table_name in TABLE_COUNT_MAP.keys():
    #     pandas_to_synapse(bucket, table_name, batch_id)
    pandas_to_synapse(bucket, 'test_table', batch_id)
   
    logger.info(f'------finish sink connector testing within {datetime.now() - start_time}------')
    



