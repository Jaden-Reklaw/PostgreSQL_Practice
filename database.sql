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
CREATE TABLE users (name TEXT, age SMALLINT, DOB DATE);

-- After the table is created do \d to see the list of relations
\d

-- To exit the terminal sql interface do \q
\q

-- Use insert into statement to add info to the table
INSERT INTO users(name, age, DOB)
VALUES('Jordan', 20, '1985-12-25');
INSERT INTO users(name, age, DOB)
VALUES('Kelsey', 19, '1985-10-07');
INSERT INTO users(name, age, DOB)
VALUES('Axel', 10, '2000-11-11');

-- Display info from the table using the SELECT command
SELECT * FROM users;

-- ADD New column to a table
ALTER TABLE users ADD score SMALLINT;

-- ONCE you alter the table the values if not specified will start
-- out as null values. To add values use UPDATE command
UPDATE users
SET score = 10
WHERE name = 'Kelsey';

--update two rows
UPDATE users
SET score = 9
WHERE name='Jordan' OR name='Axel';

-- Add one more user with score
INSERT INTO users(name, age, DOB, score)
VALUES('Lulu', 10, '1999-03-29', 8);

-- SELECT all users that names start with A
SELECT * FROM users WHERE name LIKE 'A%';

-- SELECT all users that names end with y
SELECT * FROM users WHERE name LIKE '%y';

-- Organize all the rows in descending order
SELECT * FROM users ORDER BY score DESC;

-- Organize all the rows in ascending order
SELECT * FROM users ORDER BY score ASC;

-- SQL FUNCTIONS
--Average score column
SELECT AVG(score) FROM users;
-- Sum of score column
SELECT SUM(score) FROM users;
-- Get the number of users in the database
SELECT COUNT(name) from users;

-- Primary and Foreign Keys
-- Primary keys identify a unique value in one table
-- Foreign key is a primary key from another table

CREATE TABLE login (
    ID SERIAL NOT NULL PRIMARY KEY,
    secret VARCHAR(120) NOT NULL,
    name TEXT UNIQUE NOT NULL
);

-- UNIQUE for name means you can't enter the same name twice
-- NOT NULL means the row can't have that field empty

-- Insert some new values and notice you don't have
-- to specify the id since it's auto created
INSERT INTO login(secret, name) VALUES
('abc', 'Jordan'),
('xyz', 'Kelsey'),
('123', 'Axel');

-- JOIN allows you to connect tables in SQL through relations
-- Tables should only have information specific to that table
-- Connect them with a primary key on one table that is a foreign
-- key on another table

-- name column on the user table is the primary key
-- name on the login table is a foreign key and connects the two tables
SELECT * FROM users JOIN login ON users.name = login.name;


-- How to Delete a row from a table
DELETE FROM users WHERE name='Lulu';

-- How to remove all the table
DROP TABLE login;

DROP TABLE users;