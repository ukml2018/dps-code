{{ config(materialized='incremental', alias='sa_ip_to_sa_ev_rl', unique_key='ip_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_to_ev_rl_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as ev_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as ip_src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as ip_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "256") }} 	as ev_ip_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "10") }} 	as ev_ip_src_sys_cd,
            {{ col_cast("'1'", "varchar", "25") }} 	as batch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as loaded_time
) 

 SELECT * FROM source_data WHERE 1=2 