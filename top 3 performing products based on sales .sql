-- CREATE TABLE sales (
--     sale_id INT,
--     product_id INT,
--     product_name varchar(10),
--     quantity_sold INT,
--     sale_date DATE
-- );
-- INSERT INTO sales VALUES
-- (1, 101, 'Laptop', 5, '2025-01-01'),
-- (2, 102, 'Mobile', 10, '2025-01-02'),
-- (3, 103, 'Headphones', 15, '2025-01-03'),
-- (4, 101, 'Laptop', 7, '2025-01-04'),
-- (5, 102, 'Mobile', 12, '2025-01-05'),
-- (6, 104, 'Tablet', 20, '2025-01-06'),
-- (7, 103, 'Headphones', 8, '2025-01-07'),
-- (8, 105, 'Smartwatch', 18, '2025-01-08'),
-- (9, 102, 'Mobile', 14, '2025-01-09'),
-- (10, 101, 'Laptop', 9, '2025-01-10');

-- -- Write a query to fetch the top 3 performing products based on sales .

select * from sales;

select product_name ,sum(quantity_sold) as total_sum  from sales group by product_name order by total_sum desc limit 3;

-- -- using RANK() -HANDLE TIES


with tt as (select  product_name, sum(quantity_sold)as total_sold, rank() over(order by sum(quantity_sold) desc)  as renk1 from sales group by  product_name) select product_name,total_sold from tt where renk1<=3;




