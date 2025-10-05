-- Question 185:
 -- Write a solution to find the employees who are high earners in each of the departments.
 -- Return the result table in any order. 
  -- Department wise top three in each department
 
 
--  OUTPUT:

-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Max      | 90000  |
-- | IT         | Joe      | 85000  |
-- | IT         | Randy    | 85000  |
-- | IT         | Will     | 70000  |
-- | Sales      | Henry    | 80000  |
-- | Sales      | Sam      | 60000  |
-- +------------+----------+--------+


CREATE TABLE Department_185 (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Employee_185 (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department_185(id)
);

-- Insert Departments
INSERT INTO Department_185 (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

-- Insert Employees
INSERT INTO Employee_185 (id, name, salary, departmentId) VALUES
(1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1);


select Department,Employee,Salary from (select d.name as Department,e.name as Employee,e.salary,dense_rank() over(partition by d.name order by e.salary desc ) as rnk from employee_185 e join department_185 d on d.id=e.departmentid ) a where rnk<=3;

