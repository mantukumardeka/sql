
use interview;
show tables;

-- =================================================================
-- Pure Software : Expected output:

-- Team A, Team B
-- ------------------
-- India, Sri Lanka
-- India, Australia
-- Sri Lanka, Australia
-- ===================================================================
DROP TABLE IF EXISTS Country; CREATE TABLE Country (country VARCHAR(50)); INSERT INTO Country VALUES ('India'),('Sri Lanka'),('Australia');
select * from Country;

select concat(a.Country ,"-->", b.Country  )  as Teams from Country a join Country b on a.Country<b.Country;



-- =================================================================
-- Pure Software : Find customers whose consecutive transactions have a gap of more than 2 days.”
-- ===================================================================

DROP TABLE IF EXISTS customer; CREATE TABLE customer (customer_id INT, txn_date VARCHAR(10), txn_amount INT); INSERT INTO customer VALUES (429,'21-01-2020',2311),(155,'10-01-2020',712),(398,'01-01-2020',196),(429,'14-01-2021',5634),(185,'29-01-2021',626),(155,'13-01-2022',995),(429,'20-01-2022',4851);

select * from customer;



-- using STR_TO_DATE

WITH cte AS (SELECT customer_id, STR_TO_DATE(txn_date,'%d-%m-%Y') AS txn_date, DATEDIFF(STR_TO_DATE(txn_date,'%d-%m-%Y'), LAG(STR_TO_DATE(txn_date,'%d-%m-%Y')) OVER (PARTITION BY customer_id ORDER BY STR_TO_DATE(txn_date,'%d-%m-%Y'))) AS diff FROM customer) SELECT DISTINCT customer_id FROM cte WHERE diff > 2;


WITH cte AS (
  SELECT customer_id, txn_date,
         txn_date - LAG(txn_date) OVER (PARTITION BY customer_id) AS diff
  FROM customer
)
SELECT customer_id 
FROM cte 
WHERE diff > 2;

-- =================================================================
-- Pure Software : ID, Deptname, and count of rating:
-- ===================================================================
DROP TABLE IF EXISTS employee; CREATE TABLE employee (emp_id INT, dept_id INT, name VARCHAR(50), rating INT); INSERT INTO employee VALUES (123,10,'emp1',5),(234,10,'emp2',5),(345,10,'emp3',4),(456,NULL,'emp4',5),(567,11,'emp5',3); 
DROP TABLE IF EXISTS dept; CREATE TABLE dept (dept_id INT, dept_name VARCHAR(50), updated_datetime VARCHAR(10)); INSERT INTO dept VALUES (10,'it','31-07-2023'),(11,'finance','30-07-2023'),(11,'invalid','01-01-2022'),(NULL,'others','30-07-2023');
select * from employee;
select * from dept;

select e.emp_id,d.dept_name, count(e.rating) from employee e join dept d on e.dept_id=d.dept_id 
group by e.emp_id,d.dept_name ;







-- =================================================================
-- Pure Software : Expected output:
-- ===================================================================










-- =================================================================
-- Pure Software : Expected output:
-- ===================================================================












-- =================================================================
-- Pure Software : Expected output:
-- ===================================================================










-- =================================================================
-- Pure Software : Expected output:
-- ===================================================================