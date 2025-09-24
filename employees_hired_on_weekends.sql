-- Find all employees hired on weekends.
use mkd;

CREATE TABLE emp_s1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(10),
    hire_date DATE
);

INSERT INTO emp_s1 (emp_id, emp_name, hire_date) VALUES
(1, 'Alice', '2023-07-01'),  -- Saturday
(2, 'Bob',   '2023-07-02'),  -- Sunday
(3, 'Charlie', '2023-07-03'), -- Monday
(4, 'David', '2023-07-04'),  -- Tuesday
(5, 'Eva',   '2023-07-08');  -- Saturday


select * from emp_s1;

-- SQL Server → DATENAME(WEEKDAY, hire_date)

-- MySQL → DAYOFWEEK(hire_date) IN (1,7)

-- Below only in SQL , not for mySQL.
select * from emp_s1 where DATENAME(WEEKDAY,hire_date ) in ("Saturday","Sunday");

select * FROM emp_s1 WHERE DATE(WEEK, hire_date) IN ('Saturday', 'Sunday');

-- Below is working in MySQL
select * from emp_s1 where dayofweek(hire_date ) in (1,7);


-- Find those employee who joined in weekdays.

SELECT * FROM emp_s1 WHERE DAYOFWEEK(hire_date) NOT IN (1, 7);
-- 1 = Sunday, 7 = Saturday

-- Hive or Park SQL

SELECT *
FROM Employee
WHERE pmod(datediff(hire_date, '1970-01-01'), 7) NOT IN (5, 6);
-- 5 = Saturday, 6 = Sunday






