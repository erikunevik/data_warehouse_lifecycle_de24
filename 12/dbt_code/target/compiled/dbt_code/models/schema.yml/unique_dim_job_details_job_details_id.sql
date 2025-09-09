
    
    

select
    job_details_id as unique_field,
    count(*) as n_records

from job_ads.warehouse.dim_job_details
where job_details_id is not null
group by job_details_id
having count(*) > 1


