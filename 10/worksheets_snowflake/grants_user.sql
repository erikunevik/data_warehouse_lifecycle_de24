

USE ROLE USERADMIN;
SHOW ROLES;
CREATE ROLE job_ads_dbt_role;

SHOW GRANTS OF ROLE job_ads_dbt_role;

GRANT ROLE job_ads_dbt_role TO USER transformer;
GRANT ROLE job_ads_dbt_role TO USER ERIKUNEVIK;
