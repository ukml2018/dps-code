{{ config(materialized='incremental', alias='analytic_data', re_data_monitored=true)}}

with accout_list as (
    select ip_src_sys_cd as customer_id, src_sys_cd as account_id, ar_to_ip_rl_ty_id as type, ar_src_sys_cd as disp_id, batch_nbr, load_time
    from {{ source('conformed', 'sa_ar_to_sa_ip_rl') }}
), rdfao_list as (
    select al.customer_id, al.account_id, ca.ac_aprv_dt as parseddate, {{ dbt.datediff("ca.ac_aprv_dt", current_date(), "day") }} as rdfao
    from accout_list as al
    join {{ source('conformed', 'ac_ar') }} as ca
    on al.account_id=ca.ac_ar_id
), rdfaohl_list as (
    select al.customer_id, al.account_id, hl.int_rate_eff_dt as fulldate, {{ dbt.datediff("hl.int_rate_eff_dt", current_date(), "day") }} as rdfaohl
    from accout_list as al
    join {{ source('conformed', 'loan_ar') }} as hl
    on al.account_id=hl.ac_ar_id
), rdfaocc_list as (
    select ac_ar_id as account_id, {{ dbt.datediff("ac_aprv_dt" , current_date(), "day") }} as rdfaocc
    from {{ source('conformed', 'ac_ar') }}
    where ac_ar_id in ( 
        select account_id
        from accout_list as al 
        join {{ source('conformed', 'cc_ar') }} as cl
        on al.disp_id=cl.ar_src_sys_cd
    )
), ardfad_list as (
        select account.ac_ar_id as account_id,{{ dbt.datediff("account.ac_aprv_dt", "d.dt", "day") }} as ardfad
        from {{ source('conformed', 'ac_ar') }} account 
        left join
            (select prim_ar_id as account_id, min(txn_dt) as dt from {{ source('conformed', 'txn') }}
             where lower(txn_tp_id)='debit'
             group by prim_ar_id) d
        on account.ac_ar_id=d.account_id
), ardfadcc_list as (
        select account.ac_ar_id as account_id,{{ dbt.datediff("account.ac_aprv_dt", "d.dt", "day") }} as ardfadcc 
        from {{ source('conformed', 'ac_ar') }} account  
        left join
             (select prim_ar_id as account_id, min(txn_dt) as dt 
              from {{ source('conformed', 'txn') }}
              where lower(txn_tp_id)='debit'
              group by prim_ar_id) d
        on account.ac_ar_id=d.account_id 
        where account.ac_ar_id in(
                    select a.account_id
                    from accout_list a 
                    left join {{ source('conformed', 'cc_ar') }} b
                    on a.disp_id=b.ar_src_sys_cd)
), ardld_list as (
        select account.ac_ar_id as account_id,{{ dbt.datediff("d.dt", current_date(), "day") }} as ardld 
        from {{ source('conformed', 'ac_ar') }} account 
        left join
             (select prim_ar_id as account_id, max(txn_dt) as dt 
              from {{ source('conformed', 'txn') }}
              where lower(txn_tp_id)='debit'
              group by prim_ar_id) d
        on account.ac_ar_id=d.account_id
), ardldcc_list as (
        select account.ac_ar_id as account_id,{{ dbt.datediff("d.dt", current_date(), "day") }} as ardldcc 
        from {{ source('conformed', 'ac_ar') }} account 
        left join
             (select prim_ar_id as account_id, max(txn_dt) as dt 
              from {{ source('conformed', 'txn') }}
              where lower(txn_tp_id)='debit'
              group by prim_ar_id) d
        on account.ac_ar_id=d.account_id  
        where account.ac_ar_id in(
                      select a.account_id
                      from accout_list a 
                      left join {{ source('conformed', 'cc_ar') }} b
                      on a.disp_id=b.ar_src_sys_cd)
), ardldhl_list as (
        select account.ac_ar_id as account_id,{{ dbt.datediff("d.dt", current_date(), "day") }} as ardldhl 
        from {{ source('conformed', 'ac_ar') }} account 
        join
             (select prim_ar_id as account_id, max(txn_dt) as dt 
              from {{ source('conformed', 'txn') }}
              where lower(txn_tp_id)='debit'
              group by prim_ar_id) d
        on account.ac_ar_id=d.account_id  
        where account.ac_ar_id in(
                        select a.ac_ar_id as account_id
                        from {{ source('conformed', 'ac_ar') }} a 
                        join {{ source('conformed', 'loan_ar') }} b
                        on a.ac_ar_id=b.ac_ar_id where b.loan_tp_id='home')
), ardlc_list as (
        select account.ac_ar_id as account_id,{{ dbt.datediff("d.dt", current_date(), "day") }} as ardlc 
        from {{ source('conformed', 'ac_ar') }} account 
        left join
             (select prim_ar_id as account_id, max(txn_dt) as dt 
              from {{ source('conformed', 'txn') }}
              where lower(txn_tp_id)='credit'
              group by prim_ar_id) d
        on account.ac_ar_id=d.account_id
), ardlccc_list as (
        select account.ac_ar_id as account_id, {{ dbt.datediff("d.dt", current_date(), "day") }} as ardlccc 
        from {{ source('conformed', 'ac_ar') }} account 
        left join
             (select prim_ar_id as account_id, max(txn_dt) as dt 
              from {{ source('conformed', 'txn') }}
              where lower(txn_tp_id)='credit'
              group by prim_ar_id) d
        on account.ac_ar_id=d.account_id  
        where account.ac_ar_id in(
                      select a.account_id
                      from accout_list a 
                      left join {{ source('conformed', 'cc_ar') }} b
                      on a.disp_id=b.ar_src_sys_cd)
), ardlchl_list as (
        select account.ac_ar_id as account_id,{{ dbt.datediff("d.dt", current_date(), "day") }} as ardlchl 
        from {{ source('conformed', 'ac_ar') }} account 
        join
             (select prim_ar_id as account_id, max(txn_dt) as dt 
              from {{ source('conformed', 'txn') }}
              where lower(txn_tp_id)='credit'
              group by prim_ar_id) d
        on account.ac_ar_id=d.account_id  
        where account.ac_ar_id in(
                        select a.ac_ar_id as account_id
                        from {{ source('conformed', 'ac_ar') }} a 
                        join {{ source('conformed', 'loan_ar') }} b
                        on a.ac_ar_id=b.ac_ar_id and b.loan_tp_id='home')
), antw_list as (
        select a.account_id, avg(a.num) as antw
        from(
            select d.account_id,d.year,d.week,count(d.account_id) as num
             from
                (
                 select prim_ar_id as account_id, {{ dbt.date_trunc("year", "txn_dt") }} as year, {{ dbt.date_trunc("week", "txn_dt") }} as week
                 from {{ source('conformed', 'txn') }}
                ) d
            group by d.account_id,d.year,d.week
            ) a
        group by a.account_id
), antwcc_list as (
        select a.account_id,avg(a.num) as antwcc
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id, {{ dbt.date_trunc("year", "txn_dt") }} as year, {{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        where a.account_id in(
                              select al.account_id
                              from accout_list al 
                              join {{ source('conformed', 'cc_ar') }} card
                              on al.disp_id=card.ar_src_sys_cd
                             )
        group by a.account_id
), antwhl_list as (
        select a.account_id,avg(a.num) as antwhl
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id where loan.loan_tp_id='home'
                              )
        group by a.account_id
), vntw_list as (
        select a.account_id,{{ var_samp("a.num") }} as vntw
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  ) d
             group by d.account_id,d.year,d.week
            ) a
        group by a.account_id
), vntwcc_list as (
        select a.account_id,{{ var_samp("a.num") }} as vntwcc
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  ) d
             group by d.account_id,d.year,d.week) a
        where a.account_id in(
                              select al.account_id
                              from accout_list al
                              join {{ source('conformed', 'cc_ar') }} card
                              on al.disp_id=card.ar_src_sys_cd
                              )
        group by a.account_id
), vntwhl_list as (
        select a.account_id,{{ var_samp("a.num") }} as vntwhl
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id where loan.loan_tp_id='home')
        group by a.account_id
), adtw_list as (
        select a.account_id,avg(a.num) as adtw
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='debit'
                  ) d
             group by d.account_id,d.year,d.week
            ) a
        group by a.account_id
), adtwcc_list as (
        select a.account_id,avg(a.num) as adtwcc
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='debit'
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        where a.account_id in(
                              select al.account_id
                              from accout_list al
                              join {{ source('conformed', 'cc_ar') }} card
                              on al.disp_id=card.ar_src_sys_cd)
        group by a.account_id
), adtwhl_list as (
        select a.account_id,avg(a.num) as adtwhl
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='debit'
                 ) d
             group by d.account_id,d.year,d.week) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id where loan.loan_tp_id='home')
        group by a.account_id
), actw_list as (
        select a.account_id,avg(a.num) as actw
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='credit'
                  ) d
             group by d.account_id,d.year,d.week
            ) a
        group by a.account_id
), actwcc_list as (
        select a.account_id,avg(a.num) as actwcc
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        where a.account_id in(
                              select al.account_id
                              from accout_list al
                              join {{ source('conformed', 'cc_ar') }} card
                              on al.disp_id=card.ar_src_sys_cd)
        group by a.account_id
), actwhl_list as (
        select a.account_id,avg(a.num) as actwhl
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select txn.prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id where loan.loan_tp_id='home')
        group by a.account_id
), vdtw_list as (
        select a.account_id,{{ var_samp("a.num") }} as vdtw
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='debit'
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        group by a.account_id
), vdtwcc_list as (
        select a.account_id,{{ var_samp("a.num") }} as vdtwcc
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='debit'
                 ) d
             group by d.account_id,d.year,d.week) a
        where a.account_id in(
                             select al.account_id
                             from accout_list al 
                             join {{ source('conformed', 'cc_ar') }} card
                             on al.disp_id=card.ar_src_sys_cd)
        group by a.account_id
), vdtwhl_list as (
        select a.account_id,{{ var_samp("a.num") }} as vdtwhl
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id where loan.loan_tp_id='home')
        group by a.account_id
), vctw_list as (
        select a.account_id,{{ var_samp("a.num") }} as vctw
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        group by a.account_id
), vctwcc_list as (
        select a.account_id,{{ var_samp("a.num") }} as vctwcc
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week) a
        where a.account_id in(
                             select al.account_id
                             from accout_list al 
                             join {{ source('conformed', 'cc_ar') }} card
                             on al.disp_id=card.ar_src_sys_cd)
        group by a.account_id
), vctwhl_list as (
        select a.account_id,{{ var_samp("a.num") }} as vctwhl
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num
             from(
                  select prim_ar_id as account_id,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }}
                  where lower(txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id where loan.loan_tp_id='home')
        group by a.account_id
), aadtw_list as (
        select a.account_id,avg(a.amount) as aadtw
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='debit'
                  ) d
             group by d.account_id,d.year,d.week
            ) a
        group by a.account_id
), aadtwcc_list as (
        select a.account_id,avg(a.amount) as aadtwcc
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='debit'
                 ) d
             group by d.account_id,d.year,d.week
             ) a
        where a.account_id in(
                              select al.account_id
                              from accout_list al 
                              join {{ source('conformed', 'cc_ar') }} card
                              on al.disp_id=card.ar_src_sys_cd
                              )
        group by a.account_id
), aadtwhl_list as (
        select a.account_id,avg(a.amount) as aadtwhl
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='debit'
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id where loan.loan_tp_id='home'
                             )
        group by a.account_id
), aactw_list as (
        select a.account_id,avg(a.amount) as aactw
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='credit'
                  ) d
             group by d.account_id,d.year,d.week
            ) a
        group by a.account_id
), aactwcc_list as (
        select a.account_id,avg(a.amount) as aactwcc
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week
             ) a
        where a.account_id in(
                              select al.account_id
                              from accout_list al 
                              join {{ source('conformed', 'cc_ar') }} card
                              on al.disp_id=card.ar_src_sys_cd
                              )
        group by a.account_id
), aactwhl_list as (
        select a.account_id,avg(a.amount) as aactwhl
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id where loan.loan_tp_id='home'
                             )
        group by a.account_id
), vadtw_list as (
        select a.account_id,{{ var_samp("a.amount") }} as vadtw
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='debit'
                 ) d
             group by d.account_id,d.year,d.week) a
        group by a.account_id
), vadtwcc_list as (
        select a.account_id,{{ var_samp("a.amount") }} as vadtwcc
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='debit'
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        where a.account_id in(
                              select al.account_id
                              from accout_list al 
                              join {{ source('conformed', 'cc_ar') }} card
                              on al.disp_id=card.ar_src_sys_cd
                             )
        group by a.account_id
), vadtwhl_list as (
        select a.account_id,{{ var_samp("a.amount") }} as vadtwhl
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='debit'
                 ) d
             group by d.account_id,d.year,d.week
             ) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id where loan.loan_tp_id='home'
                             )
        group by a.account_id
), vactw_list as (
        select a.account_id,{{ var_samp("a.amount") }} as vactw
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week) a
        group by a.account_id
), vactwcc_list as (
        select a.account_id,{{ var_samp("a.amount") }} as vactwcc
        from(
             select d.account_id,d.year,d.week,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week
            ) a
        where a.account_id in(
                              select al.account_id
                              from accout_list al 
                              join {{ source('conformed', 'cc_ar') }} card
                              on al.disp_id=card.ar_src_sys_cd
                             )
        group by a.account_id
), vactwhl_list as (
        select a.account_id,{{ var_samp("a.amount") }} as vactwhl
        from(
             select d.account_id,d.year,d.week,count(d.account_id) as num,sum(d.amount) as amount
             from(
                  select prim_ar_id as account_id,txn.fee_x_cmsn_amt as amount,{{ dbt.date_trunc("year", "txn_dt") }} as year,{{ dbt.date_trunc("week", "txn_dt") }} as week
                  from {{ source('conformed', 'txn') }} txn
                  where lower(txn.txn_tp_id)='credit'
                 ) d
             group by d.account_id,d.year,d.week
             ) a
        where a.account_id in(
                              select acc.ac_ar_id as account_id
                              from  {{ source('conformed', 'ac_ar') }} acc 
                              join {{ source('conformed', 'loan_ar') }} loan
                              on acc.ac_ar_id=loan.ac_ar_id and loan.loan_tp_id='home'
                             )
        group by a.account_id
), rate_list as (
        select ac_ar_id as account_id,loan_ar_id as loan_id,eff_int_rate_id as rate
        from {{ source('conformed', 'loan_ar') }}
), ctier_list as (
        select ip.src_sys_cd as customer_id, 
        {{ dbt.listagg(measure="prd.prd_nm", delimiter_text="','", order_by_clause="order by prd.prd_nm") }} as ctier
        from {{ source('conformed', 'sa_ev_cmm') }} cmm
        left join {{ source('conformed', 'sa_prd') }} prd
        on cmm.prd_id = prd.prd_id
        left join {{ source('conformed', 'sa_ip') }} ip
        on cmm.init_ip_id = ip.ip_id
        group by ip.src_sys_cd
), chu_list as (
        select cpgn.src_sys_unq_key_txt as account_id, 
        {{ dbt.listagg(measure="chnl.chnl_txt", delimiter_text="','", order_by_clause="order by chnl.chnl_txt") }} as channels
        from {{ source('conformed', 'sa_cpgn_seg_actvty') }} cpgn
        left join {{ source('conformed', 'sa_chnl') }} chnl
        on cpgn.chnl_id = chnl.chnl_id
        group by cpgn.src_sys_unq_key_txt
), ccuasp_list as (
        select txn.prim_ar_id as account_id, avg(txn.fee_x_cmsn_amt) as ccuasp
        from {{ source('conformed', 'txn') }} txn
        where lower(txn.txn_tp_id)='credit' and txn.prim_ar_id in(
          select al.account_id
          from accout_list al 
          join {{ source('conformed', 'cc_ar') }} card
          on al.disp_id=card.ar_src_sys_cd
        )
        group by txn.prim_ar_id
), ccuvsp_list as (
        select txn.prim_ar_id as account_id, {{ var_samp("txn.fee_x_cmsn_amt") }} as ccuvsp
        from {{ source('conformed', 'txn') }} txn
        where lower(txn.txn_tp_id)='credit' and txn.prim_ar_id in(
          select al.account_id
          from accout_list al 
          join {{ source('conformed', 'cc_ar') }} card
          on al.disp_id=card.ar_src_sys_cd
        )
        group by txn.prim_ar_id
)
select 
    accout_list.customer_id as customer_id,
    accout_list.account_id as account_id,
    cp.cr_rsk_scor as ccucs,
    rdfao_list.rdfao as rdfao,
    rdfaohl_list.rdfaohl as rdfaohl,
    rdfaocc_list.rdfaocc as rdfaocc,
    ardfad_list.ardfad as ardfad,
    ardfadcc_list.ardfadcc as ardfadcc,
    ardld_list.ardld as ardld,
    ardldcc_list.ardldcc as ardldcc,
    ardldhl_list.ardldhl as ardldhl,
    ardlc_list.ardlc as ardlc,
    ardlccc_list.ardlccc as ardlccc,
    ardlchl_list.ardlchl as ardlchl,
    antw_list.antw as antw,
    antwcc_list.antwcc as antwcc,
    antwhl_list.antwhl as antwhl,
    vntw_list.vntw as vntw,
    vntwcc_list.vntwcc as vntwcc,
    vntwhl_list.vntwhl as vntwhl,
    adtw_list.adtw as adtw,
    adtwcc_list.adtwcc as adtwcc,
    adtwhl_list.adtwhl as adtwhl,
    actw_list.actw as actw,
    actwcc_list.actwcc as actwcc,
    actwhl_list.actwhl as actwhl,
    vdtw_list.vdtw as vdtw,
    vdtwcc_list.vdtwcc as vdtwcc,
    vdtwhl_list.vdtwhl as vdtwhl,
    vctw_list.vctw as vctw,
    vctwcc_list.vctwcc as vctwcc,
    vctwhl_list.vctwhl as vctwhl,
    aadtw_list.aadtw as aadtw,
    aadtwcc_list.aadtwcc as aadtwcc,
    aadtwhl_list.aadtwhl as aadtwhl,
    aactw_list.aactw as aactw,
    aactwcc_list.aactwcc as aactwcc,
    aactwhl_list.aactwhl as aactwhl,
    vadtw_list.vadtw as vadtw,
    vadtwcc_list.vadtwcc as vadtwcc,
    vadtwhl_list.vadtwhl as vadtwhl,
    vactw_list.vactw as vactw,
    vactwcc_list.vactwcc as vactwcc,
    vactwhl_list.vactwhl as vactwhl,
    rate_list.rate as rate,
    ctier_list.ctier as ctier,
    chu_list.channels as chu,
    ccuasp_list.ccuasp as ccuasp,
    ccuvsp_list.ccuvsp as ccuvsp,
    accout_list.batch_nbr as batch_nbr,
    accout_list.load_time as load_time
from accout_list
left join rdfao_list
on accout_list.account_id = rdfao_list.account_id and accout_list.customer_id = rdfao_list.customer_id
left join rdfaohl_list
on accout_list.account_id = rdfaohl_list.account_id and accout_list.customer_id = rdfaohl_list.customer_id
left join rdfaocc_list
on accout_list.account_id = rdfaocc_list.account_id
left join {{ source('conformed', 'sa_ip') }} as cp
on accout_list.customer_id = cp.src_sys_cd
left join ardfad_list
on accout_list.account_id = ardfad_list.account_id
left join ardfadcc_list
on accout_list.account_id = ardfadcc_list.account_id
left join ardld_list
on accout_list.account_id = ardld_list.account_id
left join ardldcc_list
on accout_list.account_id = ardldcc_list.account_id
left join ardldhl_list
on accout_list.account_id = ardldhl_list.account_id
left join ardlc_list
on accout_list.account_id = ardlc_list.account_id
left join ardlccc_list
on accout_list.account_id = ardlccc_list.account_id
left join ardlchl_list
on accout_list.account_id = ardlchl_list.account_id
left join antw_list
on accout_list.account_id = antw_list.account_id
left join antwcc_list
on accout_list.account_id = antwcc_list.account_id
left join antwhl_list
on accout_list.account_id = antwhl_list.account_id
left join vntw_list
on accout_list.account_id = vntw_list.account_id
left join vntwcc_list
on accout_list.account_id = vntwcc_list.account_id
left join vntwhl_list
on accout_list.account_id = vntwhl_list.account_id
left join adtw_list
on accout_list.account_id = adtw_list.account_id
left join adtwcc_list
on accout_list.account_id = adtwcc_list.account_id
left join adtwhl_list
on accout_list.account_id = adtwhl_list.account_id
left join actw_list
on accout_list.account_id = actw_list.account_id
left join actwcc_list
on accout_list.account_id = actwcc_list.account_id
left join actwhl_list
on accout_list.account_id = actwhl_list.account_id
left join vdtw_list
on accout_list.account_id = vdtw_list.account_id
left join vdtwcc_list
on accout_list.account_id = vdtwcc_list.account_id
left join vdtwhl_list
on accout_list.account_id = vdtwhl_list.account_id
left join vctw_list
on accout_list.account_id = vctw_list.account_id
left join vctwcc_list
on accout_list.account_id = vctwcc_list.account_id
left join vctwhl_list
on accout_list.account_id = vctwhl_list.account_id
left join aadtw_list
on accout_list.account_id = aadtw_list.account_id
left join aadtwcc_list
on accout_list.account_id = aadtwcc_list.account_id
left join aadtwhl_list
on accout_list.account_id = aadtwhl_list.account_id
left join aactw_list
on accout_list.account_id = aactw_list.account_id
left join aactwcc_list
on accout_list.account_id = aactwcc_list.account_id
left join aactwhl_list
on accout_list.account_id = aactwhl_list.account_id
left join vadtw_list
on accout_list.account_id = vadtw_list.account_id
left join vadtwcc_list
on accout_list.account_id = vadtwcc_list.account_id
left join vadtwhl_list
on accout_list.account_id = vadtwhl_list.account_id
left join vactw_list
on accout_list.account_id = vactw_list.account_id
left join vactwcc_list
on accout_list.account_id = vactwcc_list.account_id
left join vactwhl_list
on accout_list.account_id = vactwhl_list.account_id
left join rate_list
on accout_list.account_id = rate_list.account_id
left join ctier_list
on accout_list.customer_id = ctier_list.customer_id
left join chu_list
on accout_list.account_id = chu_list.account_id
left join ccuasp_list
on accout_list.account_id = ccuasp_list.account_id
left join ccuvsp_list
on accout_list.account_id = ccuvsp_list.account_id

