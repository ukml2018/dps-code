{{ config(materialized='incremental', alias='sa_ip_to_sa_ip_rl', unique_key='obj_ip_id')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as effv_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as obj_ip_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_to_ip_rl_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as subjt_ip_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as subjt_ip_src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as subjt_ip_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "10") }} 	as obj_ip_src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as obj_ip_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_x_ip_rl_lc_sts_rsn_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as rl_lc_sts_dt,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 5, 2)) }} 	as pct_amt,
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_x_ip_rl_lc_sts_ty_id,
            {{ col_cast("'1'", "varchar", "25") }} 	as batch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as loaded_time
) 

 SELECT * FROM source_data WHERE 1=2