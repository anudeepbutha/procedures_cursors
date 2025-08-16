USE netflix;

DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;
DROP PROCEDURE IF EXISTS SendWatchTimeReport;

DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber()
BEGIN
    DECLARE subid INT;
    DECLARE finish INT DEFAULT 0;
    DECLARE subscriberlist CURSOR FOR SELECT DISTINCT subscriberid FROM watchhistory;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finish = 1;
    OPEN subscriberlist;
    read_loop: LOOP
        FETCH subscriberlist INTO subid;
        IF finish = 1 THEN
            LEAVE read_loop;
		END IF;
    SELECT s.subscriberid, s.subscribername , SUM(wh.watchtime)
    FROM subscribers s, watchhistory wh
    WHERE s.subscriberid = wh.subscriberID 
    GROUP BY wh.subscriberID;
    END LOOP read_loop;
    CLOSE subscriberlist;
END //

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    CALL GetWatchHistoryBySubscriber();
END //
DELIMITER ;

CALL SendWatchTimeReport();
