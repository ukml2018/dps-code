{{ config(materialized='incremental', alias='sa_ar_to_sa_ip_rl', unique_key='ar_id')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as ip_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ar_to_ip_rl_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as ar_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "256") }} 	as ar_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "10") }} 	as ar_src_sys_cd,
            {{ col_cast("'1'", "varchar", "10") }} 	as ip_src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as ip_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 5, 2)) }} 	as pct_amt
), columns_prep as (
    select disp.disp_id as ar_id
         , ip.ip_id as ip_id
         , disp.type as ar_to_ip_rl_ty_id
         , srd.effv_dt as effv_dt
         , srd.end_dt as end_dt
         , disp.account_id as src_sys_cd
         , srd.src_sys_unq_key_txt as src_sys_unq_key_txt
         , srd.effv_ts as effv_ts
         , srd.end_ts as end_ts
         , srd.tnnt_cd_id as tnnt_cd_id
         , srd.btch_id as btch_id
         , srd.ar_src_sys_unq_key_txt as ar_src_sys_unq_key_txt
         , disp.disp_id as ar_src_sys_cd
         , disp.client_id as ip_src_sys_cd
         , srd.ip_src_sys_unq_key_txt as ip_src_sys_unq_key_txt
         , srd.{{ add_quote("desc") }} as {{ add_quote("desc") }}
         , srd.pct_amt as pct_amt
         , {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr
         , current_timestamp as load_time
         
    from {{ source('rawdata', 'completed_disposition') }} as disp
    left join source_data as srd
    on srd.ip_src_sys_cd = disp.client_id
    left join {{ ref('SA_IP') }} ip
    on ip.src_sys_cd = disp.client_id
    where lower(disp.type) = 'owner'

)

 select * 
 from columns_prep