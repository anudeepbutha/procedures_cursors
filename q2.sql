USE netflix;

DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;

DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT s.showid, s.title, s.genre, s.releaseyear, wh.watchtime
    FROM watchhistory wh, shows s 
    where wh.showid = s.showid AND wh.subscriberID = sub_id;
END //
DELIMITER ;

CALL GetWatchHistoryBySubscriber(1);