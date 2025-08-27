USE ROLE USERADMIN;

SELECT current_role();

SELECT current_user();

CREATE ROLE ice_cream_reader COMMENT = 'Able to read ice_cream database';
CREATE ROLE ice_cream_writer COMMENT = 'Able to do CRUD ice_cream database';
CREATE ROLE ice_cream_analyst COMMENT = 'Able to do analyzing on ice_cream database';

-- User roles
USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_reader;
GRANT USAGE ON DATABASE ice_cream_db TO ROLE ice_cream_reader;

SHOW GRANTS TO ROLE ice_cream_reader;

-- Grant schemas to reader role
GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;
GRANT SELECT ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;
SHOW GRANTS TO ROLE ice_cream_reader;
SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

-- Beacuse a writer must be able to read the content
GRANT ROLE ice_cream_reader TO ROLE ice_cream_writer;

SHOW GRANTS TO ROLE ice_cream_writer;

GRANT INSERT, UPDATE, DELETE ON ALL TABles IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

SHOW GRANTS TO ROLE ice_cream_writer;
SHOW GRANTS TO ROLE ice_cream_reader;

-- I dont have this role
USE ROLE ice_cream_writer;

GRANT ROLE ice_cream_writer TO USER ERIKUNEVIK;

-- Now I have

USE ROLE ice_cream_writer;











