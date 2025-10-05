
-- Question 182: Duplicate Emails
-- Write a SQL query to find all duplicate emails in the Person table.

Example 1:

-- Input: 
-- Person table:
-- +----+---------+
-- | id | email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
-- Output: 
-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+

CREATE TABLE Person_182 (
    Id INT PRIMARY KEY,
    Email VARCHAR(255)
);

INSERT INTO Person_182 VALUES (1, 'a@b.com');
INSERT INTO Person_182 VALUES (2, 'c@d.com');
INSERT INTO Person_182 VALUES (3, 'a@b.com');


select * from Person_182;

-- solution:

SELECT Email
FROM Person_182
GROUP BY Email
HAVING COUNT(Email) > 1;

