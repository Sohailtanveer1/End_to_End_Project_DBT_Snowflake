-- Snowflake DDL script to set up the account for an e-commerce project
-- This script creates a database, schemas, user, and role with appropriate permissions

-- Create a role for the e-commerce project
USE ROLE ACCOUNTADMIN;
CREATE ROLE IF NOT EXISTS ecom_role;

-- Create a database and schemas for the e-commerce project
-- The database will be named ECOM and will have three schemas: bronze, silver, and
CREATE DATABASE ECOM;
use database ecom;
create schema bronze;
create schema silver;
create schema gold;

-- Create a user for the e-commerce project
-- The user will have a default role and warehouse, and will not be required to change their
CREATE USER IF NOT EXISTS ecom_user
  PASSWORD = 'Sohail@12345' -- change your password
  LOGIN_NAME = 'ecom_user'
  DEFAULT_ROLE = ecom_role
  DEFAULT_WAREHOUSE = 'COMPUTE_WH'
  DEFAULT_NAMESPACE = ECOM.public
  MUST_CHANGE_PASSWORD = FALSE;


-- Grant the role to the user
USE ROLE ACCOUNTADMIN;
GRANT ROLE ecom_role TO USER ecom_user;

-- Create a warehouse for the e-commerce project
-- The warehouse will be named ecom_wh and will have a size of SMALL
create warehouse ecom_wh with warehouse_size = 'SMALL';

-- Grant usage on the warehouse
GRANT USAGE ON WAREHOUSE ecom_wh TO ROLE ecom_role;

-- Grant access on the database
GRANT USAGE ON DATABASE ecom TO ROLE ecom_role;

-- Grant access on schemas
GRANT USAGE ON SCHEMA ecom.bronze TO ROLE ecom_role;
GRANT USAGE ON SCHEMA ecom.silver TO ROLE ecom_role;
GRANT USAGE ON SCHEMA ecom.gold TO ROLE ecom_role;

-- Grant table-level permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ecom.bronze TO ROLE ecom_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ecom.silver TO ROLE ecom_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ecom.gold TO ROLE ecom_role;

-- Also future-proof it for new tables
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ecom.bronze TO ROLE ecom_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ecom.silver TO ROLE ecom_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ecom.gold TO ROLE ecom_role;

