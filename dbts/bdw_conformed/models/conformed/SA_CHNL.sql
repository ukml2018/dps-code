{{ config(materialized='incremental', alias='sa_chnl', unique_key='chnl_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "64") }} 	as chnl_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_dt,
            {{ col_cast("'1'", "varchar", "64") }} 	as chnl_txt,
            {{ col_cast("'1'", "varchar", "32") }} 	as chnl_nm,
            {{ col_cast("'1'", "varchar", "20") }} 	as chnl_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ col_cast("'1'", "varchar", "32") }} 	as chnl_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as chnl_lc_sts_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as chnl_lc_sts_rsn_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as chnl_fnctn_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as chnl_cmm_form_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as chnl_cmm_drctn_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as chnl_dlvry_tmfrm_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as chnl_ownrsh_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as admn_ip_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as dlvry_ip_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as ri_chnl_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as dlvry_ri_id
), current_channels as(
    select distinct channel
    from {{ source('rawdata', 'interactiondepot_email') }}
    union all
    select distinct channel
    from {{ source('rawdata', 'interactiondepot_callcenter') }}
    union all
    select distinct channel
    from {{ source('rawdata', 'interactiondepot_mobile') }}
    union all
    select distinct channel
    from {{ source('rawdata', 'interactiondepot_web') }}
), columns_prep as (
    select
        chn.channel as chnl_id,
        src_sys_cd,
        src_sys_unq_key_txt,
        effv_ts,
        end_ts,
        tnnt_cd_id,
        btch_id,
        end_dt,
        effv_dt,
        chn.channel as chnl_txt,
        chnl_nm,
        chnl_cd,
        {{ add_quote("desc") }},
        chnl_ty_id,
        chnl_lc_sts_ty_id,
        chnl_lc_sts_rsn_ty_id,
        chnl_fnctn_ty_id,
        chnl_cmm_form_id,
        chnl_cmm_drctn_id,
        chnl_dlvry_tmfrm_ty_id,
        chnl_ownrsh_ty_id,
        admn_ip_id,
        dlvry_ip_id,
        ri_chnl_flg,
        dlvry_ri_id,
        {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
        current_timestamp as load_time
    from current_channels chn
    left join source_data sd
    on chn.channel = sd.chnl_id

)

 select * from columns_prep