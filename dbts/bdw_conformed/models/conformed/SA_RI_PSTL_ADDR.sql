{{ config(materialized='incremental', alias='sa_ri_pstl_addr', unique_key='ri_id')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as ri_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ri_to_pstl_addr_rl_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as effv_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as rnk,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "256") }} 	as ri_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "10") }} 	as ri_src_sys_cd,
            {{ col_cast("'1'", "varchar", "20") }} 	as addr_nm,
            {{ col_cast("'1'", "varchar", "4") }} 	as unt_nbr,
            {{ col_cast("'1'", "varchar", "10") }} 	as bldg_nbr,
            {{ col_cast("'1'", "varchar", "3") }} 	as ste_nbr,
            {{ col_cast("'1'", "varchar", "64") }} 	as ste_nm,
            {{ col_cast("'1'", "varchar", "10") }} 	as ste_ty,
            {{ col_cast("'1'", "varchar", "6") }} 	as ste_drctn,
            {{ col_cast("'1'", "varchar", "10") }} 	as ste_sfx,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as pstcd_area_id,
            {{ col_cast("'1'", "varchar", "40") }} 	as dstrct,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as city_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as st_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as cnty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as cntry_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as rt_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as census_area_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as bldg_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 5)) }} 	as longd,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 5)) }} 	as latd,
            {{ col_cast("'1'", "varchar", "20") }} 	as pstl_barcde,
            {{ col_cast("'1'", "varchar", "25") }} 	as batch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as loaded_time
) 

 SELECT * FROM source_data WHERE 1=2