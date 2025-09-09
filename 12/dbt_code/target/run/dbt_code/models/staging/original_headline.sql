
  
    

create or replace transient table job_ads.warehouse.original_headline
    
    
    
    as (SELECT 
    headline
FROM job_ads.staging.data_field_job_ads
    )
;


  