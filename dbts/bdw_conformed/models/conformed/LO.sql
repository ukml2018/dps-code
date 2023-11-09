{{ config(materialized='incremental', alias='lo', unique_key='lo_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "100") }}  	as lo_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as ppn_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as ppn_tm,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as src_stm_id,
            {{ col_cast("'1'", "varchar", "20") }} 	as unq_id_in_src_stm,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as lo_tp_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as prn_lo_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as lo_nm,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as eff_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "256") }} 	as dsc
), current_locations as (
    select distinct city as lo_nm, 'city' as type
    from {{ source('rawdata', 'completed_client') }}
    union all
    select distinct state as lo_nm, 'state' as type
    from {{ source('rawdata', 'completed_client') }}
    union all
    select distinct region as lo_nm, 'region' as type
    from {{ source('rawdata', 'completed_district') }}
    union all
    select distinct division as lo_nm, 'division' as type
    from {{ source('rawdata', 'completed_district') }}
), states as (
    select distinct state_name, state_abbrev
    from {{ source('rawdata', 'completed_district') }}
),columns_prep as (
    select
        {{ dbt.concat(["clo.lo_nm", "'-'", "clo.type"]) }} as lo_id,
        sd.ppn_dt,
        sd.ppn_tm,
        src_stm_id,
        unq_id_in_src_stm,
        clo.type as lo_tp_id,
        prn_lo_id,
        clo.lo_nm as lo_nm,
        eff_dt,
        end_dt,
        states.state_name as dsc,
        {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
        current_timestamp as load_time
    from current_locations clo
    left join source_data sd
    on clo.lo_nm = sd.lo_id
    left join  states
    on clo.lo_nm = states.state_abbrev and clo.type='state'
)

 select * from columns_prep