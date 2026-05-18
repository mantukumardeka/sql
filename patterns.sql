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
--  Conditional Aggregation:
-- =================================================================================

-- 1. How would you count active and inactive users separately in a single query?
SELECT 
    COUNT(CASE WHEN status = 'Active' THEN 1 END) AS active_count,
    COUNT(CASE WHEN status = 'Inactive' THEN 1 END) AS inactive_count
FROM users40;

-- PysPark
-- df=users40_df.select(
--     count(when(col("status")=='Active' ,1)).alias("Avtive_count"),
--     count(when(col("status")=="Inactive" ,1)).alias("Inactive_count")
-- )
-- df.show()


-- 2. Write a query to calculate total revenue generated only from successful transactions.

select customer_id ,sum(amount) from transactions40 where status="SUCCESS" group by customer_id;

-- pyspark

-- df=transactions40_df.filter(col("status")=="SUCCESS").groupby(col("customer_id")).agg(sum(col("amount"))).alias("Tatal_revune")
-- df.show()


-- 3. How can you count failed and successful API calls from logs?

-- 4. Calculate revenue separately for different product categories in one query.
-- 5. Count the number of premium vs non-premium users in a dataset.
