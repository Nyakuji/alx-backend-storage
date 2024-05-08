/*
SQL script that creates a table with unique users
The table should have the following attributes:
* id - integer, primary key, autoincrement, never null
* email - string(255), never null, unique
* name - string(255)
If the table already exists, your script should not fail
Your script can be executed on any database
*/
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255)
);
