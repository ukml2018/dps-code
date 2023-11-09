import os

MAIN_DAG_ID = os.getenv('DAG_ID', 'bdw-poc_dev_main_dag')
AIRFLOW_URL = os.getenv('AIRFLOW_URL', 'https://azure-airflow-dbt.ibm-dps.com')



# Kafka configuration
KAFKA_BOOTSTRAP_SERVERS = os.getenv('KAFKA_BOOTSTRAP_SERVERS', 'mda-kafka-cluster-kafka-bootstrap.kafka.svc.cluster.local:9092')  
# KAFKA_BOOTSTRAP_SERVERS = os.getenv('KAFKA_BOOTSTRAP_SERVERS', 'localhost:9092')
KAFKA_CONSUMER_GROUP = os.getenv('KAFKA_CONSUMER_GROUP','GROUP_BDW_K8S')
KAFKA_TOPIC_LIST = ["bdw_rawfiles_topic"]


RAW_CSV_LIST = ['completed_account.csv', 
                'completed_card.csv', 
                'completed_client.csv', 
                'completed_disposition.csv', 
                'completed_district.csv', 
                'completed_loan.csv', 
                'completed_order.csv', 
                'completed_transaction.csv', 
                'credit_worth.csv', 
                'crm_call_center_log.csv', 
                'crm_event.csv', 
                'crm_review.csv', 
                'dim_date_data.csv', 
                'identity_data.csv', 
                'interactiondepot_callcenter.csv', 
                'interactiondepot_email.csv', 
                'interactiondepot_mobile.csv', 
                'interactiondepot_web.csv', 
                'luxury_loan_portfolio.csv', 
                'tradelines.csv']