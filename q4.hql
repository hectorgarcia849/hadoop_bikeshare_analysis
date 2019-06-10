USE assignment1;
--question 4
SELECT station.city as landmark, COUNT(trip.id) 
FROM station 
JOIN trip ON station.id = trip.start_terminal 
GROUP BY station.city;
