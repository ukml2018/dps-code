# Airflow

## Airflow install
Refer to this repo for details about install airflow to AKS: [Install airflow](https://github.ibm.com/digital-insights/azure-airflow-dbt)

## Ariflow UI
### AKS deployment
https://azure-airflow-dbt.ibm-dps.com/home

login with ibmid

## Airflow config
### Variables
conf_db_conn_str: the sqlalchemy style configure db connection string

encrypt_key: a key used to encrypt confidential info in kafka message

### Git sync
Airflow git sync was enabled, so all codes from repo "BDW-POC" would be replicated to airflow automatically.  Airflow monitors all code changes happened to "dags" folder.

### DBT projects
The bdw dags use dbt project to run dbt commands, so from the dag there's a "prepare_dbt_project" task to copy dbt projects to dbt runtime folder: "/opt/airflow/dbts" before dag kick off any dbt command.

## Azure Synapse and ADLS2 Setup
* A linked service to one ADLS2 account must be pre-configured.
* The container used for landing-zone dir must be created.
* A rawdata schema must be created in Synapse sql dedicated pool db.
* All rawdata tables with same name as csv files(remove .csv) must be created with same column names from csv in same sequence.
## Config db setup
1. execute config_tables.sql to create config tables from db.
2. Run insert sqls to insert config values.

   example:

   --Insert one pipeline with id as 0

        --4 types of operations(used for all pipeline config)
        INSERT INTO config.operation_type (operation_type_id, operation_type_desc, begin_range, end_range) 
        VALUES(1, 'raw_layer', 0, 0);

        INSERT INTO config.operation_type (operation_type_id, operation_type_desc, begin_range, end_range) 
        VALUES(2, 'conformed', 0, 0);

        INSERT INTO config.operation_type (operation_type_id, operation_type_desc, begin_range, end_range) 
        VALUES(3, 'consumption', 0, 0);

        INSERT INTO config.operation_type (operation_type_id, operation_type_desc, begin_range, end_range) 
        VALUES(4, 'kafka_topic', 0, 0);

        --4 operations(used for all pipeline config): 1. operation on raw files from cloud storage 2. operation on conformed layer tables 3. operation on consumption layer tables 4. operation on kafka messages 
        INSERT INTO config.operation (operation_id, operation_type_id, begin_range, end_range) 
        VALUES(100000, 1, 0, 0);

        INSERT INTO config.operation (operation_id, operation_type_id, begin_range, end_range) 
        VALUES(200000, 2, 0, 0);

        INSERT INTO config.operation (operation_id, operation_type_id, begin_range, end_range) 
        VALUES(300000, 3, 0, 0);

        INSERT INTO config.operation (operation_id, operation_type_id, begin_range, end_range) 
        VALUES(400000, 4, 0, 0);

        --cloud storage config(used for all pipeline config)
        INSERT INTO config.raw_layer (operation_id, cos_type, cos_container, cos_dir, cos_conn_str, cos_url,        cos_key, cos_key_secret, source_container, source_dir, bck_container, bck_dir, files_list) 
        VALUES(100000, 'Azure', 'demo-bdw', 'landing-zone', 'connection string', 'https://adlsmdadmshdeveastus001.blob.core.windows.net', '', '', 'demo-bdw', 'source',        'raw-layer', 'bdw', 'completed_account.csv,completed_card.csv,completed_client.csv,     completed_disposition.csv,completed_district.csv,completed_loan.csv,completed_order.csv,     completed_transaction.csv,credit_worth.csv,crm_call_center_log.csv,crm_event.csv,crm_review.csv,     dim_date_data.csv,identity_data.csv,interactiondepot_callcenter.csv,interactiondepot_email.csv,  interactiondepot_mobile.csv,interactiondepot_web.csv,luxury_loan_portfolio.csv,tradelines.csv');

        --conformed layer db config(used for all pipeline config)
        INSERT INTO config.conformed (operation_id, db_type, db_server, db_name, db_user, db_psw, db_port,      db_schema, dbt_project, el_rest) 
        VALUES(200000, 'synapse', 'synps-ws-mda-dev-eastus-001.sql.azuresynapse.net', 'BDW', 'user', 'psw', 1433, 'conformed', 'bdw_conformed', 'http://bdw-cp-connector-bdw-cp-connector-chart.  bdw.svc.cluster.local:5000');

        --consumption db config(used for all pipeline config)
        INSERT INTO config.consumption (operation_id, db_type, db_server, db_name, db_user, db_psw, db_port,        db_schema, dbt_project) 
        VALUES(300000, 'postgres', 'pstgrsql-mda-dev-eastus-001.postgres.database.azure.com', 'bdw',  'user', 'psw', 5432, 'cnsumption', 'bdw_consumption');

        --kafka config(used for all pipeline config)
        INSERT INTO config.kafka_topic (operation_id, bootstrap_server, security_protocal, sasl_mechanisms,         sasl_user, sasl_psw, topic) 
        VALUES(400000, 'mda-kafka-cluster-kafka-bootstrap.kafka.svc.cluster.local:9092', null, null, null,      null, 'bdw_rawfiles_topic');

        --pipeline info
        INSERT INTO config.pipeline (pipeline_id, pipeline_name) VALUES(0, 'bdw_azure');

        --pipeline orders
        INSERT INTO config.pipeline_operation_order (pipeline_operation_order_id, pipeline_id, operation_id,        is_active, order_number) 
        VALUES(0, 0, 100000, 'y', 0);

        INSERT INTO config.pipeline_operation_order (pipeline_operation_order_id, pipeline_id, operation_id,        is_active, order_number) 
        VALUES(1, 0, 200000, 'y', 1);

        INSERT INTO config.pipeline_operation_order (pipeline_operation_order_id, pipeline_id, operation_id,        is_active, order_number) 
        VALUES(2, 0, 300000, 'y', 2);

        INSERT INTO config.pipeline_operation_order (pipeline_operation_order_id, pipeline_id, operation_id,        is_active, order_number) 
        VALUES(3, 0, 400000, 'y', 3);

### Assign dbt models to run
By inserting data to column conformed.dbt_models and consumption.dbt_models, it can control which model to run by "dbt -s ${dbt_models}". 

Multiple dbt_models should be seperated by ",". e.g. TXN,SA_IP

## Prepare dag: dagrun config sample

{
    "pipeline_id": "0"
}

## Main dag: dagrun config sample

{
    "pipeline_id": "0",
    "batch_id" : "202309201741"
}

## Message data sample

{
	"pipeline_id": "0",
    "batch_id": "20230926190717483117",
	"cos_conn_dict": {
		"type": "Azure",
		"container": "demo-bdw",
		"conn_str": "gAAAAABlErtuvMUrYodaUoI2_mecsib0XX49n-o0musy4JFclsNF9vYNvOHH3mT6LtEDryacWA_6uTZyyfE-_ZVOYCGCTaf1DMo6hQkv0phPITILdlzqilMYMsfw-PSzePHMGfRX0Uw4GogUbrbEzwqMOcb_Meu97AsaxHGwKuQW3noKYwt71ARYg32qhI35C69BiGtjnH4R325r_TUtQklB-Lvry2-tooxQdR3lU6zBqDoIrVz4jhdwkIvQgfKJ_L_pEGEN2GeS7ZkA_d6a_ZYIj_mn8g-H1o8WXdxaYEKCMKrtFcKCh5mcbzWwJfa2CtudNpSLrgfBg41DpA2aeTLG6mcUemgBAw==",
		"url": "https://adlsmdadmshdeveastus001.blob.core.windows.net"
	},
	"files_list": [
		"landing-zone/20230926190717483117/completed_account.csv",
		"landing-zone/20230926190717483117/completed_card.csv"
	],
	"db_conn_dict": {
		"conn_str": "gAAAAABlErtv5bqSio3TBuoBoCCY2ZHGeWBFf-Wc8ZwbOuyeRkhfqNeDf53cbsSp8MmjfnhgUunSXgDt4opQjqA2EuAkZaGExez3lbDSIIhk2_Wta20OUvwzcRr3LvHiCObf5EfiiS6uBV-eQ5Yhs6G9n_O7--jZVgkxBwDfFffW17eQDPEbO2a33t48ZrLBUTjsaOCMiMiFeZK9rbyJrfChF01WWbSpnvEERvPt8jbfJnARJ88bcBMfJrIYfFyNjC5shsZglZzN",
		"schema": "rawdata"
	},
	"bck_container": "raw-layer",
	"bck_dir": "bdw"
}