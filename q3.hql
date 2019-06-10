USE assignment1;
--question 3 answer: wip
CREATE TABLE IF NOT EXISTS assignment1.station_list AS
SELECT start_terminal, end_terminal, MIN(duration) AS min_duration FROM trip 
WHERE start_terminal <> end_terminal 
GROUP BY start_terminal, end_terminal 
ORDER BY min_duration;

--structure to csv format in HDFS
CREATE EXTERNAL TABLE IF NOT EXISTS stationlist 
LIKE assignment1.station_list
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\044'
LINES TERMINATED BY '\n'
LOCATION '/user/assignment1/stationlist';

--load in data
INSERT OVERWRITE TABLE stationlist 
SELECT * FROM assignment1.station_list;

