
{{ config(materialized='incremental', alias='completed_disposition', unique_key='customer_id', re_data_monitored=true)}}

with source_data as (
    select arip.ip_src_sys_cd as customer_id
            , arip.src_sys_cd as account_id
            , arip.ar_src_sys_cd as disp_id
            , arip.ar_to_ip_rl_ty_id as {{ add_quote("type") }}
            , arip.batch_nbr as batch_nbr
            , arip.load_time as load_time
    FROM {{ source('conformed', 'sa_ar_to_sa_ip_rl') }} arip
)

SELECT * FROM source_data