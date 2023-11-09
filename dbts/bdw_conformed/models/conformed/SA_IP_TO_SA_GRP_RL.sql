{{ config(materialized='incremental', alias='sa_ip_to_sa_grp_rl', unique_key='ip_id')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as effv_dt,
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_to_grp_rl_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as grp_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as ip_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "256") }} 	as grp_ip_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "10") }} 	as grp_ip_src_sys_cd,
            {{ col_cast("'1'", "varchar", "10") }} 	as ip_src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as ip_src_sys_unq_key_txt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as prfrd_cntct_dy,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as solct_flg,
            {{ col_cast("'1'", "varchar", "25") }} 	as batch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as loaded_time
) 

 SELECT * FROM source_data WHERE 1=2