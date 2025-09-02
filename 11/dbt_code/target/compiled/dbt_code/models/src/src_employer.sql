with stg_job_ads as (select * from job_ads.staging.data_field_job_ads)

-- select
--     id,
--     employer__name as employer_name,
--     employer__workplace as employer_workplace,
--     workplace_address__city as workplace_city,
-- from stg_job_ads 

SELECT *

FROM stg_job_ads