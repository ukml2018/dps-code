{{ config(materialized='incremental', alias='cc_ar', unique_key='cc_ar_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "20") }} 	as cc_ar_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as cc_tp_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as expiry_dt,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as chp_card_f,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as scd_ac_f,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as tfr_bal_otsnd_f,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as nbr_of_adl_cards,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as photo_f,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as intrdy_prd_expiry_dt,
            {{ col_cast("'1'", "varchar", "20") }} 	as ar_src_sys_cd
), columns_prep as (
    select  cad.card_id as cc_ar_id,
            cad.type as cc_tp_id,
            cad.fulldate as expiry_dt, 
            chp_card_f, scd_ac_f, tfr_bal_otsnd_f, nbr_of_adl_cards, photo_f, intrdy_prd_expiry_dt,
            cad.disp_id as ar_src_sys_cd,
            {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
            current_timestamp as load_time

    from {{ source('rawdata', 'completed_card') }} cad
    left join source_data srd
    on cad.card_id = srd.cc_ar_id
)

 select * from columns_prep