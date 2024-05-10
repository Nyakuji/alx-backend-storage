-- creates a stored procedure AddBonus 
-- that adds a new correction for a student
-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS AddBonus;

-- Change the delimiter to handle the procedure definition
DELIMITER $$
CREATE PROCEDURE AddBonus(user_id INT, project_name VARCHAR(255), score FLOAT)
BEGIN
    DECLARE project_count INT DEFAULT 0;
    DECLARE proj_id INT DEFAULT 0;

    -- Check if the project already exists in the projects table
    SELECT COUNT(id) INTO project_count
    FROM projects
    WHERE name = project_name
    LIMIT 1; -- Limit the result to one row

    -- If the project does not exist, insert it into the projects table
    IF project_count = 0 THEN
        INSERT INTO projects (name)
        VALUES (project_name);
    END IF;

    -- Retrieve the project_id for the specified project_name
    SELECT id INTO proj_id
    FROM projects
    WHERE name = project_name
    LIMIT 1; -- Limit the result to one row

    -- Insert a new correction record into the corrections table
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, proj_id, score);
END $$
DELIMITER ;
