{{ config(materialized='incremental', alias='sa_ip', unique_key='src_sys_cd')}} 
 
with source_data as (
    select
            {{ col_cast("'1'", "varchar", "50") }} as ip_id,
            {{ col_cast("'1'", "varchar", "50") }} as src_sys_cd,
            {{ col_cast("'1'", "varchar", "256") }} as src_sys_unq_key_txt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as effv_ts,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as end_ts,
            {{ col_cast("'1'", "varchar", "10") }} as tnnt_cd_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as btch_id,
            {{ col_cast("'1'", "varchar", "32") }} as ip_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as effv_dt,
            {{ col_cast("'1'", "varchar", "32") }} as {{ add_quote("desc") }},
            {{ col_cast("'1'", "varchar", "32") }} as ip_lc_sts_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as ip_lc_sts_dt,
            {{ col_cast("'1'", "varchar", "32") }} as prmy_rl_ty_id,
            {{ col_cast("'1'", "varchar", "256") }} as fnc_lgl_sts_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as fnc_lgl_sts_effv_dt,
            {{ col_cast("'1'", "varchar", "50") }} as ip_crr_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as ip_crr_dt,
            {{ col_cast("'1'", "varchar", "50") }} as pdft_cgy_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as pdft_cgy_effv_dt,
            {{ col_cast("'1'", "varchar", "64") }} as ip_nm,
            {{ col_cast("'1'", "varchar", "32") }} as ip_skl_ty_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as fi_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as fi_invest_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as advrts_flg,
            {{ col_cast("'1'", "varchar", "32") }} as sus_montr_sts_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as sus_montr_sts_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as prvs_rfus_flg,
            {{ col_cast("'1'", "varchar", "32") }} as idv_lc_sts_ty_id,
            {{ col_cast("'1'", "varchar", "32") }} as relg_id,
            {{ col_cast("'1'", "varchar", "50") }} as gndr_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as dob,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as dth_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as dth_notif_dt,
            {{ col_cast("'1'", "varchar", "32") }} as lang_id,
            {{ col_cast("'1'", "varchar", "32") }} as idv_mrtl_sts_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as idv_mrtl_sts_dt,
            {{ col_cast("'1'", "varchar", "32") }} as idv_age_seg_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as idv_age_seg_dt,
            {{ col_cast("'1'", "varchar", "32") }} as idv_race_id,
            {{ col_cast("'1'", "varchar", "32") }} as idv_ethnic_ty_id,
            {{ col_cast("'1'", "varchar", "50") }} as sectg_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as sectg_dt,
            {{ col_cast("'1'", "varchar", "32") }} as idv_incm_seg_id,
            {{ col_cast("'1'", "varchar", "32") }} as idv_ind_cl_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as idv_ind_cl_dt,
            {{ col_cast("'1'", "varchar", "32") }} as hsng_tnre_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as hsng_tnre_dt,
            {{ col_cast("'1'", "varchar", "32") }} as cntnty_of_addr_seg_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as cntnty_of_addr_seg_dt,
            {{ col_cast("'1'", "varchar", "32") }} as cert_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as cert_dt,
            {{ col_cast("'1'", "varchar", "32") }} as idv_ocpn_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as idv_ocpn_dt,
            {{ col_cast("'1'", "varchar", "32") }} as idv_empmnt_sts_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as idv_empmnt_sts_dt,
            {{ col_cast("'1'", "varchar", "32") }} as idv_empmnt_tm_comit_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as idv_empmnt_tm_comit_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as fthr_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as sps_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as mthr_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as cntry_of_brth_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as cntry_of_ctznshp_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as hh_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as head_of_hh_flg,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as ctznshp_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as cntry_of_res_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as cntry_of_res_dt,
            {{ col_cast("'1'", "varchar", "6") }} as nm_intl,
            {{ col_cast("'1'", "varchar", "10") }} as salu,
            {{ col_cast("'1'", "varchar", "10") }} as nm_qualif,
            {{ col_cast("'1'", "varchar", "50") }} as gvn_nm,
            {{ col_cast("'1'", "varchar", "50") }} as mid_nm,
            {{ col_cast("'1'", "varchar", "50") }} as surnm,
            {{ col_cast("'1'", "varchar", "25") }} as surnm2,
            {{ col_cast("'1'", "varchar", "25") }} as maid_nm,
            {{ col_cast("'1'", "varchar", "6") }} as sfx,
            {{ col_cast("'1'", "varchar", "50") }} as fl_nm,
            {{ col_cast("'1'", "varchar", "32") }} as prmy_idfn_ty_id,
            {{ col_cast("'1'", "varchar", "50") }} as prmy_idfn_nbr_txt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as crmnl_cnvct_flg,
            {{ col_cast("'1'", "varchar", "32") }} as org_lc_sts_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as org_lc_sts_dt,
            {{ col_cast("'1'", "varchar", "32") }} as cntrl_bnk_ind_cl_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as cntrl_bnk_ind_cl_dt,
            {{ col_cast("'1'", "varchar", "32") }} as intn_rptng_ind_cl_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as intn_rptng_ind_cl_dt,
            {{ col_cast("'1'", "varchar", "32") }} as org_ecnmc_intnt_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as org_ecnmc_intnt_dt,
            {{ col_cast("'1'", "varchar", "32") }} as org_lgl_strc_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as org_lgl_strc_dt,
            {{ col_cast("'1'", "varchar", "32") }} as org_nbr_of_emp_seg_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as org_nbr_of_emp_seg_dt,
            {{ col_cast("'1'", "varchar", "32") }} as org_prps_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as org_prps_dt,
            {{ col_cast("'1'", "varchar", "32") }} as org_rev_seg_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as org_rev_seg_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as incorptn_geo_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as incorptn_geo_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as estb_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as org_lglty_end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as dsslvd_dt,
            {{ col_cast("'1'", "varchar", "32") }} as prmy_cmrcl_nm,
            {{ col_cast("'1'", "varchar", "32") }} as rgstrd_bsns_nm,
            {{ col_cast("'1'", "varchar", "10") }} as org_cd,
            {{ col_cast("'1'", "varchar", "32") }} as org_opertl_area_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as org_opertl_area_ty_dt,
            {{ col_cast("'1'", "varchar", "32") }} as ou_lc_sts_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as ou_lc_sts_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as owng_org_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as mgr_emp_id,
            {{ col_cast("'1'", "varchar", "32") }} as ou_auth_dsgntn_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as ou_auth_dsgntn_dt,
            {{ col_cast("'1'", "varchar", "32") }} as ou_fnctn_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as ou_fnctn_dt,
            {{ col_cast("'1'", "varchar", "32") }} as lob_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as lob_dt,
            {{ col_cast("'1'", "varchar", "32") }} as ou_strc_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as ou_strc_dt,
            {{ col_cast("'1'", "varchar", "10") }} as brnch_nbr,
            {{ col_cast("'1'", "varchar", "10") }} as ou_cd,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as ou_geog_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as ou_geog_dt,
            {{ col_cast("'1'", "varchar", "32") }} as scl_meda_psna_nm,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as scl_meda_psna_effv_dt,
            {{ col_cast("'1'", "varchar", "32") }} as scl_meda_psna_relbty_rtng_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as scl_meda_psna_prmy_email_addr_id,
            {{ col_cast("'1'", "varchar", "32") }} as cust_lc_sts_ty_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as cust_lc_sts_dt,
            {{ col_cast("'1'", "varchar", "32") }} as cust_mseg_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as cust_mseg_dt,
            {{ col_cast("'1'", "varchar", "32") }} as cust_rl_age_seg_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as cust_rl_age_seg_dt,
            {{ col_cast("'1'", "varchar", "32") }} as cust_proft_seg_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as cust_proft_seg_dt,
            {{ col_cast("'1'", "varchar", "32") }} as satsf_rtng_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as satsf_rtng_dt,
            {{ col_cast("'1'", "varchar", "32") }} as rtn_rtng_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as rtn_rtng_dt,
            {{ col_cast("'1'", "varchar", "10") }} as prmy_brnch_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as prmy_brnch_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as prmy_prd_ar_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as end_cust_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as geo_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} as effv_cust_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as intrnt_bnk_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as ph_bnk_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as spcl_trms_flg,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} as cr_rsk_scor
),
columns_prep as (
    select cup.client_id as ip_id
         , cw.outcome as ip_crr_id
         , cw.confidence as pdft_cgy_id
         , cw.review_status as {{ add_quote("desc") }}
         , cup.client_id as src_sys_cd
         , src_sys_unq_key_txt, effv_ts, end_ts, tnnt_cd_id, btch_id
         , ip_ty_id, end_dt, effv_dt, ip_lc_sts_ty_id, ip_lc_sts_dt, prmy_rl_ty_id
         , fnc_lgl_sts_id, fnc_lgl_sts_effv_dt,  ip_crr_dt, pdft_cgy_effv_dt
         , ip_nm, ip_skl_ty_id, fi_flg, fi_invest_flg, advrts_flg, sus_montr_sts_id, sus_montr_sts_dt
         , prvs_rfus_flg, idv_lc_sts_ty_id, relg_id
         , cup.sex as gndr_id
         , {{ dbt.safe_cast('cup.fulldate', api.Column.translate_type('date')) }} as dob
         , dth_dt, dth_notif_dt, lang_id
         , idv_mrtl_sts_ty_id, idv_mrtl_sts_dt, idv_age_seg_id, idv_age_seg_dt, idv_race_id, idv_ethnic_ty_id
         , cup.acorncategory as sectg_id
         , sectg_dt, idv_incm_seg_id, idv_ind_cl_id, idv_ind_cl_dt, hsng_tnre_ty_id
         , hsng_tnre_dt, cntnty_of_addr_seg_id, cntnty_of_addr_seg_dt, cert_ty_id, cert_dt, idv_ocpn_ty_id
         , idv_ocpn_dt, idv_empmnt_sts_ty_id, idv_empmnt_sts_dt, idv_empmnt_tm_comit_id, idv_empmnt_tm_comit_dt
         , fthr_id, sps_id, mthr_id, cntry_of_brth_id, cntry_of_ctznshp_id, hh_id, head_of_hh_flg
         , ctznshp_dt, cntry_of_res_id, cntry_of_res_dt, nm_intl, salu, nm_qualif
         , cup.first as gvn_nm
         , cup.middle as mid_nm
         , cup.last as surnm
         , surnm2, maid_nm, sfx
         , {{ dbt.concat(['cup.first', "' '",'cup.middle', "' '", 'cup.last']) }} as fl_nm
         , prmy_idfn_ty_id
         , cup.social as prmy_idfn_nbr_txt
         , case
                when lower(cup.criminalrecord) = 'y' then 1
                else 0
           end as crmnl_cnvct_flg
         , org_lc_sts_ty_id, org_lc_sts_dt, cntrl_bnk_ind_cl_id, cntrl_bnk_ind_cl_dt, intn_rptng_ind_cl_id
         , intn_rptng_ind_cl_dt, org_ecnmc_intnt_id, org_ecnmc_intnt_dt, org_lgl_strc_ty_id, org_lgl_strc_dt
         , org_nbr_of_emp_seg_id, org_nbr_of_emp_seg_dt, org_prps_id, org_prps_dt, org_rev_seg_id
         , org_rev_seg_dt, incorptn_geo_id, incorptn_geo_dt, estb_dt, org_lglty_end_dt, dsslvd_dt
         , prmy_cmrcl_nm, rgstrd_bsns_nm, org_cd, org_opertl_area_ty_id, org_opertl_area_ty_dt
         , ou_lc_sts_ty_id, ou_lc_sts_dt, owng_org_id, mgr_emp_id, ou_auth_dsgntn_ty_id, ou_auth_dsgntn_dt
         , ou_fnctn_ty_id, ou_fnctn_dt, lob_id, lob_dt, ou_strc_ty_id, ou_strc_dt, brnch_nbr, ou_cd
         , ou_geog_id, ou_geog_dt, scl_meda_psna_nm, scl_meda_psna_effv_dt, scl_meda_psna_relbty_rtng_id
         , scl_meda_psna_prmy_email_addr_id, cust_lc_sts_ty_id, cust_lc_sts_dt, cust_mseg_id, cust_mseg_dt
         , cust_rl_age_seg_id, cust_rl_age_seg_dt, cust_proft_seg_id, cust_proft_seg_dt, satsf_rtng_id
         , satsf_rtng_dt, rtn_rtng_id, rtn_rtng_dt, prmy_brnch_nbr, prmy_brnch_dt, prmy_prd_ar_id
         , end_cust_dt, geo_id, effv_cust_dt, intrnt_bnk_flg, ph_bnk_flg, spcl_trms_flg
         , cup.creditscore as cr_rsk_scor
         , {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr
         , current_timestamp as load_time
    from {{ source('rawdata', 'completed_client') }} as cup
    left join source_data as srd
        on srd.ip_id = cup.client_id
    left join {{ source('rawdata', 'credit_worth') }} as cw
        on cup.client_id = cw.client_id

)


 select * 
 from columns_prep