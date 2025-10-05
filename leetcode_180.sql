-- Question 180: Consecutive Numbers
-- Write a SQL query to find all numbers that appear at least three times consecutively.



CREATE TABLE Logs_180 (
    Id INT PRIMARY KEY,
    Num INT
);

INSERT INTO Logs_180 VALUES (1, 1);
INSERT INTO Logs_180 VALUES (2, 1);
INSERT INTO Logs_180 VALUES (3, 1);
INSERT INTO Logs_180 VALUES (4, 2);
INSERT INTO Logs_180 VALUES (5, 1);
INSERT INTO Logs_180 VALUES (6, 2);
INSERT INTO Logs_180 VALUES (7, 2);


-- Solution

with tt as(select id ,num, lead(num) over(order by id) as nextnum,lag(num) over(order by id) as prevnum from Logs_180) select distinct num as connum from tt where prevnum=num and nextnum=num ;

-- or

SELECT DISTINCT l1.Num AS ConsecutiveNums
FROM Logs_180 l1
JOIN Logs_180 l2 ON l1.Id = l2.Id - 1
JOIN Logs_180 l3 ON l1.Id = l3.Id - 2
WHERE l1.Num = l2.Num AND l2.Num = l3.Num;