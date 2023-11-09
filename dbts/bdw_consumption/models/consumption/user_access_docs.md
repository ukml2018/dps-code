{% docs customer_id %}
A Primary Key. It consists of letter "C" and eight digits (e.g., 00000001)
{% enddocs %}

{% docs enum_description %}
The column is an enumerator with the following allowed values: 
{% enddocs %}

{% docs birth_date %}
A column that stores a birth date in a format "mm/dd/yyyy" 
{% enddocs %}

{% docs birth_day %}
A column that stores a birth day (i.e., 1-31) 
{% enddocs %}

{% docs birth_month %}
A column that stores a birth month (i.e., 1-12) 
{% enddocs %}

{% docs birth_year %}
A column that stores a birth day (i.e., 1900 - current year) 
{% enddocs %}

{% docs age %}
A column that stores calculated Customer age 
{% enddocs %}

{% docs social_number %}
A Column that represents Customer's social number. It has the following format "nnn-nn-nnnn" where "n" is a digit  
{% enddocs %}

{% docs customer_name %}
A Column that represents Customer's name part (first name, middle name or last name)
{% enddocs %}

{% docs primary_phone %}
A Column that represents Customer's prmary phone number. It has the following format "nnn-nnn-nnnn" where "n" is a digit  
{% enddocs %}

{% docs primary_email %}
A Column that represents Customer's prmary email address  
{% enddocs %}

{% docs mailing_address %}
A Column that represents Customer's physical mailing address  
{% enddocs %}

{% docs unit_address %}
A Column that represents Customer's unit address  
{% enddocs %}

{% docs city %}
A Column that represents Customer's city of residence  
{% enddocs %}

{% docs state %}
A Column that represents Customer's the state (of the USA) of residence  
{% enddocs %}

{% docs postal_code %}
A Column that represents Customer's postal code. It is a number 4-5 digits long  
{% enddocs %}

{% docs district_id %}
A Column that represents Customer's district id. It is a number  
{% enddocs %}

{% docs credit_score %}
A Column that represents Customer's credit score calculated. It is a number from 600 up to 800 with average value ~700  
{% enddocs %}

{% docs acorn_category %}
A Column that represents Customer's credit score calculated. It is a number from 600 up to 800 with average value ~700  
{% enddocs %}

{% docs criminal_record %}
A Column that represents Customer's criminal record. It has two possible values: "Y" (yes) and "N" (no)  
{% enddocs %}

{% docs tbl_customer_profile %}
A CustomerProfile dbt model
{% enddocs %}

{% docs AnalyticData_RDFAO %}
Relative Days from First Account Open Date
{% enddocs %}

{% docs AnalyticData_RDFAOCC %}
Relative Days from First Credit Card Account Open Date
{% enddocs %}

{% docs AnalyticData_RDFAOHL %}
Relative Days from First Home Loan Account Open Date
{% enddocs %}

{% docs AnalyticData_ARDFAD %}
Average Relative Days from Account Open Date to First Debit Transaction
{% enddocs %}

{% docs AnalyticData_ARDFADCC %}
Average Relative Days from Credit Card Account Open Date to First Debit Transaction
{% enddocs %}

{% docs AnalyticData_ARDLD %}
Average Relative Days from Last Debit Transaction to reference date
{% enddocs %}

{% docs AnalyticData_ARDLDCC %}
Average Relative Days from Credit Card Account Last Debit Transaction to Reference Date
{% enddocs %}

{% docs AnalyticData_ARDLDHL %}
Average Relative Days from Home Loan Account Last Debit Transaction to Reference Date
{% enddocs %}

{% docs AnalyticData_ARDLC %}
Average Relative Days from Last Credit Transaction to reference date
{% enddocs %}

{% docs AnalyticData_ARDLCCC %}
Average Relative Days from Credit Card Account Last Credit Transaction to Reference Date
{% enddocs %}

{% docs AnalyticData_ARDLCHL %}
Average Relative Days from Home Loan Account Last Credit Transaction to Reference Date
{% enddocs %}

{% docs AnalyticData_ANTW %}
Average number of transactions per week
{% enddocs %}

{% docs AnalyticData_ANTWCC %}
Average Number of Credit Card Account Transactions per week
{% enddocs %}

{% docs AnalyticData_ANTWHL %}
Average Number of Home Loan Account Transactions per week
{% enddocs %}

{% docs AnalyticData_VNTW %}
Variance of number of transactions per week
{% enddocs %}

{% docs AnalyticData_VNTWCC %}
Variance of Number of Credit Card Account Transactions per week
{% enddocs %}

{% docs AnalyticData_VNTWHL %}
Variance of Number of Home Loan Account Transactions per week
{% enddocs %}

{% docs AnalyticData_ADTW %}
Average Debit Transactions per Week
{% enddocs %}

{% docs AnalyticData_ADTWCC %}
Average Number of Credit Card Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_ADTWHL %}
Average Number of Home Loan Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_ACTW %}
Average Credit Transactions per Week
{% enddocs %}

{% docs AnalyticData_ACTWCC %}
Average Number of Credit Card Account Credit Transactions per week
{% enddocs %}

{% docs AnalyticData_ACTWHL %}
Average Number of Home Loan Account Credit Transactions per week
{% enddocs %}

{% docs AnalyticData_VDTW %}
Variance of Debit Transactions per Week
{% enddocs %}

{% docs AnalyticData_VDTWCC %}
Variance of Number of Credit Card Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_VDTWHL %}
Variance of Number of Home Loan Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_VCTW %}
Variance of Credit Transactions per Week
{% enddocs %}

{% docs AnalyticData_VCTWCC %}
Variance of Number of Credit Card Account Credit Transactions per week
{% enddocs %}

{% docs AnalyticData_VCTWHL %}
Variance of Number of Home Loan Account Credit Transactions per week
{% enddocs %}

{% docs AnalyticData_AADTW %}
Average amount of debit transactions per week
{% enddocs %}

{% docs AnalyticData_AADTWCC %}
Average Amount of Credit Card Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_AADTWHL %}
Average Amount of Home Loan Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_AACTW %}
Average amount of Credit Transactions per Week
{% enddocs %}

{% docs AnalyticData_AACTWCC %}
Average Amount of Credit Card Account Credit Transactions per week
{% enddocs %}

{% docs AnalyticData_AACTWHL %}
Average Amount of Home Loan Account Credit Transactions per week
{% enddocs %}

{% docs AnalyticData_VADTW %}
Variance of Amount of Debit Transactions per Week
{% enddocs %}

{% docs AnalyticData_VADTWCC %}
Variance of Amount of Credit Card Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_VADTWHL %}
Variance of Amount of Home Loan Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_VACTW %}
Variance of Amount of Debit Transactions per Week
{% enddocs %}

{% docs AnalyticData_VACTWCC %}
Variance of Amount of Credit Card Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_VACTWHL %}
Variance of Amount of Home Loan Account Debit Transactions per week
{% enddocs %}

{% docs AnalyticData_RATE %}
Interest Rates
{% enddocs %}

{% docs AnalyticData_CTIER %}
Current Product Tier    
{% enddocs %}

{% docs AnalyticData_CHU %}
Channel Usage    
{% enddocs %}

{% docs AnalyticData_CCUCS %}
Credit score   
{% enddocs %}

{% docs AnalyticData_CCUASP %}
Average total spend for Credit Card Usage
{% enddocs %}

{% docs AnalyticData_CCUVSP %}
Variance of total spend for Credit Card Usage 
{% enddocs %}