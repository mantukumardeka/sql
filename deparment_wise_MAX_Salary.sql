CREATE TABLE sal_tab (
    name varchar(10),
    department varchar(10),
    salary INT
);

INSERT INTO sal_tab VALUES
('James','Sales',3000),
('Michael','Sales',4600),
('Robert','Sales',4100),
('Maria','Finance',3000),
('Raman','Finance',3000),
('Scoe','Finance',3300),
('Jen','Finance',3900),
('Jeff','Marketing',3000),
('Kumar','Marketing',2000);


-- find the deparment wise MAX Salary ?

select * from sal_tab;

-- Using group by

select department, max(salary) as maxsal from sal_tab group by department ;

-- other way

SELECT department, MAX(salary) AS highest_salary FROM sal_tab WHERE department IN ('Sales',
'Finance', 'Marketing') GROUP BY department;


