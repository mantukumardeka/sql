
create  database scenario;
use scenario;
show tables;

-- ##############################################################################################
-- SCENARION 1: 
-- output as only P3 (who likes only Banana and Apple) 
-- ##############################################################################################
drop table if exists person_data;
CREATE TABLE person_data (
    persons VARCHAR(5),
    fruit VARCHAR(20)
);

INSERT INTO person_data VALUES
('P1','Apple'),
('P1','Banana'),
('P1','Mango'),
('P3','Banana'),
('P3','Apple'),
('P2','Apple'),
('P2','Mango');

select * from person_data;
-- WHO LIKES banana and apple--how to get it?

select persons from person_data where fruit in ("Apple","Banana") group by persons having count(distinct fruit)=2;

-- ##############################################################################################

-- SCENARION 2: Find the difference between apples sold and oranges sold per day.
-- ##############################################################################################
CREATE TABLE sale_table (
    fruit VARCHAR(20),
    sale_date DATE,
    num_sold INT
);

INSERT INTO sale_table VALUES
('apple','2022-12-18',10),
('oranges','2022-12-18',8),
('apple','2022-12-19',10),
('oranges','2022-12-19',5),
('apple','2022-12-20',7),
('oranges','2022-12-20',7);

select * from sale_table;

select sale_date , sum(case when fruit="apple" then num_sold else 0 end ) - sum(case when fruit="oranges" then num_sold else 0 end  ) as sale_diff from sale_table group by sale_date;


SELECT 
    sale_date,
    SUM(CASE WHEN fruit = 'apple' THEN num_sold ELSE 0 END) -
    SUM(CASE WHEN fruit = 'oranges' THEN num_sold ELSE 0 END) AS diff
FROM sale_table
GROUP BY sale_date
ORDER BY sale_date;

-- using lead()

SELECT sale_date, (num_sold - sold1) AS diff
FROM (
    SELECT 
        sale_date,
        num_sold,
        LEAD(num_sold) OVER (
            PARTITION BY sale_date 
            ORDER BY fruit
        ) AS sold1
    FROM sale_table
) a
WHERE sold1 IS NOT NULL;

-- ##############################################################################################
-- SCENARION 3:  Remove all special value 
-- ##############################################################################################

CREATE TABLE sp_val (
    val1 VARCHAR(10)
);

INSERT INTO sp_val VALUES
('111'),
('222'),
('*'),
('333'),
('444'),
('???');

select * from sp_val;

-- replcaing special vallue-


SELECT 
    val1,
    REGEXP_REPLACE(val1, '[^0-9]', '') AS cleaned_val
FROM sp_val;

-- ##############################################################################################

-- SCENARION 4 : Find average salary of employees for each department and order employees within a department by age.
-- ##############################################################################################

CREATE TABLE emp1 (
    name VARCHAR(50),
    age INT,
    dept VARCHAR(20),
    sal INT
);

INSERT INTO emp1 VALUES
('Ram',20,'Finance',50000),
('Sudeep',25,'Sales',30000),
('Suresh',22,'Finance',50000),
('Pradeep',28,'Finance',20000),
('Iqbal',22,'Sales',20000);
select * from emp1;

select dept,  avg(sal) as avgsal from emp1 group by dept order by avgsal desc;


select * , avg(sal) over( partition by dept ) as avg_sal from emp1 order by dept,age;


SELECT 
    name,
    age,
    dept,
    sal,
    AVG(sal) OVER(PARTITION BY dept) AS avg_dept_salary
FROM emp1
ORDER BY dept, age;

-- ##############################################################################################
-- SCENARION 5 : 1️⃣ 1st row → Always show India
-- 2️⃣ 2nd row → Country with highest population
-- 3️⃣ 3rd row → Country with lowest population
-- ##############################################################################################

CREATE TABLE country_data (country VARCHAR(20), population INT); 
INSERT INTO country_data VALUES ('Brazil',10000),('India',15000),('US',20000),('UK',12000),('Europe',12000);

select * from country_data;

select country as data from country_data where country="India" 
union all select max(population) from country_data 
union all select min(population) from country_data;

-- ##############################################################################################
-- SCENARION  6: Find the user-id's which are having more outgoing messages for feb month compared to Jan Month
-- ##############################################################################################
CREATE TABLE mobile_data (
    user_id INT,
    mobilenumber BIGINT,
    msg_type VARCHAR(10),
    mob_date DATE
);

INSERT INTO mobile_data VALUES
(12345,9988445566,'outgoing','2022-01-23'),
(67890,8899445566,'incoming','2022-02-01'),
(78915,7799884455,'outgoing','2022-01-23'),
(12345,6698112244,'outgoing','2022-02-02'),
(12345,5598445566,'incoming','2022-01-24'),
(12345,1199885544,'outgoing','2022-02-05');

select * from mobile_data;


SELECT user_id
FROM mobile_data
WHERE msg_type = 'outgoing'
GROUP BY user_id
HAVING 
SUM(CASE WHEN MONTH(mob_date) = 2 THEN 1 ELSE 0 END) >
SUM(CASE WHEN MONTH(mob_date) = 1 THEN 1 ELSE 0 END);

SELECT user_id,
SUM(CASE WHEN MONTH(mob_date)=1 AND msg_type='outgoing' THEN 1 ELSE 0 END) AS jan_msgs,
SUM(CASE WHEN MONTH(mob_date)=2 AND msg_type='outgoing' THEN 1 ELSE 0 END) AS feb_msgs
FROM mobile_data
GROUP BY user_id
HAVING feb_msgs > jan_msgs;

-- ##############################################################################################
-- SCENARION  7: 

-- Find highest temperature per city
-- Find temperature difference between consecutive dates
-- Find cities where temperature increased
-- Use LAG / LEAD window functions
-- ##############################################################################################
CREATE TABLE temperature_data (
    city VARCHAR(10),
    tdate DATE,
    temperature INT
);

INSERT INTO temperature_data VALUES
('Bang','2021-12-16',35),
('Hyd','2022-06-05',43),
('Che','2020-07-20',46),
('Mum','2019-02-19',40),
('Del','2023-04-27',45),
('Bang','2021-11-16',45),
('Hyd','2022-07-05',25),
('Che','2020-09-20',50),
('Mum','2019-05-19',20),
('Del','2023-05-27',30);

select * from temperature_data;

-- Find highest temperature per city
select city,  max(temperature) as highest from temperature_data group by city;

-- Find temperature difference between consecutive records 

SELECT 
city,
tdate,
temperature,
temperature - LAG(temperature) OVER (PARTITION BY city ORDER BY tdate) AS temp_diff
FROM temperature_data;

-- Find cities where temperature increased compared to previous record

with tt as (
select city,tdate, temperature, lag(temperature) over(partition by city order by tdate ) as prev_temp from temperature_data)
select * from tt where prev_temp<temperature;

SELECT city, tdate, temperature FROM (SELECT city, tdate, temperature, LAG(temperature) OVER(PARTITION BY city ORDER BY tdate) AS prev_temp FROM temperature_data) t WHERE temperature > prev_temp;


-- You need a Hive query to return the top 2 maximum temperatures with their year without using ORDER BY.
-- Extract year from date
-- Get max temperature per year
-- Use window function (ROW_NUMBER or RANK) to pick top 2
-- Avoid ORDER BY in the outer query


SELECT year, max_temp
FROM (
    SELECT year, max_temp,
           ROW_NUMBER() OVER (ORDER BY max_temp DESC) AS rn
    FROM (
        SELECT year(tdate) AS year, MAX(temperature) AS max_temp
        FROM temperature_data
        GROUP BY year(tdate)
    ) t
) s
WHERE rn <= 2;

-- #########################################################################################################
-- SCENARION  8: 

-- If you want, I can also show some tricky SQL interview questions using this table, like:
-- Find names starting with vowel
-- Find names ending with vowel
-- Find palindrome names
-- Count number of characters in each name
-- Find duplicate characters in names
-- #######################################################################################################

CREATE TABLE b1 (bname VARCHAR(20));

INSERT INTO b1 VALUES ('Hema'),('Sai'),('Gomathi'),('Gayatri'),('Liyansh'),('Shah'),('Anu'),('Elango'),('India'),('oli');

select * from b1;

-- | Pattern  | Meaning                |
-- | -------- | ---------------------- |
-- | `^A`     | starts with A          |
-- | `A$`     | ends with A            |
-- | `^A.*A$` | starts and ends with A |
-- | `[abc]`  | a or b or c            |
-- | `[^abc]` | not a, b, c            |
-- | `.`      | any character          |


-- 1. Find Names Starting with a Vowel

SELECT * FROM b1 WHERE bname REGEXP '^[AEIOUaeiou]';

-- 2. Find Names ending with a Vowel

select * from b1 where bname regexp  '[AEIUOaeiou]$';

-- 3. Find Names atarting and  ending with a Vowel

select * from b1 where bname  regexp '^[AEIOUaeiou].*[AEIOUaeiou]$';


-- ################################################################################################

-- SCENARION  9:  You need to find the top 2 performing markets in each location based on amt.

-- ################################################################################################
CREATE TABLE market (market_id INT, market_name VARCHAR(50), amt INT, location VARCHAR(50));

INSERT INTO market VALUES (101,'D-mart',500,'chennai'),(102,'super store',300,'chennai'),(103,'coludera',300,'chennai'),(105,'super store',200,'Pondy'),(104,'walmart',100,'Pondy');

select * from market;

-- You need to find the top 2 performing markets in each location based on amt

with tt as (
select * , row_number() over(partition by location order by amt desc ) as rnk from market)
select market_name from tt where rnk<=2;

with tt as (
select * , dense_rank() over(partition by location order by amt desc ) as rnk from market)
select market_id, market_name, amt, location from tt where rnk<=2;

-- - u sing row_number()

SELECT market_id, market_name, amt, location
FROM (
SELECT *, ROW_NUMBER() OVER(PARTITION BY location ORDER BY amt DESC) AS rn
FROM market
) t
WHERE rn <= 2;

-- Solution 2 (Without Window Function)

SELECT location, MAX(amt) AS second_highest
FROM market m1
WHERE amt < (
SELECT MAX(amt)
FROM market m2
WHERE m1.location = m2.location
)
GROUP BY location;


SELECT location, market_name, amt
FROM market
WHERE CONCAT(location, amt) IN (
SELECT CONCAT(location, MAX(amt))
FROM market
GROUP BY location
);

-- ################################################################################################

-- SCENARION  10:  “Write a SQL query to find employees who have a unique salary (salary that appears only once in the table).”

-- ################################################################################################

drop table if exists emp_data;
CREATE TABLE emp_data (
employee VARCHAR(20),
salary INT
);
INSERT INTO emp_data VALUES ('A',10),('B',10),('C',9),('D',8),('F',8),('G',7),('H',6);

SELECT * FROM emp_data;

select * from emp_data where salary in(
select salary from emp_data group by salary having count(employee)=1);







-- ################################################################################################

-- SCENARION  11:  

-- Please provide SQL query for the below questions :
-- 1) Product which has been purchased by large number of consumers
-- 2) Product which has not been sold so far
-- 3) Customer who has purchased any product more than once per day 

-- ################################################################################################


DROP TABLE IF EXISTS Product;
CREATE TABLE Product (PROD_ID VARCHAR(10), PROD_NAME VARCHAR(50), PROD_DESC VARCHAR(50), PROD_PRICE INT);
INSERT INTO Product VALUES ('P1','Prod 1','Prod 1',10),('P2','Prod 2','Prod 2',20),('P3','Prod 3','Prod 3',30),('P4','Prod 4','Prod 4',40),('P5','Prod 5','Prod 5',50);



DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (CUST_ID VARCHAR(10), NAME VARCHAR(50), REGION VARCHAR(20), ADDRESS VARCHAR(100));
INSERT INTO Customer VALUES ('C1','Cust 1','IND','Mumbai'),('C2','Cust 2','US','California'),('C3','Cust 3','UK','Buckingham Palace'),('C4','Cust 4','IND','Chennai'),('C5','Cust 5','US','Alaska');

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (CUST_ID VARCHAR(10), TXN_ID VARCHAR(10), TXNAMT INT, PROD_NAME VARCHAR(50), PROD_ID VARCHAR(10), PURCHASE_DATE DATE);
INSERT INTO transactions VALUES ('C1','T1',100,'Prod 1','P1','2022-12-02'),('C1','T2',500,'Prod 1','P1','2022-12-02'),('C2','T3',100,'Prod 2','P2','2022-12-05'),('C3','T4',100,'Prod 3','P3','2022-12-08'),('C4','T5',100,'Prod 4','P4','2022-12-09'),('C1','T6',600,'Prod 1','P1','2022-12-10');


SELECT * FROM Product;
select * from Customer;
select * from transactions;


 -- 1 ) Product which has been purchased by large number of consumers

select PROD_ID, count(CUST_ID) as total_cust  from transactions group by PROD_ID order by total_cust  desc limit 1;

select PROD_ID from transactions group by PROD_ID having count(CUST_ID)>1;


-- 2) Product which has not been sold so far


select p.PROD_ID,p.PROD_NAME from Product p left join transactions t on p.PROD_ID=t.PROD_ID where t.PROD_ID is null;


-- 3) Customer who has purchased any product more than once per day 


select c.CUST_ID,t.PURCHASE_DATE , count(c.CUST_ID) as tans from Customer c join transactions t on c.CUST_ID=t.CUST_ID group by c.CUST_ID,t.PURCHASE_DATE having tans>1;

SELECT CUST_ID, PURCHASE_DATE, COUNT(*) AS total_purchases
FROM transactions
GROUP BY CUST_ID, PURCHASE_DATE
HAVING COUNT(*) > 1;




-- ################################################################################################

-- SCENARION  12:  

-- You need to return:,product_id,size,date,amount,product_description

-- But the condition is:

-- ✅ For each product_id, select the product_description having the maximum length
-- ✅ Result should have no duplicate product_id

-- The best way is using ROW_NUMBER() with LENGTH().

-- ################################################################################################

DROP TABLE IF EXISTS sale_data;
CREATE TABLE sale_data (
product_id VARCHAR(10),
size INT,
sale_date DATE
);

INSERT INTO sale_data VALUES
('AA1',10,'2020-01-01'),
('BB1',20,'2020-01-05');

SELECT * FROM sale_data;

DROP TABLE IF EXISTS product_details;
CREATE TABLE product_details (
product_id VARCHAR(10),
product_description VARCHAR(50),
amount INT
);

INSERT INTO product_details VALUES
('AA1','ABC',100),
('AA1','ABCD',200),
('AA1','AB',150),
('BB1','BCD',120),
('BB1','BEDG',300);

SELECT * FROM product_details;
SELECT * FROM sale_data;


SELECT s.product_id, s.size, s.sale_date, p.amount, p.product_description
FROM sale_data s
JOIN (
SELECT product_id, product_description, amount,
ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY LENGTH(product_description) DESC) rn
FROM product_details
) p
ON s.product_id = p.product_id
WHERE p.rn = 1;





-- ################################################################################################

-- SCENARION  13:  

-- 1. Find a actor and director who has worked together more than once
-- 2. list of Actors who have worked in more than one movie_name
-- 3. Director - Max Movies in their lifetime


-- ################################################################################################

DROP TABLE IF EXISTS Actors;
CREATE TABLE Actors (name VARCHAR(50), age INT, movie_name VARCHAR(50));
INSERT INTO Actors VALUES 
('actor1',25,'movie1'),
('actor1',26,'movie2'),
('actor3',25,'movie3'),
('actor4',25,'movie4'),
('actor1',25,'movie5');

DROP TABLE IF EXISTS Director_details;
CREATE TABLE Director_details (dir_name VARCHAR(50), age INT, movie_name VARCHAR(50));
INSERT INTO Director_details VALUES
('dir1',50,'movie1'),
('dir1',51,'movie2'),
('dir2',45,'movie3'),
('dir4',40,'movie4'),
('dir1',55,'movie5');

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (movie_name VARCHAR(50), dt_of_publish DATE);
INSERT INTO movies VALUES
('movie1','2018-10-10'),
('movie2','2019-10-10'),
('movie3','2020-10-10'),
('movie4','2020-05-10'),
('movie5','2021-07-10');


SELECT * FROM Actors;
select * from Director_details;
select * from movies;


-- 1. Find a actor and director who has worked together more than once


select a.name, d.dir_name , count(*) as totals  from actors a join Director_details d on a.movie_name=d.movie_name group by a.name, d.dir_name having totals>1;


-- 2. list of Actors who have worked in more than one movie_name


select name , count(movie_name) as total from actors group by name having count(movie_name)>1;

SELECT name, COUNT(DISTINCT movie_name) AS total_movies
FROM Actors
GROUP BY name
HAVING COUNT(DISTINCT movie_name) > 1;


-- 3. Director - Max Movies in their lifetime

SELECT dir_name, COUNT(movie_name) AS total_movies
FROM Director_details
GROUP BY dir_name
ORDER BY total_movies DESC
LIMIT 1;

-- ################################################################################################

-- SCENARION  14:  

-- ################################################################################################


DROP TABLE IF EXISTS myrs;
CREATE TABLE myrs (
name VARCHAR(50),
subject VARCHAR(20),
marks INT,
years INT
);

INSERT INTO myrs VALUES 
('student1','math',76,2009),
('student1','math',56,2010),
('student1','eng',86,2009),
('student1','eng',87,2010),
('student1','sci',62,2009),
('student1','sci',62,2010);

SELECT * FROM myrs;

-- “Write a SQL query to compare marks of each subject with the previous year and show the result as ‘More’, ‘Less’, or ‘Same’.”


SELECT name, subject, years, marks,
CASE 
    WHEN Diff IS NULL THEN NULL
    WHEN Diff < 0 THEN 'Less'
    WHEN Diff > 0 THEN 'More'
    ELSE 'Same'
END AS Result
FROM
(
    SELECT *, (marks - prev_marks) AS Diff
    FROM
    (
        SELECT *,
               LAG(marks) OVER (PARTITION BY subject ORDER BY years) AS prev_marks
        FROM myrs
    ) a
) p;






-- ################################################################################################

-- SCENARION  15:  

-- Given employee data and salary information stored in multiple department tables (Hardware and Maintenance), 
-- write a SQL query to calculate the consolidated or total salary of each employee irrespective of the department.

-- ################################################################################################



DROP TABLE IF EXISTS Emp; CREATE TABLE Emp (name VARCHAR(10), id INT); INSERT INTO Emp VALUES ('a',100),('b',200),('c',300);
DROP TABLE IF EXISTS Hardware; CREATE TABLE Hardware (id INT, salary INT); INSERT INTO Hardware VALUES (100,1000),(300,500);
DROP TABLE IF EXISTS Maintenance; CREATE TABLE Maintenance (id INT, salary INT); INSERT INTO Maintenance VALUES (100,500),(200,1000);

--  write a SQL query to calculate the consolidated or total salary of each employee irrespective of the department.

SELECT e.name,e.id,COALESCE(h.salary,0)+COALESCE(m.salary,0) AS salary FROM Emp e LEFT JOIN Hardware h ON e.id=h.id LEFT JOIN Maintenance m ON e.id=m.id;

select * from emp;
select * from Hardware;
select * from Maintenance;

select e.name, e.id ,sum(s.salary) as sal from emp e join
(select * from Hardware
Union All 
select * from Maintenance ) s on e.id=s.id group by e.name, e.id ;


-- ################################################################################################

-- SCENARION  16:  

-- ################################################################################################


CREATE TABLE customers14 (
    custid INT,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

INSERT INTO customers14 VALUES
(1,'MARK123','RAY'),
(2,'PETER','SMITH*#'),
(3,'ROBIN','EVANS456'),
(4,'KATE','*#@'),
(5,'RICHAR*#','JONES');

select * from customers14;

SELECT 
custid,
TRIM(CONCAT(
REGEXP_REPLACE(firstname,'[^A-Za-z]',''),
' ',
REGEXP_REPLACE(lastname,'[^A-Za-z]','')
)) AS FullName
FROM customers14;


-- ################################################################################################

-- SCENARION  17:  Customer who spent more than average?

-- ################################################################################################

drop table if exists orders17;
CREATE TABLE orders17(order_id INT, cust_name VARCHAR(30), product VARCHAR(30), amount INT, order_date DATE); 
INSERT INTO orders17 VALUES (1,'Rahul','Laptop',50000,'2024-01-10'),(2,'Amit','Mobile',20000,'2024-01-11'),(3,'Rahul','Keyboard',2000,'2024-01-12'),(4,'Sneha','Laptop',55000,'2024-01-13'),(5,'Amit','Mouse',800,'2024-01-14'),(6,'Riya','Tablet',15000,'2024-01-15'),(7,'Rahul','Monitor',12000,'2024-01-16'),(8,'Karan','Mobile',18000,'2024-01-17'),(9,'Sneha','Headphone',3000,'2024-01-18'),(10,'Riya','Laptop',52000,'2024-01-19'),(11,'Amit','Keyboard',2500,'2024-01-20'),(12,'Karan','Tablet',14000,'2024-01-21'),(13,'Rahul','Mouse',900,'2024-01-22'),(14,'Sneha','Monitor',11000,'2024-01-23'),(15,'Amit','Laptop',48000,'2024-01-24'),(16,'Riya','Headphone',3500,'2024-01-25'),(17,'Rahul','Tablet',16000,'2024-01-26'),(18,'Karan','Keyboard',2200,'2024-01-27'),(19,'Sneha','Mouse',850,'2024-01-28'),(20,'Amit','Monitor',12500,'2024-01-29');
select * from orders17;


--  Customer who spent more than average?


with totab as (select cust_name,sum(amount) as total from orders17 group by cust_name) 
select * from totab where total > (select avg(amount) from orders17);




-- ################################################################################################

-- SCENARION  18:  Two table emp18, dept18, In the table, I want to get the records who have in employee table

-- ################################################################################################

use scenario;

-- Create Department Table
CREATE TABLE dept18 (
    Dep_ID INT,
    Dep_Name VARCHAR(50)
);

-- Insert into Department
INSERT INTO dept18 (Dep_ID, Dep_Name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');

-- Create Employee Table
CREATE TABLE emp18 (
    Emp_ID INT,
    Dep_ID INT
);

-- Insert into Employee
INSERT INTO emp18 (Emp_ID, Dep_ID) VALUES
(101, 1),
(102, 1),
(103, 2),
(104, 5);  -- No matching department

-- =========================
-- Get departments having employees
-- =========================

SELECT DISTINCT d.*
FROM dept18 d
INNER JOIN emp18 e
ON d.Dep_ID = e.Dep_ID;

--  OR--

SELECT *
FROM dept18 d
WHERE EXISTS (
    SELECT 1
    FROM emp18 e
    WHERE d.Dep_ID = e.Dep_ID
);


-- ################################################################################################

-- SCENARION  19: The roundtrip distance should be calculated
-- Find all the uniques routes where reverse pairs like SFO-SJC and SJC-SFO are counted only once?

-- ################################################################################################

use scenario;
CREATE TABLE distance (
    from_city VARCHAR(10),
    to_city   VARCHAR(10),
    dist      INT
);

INSERT INTO distance (from_city, to_city, dist) VALUES
('SEA', 'SF', 300),
('CHI', 'SEA', 2000),
('SF', 'SEA', 300),
('SEA', 'CHI', 2000),
('SEA', 'LND', 500),
('LND', 'SEA', 500),
('LND', 'CHI', 1000),
('CHI', 'NDL', 180);

select * from distance;


select a.from_city,a.to_city,a.dist+b.dist as roundtrip, 'shuttlemode' as mode from distance a
join distance b on a.from_city=b.to_city and a.to_city=b.from_city where a.from_city<a.to_city;

-- ################################################################################################

-- SCENARION  20:

-- Output:
-- ========
-- India vs Australia
-- India vs England
-- India vs New Zealand
-- Australia vs England
-- Australia vs New Zealand
-- England vs New Zealand
-- -

-- ################################################################################################

CREATE TABLE teams (
    Id INT,
    TeamName VARCHAR(50)
);

INSERT INTO teams (Id, TeamName) VALUES
(1, 'India'),
(2, 'Australia'),
(3, 'England'),
(4, 'New Zealand');

select * from teams;

select a.TeamName as TeamA b.TeamName as TeamB from teams a ,teams b where a.TeamName>b.TeamName;

SELECT 
    a.TeamName AS TeamA,
    b.TeamName AS TeamB
FROM teams a, teams b
WHERE a.TeamName > b.TeamName;
-- 
SELECT 
    CONCAT(a.TeamName, ' vs ', b.TeamName) AS 'Match'
FROM teams a
JOIN teams b
ON a.Id < b.Id;


-- ################################################################################################

-- SCENARION  21: Q1 :
-- Input: 
-- strore,entries
--  1,p1,p2,p3,p4
--  2,p1
--  3,p1,p2
--  4,p1,p2,p3,p4,p5,p6,p7
--  
-- Output:
--  4,7

-- 

-- ################################################################################################

use scenario;
CREATE TABLE store_data (store INT, entries VARCHAR(100));

INSERT INTO store_data (store, entries) VALUES
(1,'p1,p2,p3,p4'),
(2,'p1'),
(3,'p1,p2'),
(4,'p1,p2,p3,p4,p5,p6,p7');


select store, length(entries) -length(replace(entries, ',', '')) + 1 as entrycount  from store_data order by entrycount desc limit 1;




-- ################################################################################################

-- SCENARION 22: Find the name who has visited frequently 


-- ################################################################################################


CREATE TABLE places (
    name VARCHAR(50),
    travel_location VARCHAR(200),
    age INT
);

INSERT INTO places (name, travel_location, age) VALUES
('ravi','pune,delhi,chennai,noida',32),
('gautham','delhi,chennai',30),
('mary','noida,pune',35),
('thomas','delhi,pune',31),
('shankar','chennai,noida',30);






-- ################################################################################################

-- SCENARION 23:


-- ################################################################################################


















-- ################################################################################################

-- SCENARION 24:


-- ################################################################################################



















-- ################################################################################################

-- SCENARION 25:


-- ################################################################################################



















-- ################################################################################################

-- SCENARION 26:


-- ################################################################################################
