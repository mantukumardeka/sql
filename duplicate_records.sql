-- use mkd;

-- CREATE TABLE employees (
--     emp_id INT,
--     name varchar(20),
--     department varchar(20),
--     salary INT
-- );

-- INSERT INTO employees VALUES
-- (1, 'John', 'IT', 50000),
-- (2, 'Alice', 'HR', 60000),
-- (3, 'Bob', 'Finance', 55000),
-- (4, 'David', 'IT', 52000),
-- (5, 'Emma', 'HR', 62000),
-- (2, 'Alice', 'HR', 60000),   -- duplicate
-- (3, 'Bob', 'Finance', 55000), -- duplicate
-- (6, 'Sophia', 'Finance', 70000),
-- (7, 'Liam', 'IT', 58000),
-- (1, 'John', 'IT', 50000);   -- duplicate


-- select * from employees;

--- How you will get duplicate record?

-- select emp_id,name,salary,count(*) from employees group by emp_id,name ,salary having count(*)>1;

