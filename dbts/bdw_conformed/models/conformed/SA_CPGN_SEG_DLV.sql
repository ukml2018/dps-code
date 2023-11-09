{{ config(materialized='incremental', alias='sa_cpgn_seg_dlv', unique_key='mseg_grp_id')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as mseg_grp_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as scenr_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as cpgn_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as cpgn_dlv_nbr,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as nbr_of_seg_cpgn_cmm,
            {{ col_cast("'1'", "varchar", "32") }} 	as seg_actvty_lc_sts_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as seg_actvty_lc_sts_rsn_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as seg_dlv_amt_uom_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as seg_dlv_amt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as maxm_trg_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as expct_strt_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as expct_end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as actl_strt_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as actl_end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as rslt_end_dt,
            {{ col_cast("'1'", "varchar", "32") }} 	as cpgn_seg_actvty_nm,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as seg_cost_amt,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ col_cast("'1'", "varchar", "32") }} 	as cpgn_dlv_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as dlv_amt_uom_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as dlv_amt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "25") }} 	as batch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as loaded_time
) 

 SELECT * FROM source_data WHERE 1=2 