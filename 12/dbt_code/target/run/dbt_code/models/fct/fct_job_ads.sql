
  
    

create or replace transient table job_ads.warehouse.fct_job_ads
    
    
    
    as (with  __dbt__cte__src_job_ads as (
-- this is an extract of the model

with stg_job_ads as (select * from job_ads.staging.data_field_job_ads)

select
    id,
    headline,
    occupation__label,
    number_of_vacancies as vacancies,
    relevance,
    application_deadline
from stg_job_ads
order by application_deadline
),  __dbt__cte__src_job_details as (
with stg_job_ads as (select * from job_ads.staging.data_field_job_ads)

select
    id,
    headline,
    description__text AS description,
    description__text_formatted AS description_html_formatted,
    employment_type__label AS employment_type,
    duration__label as duration,
    salary_type__label as salary_type,
    scope_of_work__min as scope_of_work_min,
    scope_of_work__max as scope_of_work_max

  
from stg_job_ads
),  __dbt__cte__src_employer as (
with stg_job_ads as (select * from job_ads.staging.data_field_job_ads)

select
    id,
     employer__name as employer_name,
     employer__workplace as employer_workplace,
     workplace_address__city as workplace_city,
 from stg_job_ads
), ja as (select * from __dbt__cte__src_job_ads),

jd as (select * from __dbt__cte__src_job_details),

e as (select * from __dbt__cte__src_employer)

select
    md5(cast(coalesce(cast(jd.id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(jd.headline as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as job_details_key,
    md5(cast(coalesce(cast(jd.id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(e.employer_name as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as employer_key,

    vacancies,
    relevance,
    application_deadline,

    e.employer_name,
    jd.description


    
from 
    ja
left join
    jd ON ja.id = jd.id
left join
    e on ja.id = e.id
    )
;


  