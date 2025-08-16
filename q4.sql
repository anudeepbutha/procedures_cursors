USE netflix;

DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;
DROP PROCEDURE IF EXISTS SendWatchTimeReport;

DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber()
BEGIN
    SELECT s.subscribername , SUM(wh.watchtime)
    FROM subscribers s, watchhistory wh
    WHERE s.subscriberid = wh.subscriberID 
    GROUP BY wh.subscriberID 
    HAVING SUM(wh.watchtime);
END //

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    CALL GetWatchHistoryBySubscriber();
END //
DELIMITER ;

CALL SendWatchTimeReport();