
-- Question 181: Employees Earning More Than Their Managers
-- Write a SQL query that finds employees who earn more than their managers.


-- mysql> select * from Employee_181;
-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- |  1 | Joe   |  70000 |         3 |
-- |  2 | Henry |  80000 |         4 |
-- |  3 | Sam   |  60000 |      NULL |
-- |  4 | Max   |  90000 |      NULL |
-- +----+-------+--------+-----------+

CREATE TABLE Employee_181 (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Salary INT,
    ManagerId INT
);

INSERT INTO Employee_181 VALUES (1, 'Joe', 70000, 3);
INSERT INTO Employee_181 VALUES (2, 'Henry', 80000, 4);
INSERT INTO Employee_181 VALUES (3, 'Sam', 60000, NULL);
INSERT INTO Employee_181 VALUES (4, 'Max', 90000, NULL);

select * from Employee_181;


-- sulution

select e.name as employee from employee_181 e join employee_181 m on e.id=m.managerid where e.salary>m.salary;