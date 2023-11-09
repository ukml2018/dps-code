
{{ config(materialized='incremental', alias='customer_profile', unique_key='customer_id', re_data_monitored=true)}}

with source_data as (
    select ip.src_sys_cd as customer_id
            , ip.gndr_id as gender_display
            , ip.dob as birth_date
            , {{ dbt.date_trunc("day", "ip.dob") }} as birth_day
            , {{ dbt.date_trunc("month", "ip.dob") }} as birth_month
            , {{ dbt.date_trunc("year", "ip.dob") }} as birth_year
            , prof.idv_age as age
            , ip.prmy_idfn_nbr_txt as social_number
            , ip.gvn_nm as first_name
            , ip.mid_nm as middle_name
            , ip.surnm as last_name
            , eltrn.fl_ph_nbr as primary_phone
            , eltrn.email_usr_id as primary_email
            , pstl.addr_nm as mailing_address
            , pstl.unt_nbr as unit_address
            , lo1.lo_nm as city
            , lo2.lo_nm as state
            , pstl.pstcd_area_id as postal_code
            , pstl.dstrct as district_id
            , ip.cr_rsk_scor as credit_score
            , case
                when ip.crmnl_cnvct_flg = 1 then 'y'
                else 'n'
              end as criminal_record
            , sectg_id as acorn_category
            , ip.batch_nbr as batch_nbr
            , ip.load_time as load_time
    from {{ source('conformed', 'sa_ip') }} ip
    left join {{ source('conformed', 'sa_ip_prof') }} prof
    on ip.ip_id = prof.ip_id
    left join {{ source('conformed', 'sa_ip_eltrn_addr') }} eltrn
    on ip.ip_id = eltrn.ip_id
    left join {{ source('conformed', 'sa_ip_pstl_addresses') }} pstl
    on ip.ip_id = pstl.ip_id
    left join {{ source('conformed', 'lo') }} lo1
    on pstl.city_id = lo1.lo_id
    left join {{ source('conformed', 'lo') }} lo2
    on pstl.st_id = lo2.lo_id
)

select * from source_data