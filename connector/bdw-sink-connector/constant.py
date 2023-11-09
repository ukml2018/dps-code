import os
from bo import *


datamesh_access_token = os.getenv("DATA_MESH_TOKEN", "data_mesh_token")
# datamesh_backend_url = os.getenv("DATA_MESH_BACKEND_URL", "https://dbt-product-dev.ibm-dps.com/api/v1/")
datamesh_backend_url = os.getenv("DATA_MESH_BACKEND_URL", "http://data-mesh-airflow-dbt-webserver.data-mesh-airflow-dbt-dev.svc.cluster.local:8080/api/v1/")
CUSTOM_DAG_ID = os.getenv("CUSTOM_DAG_ID", "dmc-bdw-demo_dev_add2018_custom_dag")

# Kafka configuration
KAFKA_BOOTSTRAP_SERVERS = os.getenv('KAFKA_BOOTSTRAP_SERVERS', 'b-3.dps-dev-msk-cluster.vfjd4n.c24.kafka.us-east-1.amazonaws.com:9096')  # Replace with your Kafka broker IP and port
KAFKA_SASL_USERNAME=  os.getenv('KAFKA_SASL_USERNAME', 'aws-msk-connect')
KAFKA_SASL_PASSWORD= os.getenv('KAFKA_SASL_PASSWORD', 'xxxxxx')
KAFKA_SASL_MECHANISM= os.getenv('KAFKA_SASL_MECHANISM', 'SCRAM-SHA-512')  # Other SASL mechanisms, e.g., 'SCRAM-SHA-256'
KAFKA_SECURITY_PROTOCOL = os.getenv('KAFKA_SECURITY_PROTOCOL', 'SASL_SSL')

SINK_DB_SCHEMA = os.getenv('SINK_DB_SCHEMA', 'rawdata')

# SINK_DB_USERNAME = os.getenv("SINK_DB_USERNAME", "dmc_dev")
# SINK_DB_PASSWORD = os.getenv("SINK_DB_PASSWORD", "xxx")
# SINK_DB_HOST = os.getenv("SINK_DB_HOST", "wg-mda-dmc-dev.517824631004.us-east-1.redshift-serverless.amazonaws.com")
# SINK_DB_DATABASE = os.getenv("SINK_DB_DATABASE", "bdw-dev")

# SINK_DRIVER = 'redshift+redshift_connector'
# SINK_DB_PORT = 5439

SINK_DB_USERNAME = os.getenv("SINK_DB_USERNAME", "sqladminuser")
SINK_DB_PASSWORD = os.getenv("SINK_DB_PASSWORD", "xxx")
SINK_DB_HOST = os.getenv("SINK_DB_HOST", "synps-ws-mda-dev-eastus-001.sql.azuresynapse.net")
SINK_DB_DATABASE = os.getenv("SINK_DB_DATABASE", "BDW")

SINK_DRIVER = 'mssql+pyodbc'
SINK_DB_PORT = 1433

SINK_SOURCE_USERNAME = os.getenv("SINK_SOURCE_USERNAME", "sqladminuser")
SINK_SOURCE_PASSWORD = os.getenv("SINK_SOURCE_PASSWORD", "xxx")
SINK_SOURCE_HOST = os.getenv("SINK_SOURCE_HOST", "synps-ws-mda-dev-eastus-001.sql.azuresynapse.net")
SINK_SOURCE_DATABASE = os.getenv("SINK_SOURCE_DATABASE", "BDW")
SINK_SOURCE_SCHEMA = os.getenv('SINK_SOURCE_SCHEMA', 'conformed')

SINK_SOURCE_DRIVER = 'mssql+pyodbc'
SINK_SOURCE_PORT = 1433


####
## postgresql DB on Azure as target
####
SINK_TARGET_HOST = os.getenv("SINK_TARGET_HOST", "pstgrsql-mda-dev-eastus-001.postgres.database.azure.com")
SINK_TARGET_USERNAME = os.getenv("SINK_TARGET_USERNAME", "adminuser")
SINK_TARGET_PASSWORD = os.getenv("SINK_TARGET_PASSWORD", "xxx")
SINK_TARGET_DATABASE = os.getenv("SINK_TARGET_DATABASE", "bdw")
SINK_TARGET_SCHEMA = os.getenv("SINK_TARGET_SCHEMA", "conformed")
SINK_TARGET_DRIVER = "org.postgresql.Driver"
SINK_TARGET_PORT = 5432


####
## postgresql DB on AWS as target
####
# SINK_TARGET_HOST = os.getenv("SINK_TARGET_HOST", "dps-dev-rds-common.cf5vyqhifn0n.us-east-1.rds.amazonaws.com")
# SINK_TARGET_USERNAME = os.getenv("SINK_TARGET_USERNAME", "aep_demo_user")
# SINK_TARGET_PASSWORD = os.getenv("SINK_TARGET_PASSWORD", "xxx")
# SINK_TARGET_DATABASE = os.getenv("SINK_TARGET_DATABASE", "aep_mdm_demo")
# SINK_TARGET_SCHEMA = os.getenv("SINK_TARGET_SCHEMA", "conformed")
# SINK_TARGET_DRIVER = "org.postgresql.Driver"
# SINK_TARGET_PORT = 5432


####
## local postgresql DB as target
####
# SINK_TARGET_HOST = os.getenv("SINK_TARGET_HOST", "localhost")
# SINK_TARGET_USERNAME = os.getenv("SINK_TARGET_USERNAME", "postgres")
# SINK_TARGET_PASSWORD = os.getenv("SINK_TARGET_PASSWORD", "xxx")
# SINK_TARGET_DATABASE = os.getenv("SINK_TARGET_DATABASE", "postgres")
# SINK_TARGET_SCHEMA = os.getenv("SINK_TARGET_SCHEMA", "conformed")
# SINK_TARGET_DRIVER = "org.postgresql.Driver"
# SINK_TARGET_PORT = 5433

# SINK_DB_USERNAME = os.getenv("SINK_DB_USERNAME", "dujing@cn.ibm.com")
# SINK_DB_PASSWORD = os.getenv("SINK_DB_PASSWORD", "xxxxxx")
# SINK_DB_HOST = os.getenv("SINK_DB_HOST", "fra00296.snowflakecomputing.com")
# SINK_DB_ACCOUNT = os.getenv("SINK_DB_ACCOUNT", "fra00296")
# SINK_DB_DATABASE = os.getenv("SINK_DB_DATABASE", "DPS_AEP_DEMO_DEV")
# SINK_DB_WAREHOUSE = os.getenv("SINK_DB_WAREHOUSE", "DPS_ADMIN_WAREHOUSE")
# SINK_DB_ROLE = os.getenv("SINK_DB_ROLE", "DPS_DEV_ROLE")

# SINK_DRIVER = os.getenv('SINK_DRIVER', 'snowflake')
# SINK_DB_PORT = os.getenv("SINK_DB_PORT", 443)

TABLE_COUNT_MAP = os.getenv('TABLE_COUNT_MAP',{
    "completed_transaction": 1056320,
    # "completed_transaction": 314532,
    "completed_account": 4500,
    "completed_card": 892,
    "completed_client": 5369,
    "completed_disposition": 5369,
    "completed_district": 77,
    "completed_loan": 682,
    "completed_order": 6471,
    "crm_call_center_logs": 3999,
    "crm_events": 23419,
    "crm_reviews": 505,
    "luxury_loan_portfolio": 1678,
    "credit_worth": 5369,
    "identity_data": 5369,
    "interactiondepot_callcenter": 28016,
    "interactiondepot_email": 210455,
    "interactiondepot_mobile": 85847,
    "interactiondepot_web": 107769,
    "tradelines": 1
})

table_bo_map = {
    "completed_transaction": txn.Txn,
    "completed_account": acct.Acct,
    "completed_card": card.Card,
    "completed_client": client.Client,
    "completed_disposition": disposition.Disposition,
    "completed_district": district.District,
    "completed_loan": loan.Loan,
    "completed_order": order.Order,
    "crm_call_center_logs": call_center_log.CallCenterLog,
    "crm_events": event.Event,
    "crm_reviews": review.Review,
    "luxury_loan_portfolio": luxury_loan_portfolio.LuxuryLoanPortfolio,
    "credit_worth": credit_worth.CreditWorth,
    "identity_data": identity_data.IdentityData,
    "interactiondepot_callcenter": call_center.CallCenter,
    "interactiondepot_email": email.Email,
    "interactiondepot_mobile": mobile.Mobile,
    "interactiondepot_web": web.Web,
    "tradelines": tradeline.Tradeline
}

TOPIC_MAP = os.getenv('TOPIC_MAP', {
    "completed_transaction": "demo_bdw_completedtransaction",
    "completed_account": "demo_bdw_completedaccount",
    "completed_card": "demo_bdw_completedcard",
    "completed_client": "demo_bdw_completedclient",
    "completed_disposition": "demo_bdw_completeddisposition",
    "completed_district": "demo_bdw_completeddistrict",
    "completed_loan": "demo_bdw_completedloan",
    "completed_order": "demo_bdw_completedorder",
    "crm_call_center_logs": "demo_bdw_crmcallcenterlog",
    "crm_events": "demo_bdw_crmevent",
    "crm_reviews": "demo_bdw_crmreview",
    "luxury_loan_portfolio": "demo_bdw_luxuryloanportfolio",
    "credit_worth": "demo_bdw_creditworth",	
    "identity_data": "demo_bdw_identitydata",
    "interactiondepot_callcenter": "demo_bdw_interactiondepotcallcenter",
    "interactiondepot_email": "demo_bdw_interactiondepotemail",
    "interactiondepot_mobile": "demo_bdw_interactiondepotmobile",
    "interactiondepot_web": "demo_bdw_interactiondepotweb",
    "tradelines": "demo_bdw_tradelines"
})
