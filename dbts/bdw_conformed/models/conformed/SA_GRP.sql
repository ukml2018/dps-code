{{ config(materialized='incremental', alias='sa_grp', unique_key='grp_id')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as grp_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as grp_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as effv_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "20") }} 	as grp_cd,
            {{ col_cast("'1'", "varchar", "32") }} 	as grp_nm,
            {{ col_cast("'1'", "varchar", "64") }} 	as grp_txt,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_grp_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as resp_cntr_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as lo_grp_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as fnc_mrkt_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_grp_ty_id,
            {{ col_cast("'1'", "varchar", "25") }} 	as batch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as loaded_time
    
) 

 SELECT * FROM source_data WHERE 1=2