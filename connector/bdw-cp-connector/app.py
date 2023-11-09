import logging, os
import pandas as pd

import boto3
from botocore.exceptions import ClientError
from requests import Response

from sqlalchemy import orm as sa_orm
from sqlalchemy import exc

from app_constant import *
from datetime import datetime

import pyspark, sys, logging
from pyspark.sql import SparkSession

from cryptography.fernet import Fernet

from flask import Flask, request

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

fernet_key = os.getenv("FERNET_KEY", "xxx")
fernet = Fernet(fernet_key.encode())

app = Flask(__name__)

logger.info("pyspark version: {}".format(pyspark.__version__))
logger.info("Python version : {}".format(sys.version))


from sqlalchemy.engine.url import URL

def pandas_to_synapse(data): 
    if 'batch_id' in data and 'conformed_dbt_models' in data:
        batch_id = data['batch_id']
        conformed_db_schema = data['conformed_db_schema']
        consumption_db_schema = data['consumption_db_schema']
        try:
            sparkSession = SparkSession.builder \
                .appName(f"Session-{datetime.now()}") \
                .config('spark.jars.packages', 'com.microsoft.azure:spark-mssql-connector_2.12:1.3.0-BETA,com.microsoft.sqlserver:mssql-jdbc:12.4.1.jre11,org.postgresql:postgresql:42.2.8') \
                .getOrCreate()
            
            source_url = 'jdbc:sqlserver://{}:{};database={}'.format(
                data['conformed_db_server'],
                data['conformed_db_port'],
                data['conformed_db_name']
            )

            logger.info("Spark version: {}".format(sparkSession.sparkContext.version))

            if len(data['conformed_dbt_models']) > 0:
                # parse table list from payload
                table_list = [table.lower() for table in data['conformed_dbt_models']]
            else:
                # get all tables from target metadata table
                table_df = sparkSession.read \
                    .format("com.microsoft.sqlserver.jdbc.spark") \
                    .option("url", source_url) \
                    .option("dbtable", "information_schema.tables") \
                    .option("user", fernet.decrypt(data['conformed_db_user'].encode()).decode()) \
                    .option("driver", SINK_SOURCE_DRIVER) \
                    .option("password", fernet.decrypt(data['conformed_db_psw'].encode()).decode()).load().filter(f"table_schema = '{conformed_db_schema}'")
                
                table_list = list(table_df.select(table_df.TABLE_NAME).toPandas()['TABLE_NAME'])
            logger.info(table_list)
            
            
            # logger.info(len(table_list))
            
            target_url = 'jdbc:postgresql://{}:{}/{}'.format(
                data['consumption_db_server'],
                data['consumption_db_port'],
                data['consumption_db_name']
            )

            logger.info("target connection info:")
            logger.info(f"url: {target_url}")
            logger.info(f"user{fernet.decrypt(data['consumption_db_user'].encode()).decode()}")
            logger.info(f"schema: {consumption_db_schema}")

            for table_name in table_list:
                logger.info(f"table name: {table_name}")
                df = sparkSession.read \
                    .format("com.microsoft.sqlserver.jdbc.spark") \
                    .option("url", source_url) \
                    .option("dbtable", f'{conformed_db_schema}."{table_name}"') \
                    .option("user", fernet.decrypt(data['conformed_db_user'].encode()).decode()) \
                    .option("driver", SINK_SOURCE_DRIVER) \
                    .option("password", fernet.decrypt(data['conformed_db_psw'].encode()).decode()).load()
                
                logger.info(type(df))
                df.printSchema()

                if 'batch_nbr' in df.columns:
                    df = df.filter(df.batch_nbr == batch_id)
                    logger.info("After filtering by batch_id:")
                    logger.info(df.count())
                
                df.repartition(20).write.format("jdbc") \
                    .option("driver", SINK_TARGET_DRIVER) \
                    .mode("overwrite") \
                    .option("batchsize", 50000) \
                    .option("url", target_url) \
                    .option("user", fernet.decrypt(data['consumption_db_user'].encode()).decode()) \
                    .option("dbtable", f'{consumption_db_schema}."{table_name}"') \
                    .option("password", fernet.decrypt(data['consumption_db_psw'].encode()).decode()).save()
                # .mode("overwrite") \
                # .option("jdbcDriver", "com.microsoft.sqlserver.jdbc.SQLServerDriver") \
            sparkSession.stop()
        except Exception as e:
            logger.error(e)
            return False
    return True


def api_response(status, message, data=None):
    return {
        "status": status,
        "message": message,
        "data": data
    }

@app.route('/api/trigger', methods=['POST'])
def trigger():
    data = request.get_json()
    logger.info(data)
    if pandas_to_synapse(data):
        return api_response(200, 'Completed', 'Sinking completed')
    else:
        return api_response(500, 'Failed', 'Sinking failed')


if __name__ == '__main__':
    start_time = datetime.now()
    logger.info(f'------start transfering data------')

    data = {
        'pipeline_id': '1', 
        'batch_id': '20231019141925629213', 
        'files_list': ['completed_transaction.csv'], 
        'conformed_db_server': 'synps-ws-mda-dev-eastus-001.sql.azuresynapse.net', 
        'conformed_db_name': 'BDW', 
        'conformed_db_port': 1433, 
        'conformed_db_user': 'xxx', 
        'conformed_db_psw': 'xxx', 
        'conformed_db_schema': 'conformed', 
        'conformed_dbt_models': ['TXN', 'SA_IP'], 
        'consumption_db_server': 'pstgrsql-mda-dev-eastus-001.postgres.database.azure.com', 
        'consumption_db_name': 'bdw', 
        'consumption_db_port': 5432, 
        'consumption_db_user': 'xxx', 
        'consumption_db_psw': 'xxx', 
        'consumption_db_schema': 'consumption'
    }

    pandas_to_synapse(data)
   
    logger.info(f'------finish sink connector within {datetime.now() - start_time}------')
    






