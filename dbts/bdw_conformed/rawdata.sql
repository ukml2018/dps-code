CREATE TABLE rawdata.completed_account (
	account_id varchar(100)  NULL,
	district_id varchar(100)  NULL,
	frequency varchar(100)  NULL,
	parseddate varchar(100)  NULL,
	"year" varchar(100)  NULL,
	"month" varchar(100)  NULL,
	"day" varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);

CREATE TABLE rawdata.completed_card (
	card_id varchar(100)  NULL,
	disp_id varchar(100)  NULL,
	"type" varchar(100)  NULL,
	"year" varchar(100)  NULL,
	"month" varchar(100)  NULL,
	"day" varchar(100)  NULL,
	fulldate varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);

CREATE TABLE rawdata.completed_client (
	client_id varchar(100)  NULL,
	sex varchar(100)  NULL,
	fulldate varchar(100)  NULL,
	"day" varchar(100)  NULL,
	"month" varchar(100)  NULL,
	"year" varchar(100)  NULL,
	age varchar(100)  NULL,
	social varchar(100)  NULL,
	"first" varchar(100)  NULL,
	middle varchar(100)  NULL,
	"last" varchar(100)  NULL,
	phone varchar(100)  NULL,
	email varchar(100)  NULL,
	address_1 varchar(100)  NULL,
	address_2 varchar(100)  NULL,
	city varchar(100)  NULL,
	state varchar(100)  NULL,
	zipcode varchar(100)  NULL,
	district_id varchar(100)  NULL,
	creditscore varchar(100)  NULL,
	criminalrecord varchar(100)  NULL,
	acorncategory varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);

CREATE TABLE rawdata.completed_disposition (
	disp_id varchar(100)  NULL,
	client_id varchar(100)  NULL,
	account_id varchar(100)  NULL,
	"type" varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);

CREATE TABLE rawdata.completed_district (
	district_id varchar(100)  NULL,
	city varchar(100)  NULL,
	state_name varchar(100)  NULL,
	state_abbrev varchar(100)  NULL,
	region varchar(100)  NULL,
	division varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.completed_loan (
	loan_id varchar(100)  NULL,
	account_id varchar(100)  NULL,
	amount decimal(15,2)  NULL,
	duration varchar(100)  NULL,
	payments varchar(100)  NULL,
	status varchar(100)  NULL,
	"year" varchar(100)  NULL,
	"month" varchar(100)  NULL,
	"day" varchar(100)  NULL,
	fulldate varchar(100)  NULL,
	location varchar(100)  NULL,
	purpose varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.completed_order (
	order_id varchar(100)  NULL,
	account_id varchar(100)  NULL,
	bank_to varchar(100)  NULL,
	account_to varchar(100)  NULL,
	amount decimal(15,2)  NULL,
	k_symbol varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.completed_transaction (
	"row" varchar(100)  NULL,
	trans_id varchar(100)  NULL,
	account_id varchar(100)  NULL,
	"type" varchar(100)  NULL,
	operation varchar(100)  NULL,
	amount decimal(15,2) NULL,
	balance varchar(100)  NULL,
	k_symbol varchar(100)  NULL,
	bank varchar(100)  NULL,
	account varchar(100)  NULL,
	"year" varchar(100)  NULL,
	"month" varchar(100)  NULL,
	"day" varchar(100)  NULL,
	fulldate varchar(100)  NULL,
	fulltime varchar(100)  NULL,
	fulldatewithtime varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.credit_worth (
	client_id varchar(100)  NULL,
	outcome varchar(100)  NULL,
	confidence varchar(100)  NULL,
	review_status varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);

CREATE TABLE rawdata.crm_call_center_log (
	date_received varchar(100)  NULL,
	complaint_id varchar(100)  NULL,
	rand_client varchar(100)  NULL,
	phonefinal varchar(100)  NULL,
	vru_plus_line varchar(100)  NULL,
	call_id varchar(100)  NULL,
	priority varchar(100)  NULL,
	"type" varchar(100)  NULL,
	outcome varchar(100)  NULL,
	server varchar(100)  NULL,
	ser_start varchar(100)  NULL,
	ser_exit varchar(100)  NULL,
	ser_time varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);

CREATE TABLE rawdata.crm_event (
	date_received varchar(100)  NULL,
	product varchar(100)  NULL,
	sub_product varchar(100)  NULL,
	issue varchar(100)  NULL,
	sub_issue varchar(100)  NULL,
	consumer_complaint_narrative varchar(6000)  NULL,
	tags varchar(100)  NULL,
	is_consumer_consent_provided varchar(100)  NULL,
	submitted_via varchar(100)  NULL,
	date_sent_to_company varchar(100)  NULL,
	company_response_to_consumer varchar(100)  NULL,
	is_timely_response varchar(100)  NULL,
	was_consumer_disputed varchar(100)  NULL,
	complaint_id varchar(100)  NULL,
	client_id varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.crm_review (
	"date" varchar(20)  NULL,
	stars varchar(10)  NULL,
	reviews varchar(6000)  NULL,
	product varchar(100)  NULL,
	district_id varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.identity_data (
	clientid varchar(100)  NULL,
	maid varchar(100)  NULL,
	device_type varchar(100)  NULL,
	sha1_hashed_email varchar(100)  NULL,
	collection_timestamp varchar(100)  NULL,
	ip_address varchar(100)  NULL,
	source_id varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.interactiondepot_callcenter (
	"timestamp" varchar(100)   NULL,
	account_id varchar(100)  NULL,
	client_id varchar(100)  NULL,
	channel varchar(100)  NULL,
	eventtype varchar(100)  NULL,
	locationid varchar(100)  NULL,
	treatmentid varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);

CREATE TABLE rawdata.interactiondepot_email (
	"timestamp" varchar(100)   NULL,
	account_id varchar(100)  NULL,
	client_id varchar(100)  NULL,
	channel varchar(100)  NULL,
	eventtype varchar(100)  NULL,
	treatmentid varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);

CREATE TABLE rawdata.interactiondepot_mobile (
	"timestamp" varchar(100)   NULL,
	account_id varchar(100)  NULL,
	client_id varchar(100)  NULL,
	channel varchar(100)  NULL,
	eventtype varchar(100)  NULL,
	locationid varchar(100)  NULL,
	treatmentid varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.interactiondepot_web (
	"timestamp" varchar(100)   NULL,
	account_id varchar(100)  NULL,
	client_id varchar(100)  NULL,
	channel varchar(100)  NULL,
	eventtype varchar(100)  NULL,
	locationid varchar(100)  NULL,
	treatmentid varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.luxury_loan_portfolio (
	loan_id varchar(100)  NULL,
	funded_amount varchar(100)  NULL,
	funded_date varchar(100)  NULL,
	duration_years varchar(100)  NULL,
	duration_months varchar(100)  NULL,
	ten_yr_treasury_index_date_funded varchar(100)  NULL,
	interest_rate_percent varchar(100)  NULL,
	interest_rate varchar(100)  NULL,
	payments varchar(100)  NULL,
	total_past_payments varchar(100)  NULL,
	loan_balance varchar(100)  NULL,
	property_value varchar(100)  NULL,
	purpose varchar(100)  NULL,
	firstname varchar(100)  NULL,
	middlename varchar(100)  NULL,
	lastname varchar(100)  NULL,
	social varchar(100)  NULL,
	phone varchar(100)  NULL,
	title varchar(100)  NULL,
	employment_length varchar(100)  NULL,
	building_class_category varchar(100)  NULL,
	tax_class_at_present varchar(100)  NULL,
	building_class_at_present varchar(100)  NULL,
	address_1 varchar(100)  NULL,
	address_2 varchar(100)  NULL,
	zip_code varchar(100)  NULL,
	city varchar(100)  NULL,
	state varchar(100)  NULL,
	total_units varchar(100)  NULL,
	land_square_feet varchar(100)  NULL,
	gross_square_feet varchar(100)  NULL,
	tax_class_at_time_of_sale varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);

CREATE TABLE rawdata.tradelines (
	customerid varchar(100)  NULL,
	externalriskscore varchar(100)  NULL,
	monthssinceoldesttradelineopen varchar(100)  NULL,
	monthssincemostrecenttradelineopen varchar(100)  NULL,
	averageminfile varchar(100)  NULL,
	numbersatisfactorytradelines varchar(100)  NULL,
	numbertradelinesderogatorylast60days varchar(100)  NULL,
	numbertradelinesderogatorylast90days varchar(100)  NULL,
	percenttradesneverlate varchar(100)  NULL,
	monthssincemostrecentderogatory varchar(100)  NULL,
	maxdelinqent2publicrecords varchar(100)  NULL,
	maxdelinquentever varchar(100)  NULL,
	numbertotaltradelines varchar(100)  NULL,
	numbertradelinesopenlast12months varchar(100)  NULL,
	percentinstallmenttradelines varchar(100)  NULL,
	monthssincemostrecentinstallment varchar(100)  NULL,
	numberinquirieslast6months varchar(100)  NULL,
	numberinquirieslast6monthsexcludingsoft varchar(100)  NULL,
	load_time varchar(100)  NULL,
	batch_nbr varchar(100)  NULL
);


CREATE TABLE rawdata.dim_date_data (
	dimdateid int NULL,
	datetype varchar(16) NULL,
	fulldate varchar(16) NULL,
	yearnum int NULL,
	yearbegindate varchar(16) NULL,
	yearenddate varchar(16) NULL,
	daynumofweek int NULL,
	daynumofmonth int NULL,
	daynumofquarter int NULL,
	daynumofyear int NULL,
	dayofweekname varchar(16) NULL,
	dayofweekabbreviation varchar(16) NULL,
	juliandaynumofyear int NULL,
	isweekday varchar(16) NULL,
	isfederalusholiday varchar(16) NULL,
	holidaydescription varchar(16) NULL,
	islastdayofweek varchar(16) NULL,
	islastdayofmonth varchar(16) NULL,
	islastdayofquarter varchar(16) NULL,
	islastdayofyear varchar(16) NULL,
	weekofyearbegindate varchar(16) NULL,
	weekofyearenddate varchar(16) NULL,
	weekofmonthbegindate varchar(16) NULL,
	weekofmonthenddate varchar(16) NULL,
	weekofquarterbegindate varchar(16) NULL,
	weekofquarterenddate varchar(16) NULL,
	weeknumofmonth int NULL,
	weeknumofquarter int NULL,
	weeknumofyear int NULL,
	monthname varchar(16) NULL,
	monthnameabbreviation varchar(16) NULL,
	monthbegindate varchar(16) NULL,
	monthenddate varchar(16) NULL,
	monthnumofyear int NULL,
	monthformatyyyymm varchar(16) NULL,
	quarternumofyear int NULL,
	quarterbegindate varchar(16) NULL,
	quarterenddate varchar(16) NULL,
	quarterformatyyyyqq varchar(16) NULL,
	quarterformatqq varchar(16) NULL,
	fiscalmonthofyear int NULL,
	fiscalquarter int NULL,
	fiscalyear int NULL,
	fiscalyearmonthyyyymm varchar(16) NULL,
	fiscalyearquarteryyyyqq varchar(16) NULL
);
