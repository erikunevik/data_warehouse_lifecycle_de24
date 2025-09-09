
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select job_details_key as from_field
    from job_ads.warehouse.fct_job_ads
    where job_details_key is not null
),

parent as (
    select job_details_id as to_field
    from job_ads.warehouse.dim_job_details
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test