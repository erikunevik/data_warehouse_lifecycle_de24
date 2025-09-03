
  
    

create or replace transient table job_ads.warehouse.dim_employer
    
    
    
    as (WITH  __dbt__cte__src_employer as (
with stg_job_ads as (select * from job_ads.staging.data_field_job_ads)

select
    id,
     employer__name as employer_name,
     employer__workplace as employer_workplace,
     workplace_address__city as workplace_city,
 from stg_job_ads
), src_employer as (select * from __dbt__cte__src_employer)

select 

    md5(cast(coalesce(cast(id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(employer_name as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS employer_id,
    employer_name,

    
    case
        when coalesce(workplace_city, 'stad ej specificerad') is null
        then null
        else upper(substr(coalesce(workplace_city, 'stad ej specificerad'), 1, 1)) || lower(substr(coalesce(workplace_city, 'stad ej specificerad'), 2))
    end
 AS workplace_city

 from src_employer
    )
;


  