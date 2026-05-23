
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


-- ========PySpark==========

# Define Window
-- w = Window.partitionBy("customer_id").orderBy("txn_date")

-- # Calculate previous transaction date and difference
-- result = df.withColumn(
--     "prev_txn_date",
--     lag("txn_date").over(w)
-- ).withColumn(
--     "diff",
--     datediff("txn_date", "prev_txn_date")
-- )
-- # Filter customers having gap > 2 days
-- final_df = result.filter("diff > 2")
-- # Show Result
-- final_df.show()

-- ==============================

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
-- UST Global: - Find the customer who ordered 4th highest cumulative order values ?
-- ===================================================================
use interview;
DROP TABLE IF EXISTS orders40; CREATE TABLE orders40 ( order_id INT, customer_id INT, customer_name VARCHAR(50), order_date DATE, amount DECIMAL(10,2) ); INSERT INTO orders40 VALUES (1,101,'Amit','2024-01-01',500), (2,101,'Amit','2024-01-05',700), (3,102,'Rahul','2024-01-02',1200), (4,102,'Rahul','2024-01-06',800), (5,103,'Neha','2024-01-03',1500), (6,104,'Priya','2024-01-04',600), (7,104,'Priya','2024-01-08',400), (8,105,'Karan','2024-01-05',2000), (9,106,'Sneha','2024-01-06',900), (10,107,'Rohit','2024-01-07',1300);
select * from orders40;

-- +----------+-------------+---------------+------------+---------+
-- | order_id | customer_id | customer_name | order_date |  amount |
-- +----------+-------------+---------------+------------+---------+
-- |        1 |         101 | Amit          | 2024-01-01 |  500.00 |
-- |        2 |         101 | Amit          | 2024-01-05 |  700.00 |
-- |        3 |         102 | Rahul         | 2024-01-02 | 1200.00 |
-- |        4 |         102 | Rahul         | 2024-01-06 |  800.00 |
-- |        5 |         103 | Neha          | 2024-01-03 | 1500.00 |
-- |        6 |         104 | Priya         | 2024-01-04 |  600.00 |
-- |        7 |         104 | Priya         | 2024-01-08 |  400.00 |
-- |        8 |         105 | Karan         | 2024-01-05 | 2000.00 |
-- |        9 |         106 | Sneha         | 2024-01-06 |  900.00 |
-- |       10 |         107 | Rohit         | 2024-01-07 | 1300.00 |
-- +----------+-------------+---------------+------------+---------+

-- Find the customer who ordered 4th highest cumulative order values ?

with cte as( select customer_id, sum(amount) as total, dense_rank() over(order by sum(amount)  desc) as rnk   from orders40 group by customer_id)

select * from cte where rnk=4;

-- Find customer with 2nd highest TOTAL purchase amount?


-- +-------------+-------------+---------------+---------+
-- | purchase_id | customer_id | purchase_date |  amount |
-- +-------------+-------------+---------------+---------+
-- |           1 |         101 | 2024-01-01    |  500.00 |
-- |           2 |         101 | 2024-01-03    |  700.00 |
-- |           3 |         102 | 2024-01-02    | 1500.00 |
-- |           4 |         102 | 2024-01-05    |  500.00 |
-- |           5 |         103 | 2024-01-04    | 1200.00 |
-- |           6 |         104 | 2024-01-06    |  900.00 |
-- |           7 |         105 | 2024-01-07    | 2000.00 |
-- |           8 |         106 | 2024-01-08    |  800.00 |
-- |           9 |         107 | 2024-01-09    | 1100.00 |
-- |          10 |         108 | 2024-01-10    |  600.00 |
-- +-------------+-------------+---------------+---------+



WITH CustomerSpending AS (
    SELECT 
        customer_id, 
        SUM(amount) as total_spent
    FROM purchases
    GROUP BY customer_id
)
SELECT customer_id, total_spent
FROM (
    SELECT 
        customer_id, 
        total_spent,
        DENSE_RANK() OVER(ORDER BY total_spent DESC) as rnk
    FROM CustomerSpending
) ranked_spending
WHERE rnk = 2;

-- Find departments ranked by total salary ?  -- Group By + Dense_rank()
-- Top Selling Product Per Category  -- Group By + Dense_rank()

--




-- =================================================================
-- Deloitte- write a sql query to get the daily count of active users(logged in at  least once)
-- ===================================================================
DROP TABLE IF EXISTS login40; CREATE TABLE login40 ( login_id INT, user_id INT, login_date DATE, login_time TIME ); INSERT INTO login40 VALUES (1,101,'2024-01-01','09:00:00'), (2,102,'2024-01-01','10:00:00'), (3,101,'2024-01-01','12:00:00'), (4,103,'2024-01-02','08:30:00'), (5,104,'2024-01-02','09:15:00'), (6,101,'2024-01-02','11:00:00'), (7,102,'2024-01-03','10:20:00'), (8,105,'2024-01-03','01:00:00'), (9,105,'2024-01-03','05:00:00'), (10,106,'2024-01-04','07:45:00');


-- +----------+---------+------------+------------+
-- | login_id | user_id | login_date | login_time |
-- +----------+---------+------------+------------+
-- |        1 |     101 | 2024-01-01 | 09:00:00   |
-- |        2 |     102 | 2024-01-01 | 10:00:00   |
-- |        3 |     101 | 2024-01-01 | 12:00:00   |
-- |        4 |     103 | 2024-01-02 | 08:30:00   |
-- |        5 |     104 | 2024-01-02 | 09:15:00   |
-- |        6 |     101 | 2024-01-02 | 11:00:00   |
-- |        7 |     102 | 2024-01-03 | 10:20:00   |
-- |        8 |     105 | 2024-01-03 | 01:00:00   |
-- |        9 |     105 | 2024-01-03 | 05:00:00   |
-- |       10 |     106 | 2024-01-04 | 07:45:00   |
-- +----------+---------+------------+------------+


SELECT
    DATE(login_date) AS login_date,
    COUNT(DISTINCT user_id) AS active_users

FROM login40
GROUP BY DATE(login_date)
ORDER BY login_date;

-- Total login count per user per day  then identify the users who logged in more than 10 times i a day


SELECT
    user_id,
    DATE(login_date) AS login_date,
    COUNT(*) AS total_logins
FROM login40
GROUP BY
    user_id,
    DATE(login_date)
HAVING COUNT(*) > 10
ORDER BY
    total_logins DESC;




-- =================================================================
-- Incedo - get start and destinataion
-- ===================================================================

DROP TABLE IF EXISTS passengers40; CREATE TABLE passengers40 ( sn INT, name VARCHAR(50), start_city VARCHAR(50), end_city VARCHAR(50) ); INSERT INTO passengers40 VALUES (1,'A','Chennai','Bangalore'), (1,'A','Bangalore','Pune'), (1,'A','Pune','Mumbai'), (1,'A','Mumbai','Delhi'), (2,'B','Pune','Mumbai'), (2,'B','Mumbai','Bangalore');

-- +----+------+------------+-----------+
-- | sn | name | start_city | end_city  |
-- +----+------+------------+-----------+
-- |  1 | A    | Chennai    | Bangalore |
-- |  1 | A    | Bangalore  | Pune      |
-- |  1 | A    | Pune       | Mumbai    |
-- |  1 | A    | Mumbai     | Delhi     |
-- |  2 | B    | Pune       | Mumbai    |
-- |  2 | B    | Mumbai     | Bangalore |
-- +----+------+------------+-----------+

WITH startcity AS (
    SELECT *
    FROM passengers40 a
    WHERE start_city NOT IN (
        SELECT end_city
        FROM passengers40 b
        WHERE a.sn = b.sn
    )
),
endcity AS (
    SELECT *
    FROM passengers40 c
    WHERE end_city NOT IN (
        SELECT start_city
        FROM passengers40 d
        WHERE c.sn = d.sn
    )
)
SELECT 
    e.sn,
    e.name,
    e.start_city,
    f.end_city
FROM startcity e
JOIN endcity f
ON e.sn = f.sn
AND e.name = f.name;




-- ===========================================================================================
-- Zensar- Need to get masking email and mobile, also get name from email where status Active
-- ==========================================================================================

-- +--------+----------------+------------------------+----------+
-- | emp_id | phone_number   | email                  | status   |
-- +--------+----------------+------------------------+----------+
-- |      1 | +91 9876543210 | john.doe@gmail.com     | Active   |
-- |      2 | +1 9123456780  | jane.smith@gmail.com   | Inactive |
-- |      3 | +44 9988776655 | mike.brown@gmail.com   | Active   |
-- |      4 | +91 9012345678 | emily.white@gmail.com  | Inactive |
-- |      5 | +61 9090909090 | robert.black@gmail.com | Active   |
-- |      6 | +1 8887776665  | sara.green@gmail.com   | Active   |
-- +--------+----------------+------------------------+----------+

SELECT 
    emp_id,

    email,

    CONCAT(
        UPPER(LEFT(SUBSTRING_INDEX(SUBSTRING_INDEX(email,'@',1),'.',1),1)),
        LOWER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(email,'@',1),'.',1),2)),
        ' ',
        UPPER(LEFT(SUBSTRING_INDEX(SUBSTRING_INDEX(email,'@',1),'.',-1),1)),
        LOWER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(email,'@',1),'.',-1),2))
    ) AS full_name,

    CONCAT(
        LEFT(SUBSTRING_INDEX(email,'@',1),2),
        REPEAT('*', LENGTH(SUBSTRING_INDEX(email,'@',1)) - 4),
        RIGHT(SUBSTRING_INDEX(email,'@',1),2),
        '@',
        SUBSTRING_INDEX(email,'@',-1)
    ) AS masked_email,

    phone_number,

    CONCAT(
        LEFT(phone_number,3),
        REPEAT('*', LENGTH(phone_number)-5),
        RIGHT(phone_number,2)
    ) AS masked_mobile,

    status

FROM emp_num40;








-- ===========================================================================================
--
-- ==========================================================================================












-- ===========================================================================================
--
-- ==========================================================================================












-- ===========================================================================================
--
-- ==========================================================================================















-- ===========================================================================================
--
-- ==========================================================================================















-- ===========================================================================================
--
-- ==========================================================================================













-- ===========================================================================================
--
-- ==========================================================================================












-- ===========================================================================================
--
-- ==========================================================================================












-- ===========================================================================================
--
-- ==========================================================================================