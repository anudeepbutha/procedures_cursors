USE netflix;

DROP PROCEDURE IF EXISTS GetWatchHistoryCursor;
DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;

DELIMITER //
CREATE PROCEDURE GetWatchHistoryCursor()
BEGIN
    DECLARE subid INT;
    DECLARE finish INT DEFAULT 0;
    DECLARE subscriberlist CURSOR FOR SELECT subscriberid FROM subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finish = 1;
    OPEN subscriberlist;
    read_loop: LOOP
        FETCH subscriberlist INTO subid;
        IF finish = 1 THEN
            LEAVE read_loop;
		END IF;
        CALL GetWatchHistoryBySubscriber(subid);
	END LOOP read_loop;
    CLOSE subscriberlist;
END //

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN subid INT)
BEGIN
    SELECT wh.historyid, s.subscribername, sh.title, sh.genre, wh.watchtime
    FROM subscribers s, watchhistory wh, shows sh
    WHERE s.subscriberid = wh.subscriberID AND sh.showid = wh.showid AND s.subscriberid = subid;
END //
DELIMITER ;

CALL GetWatchHistoryCursor;