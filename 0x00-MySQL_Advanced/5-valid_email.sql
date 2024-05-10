-- SQL script that creates a trigger that validates an email address.
-- valid_email only when the email has been changed.

DROP TRIGGER IF EXISTS valid_email;

DELIMITER $$
CREATE TRIGGER valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        SET NEW.valid_email = 0;
    ELSE
        SET NEW.valid_email = 1;
    END IF;
END $$
DELIMITER ;