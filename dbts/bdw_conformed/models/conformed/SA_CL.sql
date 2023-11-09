{{ config(materialized='incremental', alias='sa_cl', unique_key='cl_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "32") }} 	as cl_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as nmrc_cd_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as cd_len,
            {{ col_cast("'1'", "varchar", "10") }} 	as schm_cd,
            {{ col_cast("'1'", "varchar", "32") }} 	as cl_schm_nm,
            {{ col_cast("'1'", "varchar", "64") }} 	as cl_schm_long_nm,
            {{ col_cast("'1'", "varchar", "32") }} 	as cl_cd,
            {{ col_cast("'1'", "varchar", "18") }} 	as cl_shrt_nm,
            {{ col_cast("'1'", "varchar", "64") }} 	as cl_nm,
            {{ col_cast("'1'", "varchar", "256") }} as cl_desc,
            {{ col_cast("'1'", "varchar", "25") }} 	as batch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as loaded_time
) 

 SELECT * FROM source_data WHERE 1=2