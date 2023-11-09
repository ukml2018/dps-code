{{ config(materialized='incremental', alias='txn', unique_key='txn_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "30") }} as txn_id,
            {{ col_cast("'1'", "varchar", "10") }} as txn_tp_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as rqs_cnl_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as setl_cnl_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as txn_ccy_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as cnvr_ccy_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as exg_rate_to_cnvr_ccy,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as msr_prd_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as tm_of_day_tbnd_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as excp_caus_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as excp_imp_id,
            {{ col_cast("'1'", "varchar", "40") }} as ou_id,
            {{ col_cast("'1'", "varchar", "20") }} as prim_ar_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as rqs_cmm_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as net_cash_flow_amt,
            {{ col_cast("'1'", "varchar", "20") }} as txn_tm,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as txn_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as txn_book_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as txn_val_dt,
            {{ col_cast("'1'", "varchar", "50") }} as dvc_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as sspcs_ev_grp_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} as fee_x_cmsn_amt
), columns_prep as (
    select  txn.trans_id as txn_id,
            txn.type as txn_tp_id,
            rqs_cnl_id, setl_cnl_id, txn_ccy_id, cnvr_ccy_id, exg_rate_to_cnvr_ccy, msr_prd_id,
            tm_of_day_tbnd_id, excp_caus_id, excp_imp_id, 
            txn.bank as ou_id,
            txn.account_id as prim_ar_id,
            rqs_cmm_id, 
            txn.balance as net_cash_flow_amt, 
            txn.fulltime as txn_tm,
            {{ dbt.safe_cast("txn.fulldate", api.Column.translate_type("date")) }} as txn_dt,
            txn_book_dt, txn_val_dt,
            txn.operation as dvc_id,
            sspcs_ev_grp_id,
            txn.amount as fee_x_cmsn_amt,
            {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
            current_timestamp as load_time
    from {{ source('rawdata', 'completed_transaction') }} txn
    left join source_data srd
    on txn.trans_id = srd.txn_id
)

 select * from columns_prep