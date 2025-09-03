
  
    

create or replace transient table job_ads.warehouse.dim_job_details
    
    
    
    as (with  __dbt__cte__src_job_details as (
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
), src_job_details as (select * from __dbt__cte__src_job_details)



-- we use aggregate function max() for deduplicate, but there are more alternative codes one can use for this purpose
select
    md5(cast(coalesce(cast(id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(headline as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as job_details_id,
    headline,
    description,
    description_html_formatted,
    employment_type,
    duration,
    salary_type,
    scope_of_work_min,
    scope_of_work_max
from src_job_details
    )
;


  