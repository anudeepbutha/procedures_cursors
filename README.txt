Title: Executing Simple Queries using Procedures and Cursors to Retrieve Required Information

Git Repository Link: 

Overview:
This document provides step-by-step instructions to execute the stored procedures related to simple database(netflix) with three tables(subscribers, shows, watchhistory) created in a MySQL database environment.

Steps to Execute:
1. Open your MySQL Workbench.
2. Connect to the database.
3. Create a new database, and create 3 table following the schema mentioned belo
   -Shows (ShowID INT PRIMARY KEY, Title VARCHAR(100), Genre VARCHAR(50), ReleaseYear INT)
   -Subscribers (SubscriberID INT PRIMARY KEY, SubscriberName VARCHAR(100), SubscriptionDate DATE)
   -WatchHistory (HistoryID INT PRIMARY KEY, ShowID INT REFERENCES Shows(ShowID), SubscriberID INT REFERENCES Subscribers(SubscriberID), WatchTime INT, FOREIGN KEY (SubscriberID))
4. Ensure all the three tables contain relevant data before running the procedures.
5. ListAllSubscribers() -- A stored procedure that goes through each record in subscriber table one by one using a cursor and prints their names.
6. GetWatchHistoryBySubscriber(IN sub_id INT) -- A Stored Procedure that goes through each record in subscriber table and retrieves the watch history by joining the two tables.
7. AddSubscriberIfNotExists(IN subName VARCHAR(100)) -- A stored Procedure that takes the subscribername as input and verifies the existence of another record with same name, if not present ti will create a new record.
8. SendWatchTimeReport() -- A stored procedure that retrieves the watch-time of each subscriber.
9. GetWatchHistoryBySubscriber() -- A stored Procedure that uses a cursor to iterate each record in subscribers table and displays the watch-history of the customer pointed by cursor.
