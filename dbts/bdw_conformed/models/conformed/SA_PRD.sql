{{ config(materialized='incremental', alias='sa_prd', unique_key='PRD_ID')}} 
 
with source_data as (
    SELECT
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as prd_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_ty_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as prd_cd,
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_nm,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_dt,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_usblty_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_accsblty_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_dlvry_tbnd_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_cost_seg_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as cust_mseg_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_pmt_varblty_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_lc_sts_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as prd_lc_sts_ty_dt,
            {{ col_cast("'1'", "varchar", "32") }} 	as prd_proft_seg_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as prd_proft_seg_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as parnt_prd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as cust_ac_rqd_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as scr_rqd_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as tax_advtg_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as spclzd_prd_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as fnc_prd_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as exotc_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as rdly_mktbl_flg,
            {{ col_cast("'1'", "varchar", "32") }} 	as ins_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as invstm_prd_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as invstm_prd_use_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as invstm_obj_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as invstm_ownrsh_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as srvc_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as outsrc_srvc_flg,
            {{ col_cast("'1'", "varchar", "32") }} 	as card_srvc_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as pmt_cut_off_tm,
            {{ col_cast("'1'", "varchar", "32") }} 	as fmimt_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as issr_id,
            {{ col_cast("'1'", "varchar", "1") }} 	as priv_to_pub_trd_ind,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as iss_dt
), products as(
    select distinct product
    from {{ source('rawdata', 'crm_event') }}
    union all
    select distinct sub_product as product
    from {{ source('rawdata', 'crm_event') }}
    where sub_product is not null
    union all
    select distinct product
    from {{ source('rawdata', 'crm_review') }}
), columns_prep as (
    select
        row_number() over (order by pro.product asc) as prd_id,
        pro.product as prd_nm,
        src_sys_cd,
        src_sys_unq_key_txt,
        effv_ts,
        end_ts,
        tnnt_cd_id,
        btch_id,
        prd_ty_id,
        prd_cd,
        end_dt,
        effv_dt,
        {{ add_quote("desc") }},
        prd_usblty_ty_id,
        prd_accsblty_ty_id,
        prd_dlvry_tbnd_id,
        prd_cost_seg_id,
        cust_mseg_id,
        prd_pmt_varblty_ty_id,
        prd_lc_sts_ty_id,
        prd_lc_sts_ty_dt,
        prd_proft_seg_id,
        prd_proft_seg_dt,
        parnt_prd_id,
        cust_ac_rqd_flg,
        scr_rqd_flg,
        tax_advtg_flg,
        spclzd_prd_flg,
        fnc_prd_flg,
        exotc_flg,
        rdly_mktbl_flg,
        ins_ty_id,
        invstm_prd_ty_id,
        invstm_prd_use_id,
        invstm_obj_ty_id,
        invstm_ownrsh_ty_id,
        srvc_ty_id,
        outsrc_srvc_flg,
        card_srvc_ty_id,
        pmt_cut_off_tm,
        fmimt_ty_id,
        issr_id,
        priv_to_pub_trd_ind,
        iss_dt,
        {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
        current_timestamp as load_time
    from products pro
    left join source_data sd
    on pro.product = sd.prd_nm

)

 select * from columns_prep