-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers 
-- that computes and store the average weighted score for all students
-- The average weighted score is the sum of the product of the score and the weight of each correction divided by the sum of the weights
-- The procedure takes no argument
-- The procedure updates the average_score column of the users table
-- The procedure must be created only if it does not exist
-- The procedure must be created with the following SQL statement:

-- drop the procedure if it exists
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users AS U,
    (SELECT U.id, SUM(score * weight) / SUM(weight) AS weighted_avg
    FROM users AS U
    JOIN corrections AS C ON U.id=C.user_id
    JOIN projects AS P ON C.project_id=P.id
    GROUP BY U.id) AS T
    SET U.average_score = T.weighted_avg
    WHERE U.id=T.id;
END
$$
DELIMITER ;
