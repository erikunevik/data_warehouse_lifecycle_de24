
  
    

create or replace transient table job_ads.warehouse.updated_headline_macro
    
    
    
    as (WITH staging_data AS (
    SELECT 
        *
    FROM job_ads.warehouse.original_headline)

SELECT 
    
    CASE 
        WHEN headline = 'Data Engineer' THEN 'Junior Data Engineer'
        ELSE headline
    END
 AS updated_job_title
FROM staging_data
    )
;


  