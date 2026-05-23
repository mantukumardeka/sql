
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
-- LTM- get thame emp which dep and salary is same
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
-- Altrimetric- 
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
-- -- Altrimetric- 
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