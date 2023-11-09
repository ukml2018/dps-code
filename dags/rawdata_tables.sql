-- rawdata.completed_account definition

-- Drop table

-- DROP TABLE rawdata.completed_account;

DROP TABLE IF EXISTS rawdata.completed_account;

CREATE TABLE IF NOT EXISTS rawdata.completed_account
(
	account_id VARCHAR(100)   
	,district_id VARCHAR(100)   
	,"frequency" VARCHAR(100)   
	,parseddate VARCHAR(100)   
	,"year" VARCHAR(100)   
	,"month" VARCHAR(100)   
	,"day" VARCHAR(100)  
	,PRIMARY KEY (account_id)
);


-- rawdata.completed_card definition

-- Drop table

-- DROP TABLE rawdata.completed_card;

DROP TABLE IF EXISTS rawdata.completed_card;
CREATE TABLE IF NOT EXISTS rawdata.completed_card
( 
	card_id VARCHAR(100)   
	,disp_id VARCHAR(100)   
	,"type" VARCHAR(100)   
	,"year" VARCHAR(100)   
	,"month" VARCHAR(100)   
	,"day" VARCHAR(100)   
	,fulldate VARCHAR(100)     
	,PRIMARY KEY (card_id)
);

-- rawdata.completed_client definition

-- Drop table

-- DROP TABLE rawdata.completed_client;

DROP TABLE IF EXISTS rawdata.completed_client;
CREATE TABLE IF NOT EXISTS rawdata.completed_client
(
	client_id VARCHAR(100)   
	,sex VARCHAR(100)   
	,fulldate VARCHAR(100)   
	,"day" VARCHAR(100)   
	,"month" VARCHAR(100)   
	,"year" VARCHAR(100)   
	,age VARCHAR(100)   
	,social VARCHAR(100)   
	,"first" VARCHAR(100)   
	,middle VARCHAR(100)   
	,"last" VARCHAR(100)   
	,phone VARCHAR(100)   
	,email VARCHAR(100)   
	,address_1 VARCHAR(100)   
	,address_2 VARCHAR(100)   
	,city VARCHAR(100)   
	,state VARCHAR(100)   
	,zipcode VARCHAR(100)   
	,district_id VARCHAR(100)   
	,creditscore VARCHAR(100) 
	,criminalrecord VARCHAR(100) 
	,acorncategory VARCHAR(100)   
	,PRIMARY KEY (client_id)
);

-- rawdata.completed_disposition definition

-- Drop table

-- DROP TABLE rawdata.completed_disposition;

DROP TABLE IF EXISTS rawdata.completed_disposition;
CREATE TABLE IF NOT EXISTS rawdata.completed_disposition
(
	disp_id VARCHAR(100)   
	,client_id VARCHAR(100)   
	,account_id VARCHAR(100)   
	,"type" VARCHAR(100)     
	,PRIMARY KEY (disp_id)
);

-- rawdata.completed_district definition

-- Drop table

-- DROP TABLE rawdata.completed_district;

DROP TABLE IF EXISTS rawdata.completed_district;
CREATE TABLE IF NOT EXISTS rawdata.completed_district
(
	district_id VARCHAR(100)   
	,city VARCHAR(100)   
	,state_name VARCHAR(100)   
	,state_abbrev VARCHAR(100)   
	,"region" VARCHAR(100)   
	,division VARCHAR(100)    
	,PRIMARY KEY (district_id)
);

-- rawdata.completed_loan definition

-- Drop table

-- DROP TABLE rawdata.completed_loan;

DROP TABLE IF EXISTS rawdata.completed_loan;
CREATE TABLE IF NOT EXISTS rawdata.completed_loan
(
	loan_id VARCHAR(100)   
	,account_id VARCHAR(100)   
	,amount VARCHAR(100)   
	,duration VARCHAR(100)   
	,payments VARCHAR(100)   
	,status VARCHAR(100)   
	,"year" VARCHAR(100)   
	,"month" VARCHAR(100)   
	,"day" VARCHAR(100)   
	,fulldate VARCHAR(100)   
	,"location" VARCHAR(100)   
	,purpose VARCHAR(100)  
	,PRIMARY KEY (loan_id)
);

-- rawdata.completed_order definition

-- Drop table

-- DROP TABLE rawdata.completed_order;

DROP TABLE IF EXISTS rawdata.completed_order;
CREATE TABLE IF NOT EXISTS rawdata.completed_order
(
	order_id VARCHAR(100)   
	,account_id VARCHAR(100)   
	,bank_to VARCHAR(100)   
	,account_to VARCHAR(100)   
	,amount VARCHAR(100)   
	,k_symbol VARCHAR(100)    
	,PRIMARY KEY (order_id)
);

-- rawdata.completed_transaction definition

-- Drop table

-- DROP TABLE rawdata.completed_transaction;

DROP TABLE IF EXISTS rawdata.completed_transaction;
CREATE TABLE IF NOT EXISTS rawdata.completed_transaction
( 
	"row" VARCHAR(100)   
	,trans_id VARCHAR(100)   
	,account_id VARCHAR(100)   
	,"type" VARCHAR(100)   
	,operation VARCHAR(100)   
	,amount VARCHAR(100)   
	,balance VARCHAR(100)   
	,k_symbol VARCHAR(100)   
	,bank VARCHAR(100)   
	,"account" VARCHAR(100)   
	,"year" VARCHAR(100)   
	,"month" VARCHAR(100)   
	,"day" VARCHAR(100)   
	,fulldate VARCHAR(100)   
	,fulltime VARCHAR(100)   
	,fulldatewithtime VARCHAR(100) 
	,PRIMARY KEY (trans_id)
);

-- rawdata.credit_worth definition

-- Drop table

-- DROP TABLE rawdata.credit_worth;

DROP TABLE IF EXISTS rawdata.credit_worth;
CREATE TABLE IF NOT EXISTS rawdata.credit_worth
(
	client_id VARCHAR(100)   
	,outcome VARCHAR(100)   
	,confidence VARCHAR(100)   
	,review_status VARCHAR(100)   
	,PRIMARY KEY (client_id)
);

-- rawdata.crm_call_center_logs definition

-- Drop table

-- DROP TABLE rawdata.crm_call_center_logs;

DROP TABLE IF EXISTS rawdata.crm_call_center_log;
CREATE TABLE IF NOT EXISTS rawdata.crm_call_center_log
( 
	date_received VARCHAR(100)   
	,complaint_id VARCHAR(100)   
	,rand_client VARCHAR(100)   
	,phonefinal VARCHAR(100)   
	,vru_plus_line VARCHAR(100)   
	,call_id VARCHAR(100)
	,"priority" VARCHAR(100)   
	,"type" VARCHAR(100)   
	,outcome VARCHAR(100)   
	,server VARCHAR(100)   
	,ser_start VARCHAR(100)   
	,ser_exit VARCHAR(100)   
	,ser_time VARCHAR(100)    
	,PRIMARY KEY (call_id)
);

-- rawdata.crm_events definition

-- Drop table

-- DROP TABLE rawdata.crm_events;

DROP TABLE IF EXISTS rawdata.crm_event;
CREATE TABLE IF NOT EXISTS rawdata.crm_event
( 
	date_received VARCHAR(100)   
	,product VARCHAR(100)   
	,sub_product VARCHAR(100)   
	,issue VARCHAR(100)   
	,sub_issue VARCHAR(100)   
	,consumer_complaint_narrative VARCHAR(6000)   
	,"tags" VARCHAR(100)   
	,is_consumer_consent_provided VARCHAR(100)   
	,submitted_via VARCHAR(100)   
	,date_sent_to_company VARCHAR(100)   
	,company_response_to_consumer VARCHAR(100)   
	,is_timely_response VARCHAR(100)   
	,was_consumer_disputed VARCHAR(100)   
	,complaint_id VARCHAR(100)   
	,client_id VARCHAR(100)   
	,PRIMARY KEY (complaint_id)
);

-- rawdata.crm_reviews definition

-- Drop table

-- DROP TABLE rawdata.crm_reviews;

DROP TABLE IF EXISTS rawdata.crm_review;
CREATE TABLE IF NOT EXISTS rawdata.crm_review
( 
	"date" VARCHAR(100)   
	,stars VARCHAR(100)   
	,reviews VARCHAR(6000)   
	,product VARCHAR(100)   
	,district_id VARCHAR(100)   
);

-- rawdata.identity_data definition

-- Drop table

-- DROP TABLE rawdata.identity_data;

DROP TABLE IF EXISTS rawdata.identity_data;
CREATE TABLE IF NOT EXISTS rawdata.identity_data
(
	clientid VARCHAR(100)   
	,maid VARCHAR(100)   
	,device_type VARCHAR(100)   
	,sha1_hashed_email VARCHAR(100)   
	,collection_timestamp VARCHAR(100)   
	,ip_address VARCHAR(100)   
	,source_id VARCHAR(100)    
	,PRIMARY KEY (clientid)
);

-- rawdata.interactiondepot_callcenter definition

-- Drop table

-- DROP TABLE rawdata.interactiondepot_callcenter;

DROP TABLE IF EXISTS rawdata.interactiondepot_callcenter;
CREATE TABLE IF NOT EXISTS rawdata.interactiondepot_callcenter
( 
	"timestamp" VARCHAR(100)   
	,account_id VARCHAR(100)   
	,client_id VARCHAR(100)   
	,channel VARCHAR(100)   
	,eventtype VARCHAR(100)   
	,locationid VARCHAR(100)   
	,treatmentid VARCHAR(100)    
	,PRIMARY KEY (client_id, treatmentid, "timestamp")
);

-- rawdata.interactiondepot_email definition

-- Drop table

-- DROP TABLE rawdata.interactiondepot_email;

DROP TABLE IF EXISTS rawdata.interactiondepot_email;
CREATE TABLE IF NOT EXISTS rawdata.interactiondepot_email
(
	"timestamp" VARCHAR(100)
	,account_id VARCHAR(100)   
	,client_id VARCHAR(100) 
	,channel VARCHAR(100)   
	,eventtype VARCHAR(100)   
	,treatmentid VARCHAR(100)   
	,PRIMARY KEY (client_id, treatmentid, "timestamp")
);

-- rawdata.interactiondepot_mobile definition

-- Drop table

-- DROP TABLE rawdata.interactiondepot_mobile;

DROP TABLE IF EXISTS rawdata.interactiondepot_mobile;
CREATE TABLE IF NOT EXISTS rawdata.interactiondepot_mobile
(
	"timestamp" VARCHAR(100)   
	,account_id VARCHAR(100)   
	,client_id VARCHAR(100)   
	,channel VARCHAR(100)   
	,eventtype VARCHAR(100)   
	,locationid VARCHAR(100)   
	,treatmentid VARCHAR(100)   
	,PRIMARY KEY (client_id, treatmentid, "timestamp")
);

-- rawdata.interactiondepot_web definition

-- Drop table

-- DROP TABLE rawdata.interactiondepot_web;

DROP TABLE IF EXISTS rawdata.interactiondepot_web;
CREATE TABLE IF NOT EXISTS rawdata.interactiondepot_web
( 
	"timestamp" VARCHAR(100)   
	,account_id VARCHAR(100)   
	,client_id VARCHAR(100)   
	,channel VARCHAR(100)   
	,eventtype VARCHAR(100)   
	,locationid VARCHAR(100)   
	,treatmentid VARCHAR(100)   
	,PRIMARY KEY (client_id, treatmentid, "timestamp")
);

-- rawdata.luxury_loan_portfolio definition

-- Drop table

-- DROP TABLE rawdata.luxury_loan_portfolio;

DROP TABLE IF EXISTS rawdata.luxury_loan_portfolio;
CREATE TABLE IF NOT EXISTS rawdata.luxury_loan_portfolio
(
	loan_id VARCHAR(100)   
	,funded_amount VARCHAR(100)   
	,funded_date VARCHAR(100)   
	,duration_years VARCHAR(100)   
	,duration_months VARCHAR(100)   
	,ten_yr_treasury_index_date_funded VARCHAR(100)   
	,interest_rate_percent VARCHAR(100)   
	,interest_rate VARCHAR(100)   
	,payments VARCHAR(100)   
	,total_past_payments VARCHAR(100)   
	,loan_balance VARCHAR(100)   
	,property_value VARCHAR(100)   
	,purpose VARCHAR(100)   
	,firstname VARCHAR(100)   
	,middlename VARCHAR(100)   
	,lastname VARCHAR(100)   
	,social VARCHAR(100)   
	,phone VARCHAR(100)   
	,title VARCHAR(100)   
	,employment_length VARCHAR(100)   
	,building_class_category VARCHAR(100)   
	,tax_class_at_present VARCHAR(100)   
	,building_class_at_present VARCHAR(100)   
	,address_1 VARCHAR(100)   
	,address_2 VARCHAR(100)   
	,zip_code VARCHAR(100)   
	,city VARCHAR(100)   
	,state VARCHAR(100)   
	,total_units VARCHAR(100)   
	,land_square_feet VARCHAR(100)   
	,gross_square_feet VARCHAR(100)   
	,tax_class_at_time_of_sale VARCHAR(100)   
	,PRIMARY KEY (loan_id)
);

-- rawdata.tradelines definition

-- Drop table

-- DROP TABLE rawdata.tradelines;

DROP TABLE IF EXISTS rawdata.tradelines;
CREATE TABLE IF NOT EXISTS rawdata.tradelines
( 
	customerid VARCHAR(100)   
	,externalriskscore VARCHAR(100)   
	,monthssinceoldesttradelineopen VARCHAR(100)   
	,monthssincemostrecenttradelineopen VARCHAR(100)   
	,averageminfile VARCHAR(100)   
	,numbersatisfactorytradelines VARCHAR(100)   
	,numbertradelinesderogatorylast60days VARCHAR(100)   
	,numbertradelinesderogatorylast90days VARCHAR(100)   
	,percenttradesneverlate VARCHAR(100)   
	,monthssincemostrecentderogatory VARCHAR(100)   
	,maxdelinqent2publicrecords VARCHAR(100)   
	,maxdelinquentever VARCHAR(100)   
	,numbertotaltradelines VARCHAR(100)   
	,numbertradelinesopenlast12months VARCHAR(100)   
	,percentinstallmenttradelines VARCHAR(100)   
	,monthssincemostrecentinstallment VARCHAR(100)   
	,numberinquirieslast6months VARCHAR(100)   
	,numberinquirieslast6monthsexcludingsoft VARCHAR(100)
	,PRIMARY KEY (customerid)
);

-- rawdata.dim_date_data definition

-- Drop table

DROP TABLE IF EXISTS rawdata.dim_date_data;
CREATE TABLE IF NOT EXISTS rawdata.dim_date_data (
	dimdateid int NULL,
	datetype varchar(16)   NULL,
	fulldate varchar(16)   NULL,
	yearnum int NULL,
	yearbegindate varchar(16)   NULL,
	yearenddate varchar(16)   NULL,
	daynumofweek int NULL,
	daynumofmonth int NULL,
	daynumofquarter int NULL,
	daynumofyear int NULL,
	dayofweekname varchar(16)   NULL,
	dayofweekabbreviation varchar(16)   NULL,
	juliandaynumofyear int NULL,
	isweekday varchar(16)   NULL,
	isfederalusholiday varchar(16)   NULL,
	holidaydescription varchar(16)   NULL,
	islastdayofweek varchar(16)   NULL,
	islastdayofmonth varchar(16)   NULL,
	islastdayofquarter varchar(16)   NULL,
	islastdayofyear varchar(16)   NULL,
	weekofyearbegindate varchar(16)   NULL,
	weekofyearenddate varchar(16)   NULL,
	weekofmonthbegindate varchar(16)   NULL,
	weekofmonthenddate varchar(16)   NULL,
	weekofquarterbegindate varchar(16)   NULL,
	weekofquarterenddate varchar(16)   NULL,
	weeknumofmonth int NULL,
	weeknumofquarter int NULL,
	weeknumofyear int NULL,
	monthname varchar(16)   NULL,
	monthnameabbreviation varchar(16)   NULL,
	monthbegindate varchar(16)   NULL,
	monthenddate varchar(16)   NULL,
	monthnumofyear int NULL,
	monthformatyyyymm varchar(16)   NULL,
	quarternumofyear int NULL,
	quarterbegindate varchar(16)   NULL,
	quarterenddate varchar(16)   NULL,
	quarterformatyyyyqq varchar(16)   NULL,
	quarterformatqq varchar(16)   NULL,
	fiscalmonthofyear int NULL,
	fiscalquarter int NULL,
	fiscalyear int NULL,
	fiscalyearmonthyyyymm varchar(16)   NULL,
	fiscalyearquarteryyyyqq varchar(16)   NULL
);