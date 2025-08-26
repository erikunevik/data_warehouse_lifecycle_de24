USE WAREHOUSE COMPUTE_WH;

SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS demo_db;

SHOW SCHEMAS;

CREATE SCHEMA IF NOT EXISTS demo_db.staging;

SHOW SCHEMAS in demo_db;

CREATE TABLE IF NOT EXISTS customer (
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar (50)
);

SHOW Tables;

SELECT * FROM CUSTOMER;

INSERT INTO CUSTOMER (customer_id, age, email)
VALUES
    (1, 32, 'abc@gmail.com'), 
    (1, 23, 'cdc@gmail.com'); 

SELECT * FROM customer;

DROP DATABASE demo_db;

show DATABASES;


