
use interview;
show tables;

-- =================================================================
-- 1)-- Pure Software : Expected output:

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
-- 2) Pure Software : Find customers whose consecutive transactions have a gap of more than 2 days.”
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
-- 3) Pure Software : ID, Deptname, and count of rating:
-- ===================================================================
DROP TABLE IF EXISTS employee; CREATE TABLE employee (emp_id INT, dept_id INT, name VARCHAR(50), rating INT); INSERT INTO employee VALUES (123,10,'emp1',5),(234,10,'emp2',5),(345,10,'emp3',4),(456,NULL,'emp4',5),(567,11,'emp5',3); 
DROP TABLE IF EXISTS dept; CREATE TABLE dept (dept_id INT, dept_name VARCHAR(50), updated_datetime VARCHAR(10)); INSERT INTO dept VALUES (10,'it','31-07-2023'),(11,'finance','30-07-2023'),(11,'invalid','01-01-2022'),(NULL,'others','30-07-2023');
select * from employee;
select * from dept;

select e.emp_id,d.dept_name, count(e.rating) from employee e join dept d on e.dept_id=d.dept_id 
group by e.emp_id,d.dept_name ;


-- =================================================================
-- 4) UST Global: - Find the customer who ordered 4th highest cumulative order values ?
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
-- 5) Deloitte- write a sql query to get the daily count of active users(logged in at  least once)
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
-- 6) Incedo - get start and destinataion
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
-- 7) Zensar- Need to get masking email and mobile, also get name from email where status Active
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
-- 8)  LTM- get thame emp which dep and salary is same
-- ==========================================================================================
DROP TABLE IF EXISTS dep_sal; CREATE TABLE dep_sal ( name VARCHAR(50), dept VARCHAR(50), sal INT ); INSERT INTO dep_sal VALUES ('Mike','HR',10000), ('Brand','Dev',12000), ('Peter','Dev',15000), ('Brett','HR',10000), ('Rosen','Dev',12000), ('Tyler','HR',5000);

-- +-------+------+-------+
-- | name  | dept |   sal |
-- +-------+------+-------+
-- | Mike  | HR   | 10000 |
-- | Brand | Dev  | 12000 |
-- | Peter | Dev  | 15000 |
-- | Brett | HR   | 10000 |
-- | Rosen | Dev  | 12000 |
-- | Tyler | HR   |  5000 |
-- +-------+------+-------+

SELECT *
FROM dep_sal
WHERE (dept, sal) IN (
    SELECT dept, sal
    FROM dep_sal
    GROUP BY dept, sal
    HAVING COUNT(*) > 1
);

-- Department Wise Salary Difference

SELECT 
    dept,
    MAX(sal) - MIN(sal) AS salary_gap
FROM dep_sal
GROUP BY dept;

-- Highest Paid Employee Per Department


WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY dept
               ORDER BY sal DESC
           ) rn
    FROM dep_sal
)
SELECT *
FROM cte
WHERE rn = 1;


-- Employees Having Same Salary in Same Department

SELECT dept, sal, COUNT(*) cnt
FROM dep_sal
GROUP BY dept, sal
HAVING COUNT(*) > 1;


-- ===========================================================================================
-- 9) Altrimetric- 
-- Find transactions where the same user made transactions of the same amount within 10 minutes.
-- ==========================================================================================
DROP TABLE IF EXISTS transactions40; CREATE TABLE transactions40 ( txn_id INT, user_id INT, txn_time DATETIME, amount INT ); INSERT INTO transactions40 VALUES (1,101,'2024-01-01 10:00:00',500), (2,101,'2024-01-01 10:05:00',500), (3,101,'2024-01-01 10:20:00',500), (4,102,'2024-01-01 11:00:00',300), (5,102,'2024-01-01 11:08:00',300), (6,102,'2024-01-01 11:30:00',400);

-- +--------+---------+---------------------+--------+
-- | txn_id | user_id | txn_time            | amount |
-- +--------+---------+---------------------+--------+
-- |      1 |     101 | 2024-01-01 10:00:00 |    500 |
-- |      2 |     101 | 2024-01-01 10:05:00 |    500 |
-- |      3 |     101 | 2024-01-01 10:20:00 |    500 |
-- |      4 |     102 | 2024-01-01 11:00:00 |    300 |
-- |      5 |     102 | 2024-01-01 11:08:00 |    300 |
-- |      6 |     102 | 2024-01-01 11:30:00 |    400 |
-- +--------+---------+---------------------+--------+


-- Find transactions where the same user made transactions of the same amount within 10 minutes

WITH cte AS (
    SELECT 
        txn_id,
        user_id,
        txn_time,
        amount,
        LAG(txn_time) OVER(
            PARTITION BY user_id, amount
            ORDER BY txn_time
        ) AS prev_txn_time
    FROM transactions40
)
SELECT *
FROM cte
WHERE TIMESTAMPDIFF(
          MINUTE,
          prev_txn_time,
          txn_time
      ) <= 10;

-- --- Using selft join--


SELECT 
    a.txn_id,
    a.user_id,
    a.txn_time,
    a.amount,
    b.txn_id AS matched_txn,
    b.txn_time AS matched_time
FROM transactions40 a
JOIN transactions40 b
ON a.user_id = b.user_id
AND a.amount = b.amount
AND a.txn_id < b.txn_id
AND TIMESTAMPDIFF(
        MINUTE,
        a.txn_time,
        b.txn_time
    ) <= 10;

-- ---PySpark-----
-- df = df.withColumn("txn_time",to_timestamp("txn_time")
-- window_spec = Window.partitionBy( "user_id","amount" ).orderBy("txn_time")
-- result = df.withColumn( "prev_time",lag("txn_time").over(window_spec) ).withColumn(
--     "time_diff",
--     (col("txn_time").cast("long") - col("prev_time").cast("long")) / 60
-- ).filter(
--     col("time_diff") <= 10
-- )
-- result.show(truncate=False)

-- 
-- ===========================================================================================
-- --10) Altrimetric- 
-- ==========================================================================================

-- +--------+----------+------------+--------+----------------+
-- | emp_id | emp_name | manager_id | salary | effective_date |
-- +--------+----------+------------+--------+----------------+
-- |      1 | John     |         10 |  50000 | 2024-01-01     |
-- |      1 | John     |         10 |  58000 | 2024-03-01     |
-- |      2 | Mary     |         10 |  42000 | 2024-01-01     |
-- |      3 | Bob      |         20 |  45000 | 2024-02-01     |
-- |      3 | Bob      |         20 |  48000 | 2024-04-01     |
-- |     10 | Emma     |         20 |  90000 | 2024-01-01     |
-- |     10 | Emma     |         20 |  95000 | 2024-05-01     |
-- |     20 | Raj      |     <null> | 110000 | 2024-01-01     |
-- +--------+----------+------------+--------+----------------+


-- Find each employee’s latest salary

WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY emp_id
               ORDER BY effective_date DESC
           ) AS rnk
    FROM emp_man
)
SELECT 
    emp_id,
    emp_name,
    salary,
    effective_date
FROM cte
WHERE rnk = 1;




-- Find each manager’s maximum historical salary
-- If You Want Only Employees Who Are Actually Managers

SELECT 
    e.emp_id AS manager_id,
    e.emp_name AS manager_name,
    MAX(e.salary) AS max_historical_salary
FROM emp_man e
WHERE e.emp_id IN (
    SELECT DISTINCT manager_id
    FROM emp_man
    WHERE manager_id IS NOT NULL
)
GROUP BY e.emp_id, e.emp_name;

-- or using self join

-- | Condition                              | Meaning            |
-- | -------------------------------------- | ------------------ |
-- | `employee.manager_id = manager.emp_id` | Find manager ,manager salary comparison      |
-- | `employee.emp_id = manager.manager_id`   | Find managers list ,who is exactly manager|

SELECT 
    e.emp_id,
    e.emp_name,
    MAX(e.salary) AS max_salary
FROM emp_man e
JOIN emp_man m
ON e.emp_id = m.manager_id
GROUP BY e.emp_id, e.emp_name;




-- For every employee, check if:
-- their latest salary is greater than any historical salary of their manager.

WITH latest_salary AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY emp_id
               ORDER BY effective_date DESC
           ) AS rnk
    FROM emp_man
),

manager_salary AS (
    SELECT 
        e.emp_id,
        e.emp_name,
        MAX(e.salary) AS max_salary
    FROM emp_man e
    JOIN emp_man m
    ON e.emp_id = m.manager_id
    GROUP BY e.emp_id, e.emp_name
)

SELECT 
    l.emp_id,
    l.emp_name,
    l.salary AS latest_salary,

    COALESCE(ms.emp_name, 'NO MANAGER') AS manager_name,

    COALESCE(ms.max_salary, 0) AS manager_max_salary,

    CASE 
        WHEN ms.max_salary IS NULL
        THEN 'TOP MANAGER'

        WHEN l.salary > ms.max_salary
        THEN 'YES'

        ELSE 'NO'
    END AS higher_than_manager

FROM latest_salary l

LEFT JOIN manager_salary ms
ON l.manager_id = ms.emp_id

WHERE l.rnk = 1;



-- ===========================================================================================
-- 11) Taven- 
-- ==========================================================================================
DROP TABLE IF EXISTS sensor_readings; CREATE TABLE sensor_readings ( sensor_id INT, reading_time DATETIME, temperature DECIMAL(5,2) ); INSERT INTO sensor_readings VALUES (1,'2024-01-01 10:00:00',25.5), (1,'2024-01-01 10:03:00',25.7), (1,'2024-01-01 10:12:00',26.0), (1,'2024-01-01 10:14:00',26.1), (2,'2024-01-01 11:00:00',30.0), (2,'2024-01-01 11:04:00',30.1), (2,'2024-01-01 11:20:00',31.0);

-- +-----------+---------------------+-------------+
-- | sensor_id | reading_time        | temperature |
-- +-----------+---------------------+-------------+
-- |         1 | 2024-01-01 10:00:00 |       25.50 |
-- |         1 | 2024-01-01 10:03:00 |       25.70 |
-- |         1 | 2024-01-01 10:12:00 |       26.00 |
-- |         1 | 2024-01-01 10:14:00 |       26.10 |
-- |         2 | 2024-01-01 11:00:00 |       30.00 |
-- |         2 | 2024-01-01 11:04:00 |       30.10 |
-- |         2 | 2024-01-01 11:20:00 |       31.00 |
-- +-----------+---------------------+-------------+

-- The Scenario: You have a table sensor_readings with (sensor_id, timestamp, temperature). Sometimes a sensor goes offline and stops sending data.
-- The Task: Write a query to find all "downtime" periods for each sensor. A downtime period starts when the gap between two consecutive readings for the same sensor is greater than 5 minutes.


WITH cte AS (
    SELECT 
        sensor_id,
        reading_time,

        LAG(reading_time) OVER(
            PARTITION BY sensor_id
            ORDER BY reading_time
        ) AS prev_reading_time

    FROM sensor_readings
)

SELECT 
    sensor_id,

    prev_reading_time AS downtime_start,

    reading_time AS downtime_end,

    TIMESTAMPDIFF(
        MINUTE,
        prev_reading_time,
        reading_time
    ) AS downtime_minutes

FROM cte

WHERE TIMESTAMPDIFF(
          MINUTE,
          prev_reading_time,
          reading_time
      ) > 5;







-- ===========================================================================================
-- 12) Accenture
-- ==========================================================================================
use interview;
DROP TABLE IF EXISTS sales40; CREATE TABLE sales40 ( product_id VARCHAR(10), sale_date DATE, sales_amount INT ); INSERT INTO sales40 VALUES ('P1','2025-03-01',100), ('P2','2025-03-01',200), ('P1','2025-03-02',300), ('P2','2025-03-02',400), ('P1','2025-03-03',500);

select * from sales40;

-- +------------+------------+--------------+
-- | product_id | sale_date  | sales_amount |
-- +------------+------------+--------------+
-- | P1         | 2025-03-01 |          100 |
-- | P2         | 2025-03-01 |          200 |
-- | P1         | 2025-03-02 |          300 |
-- | P2         | 2025-03-02 |          400 |
-- | P1         | 2025-03-03 |          500 |
-- +------------+------------+--------------+

-- #Sample Output: 
-- product_id month total_sal ranks 
-- P1 2025-03-01 900 1
-- P2 2025-03-01 600 2

select product_id, month(sale_date),sum(sales_amount ) as total_sal ,dense_rank() over(order by sum(sales_amount ) desc) as ranks  from sales40 group by product_id, month(sale_date) ;



-- ===========================================================================================
-- 13) CapGemini -- missing transactions 
-- ==========================================================================================
DROP TABLE IF EXISTS account_txn40; CREATE TABLE account_txn40 ( account_id INT, t_date DATE ); INSERT INTO account_txn40 VALUES (1,'2024-11-01'), (1,'2024-11-02'), (1,'2024-11-05'), (2,'2024-11-01'), (2,'2024-11-03');

-- +------------+------------+
-- | account_id | t_date     |
-- +------------+------------+
-- |          1 | 2024-11-01 |
-- |          1 | 2024-11-02 |
-- |          1 | 2024-11-05 |
-- |          2 | 2024-11-01 |
-- |          2 | 2024-11-03 |
-- +------------+------------+

-- extract missing transactions 

WITH RECURSIVE dates AS (

    SELECT MIN(t_date) AS dt
    FROM account_txn40

    UNION ALL

    SELECT DATE_ADD(dt, INTERVAL 1 DAY)

    FROM dates

    WHERE dt < (
        SELECT MAX(t_date)
        FROM account_txn40
    )
),

accounts AS (

    SELECT DISTINCT account_id
    FROM account_txn40
),

all_combinations AS (

    SELECT
        a.account_id,
        d.dt

    FROM accounts a

    CROSS JOIN dates d
)

SELECT
    c.account_id,
    c.dt AS missing_date

FROM all_combinations c

LEFT JOIN account_txn40 t
ON c.account_id = t.account_id
AND c.dt = t.t_date

WHERE t.t_date IS NULL

ORDER BY c.account_id, c.dt;


-- ===========================================================================================
--  14) Capgemini
-- ==========================================================================================
DROP TABLE IF EXISTS year_city40; CREATE TABLE year_city40 ( year INT, city_id VARCHAR(50) ); INSERT INTO year_city40 VALUES (2020,'Mumbai'), (2020,'Delhi'), (2021,'Mumbai'), (2021,'Pune'), (2022,'Delhi'), (2022,'Chennai'), (2023,'Pune');
-- +------+---------+
-- | year | city_id |
-- +------+---------+
-- | 2020 | Mumbai  |
-- | 2020 | Delhi   |
-- | 2021 | Mumbai  |
-- | 2021 | Pune    |
-- | 2022 | Delhi   |
-- | 2022 | Chennai |
-- | 2023 | Pune    |
-- +------+---------+

-- ---extract the city ,and year that introducued first

-- exp output:
-- 2020	Mumbai
-- 2020	Delhi
-- 2021	Pune
-- 2022	Chennai

SELECT 
    MIN(year) AS first_year,
    city_id
FROM year_city40
GROUP BY city_id
ORDER BY first_year;




-- ===========================================================================================
-- 15) BCC consulting- -TOP 5 CITIES WITH HIGHEST RVENUEE IN LAST 30 DAYS
-- ==========================================================================================

DROP TABLE IF EXISTS orders; CREATE TABLE orders ( order_id INT, city VARCHAR(50), revenue INT, order_date DATE ); INSERT INTO orders VALUES (1,'Mumbai',5000,CURDATE() - INTERVAL 5 DAY), (2,'Delhi',7000,CURDATE() - INTERVAL 10 DAY), (3,'Pune',4000,CURDATE() - INTERVAL 12 DAY), (4,'Chennai',9000,CURDATE() - INTERVAL 15 DAY), (5,'Bangalore',8500,CURDATE() - INTERVAL 20 DAY), (6,'Hyderabad',3000,CURDATE() - INTERVAL 25 DAY), (7,'Mumbai',6000,CURDATE() - INTERVAL 2 DAY), (8,'Delhi',2000,CURDATE() - INTERVAL 3 DAY), (9,'Pune',5000,CURDATE() - INTERVAL 8 DAY), (10,'Chennai',1000,CURDATE() - INTERVAL 35 DAY);

-- +----------+-----------+---------+------------+
-- | order_id | city      | revenue | order_date |
-- +----------+-----------+---------+------------+
-- |        1 | Mumbai    |    5000 | 2026-05-20 |
-- |        2 | Delhi     |    7000 | 2026-05-15 |
-- |        3 | Pune      |    4000 | 2026-05-13 |
-- |        4 | Chennai   |    9000 | 2026-05-10 |
-- |        5 | Bangalore |    8500 | 2026-05-05 |
-- |        6 | Hyderabad |    3000 | 2026-04-30 |
-- |        7 | Mumbai    |    6000 | 2026-05-23 |
-- |        8 | Delhi     |    2000 | 2026-05-22 |
-- |        9 | Pune      |    5000 | 2026-05-17 |
-- |       10 | Chennai   |    1000 | 2026-04-20 |
-- +----------+-----------+---------+------------+

-- TOP 5 CITIES WITH HIGHEST RVENUEE IN LAST 30 DAYS

-- ============Easy one==========
SELECT city, SUM(revenue) total_revenue
FROM orders
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 5;
-- ================= with group by + Dense_rank()==========
WITH cte AS (

    SELECT
        city,
        SUM(revenue) AS total_revenue

    FROM orders

    WHERE order_date >= CURDATE() - INTERVAL 30 DAY

    GROUP BY city
),

rnk_cte AS (

    SELECT
        city,
        total_revenue,

        DENSE_RANK() OVER(
            ORDER BY total_revenue DESC
        ) AS rnk

    FROM cte
)

SELECT *
FROM rnk_cte

WHERE rnk <= 5;

-- ======================================= =

-- ===========================================================================================
-- 16) IBM Internal- Consecutive days- Island + date_sub + row_numbers()
-- ==========================================================================================

DROP TABLE IF EXISTS login_streak40; CREATE TABLE login_streak40 ( user_id INT, username VARCHAR(50), login_date DATE ); INSERT INTO login_streak40 VALUES (1,'John','2025-05-01'), (1,'John','2025-05-02'), (1,'John','2025-05-03'), (1,'John','2025-05-06'), (2,'Mary','2025-05-01'), (2,'Mary','2025-05-03'), (2,'Mary','2025-05-04'), (2,'Mary','2025-05-05'), (3,'David','2025-05-07'), (3,'David','2025-05-08'), (3,'David','2025-05-09');


-- 1. Find users who logged in for 3 consecutive days.

WITH cte AS (

    SELECT
        user_id,
        username,
        login_date,

        ROW_NUMBER() OVER(
            PARTITION BY user_id
            ORDER BY login_date
        ) AS rn

    FROM login_streak40
),

grp_cte AS (

    SELECT
        user_id,
        username,
        login_date,

        DATE_SUB(login_date, INTERVAL rn DAY) AS grp

    FROM cte
)

SELECT
    user_id,
    username,

    MIN(login_date) AS streak_start,
    MAX(login_date) AS streak_end,

    COUNT(*) AS consecutive_days

FROM grp_cte

GROUP BY
    user_id,
    username,
    grp

HAVING COUNT(*) >= 3;

-- =======================

-- 1. Identify longest activity streak for each user.

-- 3. Detect continuous order dates without gaps.
-- =========================================================================================
-- 17)  Zensar- Analyze patterns in time-series continuity
-- =========================================================================================
-- 

DROP TABLE IF EXISTS sensor_series40; CREATE TABLE sensor_series40 ( sensor_id INT, reading_time DATETIME, temperature DECIMAL(5,2) ); INSERT INTO sensor_series40 VALUES (1,'2025-05-01 10:00:00',25.5), (1,'2025-05-01 10:01:00',25.7), (1,'2025-05-01 10:02:00',26.0), (1,'2025-05-01 10:10:00',27.5), (2,'2025-05-01 11:00:00',30.1), (2,'2025-05-01 11:01:00',30.2), (2,'2025-05-01 11:05:00',31.0), (2,'2025-05-01 11:06:00',31.2);
-- +-----------+---------------------+-------------+
-- | sensor_id | reading_time        | temperature |
-- +-----------+---------------------+-------------+
-- |         1 | 2025-05-01 10:00:00 |       25.50 |
-- |         1 | 2025-05-01 10:01:00 |       25.70 |
-- |         1 | 2025-05-01 10:02:00 |       26.00 |
-- |         1 | 2025-05-01 10:10:00 |       27.50 |
-- |         2 | 2025-05-01 11:00:00 |       30.10 |
-- |         2 | 2025-05-01 11:01:00 |       30.20 |
-- |         2 | 2025-05-01 11:05:00 |       31.00 |
-- |         2 | 2025-05-01 11:06:00 |       31.20 |
-- +-----------+---------------------+-------------+

-- Find continuity breaks in sensor readings.
-- A break occurs when the difference between consecutive timestamps for the same sensor exceeds 5 minutes.


WITH cte AS (

    SELECT
        sensor_id,
        reading_time,
        temperature,

        LAG(reading_time) OVER(
            PARTITION BY sensor_id
            ORDER BY reading_time
        ) AS prev_time

    FROM sensor_series40
)

SELECT
    sensor_id,

    prev_time AS continuity_start,
    reading_time AS continuity_end,

    TIMESTAMPDIFF(
        MINUTE,
        prev_time,
        reading_time
    ) AS gap_minutes,

    CASE
        WHEN TIMESTAMPDIFF(
                 MINUTE,
                 prev_time,
                 reading_time
             ) > 5
        THEN 'BREAK'
        ELSE 'CONTINUOUS'
    END AS continuity_status

FROM cte

WHERE prev_time IS NOT NULL;

-- ===============================

-- =========================================================================================
-- 18) -- EY- HSBC clint
-- =========================================================================================
use interview;
DROP TABLE IF EXISTS customers18; CREATE TABLE customers18 (customer_id INT, name VARCHAR(50), city VARCHAR(50)); INSERT INTO customers18 VALUES (1,'John Levi','New York'),(2,'Jane Tye','Los Angeles'),(3,'Mike Foley','Chicago'),(4,'Alice White','New York');
DROP TABLE IF EXISTS orders18; CREATE TABLE orders18 (order_id INT, customer_id INT, order_date DATE, order_total DECIMAL(10,2)); INSERT INTO orders18 VALUES (100,1,'2023-07-01',100.00),(101,2,'2023-06-15',50.00),(102,3,'2023-07-05',150.00),(103,1,'2023-07-07',75.00),(104,4,'2023-07-02',200.00),(105,1,'2023-07-01',180.00),(106,2,'2023-06-18',150.00),(107,4,'2024-06-05',350.00),(108,5,'2023-07-07',275.00),(109,3,'2023-07-02',300.00);
-- +-------------+-------------+-------------+
-- | customer_id | name        | city        |
-- +-------------+-------------+-------------+
-- |           1 | John Levi   | New York    |
-- |           2 | Jane Tye    | Los Angeles |
-- |           3 | Mike Foley  | Chicago     |
-- |           4 | Alice White | New York    |
-- +-------------+-------------+-------------+

-- +----------+-------------+------------+-------------+
-- | order_id | customer_id | order_date | order_total |
-- +----------+-------------+------------+-------------+
-- |      100 |           1 | 2023-07-01 |      100.00 |
-- |      101 |           2 | 2023-06-15 |       50.00 |
-- |      102 |           3 | 2023-07-05 |      150.00 |
-- |      103 |           1 | 2023-07-07 |       75.00 |
-- |      104 |           4 | 2023-07-02 |      200.00 |
-- |      105 |           1 | 2023-07-01 |      180.00 |
-- |      106 |           2 | 2023-06-18 |      150.00 |
-- |      107 |           4 | 2024-06-05 |      350.00 |
-- |      108 |           5 | 2023-07-07 |      275.00 |
-- |      109 |           3 | 2023-07-02 |      300.00 |
-- +----------+-------------+------------+-------------+
--  Find the total number of orders placed by each customer by name, excluding orders placed in June.

SELECT 
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers18 c
LEFT JOIN orders18 o
    ON c.customer_id = o.customer_id
    AND EXTRACT(MONTH FROM o.order_date) <> 6
GROUP BY c.customer_id, c.name;

--  total amount of orders place by each customer- Using coalesce to replace null

SELECT 
    c.name,
    coalesce(sum(o.order_date),0) AS total_amount
FROM customers18 c
LEFT JOIN orders18 o
    ON c.customer_id = o.customer_id
    AND EXTRACT(MONTH FROM o.order_date) != 6
GROUP BY c.customer_id, c.name;



-- =========================================================================================
-- 19--  
-- =========================================================================================










-- =========================================================================================
-- 20--
-- =========================================================================================









-- =========================================================================================
-- 21
-- =========================================================================================











-- =========================================================================================
-- 
-- =========================================================================================











-- =========================================================================================
-- 
-- =========================================================================================


