-- use mkd;


-- CREATE TABLE salary (
--     emp_id INT,
--     name varchar(20),
--     department varchar(20),
--     salary INT
--     
-- );

-- INSERT INTO salary VALUES
-- (1, 'John', 'IT', 50000),
-- (2, 'Alice', 'HR', 60000),
-- (3, 'Bob', 'Finance', 55000),
-- (4, 'David', 'IT', 52000),
-- (5, 'Emma', 'HR', 62000),
-- (6, 'Sophia', 'Finance', 70000),
-- (7, 'Liam', 'IT', 58000),
-- (8, 'Olivia', 'Finance', 75000),
-- (9, 'Noah', 'IT', 72000),
-- (10, 'Ava', 'HR', 65000);




-- -- How to get 2nd Highest salary ( using MAX(), Limit, order by desc)

-- select * from emp_salary ;

select salary from emp_salary where salary < (select max(salary) from emp_salary) order by salary desc limit 1;

-- -- Using MAX() and MAX()

select max(salary) from emp_salary where salary < (select max(salary) from emp_salary);


-- -- Using Limit and Offset (Offser start from 0)

select distinct salary from emp_salary order by salary desc limit 1 offset 0;  -- first Highest salary
select distinct salary from emp_salary order by salary desc limit 1 offset 1;  -- 2nd Highest salary

select distinct salary from emp_salary order by salary desc limit 1 offset 2;  -- 3rd Highest salary


-- -- Using DENSE_RANK() 

select * from (select salary, dense_rank() over (order by salary desc) as rnk from emp_salary) a where rnk=2;

-- --with CTE

with tt as (select salary, dense_rank() over (order by salary desc) as rnk from emp_salary) select * from tt a where rnk=2;


-- -- if we use RANK() or Row_number()?


with tt as (select salary, rank() over (order by salary desc) as rankno from emp_salary  ) select * from tt where rankno=3;

select * from (select salary , rank() over(order by salary desc) as rank1 from emp_salary) a where rank1 =3;


-- -- DENSE RANK(),ROW_NUMBER(), RANK()

select salary, rank() over (order by salary desc) as rankno,dense_rank() over (order by salary desc) as dense_rankno,row_number() over (order by salary desc) as row_numberno from emp_salary  ;



