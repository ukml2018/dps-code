
{{ config(materialized='incremental', alias='identity_data', unique_key='hashed_email', re_data_monitored=true)}}

with source_data as (
    select  eltrn.ip_src_sys_cd as customer_id
            , eltrn.ip_src_sys_unq_key_txt as ma_id 
            , eltrn.tlphnc_dvc_ty_id as device_type 
            , eltrn.extnsn as hashed_email
            , eltrn.effv_dt as collection_timestamp
            , eltrn.eltrn_addr_ty_id as ip_address
            , eltrn.src_sys_cd as source_id
            , eltrn.batch_nbr as batch_nbr
            , eltrn.load_time as load_time
    from {{ source('conformed', 'sa_ip_eltrn_addr') }} eltrn
)

select * from source_data