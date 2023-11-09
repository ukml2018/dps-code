{{ config(materialized='incremental', alias='sa_ev_cpgn', unique_key='ev_cpgn_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "32") }} 	as ev_cpgn_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ev_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ev_lc_sts_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ev_lc_sts_rsn_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as ev_lc_sts_ty_dt,
            {{ col_cast("'1'", "varchar", "32") }} 	as ev_orgntn_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as ev_src_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ev_cntct_mdm_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as prty_rtng_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as authrztn_cd,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as authrztn_dt,
            {{ col_cast("'1'", "varchar", "32") }} 	as ev_prps_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ev_exctn_mode_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as cpgn_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as cpgn_lc_sts_rsn_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as cpgn_trgr_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as expct_strt_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as actl_strt_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as expct_end_dt,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as actl_end_dt,
            {{ col_cast("'1'", "varchar", "32") }} 	as cpgn_nm,
            {{ col_cast("'1'", "varchar", "10") }} 	as cpgn_cd,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as prd_id
), columns_prep as (
    select 
        ev_cpgn_id,
        ev_ty_id, ev_lc_sts_ty_id, ev_lc_sts_rsn_ty_id, ev_lc_sts_ty_dt, ev_orgntn_ty_id,
        ev_src_id, ev_cntct_mdm_ty_id, 
        review.stars as prty_rtng_id, 
        authrztn_cd, authrztn_dt, 
        review.reviews as ev_prps_ty_id,
        ev_exctn_mode_id, cpgn_ty_id, cpgn_lc_sts_rsn_ty_id,cpgn_trgr_ty_id, expct_strt_dt,
        review.date as actl_strt_dt, 
        expct_end_dt, srd.{{ add_quote("desc") }}, actl_end_dt, cpgn_nm, cpgn_cd, 
        prd.prd_id as prd_id,
        {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
        current_timestamp as load_time
           
    from {{ source('rawdata', 'crm_review') }} as review
    left join source_data as srd
    on review.date = srd.actl_strt_dt
    left join {{ ref('SA_PRD') }} prd
    on review.product = prd.prd_nm

)

 select * from columns_prep