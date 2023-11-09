{{ config(materialized='incremental', alias='credit_worth', unique_key='customer_id', re_data_monitored=true)}} 
 
with source_data as (
    select
            ip.src_sys_cd as customer_id,
            ip.ip_crr_id as outcome,
            ip.pdft_cgy_id as confidence, 
            ip.{{ add_quote("desc") }} as review_status,
            ip.batch_nbr as batch_nbr,
            ip.load_time as load_time
    from {{ source('conformed', 'sa_ip') }} ip
) 

 select * from source_data