{{ config(materialized='incremental', alias='transactions', unique_key='trans_id', re_data_monitored=true)}} 
 
with source_data as (
    select  trans.txn_id as trans_id,
            trans.txn_tp_id as trans_type,
            trans.ou_id as bank,
            srd.ip_src_sys_cd as client_id,
            trans.prim_ar_id as account_id,
            trans.net_cash_flow_amt as balance, 
            trans.txn_tm as trans_time,
            trans.txn_dt as trans_date,
            {{ date_to_str("trans.txn_dt") }} as trans_date_str,
            trans.dvc_id as operation,
            trans.fee_x_cmsn_amt as trans_amount,
            trans.batch_nbr as batch_nbr,
            trans.load_time as load_time
    from {{ source('conformed', 'txn') }} trans
    left join {{ source('conformed', 'sa_ar_to_sa_ip_rl') }} srd
    on trans.prim_ar_id = srd.src_sys_cd
) , cols_prepare as (
    select  srd.trans_id as trans_id,
            srd.trans_type as trans_type,
            srd.bank as bank,
            srd.client_id as client_id,
            srd.account_id as account_id,
            srd.balance as balance, 
            srd.trans_time as trans_time,
            srd.trans_date as trans_date,
			{{ dbt.replace(dbt.split_part(string_text="srd.trans_date_str", delimiter_text="'T'", part_number=1), "'-'", "''") }} as dim_trans_date,
            srd.operation as operation,
            srd.trans_amount as trans_amount,
            srd.batch_nbr as batch_nbr,
            srd.load_time as load_time
    from source_data srd
)

 select * from cols_prepare