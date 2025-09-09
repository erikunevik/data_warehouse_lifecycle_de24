
  
    

create or replace transient table job_ads.marts.mart_job_listings
    
    
    
    as (-- this is an extract of the model

with
    fct_job_ads as 
        (select * from job_ads.warehouse.fct_job_ads
    
),

job_details AS (SELECT * FROM job_ads.warehouse.dim_job_details),

employer AS (SELECT * FROM job_ads.warehouse.dim_employer)


    
select
    jd.headline,
    f.vacancies,
    jd.salary_type,
    f.relevance,
    e.employer_name,
    e.workplace_city,
    jd.description,
    jd.description_html_formatted,
    jd.duration,
    jd.scope_of_work_min,
    jd.scope_of_work_max,
    f.application_deadline
from fct_job_ads AS f
left join job_details AS jd
    ON f.job_details_key = jd.job_details_id
left join employer AS e
    on f.employer_key = e.employer_id
    )
;


  