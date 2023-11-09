
{{ config(materialized='incremental', alias='interaction_depot', unique_key='interaction_depot_id', re_data_monitored=true)}}

with source_data as (
    select  cp.cpgn_id as interaction_depot_id
            , cp.actl_strt_dt as {{ add_quote("timestamp") }}  
            , cp.src_sys_unq_key_txt as account_id 
            , cp.src_sys_cd as client_id
            , chnl.chnl_txt as channel
            , cp.cmpnavy_ty_id as eventtype
            , cp.cmpnavy_nm as locationid
            , cp.cpgn_seg_actvty_nm as treatmentid
            , cp.scenr_id as journey
            , cp.actvty_lc_sts_ty_id as stage
            ,{{ dbt.replace(dbt.split_part(string_text="cp.actl_strt_dt", delimiter_text="'T'", part_number=1), "'-'", "''") }} as dim_interaction_date
            , cp.batch_nbr as batch_nbr
            , cp.load_time as load_time
    from {{ source('conformed', 'sa_cpgn_seg_actvty') }} cp
    left join {{ source('conformed', 'sa_chnl') }} chnl
    on chnl.chnl_id = cp.chnl_id
)

select * from source_data