-- Question 184-

--  Write a solution to find employees who have the highest salary in each of the departments.
-- Return the result table in any order.

-- Output: 
-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Jim      | 90000  |
-- | Sales      | Henry    | 80000  |
-- | IT         | Max      | 90000  |
-- +------------+----------+--------+


CREATE TABLE Department_184 (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Employee_184 (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department_184(id)
);


INSERT INTO Department_184 (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO Employee_184 (id, name, salary, departmentId) VALUES
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);



select Employee,Department,Salary from (select e.name as Employee,e.salary as Salary,d.name as Department, dense_rank() over(partition by d.name order by e.salary desc ) as rnk from Employee_184 e join Department_184 d on e.departmentid=d.id) a where rnk=1;