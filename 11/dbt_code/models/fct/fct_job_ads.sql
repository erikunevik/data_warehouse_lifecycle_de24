with ja as (select * from {{ ref('src_job_ads') }}),

jd as (select * from {{ ref('src_job_details') }}),

e as (select * from {{ ref('src_employer') }})

select
    {{ dbt_utils.generate_surrogate_key(['jd.id', 'jd.headline']) }} as job_details_key,
    {{ dbt_utils.generate_surrogate_key(['jd.id', 'e.employer_name']) }} as employer_key,

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
