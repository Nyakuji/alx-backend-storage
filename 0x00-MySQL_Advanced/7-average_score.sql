-- SQL script that creates a stored procedure ComputeAverageScoreForUser
--  that computes and store the average score for a student

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

-- Change the delimiter to handle the procedure definition
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(user_id INT)
BEGIN
    DECLARE average_score FLOAT;
    SET average_score = (SELECT AVG(score) FROM corrections AS C WHERE C.user_id = user_id);
    UPDATE users SET average_score = average_score WHERE id = user_id;
END
$$
DELIMITER ;
