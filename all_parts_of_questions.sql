create database all_parts;
use  all_parts;

-- ==================================================================================
-- 1) To get who are getting equal salary. ( Sefl join )
-- ==================================================================================
DROP TABLE IF EXISTS workers; CREATE TABLE workers (WORKER_ID INT, FIRST_NAME VARCHAR(50), LAST_NAME VARCHAR(50), SALARY INT, JOINING_DATE DATETIME, DEPARTMENT VARCHAR(50)); INSERT INTO workers VALUES (1,'Monika','Arora',100000,'2014-02-20 09:00:00','HR'),(2,'Niharika','Verma',300000,'2014-06-11 09:00:00','Admin'),(3,'Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),(4,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),(5,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin');
select * from workers;
-- +-----------+------------+-----------+--------+---------------------+------------+
-- | WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
-- +-----------+------------+-----------+--------+---------------------+------------+
-- |         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
-- |         2 | Niharika   | Verma     | 300000 | 2014-06-11 09:00:00 | Admin      |
-- |         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
-- |         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
-- |         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
-- +-----------+------------+-----------+--------+---------------------+------------+


-- Notes: Worker_id!=Worker_id

select  a.first_name,a.salary   from workers a join workers b on a.worker_id!=b.worker_id where a.salary=b.salary;

SELECT a.WORKER_ID,a.FIRST_NAME,a.SALARY,b.WORKER_ID,b.FIRST_NAME,b.SALARY FROM workers a JOIN workers b ON a.SALARY=b.SALARY AND a.WORKER_ID<b.WORKER_ID;

-- Same Salary each department
SELECT a.WORKER_ID,a.FIRST_NAME,a.DEPARTMENT,a.SALARY,b.WORKER_ID,b.FIRST_NAME 
FROM workers a 
JOIN workers b 
ON a.SALARY=b.SALARY 
AND a.DEPARTMENT=b.DEPARTMENT 
AND a.WORKER_ID<b.WORKER_ID;

-- using group by (same salary on same department) (AA)

SELECT DEPARTMENT,SALARY,GROUP_CONCAT(FIRST_NAME) AS employees FROM workers GROUP BY DEPARTMENT,SALARY HAVING COUNT(*)>1;

-- ==================================================================================
-- 2) Need the dates when the status gets changed like ordered to dispatched ?
-- ==================================================================================

-- Notes: lag on status

DROP TABLE IF EXISTS orders; CREATE TABLE orders (order_id INT, status_date DATE, status VARCHAR(50)); INSERT INTO orders VALUES (1,'2024-01-01','Ordered'),(1,'2024-01-02','dispatched'),(1,'2024-01-03','dispatched'),(1,'2024-01-04','Shipped'),(1,'2024-01-05','Shipped'),(1,'2024-01-06','Delivered'),(2,'2024-01-01','Ordered'),(2,'2024-01-02','dispatched'),(2,'2024-01-03','shipped');
select * from orders;
-- +----------+-------------+------------+
-- | order_id | status_date | status     |
-- +----------+-------------+------------+
-- |        1 | 2024-01-01  | Ordered    |
-- |        1 | 2024-01-02  | dispatched |
-- |        1 | 2024-01-03  | dispatched |
-- |        1 | 2024-01-04  | Shipped    |
-- |        1 | 2024-01-05  | Shipped    |
-- |        1 | 2024-01-06  | Delivered  |
-- |        2 | 2024-01-01  | Ordered    |
-- |        2 | 2024-01-02  | dispatched |
-- |        2 | 2024-01-03  | shipped    |
-- +----------+-------------+------------+


SELECT order_id,status_date,status FROM 
(SELECT order_id,status_date,status,LAG(status) OVER (PARTITION BY order_id ORDER BY status_date) AS prev_status FROM orders) t 
WHERE status<>prev_status OR prev_status IS NULL;
-- below is expected.
SELECT order_id,status_date 
FROM (SELECT order_id,status_date,status,LAG(status) OVER (PARTITION BY order_id ORDER BY status_date) AS prev_status FROM orders) t 
WHERE prev_status='Ordered' AND status='dispatched';



-- ==================================================================================
-- 3) Get the roundtrip distance from below- ALL PATTERNS
-- ==================================================================================

-- PATTERN A -- SUM DISTANCE
DROP TABLE IF EXISTS distance; CREATE TABLE distance (from_city VARCHAR(10), to_city VARCHAR(10), dist INT); INSERT INTO distance VALUES ('SEA','SF',300),('CHI','SEA',2000),('SF','SEA',300),('SEA','CHI',2000),('SEA','LND',500),('LND','SEA',500),('LND','CHI',1000),('CHI','NDL',180);
select * from distance;

-- +-----------+---------+------+
-- | from_city | to_city | dist |
-- +-----------+---------+------+
-- | SEA       | SF      |  300 |
-- | CHI       | SEA     | 2000 |
-- | SF        | SEA     |  300 |
-- | SEA       | CHI     | 2000 |
-- | SEA       | LND     |  500 |
-- | LND       | SEA     |  500 |
-- | LND       | CHI     | 1000 |
-- | CHI       | NDL     |  180 |
-- +-----------+---------+------+


select  a.from_city,a.to_city, a.dist+b.dist as total from  distance a join distance b  on a.from_city=b.to_city and a.to_city=b.from_city where  a.from_city<a.to_city;

-- PATTERN B - From a Travel history table containing User Id, City and Travel Date, 
-- identify the source and destination city of each journey?

DROP TABLE IF EXISTS travel_history; CREATE TABLE travel_history (user_id INT, city VARCHAR(50), travel_date DATE); INSERT INTO travel_history (user_id, city, travel_date) VALUES (101,'Delhi','2024-01-01'),(101,'Mumbai','2024-01-05'),(101,'Pune','2024-01-10'),(101,'Bangalore','2024-01-15'),(102,'Chennai','2024-02-01'),(102,'Hyderabad','2024-02-04'),(102,'Kolkata','2024-02-08'),(103,'Jaipur','2024-03-01'),(103,'Ahmedabad','2024-03-05'),(104,'Goa','2024-04-01');
-- +---------+-----------+-------------+
-- | user_id | city      | travel_date |
-- +---------+-----------+-------------+
-- |     101 | Delhi     | 2024-01-01  |
-- |     101 | Mumbai    | 2024-01-05  |
-- |     101 | Pune      | 2024-01-10  |
-- |     101 | Bangalore | 2024-01-15  |
-- |     102 | Chennai   | 2024-02-01  |
-- |     102 | Hyderabad | 2024-02-04  |
-- |     102 | Kolkata   | 2024-02-08  |
-- |     103 | Jaipur    | 2024-03-01  |
-- |     103 | Ahmedabad | 2024-03-05  |
-- |     104 | Goa       | 2024-04-01  |
-- +---------+-----------+-------------+

SELECT *
FROM (
    SELECT
        user_id,
        city AS source_city,
        LEAD(city) OVER (
            PARTITION BY user_id
            ORDER BY travel_date
        ) AS destination_city,
        travel_date AS source_travel_date,
        LEAD(travel_date) OVER (
            PARTITION BY user_id
            ORDER BY travel_date
        ) AS destination_travel_date
    FROM travel_history
) t
WHERE destination_city IS NOT NULL;


-- PATTERN C--Write a sql query to find source and destination of each airway

DROP TABLE IF EXISTS flight; CREATE TABLE flight (id INT, airway VARCHAR(50), src VARCHAR(50), dest VARCHAR(50)); INSERT INTO flight (id, airway, src, dest) VALUES (1,'Indigo','India','Bhutan'),(2,'Air Asia','Aus','India'),(3,'Indigo','Bhutan','Nepal'),(4,'spice jet','SriLanka','Bhutan'),(5,'Indigo','Nepal','SriLanka'),(6,'Air Asia','India','Japan'),(7,'spice jet','Bhutan','Nepal');

-- +----+-----------+----------+----------+
-- | id | airway    | src      | dest     |
-- +----+-----------+----------+----------+
-- |  1 | Indigo    | India    | Bhutan   |
-- |  2 | Air Asia  | Aus      | India    |
-- |  3 | Indigo    | Bhutan   | Nepal    |
-- |  4 | spice jet | SriLanka | Bhutan   |
-- |  5 | Indigo    | Nepal    | SriLanka |
-- |  6 | Air Asia  | India    | Japan    |
-- |  7 | spice jet | Bhutan   | Nepal    |
-- +----+-----------+----------+----------+

WITH source AS (
    SELECT airway, src
    FROM flight a
    WHERE src NOT IN (
        SELECT dest
        FROM flight b
        WHERE a.airway = b.airway
    )
),
destination AS (
    SELECT airway, dest
    FROM flight c
    WHERE dest NOT IN (
        SELECT src
        FROM flight d
        WHERE c.airway = d.airway
    )
)
SELECT
    s.airway,
    s.src AS sources,
    d.dest AS destinations
FROM source s
JOIN destination d
ON s.airway = d.airway;


-- ==================================================================================
-- 4) Get- Manager_Id    Manager_Name Average_Salary_Under_Manager
-- ==================================================================================

DROP TABLE IF EXISTS emp; CREATE TABLE emp (Emp_Id INT, Emp_name VARCHAR(50), Salary INT, Manager_Id INT); INSERT INTO emp VALUES (1,'A',50000,9),(2,'B',75000,7),(3,'C',40000,9),(4,'D',60000,8),(5,'E',80000,9),(6,'F',45000,9),(7,'G',90000,NULL),(8,'H',55000,7),(9,'I',65000,8);
select * from emp;

SELECT e.Manager_Id, AVG(e.Salary) AS avsum FROM emp e JOIN emp m ON m.Emp_Id = e.Manager_Id GROUP BY e.Manager_Id;

-- ==================================================================================
-- 5) PureSoft Interview Question --Need to be clear
-- ==================================================================================

DROP TABLE IF EXISTS employee; CREATE TABLE employee(emp_id INT, dept_id INT, name VARCHAR(50), rating INT); INSERT INTO employee VALUES (123,10,'emp1',5),(234,10,'emp2',5),(345,10,'emp3',4),(456,NULL,'emp4',5),(567,11,'emp5',3);
DROP TABLE IF EXISTS dept; CREATE TABLE dept(dept_id INT, dept_name VARCHAR(50), updated_datetime DATE); INSERT INTO dept VALUES (10,'it','2023-07-31'),(11,'finance','2023-07-30'),(11,'invalid','2022-01-01'),(NULL,'others','2023-07-30');


select * from employee;
select * from dept;

-- DepartmentID, DepartmentName, count of Rating including null department?

SELECT e.emp_id, e.dept_id, COUNT(e.rating) AS ratings
FROM employee e
LEFT JOIN dept d 
ON COALESCE(e.dept_id,0) = COALESCE(d.dept_id,0)
WHERE e.dept_id IS NULL
GROUP BY e.emp_id, e.dept_id;

-- -- DepartmentID, DepartmentName, count of Rating including null department?

SELECT COALESCE(d.dept_id,0) AS dept_id, COALESCE(d.dept_name,'others') AS dept_name, 
COUNT(e.rating) AS rating_count FROM employee e 
LEFT JOIN (SELECT dept_id, dept_name FROM (SELECT dept_id, dept_name, updated_datetime, 
ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY updated_datetime DESC) rn FROM dept) t WHERE rn=1) d 
ON e.dept_id = d.dept_id GROUP BY COALESCE(d.dept_id,0), COALESCE(d.dept_name,'others');



SELECT COALESCE(d.dept_id,0) AS dept_id, COALESCE(d.dept_name,'others') AS dept_name, e.rating FROM employee e LEFT JOIN (SELECT dept_id, dept_name FROM (SELECT dept_id, dept_name, updated_datetime, ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY updated_datetime DESC) rn FROM dept) t WHERE rn=1) d ON e.dept_id = d.dept_id;


SELECT d.dept_id, d.dept_name, e.rating FROM employee e LEFT JOIN dept d ON e.dept_id = d.dept_id;



-- ==================================================================================
-- 6) Tech Mahindra Interview Qestions --Need to explore it>>
-- ==================================================================================


DROP TABLE IF EXISTS customer; CREATE TABLE customer (customer_id INT, customer_name VARCHAR(100), city VARCHAR(100), effective_start_date DATE, effective_end_date DATE, is_current CHAR(1)); INSERT INTO customer VALUES (101,'Abhishek Kumar','Bangalore','2018-01-01','2019-06-30','N'),(101,'Abhishek Kumar','Hyderabad','2019-07-01','2021-03-31','N'),(101,'Abhishek Kumar','Pune','2021-04-01','2023-08-31','N'),(101,'Abhishek Kumar','Chennai','2023-09-01',NULL,'Y'),(102,'Priya Sharma','Delhi','2017-05-01','2018-12-31','N'),(102,'Priya Sharma','Mumbai','2019-01-01','2020-10-31','N'),(102,'Priya Sharma','Jaipur','2020-11-01','2022-05-31','N'),(102,'Priya Sharma','Kolkata','2022-06-01',NULL,'Y'),(103,'Rohan Mehta','Lucknow','2016-03-01','2017-09-30','N'),(103,'Rohan Mehta','Patna','2017-10-01','2019-04-30','N'),(103,'Rohan Mehta','Bhopal','2019-05-01','2021-11-30','N'),(103,'Rohan Mehta','Indore','2021-12-01',NULL,'Y'),(104,'Sneha Iyer','Kochi','2015-02-01','2016-08-31','N'),(104,'Sneha Iyer','Trivandrum','2016-09-01','2018-03-31','N'),(104,'Sneha Iyer','Coimbatore','2018-04-01','2020-12-31','N'),(104,'Sneha Iyer','Madurai','2021-01-01',NULL,'Y'),(105,'Arjun Patel','Surat','2014-01-01','2015-07-31','N'),(105,'Arjun Patel','Vadodara','2015-08-01','2017-02-28','N'),(105,'Arjun Patel','Ahmedabad','2017-03-01','2019-09-30','N'),(105,'Arjun Patel','Rajkot','2019-10-01',NULL,'Y'),(106,'Kavya Reddy','Vizag','2013-06-01','2014-12-31','N'),(106,'Kavya Reddy','Vijayawada','2015-01-01','2016-07-31','N'),(106,'Kavya Reddy','Tirupati','2016-08-01','2018-02-28','N'),(106,'Kavya Reddy','Guntur','2018-03-01',NULL,'Y'),(107,'Neha Gupta','Chandigarh','2012-04-01','2013-10-31','N'),(107,'Neha Gupta','Ludhiana','2013-11-01','2015-05-31','N'),(107,'Neha Gupta','Amritsar','2015-06-01','2017-12-31','N'),(107,'Neha Gupta','Jalandhar','2018-01-01',NULL,'Y'),(108,'Vivek Nair','Trichy','2011-07-01','2013-01-31','N'),(108,'Vivek Nair','Erode','2013-02-01','2014-08-31','N'),(108,'Vivek Nair','Salem','2014-09-01','2016-03-31','N'),(108,'Vivek Nair','Hosur','2016-04-01',NULL,'Y'),(109,'Meera Joshi','Bhubaneswar','2010-05-01','2011-11-30','N'),(109,'Meera Joshi','Cuttack','2011-12-01','2013-06-30','N'),(109,'Meera Joshi','Rourkela','2013-07-01','2015-01-31','N'),(109,'Meera Joshi','Puri','2015-02-01',NULL,'Y'),(110,'Aditya Verma','Guwahati','2009-09-01','2011-03-31','N'),(110,'Aditya Verma','Shillong','2011-04-01','2012-10-31','N'),(110,'Aditya Verma','Gangtok','2012-11-01','2014-05-31','N'),(110,'Aditya Verma','Imphal','2014-06-01',NULL,'Y');

select * from customer;


-- ==================================================================================
-- 7)  Write a sql query to check and compare the previous month salary for each employee , 
-- if its higher than the current month replace the current month salary with the previous one.
-- ==================================================================================

DROP TABLE IF EXISTS salarydiff; CREATE TABLE salarydiff(emp INT, date DATE, salary INT); INSERT INTO salarydiff VALUES (1,'2022-01-01',1000),(1,'2022-02-01',2000),(1,'2022-03-01',3000),(1,'2022-04-01',1000),(2,'2022-01-01',2220),(2,'2022-02-01',3450),(2,'2022-03-01',3450);

select * from salarydiff;

with tt as (select emp, date,salary, lag(salary) over(partition by emp order by date) as previoussal from salarydiff) select emp,date
,salary, case when salary<previoussal then previoussal else salary end as updatedsalary from tt;


-- ==================================================================================
-- 8)  linkedin- Users who placed more than 20 “critical” orders every week for at least 4 weeks (≈ 1 month).
-- ==================================================================================

DROP TABLE IF EXISTS transactions1; CREATE TABLE transactions1(user_id INT, order_date DATE, order_type VARCHAR(20)); INSERT INTO transactions1 VALUES (1,'2024-01-02','critical'),(1,'2024-01-03','critical'),(1,'2024-01-09','critical'),(1,'2024-01-10','critical'),(2,'2024-01-02','critical'),(2,'2024-01-03','normal'),(2,'2024-01-09','critical'),(3,'2024-01-02','critical'),(3,'2024-01-03','critical'),(3,'2024-01-10','critical');

select * from transactions1;

SELECT 
    user_id,
    DATE_TRUNC('week', order_date) AS week,
    COUNT(*) AS cnt
FROM transactions
WHERE order_type = 'critical'
GROUP BY user_id, week
HAVING COUNT(*) > 20

SELECT user_id, YEAR(order_date), WEEK(order_date), COUNT(*) 
FROM transactions1 
WHERE order_type='critical'
GROUP BY user_id, YEAR(order_date), WEEK(order_date)
HAVING COUNT(*) > 2;



-- ==================================================================================
-- 9)  Altimetrik -Find transactions where the same user made transactions of the same amount within 10 minutes.
-- ==================================================================================

DROP TABLE IF EXISTS transactions; CREATE TABLE transactions (txn_id INT, user_id INT, txn_time TIMESTAMP, amount INT); INSERT INTO transactions VALUES (1,101,'2024-01-01 10:00',500),(2,101,'2024-01-01 10:05',500),(3,101,'2024-01-01 10:20',500),(4,102,'2024-01-01 11:00',300),(5,102,'2024-01-01 11:08',300),(6,102,'2024-01-01 11:30',400);
select * from transactions;

--   Use lag, partiton by user_id and amount
SELECT * 
FROM (
    SELECT *, 
           LAG(txn_time) OVER (PARTITION BY user_id, amount ORDER BY txn_time) AS prev_time
    FROM transactions
) t
WHERE TIMESTAMPDIFF(MINUTE, prev_time, txn_time) <= 10;

-- self join

SELECT t1.*
FROM transactions t1
JOIN transactions t2
ON t1.user_id = t2.user_id
AND t1.amount = t2.amount
AND t1.txn_id <> t2.txn_id
AND ABS(TIMESTAMPDIFF(MINUTE, t1.txn_time, t2.txn_time)) <= 10;



-- ==================================================================================
-- 10)  Altimetrik-  Find each employee’s latest salary
-- ==================================================================================
DROP TABLE IF EXISTS emp_manager; CREATE TABLE emp_manager (emp_id INT, emp_name VARCHAR(50), manager_id INT, salary INT, effective_date DATE); INSERT INTO emp_manager VALUES (1,'John',10,50000,'2024-01-01'),(1,'John',10,58000,'2024-03-01'),(2,'Mary',10,42000,'2024-01-01'),(3,'Bob',20,45000,'2024-02-01'),(3,'Bob',20,48000,'2024-04-01'),(10,'Emma',20,90000,'2024-01-01'),(10,'Emma',20,95000,'2024-05-01'),(20,'Raj',NULL,110000,'2024-01-01');
select * from emp_manager;

-- Find each employee’s latest salary ?
SELECT emp_id, emp_name, manager_id, salary, effective_date FROM ( SELECT *, ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY effective_date DESC) AS rn FROM emp_manager ) t WHERE rn = 1;

-- Find each manager’s maximum historical salary?

SELECT manager_id, MAX(salary) AS max_salary FROM emp_manager GROUP BY manager_id; -- Also give answers.
SELECT m.emp_id AS manager_id, MAX(m.salary) AS max_salary FROM emp_manager e JOIN emp_manager m ON e.manager_id = m.emp_id GROUP BY m.emp_id;

-- For every employee, check if:
-- their latest salary is greater than any historical salary of their manager.

with lastes_salary as
(SELECT emp_id, emp_name, manager_id, salary, effective_date FROM ( SELECT *, ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY effective_date DESC) AS rn FROM emp_manager ) t WHERE rn = 1),

mhsalary  as (SELECT m.emp_id AS manager_id, MAX(m.salary) AS max_salary FROM emp_manager e JOIN emp_manager m ON e.manager_id = m.emp_id GROUP BY m.emp_id
)

WITH lastes_salary AS (SELECT emp_id, emp_name, manager_id, salary, effective_date FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY effective_date DESC) AS rn FROM emp_manager) t WHERE rn = 1),
mhsalary AS (SELECT m.emp_id AS manager_id, MAX(m.salary) AS max_salary FROM emp_manager e JOIN emp_manager m ON e.manager_id = m.emp_id GROUP BY m.emp_id) 

SELECT l.emp_id, l.emp_name, l.salary AS emp_latest_salary, l.manager_id, m.max_salary AS manager_max_salary FROM lastes_salary l JOIN mhsalary m ON l.manager_id = m.manager_id WHERE l.salary > m.max_salary;



-- ==================================================================================
-- 11) Capgmeini : Write SQL to get customers who spent the most in the last month (based on order_date).
-- ==================================================================================

DROP TABLE IF EXISTS spent; CREATE TABLE spent (order_id INT, customer_id INT, order_date DATE, quantity INT, unit_price INT); INSERT INTO spent VALUES (1,101,'2026-03-05',2,500),(2,101,'2026-03-05',1,200),(3,102,'2026-03-10',3,400),(4,103,'2026-03-15',1,900),(5,104,'2026-03-20',5,300),(6,105,'2026-03-25',2,1500),(7,101,'2026-03-28',1,800),(8,102,'2026-03-18',2,600),(9,103,'2026-03-22',3,700),(10,104,'2026-03-27',1,2500),(11,106,'2026-03-12',4,500),(12,107,'2026-03-14',2,1200),(13,108,'2026-03-16',1,3000),(14,105,'2026-03-29',1,2000),(15,109,'2026-03-30',3,900);
select * from spent;

SELECT * FROM ( SELECT customer_id, SUM(quantity * unit_price) AS total_spent, DENSE_RANK() OVER (ORDER BY SUM(quantity * unit_price) DESC) rnk FROM spent WHERE order_date >= DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01') AND order_date < DATE_FORMAT(CURDATE(), '%Y-%m-01') GROUP BY customer_id ) t WHERE rnk = 1;

-- ==================================================================================
-- 12)  Top 3 customers per city
-- ==================================================================================

DROP TABLE IF EXISTS city_customer; CREATE TABLE city_customer (order_id INT, customer_id INT, city VARCHAR(50), amount INT, order_date DATE); INSERT INTO city_customer VALUES (1,101,'Delhi',500,'2026-03-01'),(2,101,'Delhi',700,'2026-03-05'),(3,102,'Delhi',1200,'2026-03-10'),(4,103,'Delhi',900,'2026-03-15'),(5,104,'Mumbai',1500,'2026-03-20'),(6,105,'Mumbai',2000,'2026-03-25'),(7,104,'Mumbai',500,'2026-03-28'),(8,106,'Bangalore',3000,'2026-03-18'),(9,107,'Bangalore',2500,'2026-03-22'),(10,106,'Bangalore',1000,'2026-03-27'),(11,108,'Delhi',600,'2026-03-29'),(12,109,'Mumbai',1800,'2026-03-30');

select * from city_customer;


-- Top 3 customers per city
WITH order_totals AS ( SELECT customer_id, city, SUM(amount) AS total_spent, COUNT(*) AS order_count, AVG(amount) AS avg_order_value FROM city_customer GROUP BY customer_id, city ), ranked AS ( SELECT *, DENSE_RANK() OVER (PARTITION BY city ORDER BY total_spent DESC) AS city_rank FROM order_totals ) SELECT customer_id, city, total_spent, order_count, avg_order_value FROM ranked WHERE city_rank <= 3;

-- “What % of city revenue comes from each customer?”

-- 

-- ==================================================================================
-- 13 ) Incedo Interview: get source and destination path-
-- ==================================================================================
 DROP TABLE IF EXISTS passenger; CREATE TABLE passenger (sn INT, name VARCHAR(10), start VARCHAR(50), end VARCHAR(50)); INSERT INTO passenger VALUES (1,'A','Chennai','Bangalore'),(1,'A','Bangalore','Pune'),(1,'A','Pune','Mumbai'),(1,'A','Mumbai','Delhi'),(2,'B','Pune','Mumbai'),(2,'B','Mumbai','Bangalore');
select * from passenger;

--  Get Source and destination --


select * from passenger;

with starttab as (
select sn,name,start from passenger p where start not in (select end from passenger where p.sn=sn )),
endtab as (select sn,name,end from passenger n where end not in (select start from passenger where n.sn=sn ))

select s.sn,s.name,s.start as Source ,e.end as  Destination  from starttab s join endtab e on e.sn=s.sn;

-- ==================================================================================
-- 14)  get source and destination path- (same type) (AAA)
-- ==================================================================================
DROP TABLE IF EXISTS flight; CREATE TABLE flight (id INT, airway VARCHAR(50), src VARCHAR(50), dest VARCHAR(50)); INSERT INTO flight VALUES (1,'Indigo','India','Bhutan'),(2,'Air Asia','Aus','India'),(3,'Indigo','Bhutan','Nepal'),(4,'spice jet','SriLanka','Bhutan'),(5,'Indigo','Nepal','SriLanka'),(6,'Air Asia','India','Japan'),(7,'spice jet','Bhutan','Nepal');
select * from flight;

-- Make sure what you are using as KEY, here Airways.
with srctab as (
select id,airway,src from flight f1 where src not in ( select dest from flight f2 where f1.airway=f2.airway )),

desttab as (select id,airway,dest from flight f1 where dest not in ( select src from flight f2 where f1.airway=f2.airway ))

select  s.airway,s.src,d.dest  from srctab s join  desttab d on s.airway=d.airway;



-- ==================================================================================
-- 15)  PCW--

-- 1) For each employee, calculate total sales and average monthly sales.
-- 2) Rank employees within each department based on total sales.
-- 3) Compute a running total of sales per department, ordered by total sales.
-- 4) Perform a month-over-month comparison:
--    - Previous month's sales
--    - Difference from current month
-- 5) Show only those departments whose total sales exceed 100000 and classify employees as:
--    - Top Performer → total sales > department average
--    - Below Average
-- ==================================================================================

DROP TABLE IF EXISTS emp_dep; CREATE TABLE emp_dep (EmployeeID INT, EmployeeName VARCHAR(50), Department VARCHAR(50), ManagerID INT, HireDate DATE, MonthlySalary INT, SalesAmount INT, Month DATE); INSERT INTO emp_dep VALUES (1,'Alice','Sales',101,'2020-01-01',90000,150000,'2025-01-01'),(1,'Alice','Sales',101,'2020-01-01',90000,200000,'2025-02-01'),(2,'Bob','Sales',101,'2021-03-15',85000,100000,'2025-01-01'),(2,'Bob','Sales',101,'2021-03-15',85000,120000,'2025-02-01'),(3,'Carol','HR',102,'2019-07-10',95000,0,'2025-01-01'),(4,'David','HR',102,'2020-06-25',87000,0,'2025-02-01'),(5,'Evan','IT',103,'2022-05-05',80000,60000,'2025-01-01'),(5,'Evan','IT',103,'2022-05-05',80000,75000,'2025-02-01');
select * from emp_dep;

-- 1) For each employee, calculate total sales and average monthly sales.
select EmployeeID,sum(SalesAmount) as total_Sale, avg(SalesAmount) as avgsale from emp_dep group by EmployeeID;

-- 2) Rank employees within each department based on total sales.

SELECT EmployeeID, EmployeeName, Department, SUM(SalesAmount) AS total_sales, 
RANK() OVER (PARTITION BY Department ORDER BY SUM(SalesAmount) DESC) AS dept_rank 
FROM emp_dep GROUP BY EmployeeID, EmployeeName, Department;

-- 4) Perform a month-over-month comparison:
--    - Previous month's sales
--    - Difference from current month

SELECT EmployeeID, EmployeeName, Department, Month, SalesAmount,
 LAG(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY Month) AS prev_month_sales,
 SalesAmount - LAG(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY Month) AS sales_diff FROM emp_dep;

-- 5) Show only those departments whose total sales exceed 100000 and classify employees as:
--    - Top Performer → total sales > department average
--    - Below Average

WITH emp_total AS (SELECT EmployeeID, EmployeeName, Department, SUM(SalesAmount) AS emp_total_sales FROM emp_dep GROUP BY EmployeeID, EmployeeName, Department),
dept_total AS (SELECT Department, SUM(SalesAmount) AS dept_total_sales FROM emp_dep GROUP BY Department),
dept_avg AS (SELECT Department, AVG(emp_total_sales) AS dept_avg_sales FROM emp_total GROUP BY Department)
SELECT e.EmployeeID, e.EmployeeName, e.Department, e.emp_total_sales, d.dept_total_sales,
CASE WHEN e.emp_total_sales > a.dept_avg_sales THEN 'Top Performer' ELSE 'Below Average' END AS performance_category
FROM emp_total e
JOIN dept_total d ON e.Department = d.Department
JOIN dept_avg a ON e.Department = a.Department
WHERE d.dept_total_sales > 100000;




-- ==================================================================================
-- 16) Delloite - Show duplicate values
-- ==================================================================================
use all_parts;
DROP TABLE IF EXISTS users; CREATE TABLE users (id INT, email VARCHAR(100)); INSERT INTO users VALUES (1,'a@test.com'),(2,'b@test.com'),(3,'a@test.com'),(4,'c@test.com'),(5,'b@test.com');

select * from users;













-- ==================================================================================
-- 17) Delloite: write a sql query to get the daily count of active users(logged in at  least once)
-- ==================================================================================
DROP TABLE IF EXISTS user_logins; CREATE TABLE user_logins (user_id INT, login_timestamp TIMESTAMP); INSERT INTO user_logins VALUES (1,'2025-05-01 08:00:00'),(1,'2025-05-01 10:00:00'),(2,'2025-05-01 09:00:00'),(2,'2025-05-01 11:00:00'),(3,'2025-05-01 12:00:00'),(3,'2025-05-02 09:00:00'),(1,'2025-05-02 10:00:00'),(2,'2025-05-02 11:00:00'),(4,'2025-05-02 12:00:00'),(4,'2025-05-02 13:00:00');

-- Count of Active users?
select * from user_logins;

select login_timestamp ,count( user_id) as Active_user from user_logins group by login_timestamp;

SELECT DATE(login_timestamp) AS login_date, COUNT(DISTINCT user_id) AS active_users
FROM user_logins
GROUP BY DATE(login_timestamp)
ORDER BY login_date;


-- Total login count per user per day hen identify the users who logged in more than 10 times i a day

SELECT user_id, DATE(login_timestamp) AS login_date, COUNT(*) AS total_logins
FROM user_logins
GROUP BY user_id, DATE(login_timestamp)
HAVING COUNT(*) > 10
ORDER BY user_id, login_date;

-- using row_rumber()

with cte as(
select *, row_number() over(partition by date(login_timestamp) order by user_id  ) as rn from user_logins)

select date(login_timestamp) as loginDate, count(user_id) as user_count from cte group by date(login_timestamp);




-- ==================================================================================
-- 18) compute median salary per department (bonus interview question)
-- ==================================================================================

DROP TABLE IF EXISTS employees4; CREATE TABLE employees4 (id INT, department VARCHAR(50), salary INT); INSERT INTO employees4 VALUES (1,'Engineering',85000),(2,'Engineering',90000),(3,'Engineering',95000),(4,'Marketing',60000),(5,'Marketing',65000),(6,'Marketing',70000);
select * from employees4;
WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary) AS rn,
           COUNT(*) OVER (PARTITION BY department) AS cnt
    FROM employees4
)
SELECT id, department, salary
FROM cte
WHERE rn = (cnt + 1) / 2;



-- ==================================================================================
-- 19) Write a query to find all pairs of products that were ordered together at least once.
-- ==================================================================================
DROP TABLE IF EXISTS order_items; CREATE TABLE order_items (order_id INT, product_id VARCHAR(10)); INSERT INTO order_items VALUES (1,'A'),(1,'B'),(1,'C'),(2,'A'),(2,'B'),(3,'B'),(3,'C'),(4,'A');
select * from order_items;

SELECT DISTINCT 
       o1.product_id AS product_1,
       o2.product_id AS product_2
FROM order_items o1
JOIN order_items o2
  ON o1.order_id = o2.order_id
 AND o1.product_id < o2.product_id;
 
 -- Bonus: Count how many times pairs occurred
 
 SELECT 
    o1.product_id AS product_1,
    o2.product_id AS product_2,
    COUNT(*) AS pair_count
FROM order_items o1
JOIN order_items o2
  ON o1.order_id = o2.order_id
 AND o1.product_id < o2.product_id
GROUP BY o1.product_id, o2.product_id;


-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================







-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================









-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================









-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================










-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================











-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================









-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================








-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================








-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================








-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================







-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================










-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================





-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




-- ==================================================================================
-- 
-- ==================================================================================






-- ==================================================================================
-- 
-- ==================================================================================




