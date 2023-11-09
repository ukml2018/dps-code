{{ config(materialized='incremental', alias='fnc_mkt_ordr', unique_key='fnc_mkt_ordr_id')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as fnc_mkt_ordr_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as fnc_mkt_imt_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as fnc_mkt_ordr_tp_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as fnc_mkt_ordr_txn_tp_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 23, 8)) }} 	as upr_prc,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 23, 8)) }} 	as ordr_prc,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 23, 8)) }} 	as lwr_prc,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 5)) }} 	as ordr_qty,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as ordr_val,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as ordr_end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as ordr_end_tm,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as cncl_dt_tm,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as day_ordr_f,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as fill_or_kill_f,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as cd_met_f,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as ordr_ccy_id
), columns_prep as (
    select  ord.order_id as fnc_mkt_ordr_id,
            ord.account_id as fnc_mkt_imt_id,
            ord.k_symbol as fnc_mkt_ordr_tp_id,
            fnc_mkt_ordr_txn_tp_id, upr_prc,
            ord.amount as ordr_prc,
            lwr_prc, ordr_qty, ordr_val, ordr_end_dt, ordr_end_tm, cncl_dt_tm, day_ordr_f, fill_or_kill_f,
            cd_met_f, 
            ordr_ccy_id,
            {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
            current_timestamp as load_time

    from {{ source('rawdata', 'completed_order') }} ord
    left join source_data srd
    on ord.order_id = srd.fnc_mkt_ordr_id
)

 select * from columns_prep