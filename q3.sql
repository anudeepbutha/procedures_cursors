USE netflix;

DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;

DELIMITER //
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE namecount INT DEFAULT 0;
    DECLARE rowcount INT DEFAULT 0;
    SELECT count(*) INTO rowcount
    FROM subscribers;

    SELECT COUNT(*) INTO namecount
    FROM subscribers
    WHERE subscribername = subName;

    IF namecount = 0 THEN
        INSERT INTO subscribers VALUES
        (rowcount+1, subname, curdate());
    END IF;
END //
DELIMITER ;

CALL AddSubscriberIfNotExists('Thomas Shelby');