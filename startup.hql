CREATE DATABASE IF NOT EXISTS assignment1 COMMENT 'CIND 719 Assignment 1, database of bike program in California';
USE assignment1;

DROP TABLE IF EXISTS assignment1.station;

CREATE TABLE assignment1.station (
	id INT COMMENT 'station id', 
	name STRING COMMENT 'station name', 
	lat DOUBLE COMMENT 'station latitude', 
	lon DOUBLE COMMENT 'station longitude', 
	dockcount INT COMMENT 'number of bike docks at the station', 
	city STRING COMMENT 'closest city to station', 
	install_date STRING COMMENT 'date the station was built'
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INPATH '/user/assignment1/station_data.csv'
OVERWRITE INTO TABLE assignment1.station;

DROP TABLE IF EXISTS assignment1.trip;

CREATE TABLE assignment1.trip (
	id INT COMMENT 'numeric ID of bike trip',
	duration INT COMMENT 'time of trip in seconds',
	start_datetime STRING COMMENT 'start date and time of trip in format mm/dd/yyyy HH:MM (PST)',
	start_station STRING COMMENT 'reference to attribute name in assignment1.station table, name of station',
	start_terminal INT COMMENT 'reference to attribute id in assignment1.station table , numeric ID of station',
	end_datetime STRING COMMENT 'end date and time of trip in format mm/dd/yyyy HH:MM (PST)',
	end_station STRING COMMENT 'reference to attribute name in assignment1.station table, name of station where trip ends',
	end_terminal INT COMMENT 'reference to attribute id in assignment1.station table, numeric ID of station where trip ends',
	bike_id INT COMMENT 'numeric ID of bike used',
	subscription STRING COMMENT 'Subscriber refers to annual or 30 day member and Customer refers 24-hour or 3-day member',
	zip_code STRING COMMENT 'home zip code of subscriber, though data unreliable'
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INPATH '/user/assignment1/trip_data.csv'
OVERWRITE INTO TABLE assignment1.trip;

