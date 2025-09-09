
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    job_details_id as unique_field,
    count(*) as n_records

from job_ads.warehouse.dim_job_details
where job_details_id is not null
group by job_details_id
having count(*) > 1



  
  
      
    ) dbt_internal_test