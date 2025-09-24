

-- -- 'Typical Variations of This Question'

-- -- “Find customers who have never placed an order.”

-- -- “List students who are not enrolled in any course.”

-- -- “Show products that were never sold.”

-- -- “Find employees whose department does not exist in the department table.”

CREATE TABLE Dep (
    department_id INT,
    department_name varchar(20)
);

INSERT INTO Dep VALUES
(1, 'Sales'),
(2, 'Finance'),
(3, 'Marketing');


CREATE TABLE Emp (
    emp_id INT,
    emp_name varchar(20),
    department_id INT
);

INSERT INTO Emp VALUES
(101, 'James', 1),
(102, 'Michael', 1),
(103, 'Robert', 2),
(104, 'Maria', NULL),   -- No department
(105, 'Raman', 5),      -- Dept not existing in Department table
(106, 'Jen', 3);


show tables;


select * from Emp;
select * from Dep;

select e.*,  d.department_name from Emp e left join Dep d on e.department_id=d.department_id where e.department_id is NULL;


-- -- “Find customers who have never placed an order.”

CREATE TABLE Customer (
    customer_id INT,
    customer_name varchar(10)
);

INSERT INTO Customer VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Emma');

CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    order_amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(101, 1, 250.00),
(102, 2, 300.00),
(103, 1, 150.00),
(104, 4, 400.00);

-- --  get full table with left join to 
select c.* , o.* from Customer c left join orders o on c.customer_id=o.customer_id;

select c.* , o.order_id,o.order_amount from Customer c left join orders o on c.customer_id=o.customer_id where o.customer_id is NULL;


