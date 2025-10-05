
-- Question 183: Customers Who Never Order
-- Write a SQL query to find all customers who never order anything.


-- Input: 
-- Customers table:
-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
-- Orders table:
-- +----+------------+
-- | id | customerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
-- Output: 
-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+

CREATE TABLE Customers_183 (
    Id INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Orders_183 (
    Id INT PRIMARY KEY,
    CustomerId INT
);

INSERT INTO Customers_183 VALUES (1, 'Joe');
INSERT INTO Customers_183 VALUES (2, 'Henry');
INSERT INTO Customers_183 VALUES (3, 'Sam');
INSERT INTO Customers_183 VALUES (4, 'Max');

INSERT INTO Orders_183 VALUES (1, 3);
INSERT INTO Orders_183 VALUES (2, 1);

select * from customers_183;

select * from Orders_183;

-- soultion using  left join
select c.name from customers_183 c left join orders_183 o on c.id=o.Customerid where o.customerid is null;

-- soultion using not in

select name from customers_183 where id not in (select CustomerId from orders_183);

