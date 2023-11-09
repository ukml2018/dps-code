{{ config(materialized='incremental', alias='sa_ip_pstl_addresses', unique_key='ip_id')}} 
 
with source_data as (
    select
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as ip_to_pstl_addr_rl_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as effv_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as rnk,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("date")) }} 	as end_dt,
            {{ col_cast("'1'", "varchar", "10") }} 	as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} 	as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as btch_id,
            {{ col_cast("'1'", "varchar", "10") }} 	as ip_src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} 	as ip_src_sys_unq_key_txt,
            {{ col_cast("'1'", "varchar", "256") }} 	as {{ add_quote("desc") }},
            {{ col_cast("'1'", "varchar", "32") }} 	as cntnty_of_addr_seg_id,
            {{ col_cast("'1'", "varchar", "256") }} 	as cntct_txt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as solct_flg,
            {{ col_cast("'1'", "varchar", "20") }} 	as addr_nm,
            {{ col_cast("'1'", "varchar", "6") }} 	as box_nbr,
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
            {{ col_cast("'1'", "varchar", "20") }} 	as pstl_barcde
), columns_prep as (
    select 
        ip.ip_id as ip_id,
        ip_to_pstl_addr_rl_ty_id,
        srd.effv_dt,
        rnk,
        srd.end_dt,
        srd.src_sys_cd,
        srd.src_sys_unq_key_txt,
        srd.effv_ts,
        srd.end_ts,
        srd.tnnt_cd_id,
        srd.btch_id,
        cp.client_id as ip_src_sys_cd,
        ip_src_sys_unq_key_txt,
        srd.{{ add_quote("desc") }},
        ip.cntnty_of_addr_seg_id as cntnty_of_addr_seg_id,
        cntct_txt,
        solct_flg,
        cp.address_1 as addr_nm,
        box_nbr,
        cp.address_2 as unt_nbr,
        bldg_nbr,
        ste_nbr,
        ste_nm,
        ste_ty,
        ste_drctn,
        ste_sfx,
        cp.zipcode as pstcd_area_id,
        cp.district_id as dstrct,
        lo1.lo_id as city_id,
        lo2.lo_id as st_id,
        cnty_id,
        cntry_id,
        rt_id,
        census_area_id,
        bldg_ty_id,
        longd,
        latd,
        pstl_barcde,
        {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
        current_timestamp as load_time
    from {{ source('rawdata', 'completed_client') }} cp
    left join source_data srd
    on cp.client_id = srd.ip_id
    left join {{ ref('SA_IP') }} ip
    on ip.src_sys_cd = cp.client_id
    left join {{ ref('LO') }} as lo1
        on cp.city = lo1.lo_nm
    left join {{ ref('LO') }} as lo2
        on cp.state = lo2.lo_nm

) 

 SELECT * FROM columns_prep