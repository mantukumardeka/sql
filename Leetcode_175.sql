-- show databases;
-- create database leetcode;
-- use leetcode;

-- Question 175: Combine Two Tables
-- Write a SQL query for a report that provides FirstName, LastName, City, State 
--  If the address of a personId is not present in the Address table, report null instead.


CREATE TABLE Person_175 (
    PersonId INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255)
);

CREATE TABLE Address_175 (
    AddressId INT PRIMARY KEY,
    PersonId INT,
    City VARCHAR(255),
    State VARCHAR(255)
);

INSERT INTO Person_175 VALUES (1, 'Wang', 'Allen');
INSERT INTO Person_175 VALUES (2, 'Alice', 'Bob');

INSERT INTO Address_175 VALUES (1, 2, 'New York City', 'New York');

select * from Person_175;

select * from Address_175;

-- soultion

select p.firstname,p.lastname,a.state from person_175 p join address_175 a on p.personid=a.personid;
