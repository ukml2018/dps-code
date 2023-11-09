Drop Table if exists config."pipeline_operation_order";
Create Table config."pipeline_operation_order" (
  pipeline_operation_order_id 
                        int4                      NOT NULL,
	pipeline_id           int4                      NOT NULL,
  operation_id          int4                      NOT NULL,	
  is_active             char(1)                   NOT NULL,
  order_number          int4                      NOT NULL,
  CONSTRAINT pipeline_operation_order_pk PRIMARY KEY (pipeline_operation_order_id)
);
Drop Table if exists config."operation"; 
CREATE TABLE config."operation"
(
  operation_id          int4                      NOT NULL,
  operation_type_id     int4                      NOT NULL,  
  begin_range           int4                      NOT NULL, --Each Operation has a begin/end values that is unique
  end_range             int4                      NOT NULL, --for the Operation
  CONSTRAINT operation_pk PRIMARY KEY (operation_id)
);
Drop Table if exists config."pipeline";
CREATE TABLE config."pipeline" (
	pipeline_id           int4                      NOT NULL,
	pipeline_name         varchar(100)              NOT NULL,	
	CONSTRAINT pipeline_pk PRIMARY KEY (pipeline_id)
);
Drop Table if exists config."operation_type"; 
CREATE TABLE config."operation_type"
(
  operation_type_id     int4                      NOT NULL,
  operation_type_desc   varchar(50)               NOT NULL, --Possible Values are: raw_layer,conformed,consumption,kafka_topic
  begin_range           int4                      NOT NULL,
  end_range             int4                      NOT NULL,
  CONSTRAINT operation_type_pk PRIMARY KEY (operation_type_id)
);
ALTER TABLE       config."operation" 
  ADD CONSTRAINT  operation_fk                    FOREIGN KEY (operation_type_id) 
  REFERENCES      config."operation_type"(operation_type_id);
ALTER TABLE       config."pipeline_operation_order" 
  ADD CONSTRAINT  pipeline_operation_order_fk1    FOREIGN KEY (pipeline_id) 
  REFERENCES      config."pipeline"(pipeline_id);
ALTER TABLE       config."pipeline_operation_order" 
  ADD CONSTRAINT  pipeline_operation_order_fk2    FOREIGN KEY (operation_id) 
  REFERENCES      config."operation"(operation_id);
--*******************************************************************************************
--OPERATIONS
--*******************************************************************************************
Drop Table if exists config."raw_layer"; 
CREATE TABLE config."raw_layer" (
	operation_id          int4                      NOT NULL, --Possible Values: 100000-199999
	cos_type              varchar(10)                   NULL,
	cos_container         varchar(50)                   NULL,
	cos_dir               varchar(500)                  NULL,
	cos_conn_str          varchar(1000)                 NULL,
	cos_url               varchar(200)                  NULL,
	cos_key               varchar(500)                  NULL,
	cos_key_secret        varchar(500)                  NULL,
	source_container      varchar(50)                   NULL,
	source_dir            varchar(500)                  NULL,
	bck_container         varchar(50)                   NULL,
  bck_dir               varchar(500)                  NULL,
	files_list            varchar(5000)                 NULL,
	CONSTRAINT raw_layer_pk PRIMARY KEY (operation_id)
);

Drop Table if exists config."conformed"; 
CREATE TABLE config."conformed" (
	operation_id          int4                      NOT NULL, --Possible Values: 200000-299999
	db_type               varchar(10)                   NULL,
	db_server             varchar(500)                  NULL,
	db_name               varchar(50)                   NULL,
	db_user               varchar(50)                   NULL,
	db_psw                varchar(50)                   NULL,
	db_port               int                           NULL,
	db_schema             varchar(50)                   NULL,
  db_table              varchar(50)                   NULL,
  db_storedprocedure    varchar(50)                   NULL,
	dbt_project           varchar(50)                   NULL,
	el_rest               varchar(500)                  NULL,
	dbt_models            varchar(500)                  NULL,
	CONSTRAINT conformed_pk PRIMARY KEY (operation_id)
);

Drop Table if exists config."consumption"; 
CREATE TABLE config."consumption" (
	operation_id          int4                      NOT NULL, --Possible Values: 300000-399999
	db_type               varchar(10)                   NULL,
	db_server             varchar(500)                  NULL,
	db_name               varchar(50)                   NULL,
	db_user               varchar(50)                   NULL,
	db_psw                varchar(50)                   NULL,
	db_port               int                           NULL,
	db_schema             varchar(50)                   NULL,
  db_table              varchar(50)                   NULL,
  db_storedprocedure    varchar(50)                   NULL,
  dbt_project           varchar(50)                   NULL,
  dbt_models            varchar(500)                  NULL,
	CONSTRAINT   consumption_pk PRIMARY KEY (operation_id)
);

Drop Table if exists config."kafka_topic"; 
CREATE TABLE config."kafka_topic" (
	operation_id          int                       NOT NULL, --Possible Values: 400000-499999
	bootstrap_server      varchar(500)                  NULL,
	security_protocal     varchar(20)                   NULL,
	sasl_mechanisms       varchar(20)                   NULL,
	sasl_user             varchar(50)                   NULL,
	sasl_psw              varchar(50)                   NULL,
	topic                 varchar(500)                  NULL,
	CONSTRAINT kafka_topic_pk PRIMARY KEY (operation_id)
);
ALTER TABLE       config."raw_layer" 
  ADD CONSTRAINT  raw_layer_fk                    FOREIGN KEY (operation_id) 
  REFERENCES      config."operation"(operation_id);
ALTER TABLE       config."conformed" 
  ADD CONSTRAINT  conformed_fk                    FOREIGN KEY (operation_id) 
  REFERENCES      config."operation"(operation_id);
ALTER TABLE       config."consumption" 
  ADD CONSTRAINT  consumption_fk                  FOREIGN KEY (operation_id) 
  REFERENCES      config."operation"(operation_id);
ALTER TABLE       config."kafka_topic" 
  ADD CONSTRAINT  kafka_topic_fk                  FOREIGN KEY (operation_id) 
  REFERENCES      config."operation"(operation_id);
