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