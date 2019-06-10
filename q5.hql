
USE assignment1;
SELECT x.start_landmark, y.city as end_landmark, COUNT(*)
FROM (
	SELECT trip.start_terminal, station.city as start_landmark, trip.end_terminal 
	FROM trip 
	JOIN station ON station.id=start_terminal 
) as x 
JOIN station as y ON x.end_terminal=y.id 
WHERE x.start_landmark<>y.city 
GROUP BY x.start_landmark, y.city
LIMIT 50;
