-- SQL script that creates a table users with the following attributes:
-- * id - integer, primary key, autoincrement, never null
-- * email - string(255), never null, unique
-- * name - string(255)
-- * country - enum('US', 'CO', 'TN'), never null, (default 'US')
-- If the table already exists, the script should not fail
-- The script can be executed on any database

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
