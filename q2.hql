USE assignment1;
--question 2 answer: subscriber: 310217, customer: 43935
SELECT subscription, COUNT(id) as trips 
FROM assignment1.trip 
GROUP BY subscription;
