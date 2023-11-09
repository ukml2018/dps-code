{{ config(materialized='incremental', alias='sa_ri_eltrn_addr', unique_key='ri_id')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as ri_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ri_to_eltrn_addr_rl_ty_id,
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
            {{ col_cast("'1'", "varchar", "32") }} 	as eltrn_addr_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as tlphnc_dvc_ty_id,
            {{ col_cast("'1'", "varchar", "2") }} 	as grnule,
            {{ col_cast("'1'", "varchar", "4") }} 	as cntry_ph_cd,
            {{ col_cast("'1'", "varchar", "6") }} 	as ph_cd,
            {{ col_cast("'1'", "varchar", "10") }} 	as lcl_nbr,
            {{ col_cast("'1'", "varchar", "6") }} 	as extnsn,
            {{ col_cast("'1'", "varchar", "30") }} 	as fl_ph_nbr,
            {{ col_cast("'1'", "varchar", "20") }} 	as email_usr_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as maxm_msg_sz,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as attac_alwd_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as txt_only_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as eltrn_addr_dm_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as web_addr_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as web_addr_prtcl_ty_id,
            {{ col_cast("'1'", "varchar", "256") }} 	as url,
            {{ col_cast("'1'", "varchar", "25") }} 	as batch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as loaded_time
) 

 SELECT * FROM source_data WHERE 1=2