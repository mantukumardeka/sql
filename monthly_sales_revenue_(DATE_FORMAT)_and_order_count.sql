
-- Get monthly sales revenue and order count.

-- using date_format 


-- COMMON FORMAT PATERNS

-- DD → Day of month (24)
-- MM → Month number (09)
-- Mon / %b → Abbreviated month name (Sep)
-- Month → Full month name (September)
-- YY → 2-digit year (25)
-- YYYY → 4-digit year (2025)

CREATE TABLE Orders_s1 (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    amount DECIMAL(10,2)
);


INSERT INTO Orders_s1
 (order_id, customer_name, order_date, amount) VALUES
(1, 'Alice',   '2023-07-05', 250.00),
(2, 'Bob',     '2023-07-15', 300.00),
(3, 'Charlie', '2023-08-01', 150.00),
(4, 'David',   '2023-08-12', 500.00),
(5, 'Eva',     '2023-08-20', 200.00),
(6, 'Frank',   '2023-09-05', 100.00),
(7, 'Grace',   '2023-09-18', 400.00),
(8, 'Hannah',  '2023-10-02', 350.00),
(9, 'Ian',     '2023-10-10', 275.00),
(10,'Julia',   '2023-10-25', 600.00);


select * from orders_s1;

select month(order_date) as monthsale, sum(amount) as revune ,count(order_id) as order_count from Orders_s1 group by month(order_date);



-- | MySQL → use DATE_FORMAT(order_date, '%Y-%m') instead of FORMAT.

SELECT
    FORMAT(order_date, '%y-%m') AS month,
    SUM(amount) AS total_revenue,
    COUNT(order_id) AS order_count
FROM Orders_s1
GROUP BY
    FORMAT(order_date, '%y-%m');
	
 --  | USING DATE_FORMAR ITS WORKING FINE ,  DATE_FORMAT(order_date, '%Y-%m')
 --
 
    SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS total_revenue,
    COUNT(order_id) AS order_count
FROM Orders_s1
GROUP BY
    DATE_FORMAT(order_date, '%Y-%m');
    
    -- | using  DATE_FORMAT(order_date, '%y-%m-%d')
    
    SELECT
    DATE_FORMAT(order_date, '%y-%m-%d') AS month,
    SUM(amount) AS total_revenue,
    COUNT(order_id) AS order_count
FROM Orders_s1
GROUP BY
    DATE_FORMAT(order_date, '%y-%m-%d');

-- | another way DATE_FORMAT(order_date, '%b-%y')
-- Format specifiers used

-- %b → Abbreviated month name (Jan, Feb, Mar, … Sep)
-- %y → Last two digits of the year (25 for 2025)


SELECT
    DATE_FORMAT(order_date, '%b-%y') AS month,
    SUM(amount) AS total_revenue,
    COUNT(order_id) AS order_count
FROM Orders_s1
GROUP BY
    DATE_FORMAT(order_date, '%b-%y');
    
    
    
