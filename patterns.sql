use patterns;
show tables;
select * from login40;
select * from customers40;
select * from employees40;
select * from events40;
select * from numbers40;
select * from orders40;
select * from products40;
select * from sequence40;
select * from transactions40;
select * from users40;

-- =================================================================================
--  Conditional Aggregation:-
-- =================================================================================

-- 1. How would you count active and inactive users separately in a single query?
SELECT 
    COUNT(CASE WHEN status = 'Active' THEN 1 END) AS active_count,
    COUNT(CASE WHEN status = 'Inactive' THEN 1 END) AS inactive_count
FROM users40;

-- --------------------------------------------------------- -------------------------------------------------------
-- PySpark=
-- df=users40_df.select(
--     count(when(col("status")=='Active' ,1)).alias("Avtive_count"),
--     count(when(col("status")=="Inactive" ,1)).alias("Inactive_count")
-- --------------------------------------------------------- -------------------------------------------------------



-- 2. Write a query to calculate total revenue generated only from successful transactions.

select customer_id ,sum(amount) from transactions40 where status="SUCCESS" group by customer_id;

SELECT customer_id,SUM(CASE WHEN status = 'SUCCESS' THEN amount ELSE 0 END) AS total_revenue FROM transactions40
GROUP BY customer_id;

-- --------------------------------------------------------- -------------------------------------------------------
-- PySpark=

-- transactions40_df.filter(col("status")=="SUCCESS").groupby(col("customer_id")).agg(sum(col("amount"))).alias("Tatal_revune")

-- --------------------------------------------------------- -------------------------------------------------------


-- 3. How can you count failed and successful API calls from logs?
-- -------------------------------------------------
-- COUNT(CASE WHEN x THEN 1 END) ✅
-- TRUE  → 1    → counted
-- FALSE → NULL → ignored
-- COUNT(CASE WHEN x THEN 1 ELSE 0 END) ❌
-- Reason:
-- 0 is NOT NULL
-- COUNT counts 0 also
-- -------------------------------------------------

select customer_id, count( case when status= 'FAILED' then 1  end  ) as  failed_count  from transactions40 group by customer_id;

SELECT  customer_id,SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END ) AS failed_count FROM transactions40 GROUP BY customer_id;



-- ---------------- count()------------------
-- transactions40_df.groupBy("customer_id").agg(count( when(col("status") == "FAILED", 1)).alias("failed_count")

-- ------------------sum()--------------------
-- transactions40_df.groupBy("customer_id").agg(sum(when(col("status") == "FAILED", 1).otherwise(0)).alias("failed_count")


-- 4. Calculate revenue separately for different product categories in one query.


-- 5. Count the number of premium vs non-premium users in a dataset.


-- =======================================================================================
-- Running Total:
-- =======================================================================================
--  1. How would you calculate the running total of daily sales over a month?

WITH daily AS (
    SELECT order_date, SUM(amount) AS daily_sales
    FROM orders40
    GROUP BY order_date
)
SELECT
    order_date,
    daily_sales,
    SUM(daily_sales) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM daily;

-- other-way
select order_date, sum(amount) as daily_toal ,sum( sum(amount)  )
 over( order by order_date rows between unbounded preceding and current row ) as cumtoal
 from orders40 group by order_date;
-- --------------------------------------------------------- -------------------------------------------------------
-- PySpark=

-- df=orders40_df.groupby(col("order_date")).agg(sum(col("amount")).alias("daily_total"))
-- ws=Window.orderBy(col("order_date")).rowsBetween(Window.unboundedPreceding,Window.currentRow)
-- df2=df.withColumn("total_monthly", sum("daily_total").over(ws))
-- df2.show()
-- --------------------------------------------------------- -------------------------------------------------------
-- “What is the account balance after each transaction in time order?”
-- 3. Track running account balance after each transaction.

select * from transactions40;


select customer_id,txn_date, sum(amount) over( partition by customer_id order by txn_date  rows between unbounded
preceding and current row
) as "running account balance" from transactions40 where status='SUCCESS' order by customer_id,txn_date;

-- --------------------------------------------------------- -------------------------------------------------------
-- PySpark=
-- df=transactions40_df.filter(col("status")=="SUCCESS")
-- ws=Window.partitionBy(col("customer_id")).orderBy(col("txn_date"),col("txn_id")).rowsBetween(Window.unboundedPreceding, Window.currentRow)
-- df1=df.withColumn("Total_amount",sum("amount").over(ws) )
-- df1.show()

-- --------------------------------------------------------- -------------------------------------------------------

-- 4. Calculate the total number of users registered till each date.—> get daily total, then monthly.-- 

WITH daily AS (
    SELECT
        signup_date,
        COUNT(customer_id) AS daily_customer
    FROM customers40
    GROUP BY signup_date
)

SELECT
    signup_date,
    daily_customer,
    SUM(daily_customer) OVER (
        ORDER BY signup_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS monthly_total
FROM daily
ORDER BY signup_date;

-- --------------------------------------------------------- -------------------------------------------------------
-- PySpark=

-- daily = orders40_df.groupBy("order_date").agg(
--     F.sum("amount").alias("daily_sales")
-- )

-- window_spec = Window.orderBy("order_date") \
--     .rowsBetween(Window.unboundedPreceding, Window.currentRow)

-- result = daily.withColumn(
--     "cumulative_sales",
--     F.sum("daily_sales").over(window_spec)
-- )


-- -------------------------------------------

-- How do you calculate a running total per month?"
-- First get group by daily total, then calculate montly-

WITH DailySales AS (
    -- Step 1: Aggregate sales by day
    SELECT order_date,
           SUM(amount) AS daily_amount
    FROM orders40
    GROUP BY order_date
)
-- Step 2: Running total partitioned by month
SELECT order_date,
       daily_amount,
       SUM(daily_amount) OVER (
           PARTITION BY month(order_date) 
           ORDER BY order_date
       ) AS mtd_running_total
FROM DailySales
ORDER BY order_date;

-- =======================================================================================
 -- Ranking (Top N per Group)
-- =======================================================================================


-- 1. Find the top 3 highest-paid employees in each department.

SELECT *
FROM (
    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY dept
            ORDER BY salary DESC
        ) AS rnk
    FROM employees40
) e
WHERE rnk <= 3
AND manager_id IS NOT NULL;

-- 2. Identify top-performing products within each category based on sales.
-- 

-- Step 1: Calculate total sales for each product
WITH product_sales AS (
    SELECT category, product_id,
        -- Adding all sales/price values for same product
        SUM(price) AS total_sales
    FROM products40
    -- Grouping data product-wise inside category
    GROUP BY category, product_id
)
-- Step 2: Apply ranking on aggregated sales
SELECT *
FROM (SELECT*,
        -- Creating ranking within each category
        DENSE_RANK() OVER (
            -- Separate ranking for each category
            PARTITION BY category
            -- Highest sales gets rank 1
            ORDER BY total_sales DESC ) AS rnk
    FROM product_sales
) t
-- Step 3: Fetch top-performing product
WHERE rnk = 1;


-- 5. Retrieve top customers contributing the most revenue in each region.

WITH customer_revenue AS (
    -- Step 1: Calculate total revenue per customer in each region
    SELECT region,customer_id,SUM(amount) AS total_revenue FROM orders40 GROUP BY region, customer_id
)
-- Step 2: Rank customers within each region
SELECT *
FROM ( SELECT *, DENSE_RANK() OVER ( PARTITION BY region ORDER BY total_revenue DESC) AS rnk FROM customer_revenue
) t
-- Step 3: Fetch top customers
WHERE rnk = 1;





-- #########################################################################################
-- AMERICAN EXPRESS:
-- #########################################################################################

-- SUM of Last 5 transaction by affiliate  (American Express)

use amex;
SELECT * FROM affiliate;
SELECT * FROM transactions;

WITH cte AS (
    SELECT
        a.name,
        b.*,

        ROW_NUMBER() OVER(
            PARTITION BY a.affiliate_id
            ORDER BY b.transaction_date DESC
        ) AS rn

    FROM affiliate a
    JOIN transactions b
    ON a.affiliate_id = b.affiliate_id
)

SELECT
    affiliate_id,
    SUM(amount) AS total
FROM cte
WHERE rn <= 5
GROUP BY affiliate_id;

-- #########################################################################################
--  27. Recursive Hierarchy (CTE)  
-- #########################################################################################

-- 1. Retrieve the full employee hierarchy starting from the CEO down to all levels.

-- +--------+-------+---------+--------+------------+---------------+
-- | emp_id | name  | dept    | salary | manager_id | department_id |
-- +--------+-------+---------+--------+------------+---------------+
-- |      1 | Ravi  | IT      |  50000 |     <null> |             1 |
-- |      2 | Anita | HR      |  60000 |          1 |             2 |
-- |      3 | Kumar | IT      |  55000 |          1 |             1 |
-- |      4 | Neha  | Finance |  70000 |          2 |             3 |
-- |      5 | Amit  | HR      |  65000 |          2 |             2 |
-- |      6 | Sara  | IT      |  52000 |          1 |             1 |
-- |      7 | John  | Finance |  72000 |          4 |             3 |
-- |      8 | Priya | IT      |  58000 |          1 |        <null> |
-- |      9 | Rahul | HR      |  62000 |          2 |        <null> |
-- |     10 | Meena | Finance |  71000 |          4 |             3 |
-- +--------+-------+---------+--------+------------+---------------+

WITH RECURSIVE emp_hierarchy AS (

    -- 🔹 Anchor: CEO level (root of hierarchy)
    SELECT
        emp_id,
        name,
        dept,
        salary,
        manager_id,
        1 AS level
    FROM employees40
    WHERE manager_id IS NULL

    UNION ALL

    -- 🔹 Recursive: get employees reporting to previous level
    SELECT
        e.emp_id,
        e.name,
        e.dept,
        e.salary,
        e.manager_id,
        eh.level + 1
    FROM employees40 e
    JOIN emp_hierarchy eh
        ON e.manager_id = eh.emp_id
)

SELECT *
FROM emp_hierarchy
ORDER BY level, emp_id;

-- ====================================

-- Add Full Reporting Path (VERY IMPORTANT)

WITH RECURSIVE subordinates AS (

    SELECT
        emp_id,
        name,
        manager_id,
        CAST(name AS CHAR(1000)) AS path,
        1 AS level
    FROM employees40
    WHERE emp_id = 1

    UNION ALL

    SELECT
        e.emp_id,
        e.name,
        e.manager_id,
        CONCAT(s.path, ' -> ', e.name),
        s.level + 1
    FROM employees40 e
    JOIN subordinates s
        ON e.manager_id = s.emp_id
)

SELECT *
FROM subordinates;

-- =============================================

-- 1. Calculate hierarchy depth or levels in a tree structure.

—WITH RECURSIVE emp_tree AS (
    SELECT emp_id, name, manager_id, salary
    FROM employees40

    UNION ALL

    SELECT
        m.emp_id,
        m.name,
        m.manager_id,
        e.salary
    FROM employees40 e
    JOIN emp_tree m
        ON e.manager_id = m.emp_id
)
SELECT manager_id, SUM(salary)
FROM emp_tree
GROUP BY manager_id;



-- #########################################################################################
--  27. Merge -Upsert
-- #########################################################################################








