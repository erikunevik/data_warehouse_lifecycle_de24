
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select headline
from job_ads.warehouse.dim_job_details
where headline is null



  
  
      
    ) dbt_internal_test