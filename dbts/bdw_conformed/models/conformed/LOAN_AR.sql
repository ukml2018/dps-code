{{ config(materialized='incremental', alias='loan_ar', unique_key='loan_ar_id')}} 
 
with source_data as (
    SELECT
            {{ col_cast("'1'", "varchar", "20") }} 	as loan_ar_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as eff_int_rate_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as int_rate_eff_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as loan_anul_prpymt_pct_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as loan_neg_amrz_cap_rate_id,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as pymt_tot_nbr,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as pymt_rman_nbr,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as blln_pymt_due_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as dcn_loan_f,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as loan_tp_id,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 6, 2)) }} 	as loan_to_val_rto,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 6, 2)) }} 	as cmb_loan_to_val_rto,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as frst_pymt_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as int_only_term_end_dt,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as loan_prpymt_pny_end_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as loan_subs,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as loan_subs_end_dt,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 6, 2)) }} 	as neg_amrz_avl_id,
            {{ dbt.safe_cast("'2022-06-21T21:00:00'", api.Column.translate_type("timestamp")) }} 	as nxt_int_rset_dt,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as indp_cnsll_rcvd_f,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 6, 2)) }} 	as orig_cmb_loan_to_val_rto,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 5, 2)) }} 	as orig_ins_cvr_pct,
            {{ dbt.safe_cast("'1'", api.Column.numeric_type('numeric', 6, 2)) }} 	as orig_loan_to_val_rto,
            {{ dbt.safe_cast("'1'", api.Column.translate_type("integer")) }} 	as pty_prch_govt_scm_id,
            {{ col_cast("'1'", "varchar", "32") }} 	as pty_prch_govt_scm_nbr,
            {{ col_cast("'1'", "varchar", "20") }} 	as ac_ar_id
), loan as (
    select loan_id, fulldate, amount, purpose, account_id, null as interest_rate
    from {{ source('rawdata', 'completed_loan') }}
    union all
    select loan_id, funded_date as  fulldate,  {{ dbt.safe_cast("funded_amount", api.Column.translate_type("integer")) }} as amount, purpose, null as account_id,interest_rate
    from {{ source('rawdata', 'luxury_loan_portfolio') }}
),columns_prep as (
    select  loan.loan_id as loan_ar_id,
            loan.interest_rate as eff_int_rate_id,
            loan.fulldate as int_rate_eff_dt,
            loan_anul_prpymt_pct_id,
            loan_neg_amrz_cap_rate_id,
            loan.amount as pymt_tot_nbr,
            pymt_rman_nbr,
            blln_pymt_due_dt,
            dcn_loan_f,
            loan.purpose as loan_tp_id,
            loan_to_val_rto,
            cmb_loan_to_val_rto,
            frst_pymt_dt,
            int_only_term_end_dt,
            loan_prpymt_pny_end_dt,
            loan_subs,
            loan_subs_end_dt,
            neg_amrz_avl_id,
            nxt_int_rset_dt,
            indp_cnsll_rcvd_f,
            orig_cmb_loan_to_val_rto,
            orig_ins_cvr_pct,
            orig_loan_to_val_rto,
            pty_prch_govt_scm_id,
            pty_prch_govt_scm_nbr,
            loan.account_id as ac_ar_id,
            {{ col_cast(var("batch_nbr", "a_batch_nbr"), "varchar", "25") }} as batch_nbr,
            current_timestamp as load_time

    from loan
    left join source_data srd
    on loan.loan_id = srd.loan_ar_id
)

 select * from columns_prep