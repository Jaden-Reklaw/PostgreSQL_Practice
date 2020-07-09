-- How to run postgres from the terminal

-- First Start Postgres:
-- brew services start postgresql

-- Create a database:
-- createdb 'name_of_database'

-- Connect to the database via the terminal:
-- psql 'test'

-- At this point you should be able to do sql commands
-- To create tables, fields, enter data etc...

-- Create your first table
CREATE TABLE users (name text, age smallint, DOB date);

