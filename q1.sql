USE netflix;

DROP PROCEDURE IF EXISTS ListAllSubscribers;

DELIMITER //

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE subname VARCHAR(100);
    DECLARE finished INT DEFAULT 0;
    DECLARE subscriberlist CURSOR FOR SELECT subscribername FROM subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    OPEN subscriberlist;
    read_loop: LOOP
        FETCH subscriberlist INTO subname;
        IF finished = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT subscribername
        FROM subscribers
        WHERE subscribername = subname;
    END LOOP;
    CLOSE subscriberlist;
END //
DELIMITER ;

CALL ListAllSubscribers();