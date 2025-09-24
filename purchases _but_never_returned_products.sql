
show databases;
-- Customers who made purchases but never returned products.
use mkd;

CREATE TABLE Customer_1 (
    customer_id INT,
    customer_name VARCHAR(10)
);

INSERT INTO Customer_1 VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Emma');

CREATE TABLE Orders_1 (
    order_id INT,
    customer_id INT,
    order_amount DECIMAL(10,2)
);

INSERT INTO Orders_1 VALUES
(101, 1, 250.00),
(102, 2, 300.00),
(103, 3, 150.00),
(104, 4, 400.00),
(105, 1, 200.00);


CREATE TABLE Returns_1 (
    return_id INT,
    customer_id INT,
    order_id INT
);

INSERT INTO Returns_1 VALUES
(201, 1, 101),   -- Alice returned one order
(202, 3, 103);   -- Charlie returned one order


select c.customer_id from Customer_1 c join orders_1 o on c.customer_id=o.customer_id where c.customer_id not in (select r.customer_id from Returns_1 r);


-- Another Way-

SELECT DISTINCT c.customer_id
FROM Customer_1 c
JOIN orders_1 o ON c. customer_id =o.customer_id
WHERE c. customer_id NOT IN ( SELECT customer_id FROM Returns_1);


 -- ==============================================
-- BOLD: COUNT HOW MANY CUSTOMERS PLACED > 5 ORDERS
-- ==============================================

 select customer_id, count(*)  from orders_1 group by customer_id having count(*)>5;
 

SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 5;

-- **USING SUB QUESRY**
 
 with tt as(select customer_id, count(*)  from orders_1 group by customer_id having count(*)>5) select count(*) from tt;
 

