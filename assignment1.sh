#!/bin/bash

echo Starting Assignment 1 program for Big Data Tools course...

echo Adding CSV files station_data.csv and trip_data.csv to hadoop file system...
hadoop fs -put ./station_data.csv /user/assignment1
hadoop fs -put ./trip_data.csv /user/assignment1

echo Will execute hive scripts for assignment...

echo running startup script...
hive -f ./startup.hql

echo running q1 script...
hive -f ./q1.hql

echo running q2 script...
hive -f ./q2.hql

echo running q3 script...
hive -f ./q3.hql

echo running q4 script...
hive -f ./q4.hql

echo running q5 script...
hive -f ./q5.hql 


# hive -e "$(cat ./startup.hql ./q1.hql ./q2.hql ./q3.hql ./q4.hql, ./q5.hql)"

echo Will create stationlist.csv file and store in hdfs /user/assignment1/
hadoop fs -cat /user/assignment1/stationlist/* > stationlist.csv
hadoop fs -put stationlist.csv /user/assignment1/
rm -f stationlist.csv

echo Program completed.  Good-bye.
