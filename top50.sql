use top50;


-- ========================================================================
-- Fetch all employees whose names contain the letter “a” exactly twice.
-- ========================================================================

DROP TABLE IF EXISTS employees1; CREATE TABLE employees1 (emp_id INT, name VARCHAR(50), salary DECIMAL(10,2)); INSERT INTO employees1 VALUES (1,'Ravi',50000.00),(2,'Anand',60000.00),(3,'Aakash',55000.00),(4,'Saurabh',70000.00),(5,'Kamal',65000.00),(6,'Deepa',48000.00),(7,'Aman',52000.00);
--  names contain the letter “a” exactly twice.
SELECT * FROM employees1 WHERE LENGTH(LOWER(name)) - LENGTH(REPLACE(LOWER(name), 'a', '')) = 2;
-- where a comes 3 times-
select * from employees1 where length(lower(name)) - length(replace(lower(name),'a',''))=3 ;
