
CREATE ROLE IF NOT EXISTS movies_dlt_role;

USE ROLE movies_dlt_role;

CREATE DATABASE IF NOT EXISTS movies;
CREATE OR REPLACE SCHEMA movies.staging;

