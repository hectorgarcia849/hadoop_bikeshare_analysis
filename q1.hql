USE assignment1;
--question 1 answer: bike: 878 trips: 1121
SELECT bike_id, COUNT(id) as trips FROM trip 
GROUP BY bike_id 
ORDER BY trips DESC LIMIT 10;
