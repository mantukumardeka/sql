-- Question 176: Second Highest Salary
-- Write a SQL query to get the second highest salary from the Employee table.
-- If there is no second highest salary, return null.

CREATE TABLE Employee_176 (
    Id INT PRIMARY KEY,
    Salary INT
);

INSERT INTO Employee_176 VALUES (1, 100);
INSERT INTO Employee_176 VALUES (2, 200);
INSERT INTO Employee_176 VALUES (3, 300);

-- Solution:
SELECT IFNULL(
    (SELECT DISTINCT Salary 
     FROM Employee_176 
     ORDER BY Salary DESC 
     LIMIT 1 OFFSET 1),
    NULL
) AS SecondHighestSalary;


select max(salary) from employee_176 where salary< (select max(salary) from employee_176);

select * from Employee_176;
