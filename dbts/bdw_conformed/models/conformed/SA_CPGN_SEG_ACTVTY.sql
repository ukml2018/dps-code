{{ config(materialized='incremental', alias='sa_cpgn_seg_actvty', unique_key='cpgn_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "32") }} 	as cpgn_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as seg_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as scenr_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as nbr_of_seg_cpgn_cmm,
            {{ col_cast("'1'", "varchar", "32") }} 	as seg_actvty_lc_sts_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as seg_actvty_lc_sts_rsn_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as seg_dlv_amt_uom_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as seg_dlv_amt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as maxm_trg_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as expct_strt_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as expct_end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as actl_strt_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as actl_end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as rslt_end_dt,
            {{ col_cast("'1'", "varchar", "32") }} 	as cpgn_seg_actvty_nm,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as seg_cost_amt,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as cpgn_seg_actvty_nbr,
            {{ col_cast("'1'", "varchar", "32") }} 	as cmpnavy_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as cpgn_lc_sts_rsn_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as actvty_lc_sts_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as chnl_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as nbr_of_cpgn_cmm,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 15, 2)) }} 	as cpgn_cost_amt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as trmn_actvty_flg,
            {{ col_cast("'1'", "varchar", "256") }} 	as cmpnavy_desc,
            {{ col_cast("'1'", "varchar", "32") }} 	as cmpnavy_nm
), merged_dpt as (
    select {{ add_quote("timestamp") }}, account_id, client_id, channel, eventtype, '' as locationid, treatmentid
    from {{ source('rawdata', 'interactiondepot_email') }}
    union all
    select {{ add_quote("timestamp") }}, account_id, client_id, channel, eventtype, locationid, treatmentid
     from {{ source('rawdata', 'interactiondepot_callcenter') }}
    union all
    select {{ add_quote("timestamp") }}, account_id, client_id, channel, eventtype, locationid, treatmentid
    from {{ source('rawdata', 'interactiondepot_mobile') }}
    union all
    select {{ add_quote("timestamp") }}, account_id, client_id, channel, eventtype, locationid, treatmentid
   from {{ source('rawdata', 'interactiondepot_web') }}
), itdpt as (
    select  
            {{ dbt_utils.generate_surrogate_key(["account_id", "timestamp", "channel", "eventtype", "treatmentid"]) }} as interaction_depot_id
            , {{ add_quote("timestamp") }}
            , account_id 
            , client_id
            , channel
            , eventtype
            , locationid
            , treatmentid
            , case
                when lower(locationid)='autoloan' then 'autoloan'
                when lower(locationid)='homeloan' then 'homeloan'
                when lower(locationid)='credit' then 'credit'
                when lower(locationid)='deposit' then 'deposit'
                when lower(locationid)='investing' then 'investing'
                else ''
              end as journey
            , case
                when channel='call' and eventtype='considering' then 'discovery'
                when eventtype='conversion' then 'conversion'
                when eventtype='lead' then 'interest'
                when channel='call' and eventtype='offered' then 'awareness'
                when eventtype='click' then 'discovery'
                when channel='email' and eventtype='open' then 'discovery'
                when channel='email' and eventtype='sent' then 'awareness'
                when eventtype='presented' then 'awareness'
                else ''
              end as stage
    from merged_dpt
    -- where substring(timestamp, 15, 2) < 60 
    --       and substring(timestamp, 18, 2) < 60 --can't parse '2017-12-31t14:60:51' as timestamp with format 'yyyy-mm-ddthh24:mi:ss'
    --       and substring(timestamp, 18, 1) != ':'
),columns_prep as (
    select 
        itdpt.interaction_depot_id as cpgn_id,
        seg_id,
        itdpt.journey as scenr_id,
        itdpt.client_id as src_sys_cd,
        itdpt.account_id as src_sys_unq_key_txt,
        srd.effv_ts,
        srd.end_ts,
        srd.tnnt_cd_id,
        srd.btch_id,
        srd.nbr_of_seg_cpgn_cmm,
        srd.seg_actvty_lc_sts_ty_id,
        srd.seg_actvty_lc_sts_rsn_ty_id,
        srd.seg_dlv_amt_uom_id,
        srd.seg_dlv_amt,
        srd.maxm_trg_nbr,
        srd.expct_strt_dt,
        srd.expct_end_dt,
        itdpt.{{ add_quote("timestamp") }} as actl_strt_dt,
        srd.actl_end_dt,
        srd.rslt_end_dt,
        itdpt.treatmentid as cpgn_seg_actvty_nm,
        srd.seg_cost_amt,
        srd.{{ add_quote("desc") }},
        srd.cpgn_seg_actvty_nbr,
        itdpt.eventtype as cmpnavy_ty_id,
        srd.cpgn_lc_sts_rsn_ty_id,
        itdpt.stage as actvty_lc_sts_ty_id,
        chnl.chnl_id as chnl_id,
        srd.nbr_of_cpgn_cmm,
        srd.cpgn_cost_amt,
        srd.trmn_actvty_flg,
        srd.cmpnavy_desc,
        itdpt.locationid as cmpnavy_nm,
        {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
        current_timestamp as load_time
    from itdpt
    left join source_data as srd
    on srd.cpgn_id = itdpt.interaction_depot_id
    left join {{ ref('SA_CHNL') }} as chnl
    on itdpt.channel = chnl.chnl_txt
) 

 select * from columns_prep