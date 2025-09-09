
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select job_details_id
from job_ads.warehouse.dim_job_details
where job_details_id is null



  
  
      
    ) dbt_internal_test