from sqlalchemy import create_engine, text
import os
import logging, json
from enum import Enum

logging.basicConfig(level=logging.INFO, format='%(asctime)s-%(name)s-%(levelname)s-%(message)s')
logger = logging.getLogger(__name__)

class COS_TYPE(Enum):
    Azure = 'adls'
    AWS = 's3'
    GCP = 'gcs'

class DB_TYPE(Enum):
    Synapse = 'synapse'
    Redshift = 'redshift'
    Bigquery = 'bigquery'
    Postgres = 'postgres'
    Snowflake = 'Snowflake'
    Databricks = 'databricks'
    
def get_db_type(cloud_type: str):
    """For Azure db on Synapse
       For AWS db on Redshift
       For GCP db on Bigquery

    Args:
        cloud_type (str): Azure|AWS|GCP

    Returns:
        _type_: Synapse|Redshift|Bigquery
    """
    if cloud_type == COS_TYPE.Azure.name:
        return DB_TYPE.Synapse.name
    elif cloud_type == COS_TYPE.AWS.name:
        return DB_TYPE.Redshift.name
    elif cloud_type == COS_TYPE.GCP.name:
        return DB_TYPE.Bigquery.name

def load_csv_from_cos(cos_type: str, rawdata_schema: str, conn_str: str, csv_list: list, cos_path: str, options : dict = {}) -> None:
    if cos_type == COS_TYPE.Azure.name:
        load_csv_az(rawdata_schema=rawdata_schema, conn_str= conn_str, csv_list=csv_list, cos_path=cos_path)
    elif cos_type == COS_TYPE.AWS.name:
        if 'iam_role' in options:
            load_csv_aws(rawdata_schema=rawdata_schema, conn_str= conn_str, csv_list=csv_list, cos_path=cos_path, iam_role=options['iam_role'])
        else:
            logger.error("iam_role not provided!")
    

def load_csv_az(rawdata_schema: str, conn_str: str, csv_list: list, cos_path: str) -> None:    
    # Create the SQLAlchemy engine
    engine = create_engine(conn_str, future=True, ignore_no_transaction_on_rollback=True)
    
    # Execute the copy after deleted records
    with engine.connect() as connection:
        for csv in csv_list:
            table_name = csv.replace('.csv', '')
            del_sql = f"delete from {rawdata_schema}.{table_name}"
            sql = f"""
                    COPY INTO {rawdata_schema}.{table_name}
                    FROM '{cos_path}/{csv}'
                    WITH (
                        FILE_TYPE = 'CSV',
                        FIRSTROW = 2,
                        FIELDTERMINATOR = ',',
                        ENCODING = 'UTF8',
                        CREDENTIAL = (IDENTITY='Managed Identity')
                    );
                   """
            logger.info(text(sql))
            try:
                connection.execute(text(del_sql))
                connection.execute(text(sql))
                connection.commit()
                logger.info("Table: {} copied from: {}.".format(table_name, csv))
            except Exception as err:
                logger.error(err)
                connection.rollback()

def load_csv_aws(rawdata_schema: str, conn_str: str, csv_list: list, cos_path: str, iam_role: str) -> None:    
    # Create the SQLAlchemy engine
    engine = create_engine(conn_str, future=True)
    
    # Execute the copy after deleted records
    with engine.connect() as connection:
        for csv in csv_list:
            table_name = csv.replace('.csv', '')
            del_sql = f"delete from {rawdata_schema}.{table_name}"
            sql = f"""
                    copy {rawdata_schema}.{table_name}
                    from 's3://{cos_path}/{csv}'
                    iam_role '{iam_role}'
                    csv
                    IGNOREHEADER 1;
                   """
            try:
                connection.execute(text(del_sql))
                connection.execute(text(sql))
                connection.commit()
                logger.info("Table: {} copied from: {}.".format(table_name, csv))
            except Exception as err:
                logger.error(err)
                connection.rollback()
                
def load_config(conn_str: str, pipeline_id: str)-> dict:
    app_config = {}
    # Create the SQLAlchemy engine
    engine = create_engine(conn_str)
    with engine.connect() as connection:
        sql = f"""
            with conformed as(
            select poo.pipeline_id, c.operation_id , c.db_type, c.db_server, c.db_name, c.db_port, c.db_user, c.db_psw, c.dbt_project, c.el_rest
            from config.pipeline_operation_order poo 
            join config.conformed c 
            on poo.operation_id = c.operation_id 
            where poo.pipeline_id  = {pipeline_id}
            ), raw_layer as(
            select poo.pipeline_id, rl.operation_id , cos_type, cos_container, cos_dir, cos_conn_str, cos_url, cos_key, cos_key_secret, source_container, source_dir, bck_container, bck_dir, files_list
            from config.pipeline_operation_order poo 
            join config.raw_layer rl 
            on poo.operation_id = rl.operation_id 
            where poo.pipeline_id  = {pipeline_id}
            ), consumption as (
            select poo.pipeline_id, c2.operation_id , c2.operation_id , c2.db_type, c2.db_server, c2.db_name, c2.db_port, c2.db_user, c2.db_psw, c2.dbt_project
            from config.pipeline_operation_order poo 
            join config.consumption c2
            on poo.operation_id = c2.operation_id 
            where poo.pipeline_id  = {pipeline_id}
            ), kafka_topic as (
            select poo.pipeline_id, kt.operation_id , kt.bootstrap_server, kt.security_protocal, kt.sasl_mechanisms, kt.sasl_user, kt.sasl_psw, kt.topic
            from config.pipeline_operation_order poo 
            join config.kafka_topic kt 
            on poo.operation_id = kt.operation_id 
            where poo.pipeline_id  = {pipeline_id}
            ) select rl.pipeline_id, cos_type, cos_container, cos_dir, cos_conn_str, cos_url, cos_key, cos_key_secret, source_container, source_dir, bck_container, bck_dir, files_list, 
            c.db_type as conformed_db_type, c.db_server as conformed_db_server, c.db_name as conformed_db_name, c.db_port as conformed_db_port, c.db_user as conformed_db_user, c.db_psw as conformed_db_psw, c.dbt_project as conformed_dbt_project, c.el_rest as el_rest,
            c2.db_type as consumption_db_type, c2.db_server as consumption_db_server, c2.db_name as consumption_db_name, c2.db_port as consumption_db_port, c2.db_user as consumption_db_user, c2.db_psw as consumption_db_psw, c2.dbt_project as consumption_dbt_project,
            kt.bootstrap_server as kafka_bootstrap_server, kt.security_protocal as kafka_security_protocal, kt.sasl_mechanisms as kafka_sasl_mechanisms, kt.sasl_user as kafka_sasl_user, kt.sasl_psw as kafka_sasl_psw, kt.topic as kafka_topic
            from raw_layer rl
            join conformed c 
            on rl.pipeline_id = c.pipeline_id
            join consumption c2 
            on rl.pipeline_id = c2.pipeline_id
            join kafka_topic kt
            on rl.pipeline_id = kt.pipeline_id;
        """
        result = connection.execute(text(sql))
        for row in result:
            app_config['pipeline_id'] = row.pipeline_id
            app_config['cos_type'] = row.cos_type
            app_config['cos_container'] = row.cos_container
            app_config['cos_dir'] = row.cos_dir
            app_config['cos_conn_str'] = row.cos_conn_str
            app_config['cos_url'] = row.cos_url
            app_config['cos_key'] = row.cos_key
            app_config['cos_key_secret'] = row.cos_key_secret
            app_config['source_container'] = row.source_container
            app_config['source_dir'] = row.source_dir
            app_config['bck_container'] = row.bck_container
            app_config['bck_dir'] = row.bck_dir
            app_config['files_list'] = row.files_list
            app_config['conformed_db_type'] = row.conformed_db_type
            app_config['conformed_db_server'] = row.conformed_db_server
            app_config['conformed_db_name'] = row.conformed_db_name
            app_config['conformed_db_port'] = row.conformed_db_port
            app_config['conformed_db_user'] = row.conformed_db_user
            app_config['conformed_db_psw'] = row.conformed_db_psw
            app_config['conformed_dbt_project'] = row.conformed_dbt_project
            app_config['consumption_db_type'] = row.consumption_db_type
            app_config['consumption_db_server'] = row.consumption_db_server
            app_config['consumption_db_name'] = row.consumption_db_name
            app_config['consumption_db_port'] = row.consumption_db_port
            app_config['consumption_db_user'] = row.consumption_db_user
            app_config['consumption_db_psw'] = row.consumption_db_psw
            app_config['consumption_dbt_project'] = row.consumption_dbt_project
            app_config['kafka_bootstrap_server'] = row.kafka_bootstrap_server
            app_config['kafka_security_protocal'] = row.kafka_security_protocal
            app_config['kafka_sasl_mechanisms'] = row.kafka_sasl_mechanisms
            app_config['kafka_sasl_user'] = row.kafka_sasl_user
            app_config['kafka_sasl_psw'] = row.kafka_sasl_psw
            app_config['kafka_topic'] = row.kafka_topic
            app_config['el_rest'] = row.el_rest
            
        return app_config
     
def get_db_conn_str(db_type: str, db_server: str, db_name: str, db_port: str, db_user: str, db_psw: str) -> str:
    conn_str = f'{db_user}:{db_psw}@{db_server}:{db_port}/{db_name}'
    
    if DB_TYPE.Postgres.name.lower() == db_type.lower():
        db_conn_str = "postgresql://" + conn_str
    elif DB_TYPE.Synapse.name.lower() == db_type.lower():
        db_conn_str = f"mssql+pyodbc://{db_user}:{db_psw}@{db_server}/{db_name}?driver=ODBC+Driver+18+for+SQL+Server"
    elif DB_TYPE.Redshift.name.lower() == db_type.lower():
        db_conn_str = "redshift+psycopg2://" + conn_str
    else:
        db_conn_str = ""
    
    return db_conn_str
        
                
def main():
    server_name = os.environ.get("SYNAPSE_DB_SERVER")
    database_name = os.environ.get("SYNAPSE_DB_NAME")
    username = os.environ.get("SYNAPSE_DB_USER")
    password = os.environ.get("SYNAPSE_DB_PASSWORD")
    
    # server_name = os.environ.get("REDSHIFT_DB_SERVER")
    # database_name = os.environ.get("REDSHIFT_DB_NAME")
    # username = os.environ.get("REDSHIFT_DB_USER")
    # password = os.environ.get("REDSHIFT_DB_PASSWORD")
    # iam_role = os.environ.get("REDSHIFT_IAM_ROLE")
    
    postgres_server = os.environ.get("POSTGRES_DB_SERVER")
    postgres_db = os.environ.get("POSTGRES_DB_NAME")
    postgres_user = os.environ.get("POSTGRES_DB_USER")
    postgres_psw = os.environ.get("POSTGRES_DB_PASSWORD")
    

    RAW_CSV_LIST = ['completed_account.csv', 'completed_card.csv', 'completed_client.csv', 'completed_disposition.csv', 'completed_district.csv', 'completed_loan.csv', 'completed_order.csv', 'completed_transaction.csv', 'credit_worth.csv', 'crm_call_center_log.csv', 'crm_event.csv', 'crm_review.csv', 'dim_date_data.csv', 'identity_data.csv', 'interactiondepot_callcenter.csv', 'interactiondepot_email.csv', 'interactiondepot_mobile.csv', 'interactiondepot_web.csv', 'luxury_loan_portfolio.csv', 'tradelines.csv']
    # RAW_CSV_LIST = ['completed_account.csv', 'completed_card.csv']
    # Specify the connection string
    connection_string = f"mssql+pyodbc://{username}:{password}@{server_name}/{database_name}?driver=ODBC+Driver+18+for+SQL+Server"
    COS_PATH = "https://adlsmdadmshdeveastus001.dfs.core.windows.net/demo-bdw/landing-zone/20230922035323927979"
    load_csv_from_cos(COS_TYPE.Azure.name, rawdata_schema="rawdata", conn_str=connection_string, csv_list=RAW_CSV_LIST, cos_path=COS_PATH)
    
    # connection_string = f"redshift+psycopg2://{username}:{password}@{server_name}:5439/{database_name}"
    # COS_PATH = "demo-bdw/source"
    # options = {
    #     'iam_role' : iam_role
    # }
    # load_csv_from_cos(COS_TYPE.AWS.name, rawdata_schema="rawdata", conn_str=connection_string, csv_list=RAW_CSV_LIST, cos_path=COS_PATH, options=options)
    
    
    
    # postgres_conn_str = f"postgresql://{postgres_user}:{postgres_psw}@{postgres_server}:5432/{postgres_db}"
    # config = load_config(postgres_conn_str, "0")
    # logger.info(f"config: {config}")
    
    
if __name__ == '__main__':
    main()