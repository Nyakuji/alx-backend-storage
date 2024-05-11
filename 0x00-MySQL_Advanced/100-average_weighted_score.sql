-- creates a stored procedure ComputeAverageWeightedScoreForUser 
-- that computes and store the average weighted score for a student
-- The average weighted score is the sum of the product of the score and the weight of each correction divided by the sum of the weights

-- drop the procedure if it exists
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    user_id INT
)
BEGIN
    DECLARE weighted_avg_score FLOAT;
    SET weighted_avg_score = (SELECT SUM(score * weight) / SUM(weight) 
                        FROM users AS U 
                        JOIN corrections as C ON U.id=C.user_id 
                        JOIN projects AS P ON C.project_id=P.id 
                        WHERE U.id=user_id);
    UPDATE users SET average_score = weighted_avg_score WHERE id=user_id;
END
$$
DELIMITER ;
