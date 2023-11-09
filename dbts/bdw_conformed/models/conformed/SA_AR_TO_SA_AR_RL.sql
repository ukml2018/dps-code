{{ config(materialized='incremental', alias='sa_ar_to_sa_ar_rl', unique_key='obj_ar_id')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as obj_ar_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as subjt_ar_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ar_to_ar_rl_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as subjt_ar_src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as subjt_ar_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "10") }} 	as obj_ar_src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as obj_ar_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "32") }} 	as ar_x_ar_rl_lc_sts_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as rl_lc_sts_dt,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 5, 2)) }} 	as pct_amt,
            {{ col_cast("'1'", "varchar", "25") }} 	as batch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as loaded_time
) 

 SELECT * FROM source_data WHERE 1=2