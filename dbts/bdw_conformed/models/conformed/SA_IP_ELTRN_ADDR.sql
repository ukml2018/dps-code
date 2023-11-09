{{ config(materialized='incremental', alias='sa_ip_eltrn_addr', unique_key='ip_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_to_eltrn_addr_rl_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as effv_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as rnk,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as ip_src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as ip_src_sys_unq_key_txt,
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
            {{ col_cast("'1'", "varchar", "256") }} 	as url
), columns_prep as (
    select 
            ip.ip_id as ip_id,
            ip_to_eltrn_addr_rl_ty_id,
            id.collection_timestamp as effv_dt,
            rnk,
            srd.end_dt,
            id.source_id as src_sys_cd,
            srd.src_sys_unq_key_txt,
            srd.effv_ts,
            srd.end_ts,
            srd.tnnt_cd_id,
            srd.btch_id,
            cp.client_id as ip_src_sys_cd,
            id.maid as ip_src_sys_unq_key_txt,
            id.ip_address as eltrn_addr_ty_id,
            id.device_type as tlphnc_dvc_ty_id,
            grnule,
            cntry_ph_cd,
            ph_cd,
            lcl_nbr,
            id.sha1_hashed_email as extnsn,
            cp.phone as fl_ph_nbr,
            cp.email as email_usr_id,
            maxm_msg_sz,
            attac_alwd_flg,
            txt_only_flg,
            eltrn_addr_dm_id,
            web_addr_ty_id,
            web_addr_prtcl_ty_id,
            url,
            {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
            current_timestamp as load_time
    FROM {{ source('rawdata', 'completed_client') }} cp
    LEFT JOIN source_data srd
    on cp.client_id = srd.ip_id
    left join {{ ref('SA_IP') }} ip
    on ip.src_sys_cd = cp.client_id
    left join {{ source('rawdata', 'identity_data') }} id
    on cp.client_id = id.clientid

) 

 SELECT * FROM columns_prep