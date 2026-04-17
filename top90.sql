create database ankit;
use ankit;

-- ====================================================================
-- 1) top 2 employee bases on salary desc;
-- ====================================================================

select * from employee order by salary desc limit 2;

with cte as (select *, row_number() over(partition by dept_id order by salary desc) as rnk from employee) select * from cte where rnk<=2;


select * from orders;
-- ====================================================================
-- 2) top 5 product_id by sales
-- ====================================================================
with cte as (select product_id, sum(list_price) as sales from orders  group by product_id) 

select product_id, sales from cte order by sales desc;

-- ====================================================================
-- 3) top 5 product_id, category by sales
-- ====================================================================
with tt as 
(select  category ,product_id, sum(list_price) as sales from orders  group by product_id,category)

select * from (
select *, row_number() over(partition by category order by sales desc ) as rnk from tt) a where rnk=1;


-- ====================================================================
--  4) find top 5 highest selling products in each region
-- ====================================================================

with tt as (select product_id,region, sum(list_price) as sales from orders group by product_id ,region),
cte as (
select * , row_number() over(partition by region order by sales desc) as rn from tt)

select * from cte where rn<=5;

-- ====================================================================
-- 5) find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
-- ====================================================================

with tt as (select year(order_date) as order_year, month(order_date) as order_month , sum(list_price) as sales from orders group by  year(order_date) ,month(order_date))

select order_month, 
 sum(case when order_year=2022 then sales else 0 end ) as 2022_sales,
 sum(case when order_year=2023 then sales else 0 end) as 2023_sales  from tt
 group by order_month order by order_month;
 

-- ====================================================================
-- 6)  for each category which month had highest sales 
-- ====================================================================

select * from orders;

with tt as (select  category, month(order_date) as month ,sum(list_price) as sale  from orders group by category, month(order_date)),

cte as (select *, row_number() over(partition by category order by sale desc  ) as rnk from tt)

select * from cte where rnk=1



-- ====================================================================
-- 7) which sub category had highest growth by profit in 2023 compare to 2022
-- ====================================================================

with tte as (
select sub_category,year(order_date) as order_year,
sum(list_price) as sales
from orders
group by sub_category,year(order_date)
-- order by year(order_date),month(order_date)
	),
cte2 as (
select sub_category
, sum(case when order_year=2022 then sales else 0 end) as sales_2022
, sum(case when order_year=2023 then sales else 0 end) as sales_2023
from tte 
group by sub_category
)
select  *
,(sales_2023-sales_2022)
from  cte2
order by (sales_2023-sales_2022) desc limit 1;


-- ====================================================================
--  8) MySQL Pivot Query
-- ====================================================================

SELECT 
    YEAR(order_date) AS orders,
    SUM(CASE WHEN category = 'Furniture' THEN list_price ELSE 0 END) AS furniture_sales,
    SUM(CASE WHEN category = 'Office Supplies' THEN list_price ELSE 0 END) AS office_supplies_sales,
    SUM(CASE WHEN category = 'Technology' THEN list_price ELSE 0 END) AS technology_sales
FROM orders
GROUP BY YEAR(order_date);



-- ====================================================================
--   9) % of YOY  growth
-- ====================================================================


with cte8 as (
select year (order_date) as year_order, sum(list_price) as sales from orders
group by year (order_date)
-- order by year(order_date) 
),
cte9 as  (select * ,lag(sales, 1, sales) over(order by year_order) as previoys_year_sales from cte8)

select *, (year_order-previoys_year_sales)*100/previoys_year_sales as yoy from cte9



-- ====================================================================
-- 10) - yoy growth/category with current month sales more than previous months sales--
-- ====================================================================

with cte as (select category, year(order_date) as year_order, sum(list_price) as sales from orders
group by category, year(order_date)
-- order by year(order_date) ,category),
),

cte1 as  (select * ,lag(sales, 1, sales) over( partition by category order by year_order) as previoys_year_sales from cte)

select *, (year_order-previoys_year_sales)*100/previoys_year_sales as yoy from cte1;


-- ====================================================================
-- 11) Cummalatiove sales-  rolling sales--running sales
-- ====================================================================

with  cte as (
select year(order_date) as year_order,sum(list_price) as sales from orders group by year(order_date))

select *, sum(sales) over(order by year_order ) as total_sum from cte;

-- rolling 3 months sale 

WITH cte AS (SELECT  YEAR(order_date) AS year_order,MONTH(order_date) AS month_order_date,
        SUM(list_price) AS sales FROM orders GROUP BY YEAR(order_date), MONTH(order_date)
)

SELECT  year_order,month_order_date, sales,

    SUM(sales) OVER (ORDER BY year_order, month_order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM cte
ORDER BY year_order, month_order_date;

-- ====================================================================
-- 12) Cummalatiove sales-  rolling sales--running sales---with category
-- ====================================================================

WITH cte AS (SELECT  category,YEAR(order_date) AS year_order,MONTH(order_date) AS month_order_date,
        SUM(list_price) AS sales FROM orders GROUP BY YEAR(order_date), MONTH(order_date),category
)

SELECT  category,year_order,month_order_date, sales,

    SUM(sales) OVER (partition by category ORDER BY year_order, month_order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM cte
ORDER BY year_order, month_order_date;

-- last 3 month  ROWS BETWEEN 3 PRECEDING AND 2 PRECEDING



-- ====================================================================
-- 13)  get order_id, new customer and repeat customer count
-- ====================================================================

CREATE TABLE customer_orders (order_id INT PRIMARY KEY, customer_id INT, order_date DATE, order_amount INT); INSERT INTO customer_orders VALUES (1,100,'2022-01-01',2000),(2,200,'2022-01-01',2500),(3,300,'2022-01-01',2100),(4,100,'2022-01-02',2000),(5,400,'2022-01-02',2200),(6,500,'2022-01-02',2700),(7,100,'2022-01-03',3000),(8,400,'2022-01-03',1000),(9,600,'2022-01-03',3000);

-- min, cte, join inclusing case, again cte and count
select * from customer_orders;

with first_visit as (select customer_id ,min(order_date) as first_visit_date 
from customer_orders group by customer_id),

visit_flag as (
select co.*, fv.first_visit_date , 
case when co.order_date=fv.first_visit_date then 1 else 0 end as  first_visit_count, 
case when co.order_date!=fv.first_visit_date then 1 else 0 end as  repaet_visit_count 
 from first_visit fv join customer_orders co on co.customer_id=fv.customer_id)

select order_date, sum(first_visit_count), sum(repaet_visit_count)  from  visit_flag group by order_date;



-- ====================================================================
-- 14)  Get team_name, no_of_matches_played, no_of_wins ,no_ot_losses
-- ====================================================================

drop table icc_world_cup;
CREATE TABLE icc_world_cup (Team_1 VARCHAR(20), Team_2 VARCHAR(20), Winner VARCHAR(20)); INSERT INTO icc_world_cup VALUES ('India','SL','India'),('SL','Aus','Aus'),('SA','Eng','Eng'),('Eng','NZ','NZ'),('Aus','India','India'); 

-- case winner, union , and then count, sum group by
SELECT * FROM icc_world_cup;

with tt as (
select Team_1 as team ,case when Team_1="Winner" then 1 else 0 end as Winner_count  from icc_world_cup union all

select Team_2, case when Team_2="Winner" then 1 else 0 end as Winner_count  from icc_world_cup)
select team, count(1), sum(Winner_count) as no_of_Wins, count(1)-sum(Winner_count) as no_of_losses from tt
group by team;


-- ====================================================================
--  15)  Get name, most_visited_floor, Total_visit, used_resources
-- ====================================================================

drop table entries;
CREATE TABLE entries (name VARCHAR(20), address VARCHAR(20), email VARCHAR(20), floor INT, resources VARCHAR(10)); INSERT INTO entries VALUES ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP'),('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');

select * from entries;

WITH floor_visits AS (
    SELECT 
        name,
        floor,
        COUNT(*) AS visit_count
    FROM entries
    GROUP BY name, floor
),

floor_visits as

    (SELECT *,
           ROW_NUMBER() OVER (PARTITION BY name ORDER BY visit_count DESC) AS rn
    FROM floor_visits
)

SELECT 
    e.name,
    r.floor AS most_visited_floor,
    COUNT(*) AS total_visits,
    GROUP_CONCAT(DISTINCT e.resources ORDER BY e.resources) AS used_resources
FROM entries e
JOIN ranked r 
    ON e.name = r.name
WHERE r.rn = 1
GROUP BY e.name, r.floor;



-- ====================================================================
-- 16) Write a Query to provide the date for nth occurrence of Sunday in future from given date
-- ====================================================================


SELECT 
    DATE_ADD(
        DATE_ADD('2026-04-01', 
            INTERVAL (1 + 7 - DAYOFWEEK('2026-04-01')) % 7 DAY
        ),
        INTERVAL (3 - 1) * 7 DAY
    ) AS third_sunday;
    

  -- target_day: 1=Sunday, 2=Monday ... 7=Saturday
  -- n -nth occurance

SELECT 
    DATE_ADD(
        DATE_ADD('2026-04-01', 
            INTERVAL (target_day + 7 - DAYOFWEEK('2022-01-01')) % 7 DAY
        ),
        INTERVAL (n - 1) * 7 DAY
    );
    
    
    
-- ====================================================================
-- 17)  find player with no of gold medals won by them only for players who won only gold medals.
-- ====================================================================
drop table events;
CREATE TABLE events (ID INT, event VARCHAR(255), YEAR INT, GOLD VARCHAR(255), SILVER VARCHAR(255), BRONZE VARCHAR(255)); DELETE FROM events; INSERT INTO events VALUES (1,'100m',2016,'Amthhew Mcgarray','donald','barbara'),(2,'200m',2016,'Nichole','Alvaro Eaton','janet Smith'),(3,'500m',2016,'Charles','Nichole','Susana'),(4,'100m',2016,'Ronald','maria','paula'),(5,'200m',2016,'Alfred','carol','Steven'),(6,'500m',2016,'Nichole','Alfred','Brandon'),(7,'100m',2016,'Charles','Dennis','Susana'),(8,'200m',2016,'Thomas','Dawn','catherine'),(9,'500m',2016,'Thomas','Dennis','paula'),(10,'100m',2016,'Charles','Dennis','Susana'),(11,'200m',2016,'jessica','Donald','Stefeney'),(12,'500m',2016,'Thomas','Steven','Catherine');

select * from events;

select gold as player_name, count(1) as number_of_medals from events 
where gold not in ( select silver from events union all select bronze  from events   )
group by gold;

-- -------
with cte as (
select gold as player_name ,"gold" as madel_name from events union all
select silver ,"silver" as madel_name  from events union all
select bronze ,"bronze" as madel_name  from events )
select player_name , count(1) as no_of_gold_madel from cte group by player_name having count(distinct madel_name)=1 and max(madel_name)="gold"
-- ---------
select gold, count(gold) from events
where gold not in (select distinct silver from events) 
and gold not in (select distinct bronze from events) 
group by gold



-- ====================================================================
-- 18)  we need to find difference between 2 dates excluding weekends and public holidays  . 
-- Basically we need to find business days between 2 given dates 
-- ====================================================================
drop table tickets;drop table holidays;
CREATE TABLE tickets (ticket_id VARCHAR(10), create_date DATE, resolved_date DATE);  INSERT INTO tickets VALUES (1,'2022-08-01','2022-08-03'),(2,'2022-08-01','2022-08-12'),(3,'2022-08-01','2022-08-16'); CREATE TABLE holidays (holiday_date DATE, reason VARCHAR(100));  INSERT INTO holidays VALUES ('2022-08-11','Rakhi'),('2022-08-15','Independence day');

select * from tickets;
select * from holidays;


SELECT 
    t.ticket_id,
    t.create_date,
    t.resolved_date,

    DATEDIFF(t.resolved_date, t.create_date) + 1 AS actual_days,

    COUNT(h.holiday_date) AS no_of_holidays,

    (
        DATEDIFF(t.resolved_date, t.create_date) + 1
        - (FLOOR(DATEDIFF(t.resolved_date, t.create_date) / 7) * 2)
        - COUNT(h.holiday_date)
    ) AS business_days

FROM tickets t
LEFT JOIN holidays h 
    ON h.holiday_date BETWEEN t.create_date AND t.resolved_date

GROUP BY t.ticket_id, t.create_date, t.resolved_date;



-- ====================================================================
-- 19) select the emp who is inside the office
-- ====================================================================
drop table hospital;CREATE TABLE hospital (emp_id INT, action VARCHAR(10), time DATETIME); INSERT INTO hospital VALUES (1,'in','2019-12-22 09:00:00'),(1,'out','2019-12-22 09:15:00'),(2,'in','2019-12-22 09:00:00'),(2,'out','2019-12-22 09:15:00'),(2,'in','2019-12-22 09:30:00'),(3,'out','2019-12-22 09:00:00'),(3,'in','2019-12-22 09:15:00'),(3,'out','2019-12-22 09:30:00'),(3,'in','2019-12-22 09:45:00'),(4,'in','2019-12-22 09:45:00'),(5,'out','2019-12-22 09:40:00');
select * from hospital;

with cte as (
select emp_id,
max(case when action='in' then time end) as in_time,
max(case when action='out' then time end) as out_time from hospital group by emp_id)

select  emp_id, in_time, out_time from cte where in_time > out_time or out_time is null ;



-- ====================================================================
-- 20)  Convert Comma Separated Values into Rows-- JSON_TABLE
-- ====================================================================
drop table airbnb_searches;
CREATE TABLE airbnb_searches (user_id INT, date_searched DATE, filter_room_types VARCHAR(200)); DELETE FROM airbnb_searches; INSERT INTO airbnb_searches VALUES (1,'2022-01-01','entire home,private room'),(2,'2022-01-02','entire home,shared room'),(3,'2022-01-02','private room,shared room'),(4,'2022-01-03','private room');
select * from airbnb_searches;

SELECT value, COUNT(*) AS cnt
FROM airbnb_searches,
JSON_TABLE(
    CONCAT('["', REPLACE(filter_room_types, ',', '","'), '"]'),
    '$[*]' COLUMNS (value VARCHAR(50) PATH '$')
) jt
GROUP BY value;



-- ====================================================================
-- 21)  JSON table-
-- ====================================================================

drop table emp21; CREATE TABLE emp21 (emp_id INT, gender VARCHAR(10), category VARCHAR(20), age INT); INSERT INTO emp21 VALUES (1,'m','1,2',20),(2,'f','1,2,3',20),(3,'T','1',20);

select * from emp21;

select emp_id,gender, js.value, age from emp21, 
JSON_TABLE(   concat('["' , replace(category,',', '","' ) , '"]'),
'$[*]' COLUMNS (value VARCHAR(50) PATH '$') ) as js


-- ====================================================================
-- 22) JSON_TABLE
-- ====================================================================
drop table emp22; create table emp22 as select * from top50.emp20;
select * from emp22;

select e.id, js.value from emp22 e join
json_table ( concat ( '["' ,replace(  names, ',' , '","'   )  , '"]' ), '$[*]' columns (value varchar(10) path '$' )     )as js


-- ====================================================================
-- 23 JSON_TABLE
-- ====================================================================
drop table emp23;CREATE TABLE emp23 (emp_id INT, departments VARCHAR(100)); INSERT INTO emp23 VALUES (1,'IT,HR'),(2,'MR,Sales,Finance');

select * from emp23;

select e.emp_id,js.value from emp23 e join 
json_table ( concat( '["' ,replace(departments,',', '","')  ,  '"]' ), '$[*]' columns (value varchar(20)  path '$' )) as js


-- ====================================================================
-- 24) Find the name whose array contains the maximum number of 1’s.”
-- ====================================================================
drop table emp24;CREATE TABLE emp24 (name VARCHAR(10), rank_arr JSON); INSERT INTO emp24 VALUES ('a','[1,1,1,3]'),('b','[1,2,3,4]'),('c','[1,1,1,1,4]'),('d','[3]');

select * from emp24;

SELECT name, jt.val
FROM emp24,
JSON_TABLE(rank_arr, '$[*]' COLUMNS (val INT PATH '$')) jt;
-----
WITH exploded AS (
    SELECT 
        name,
        jt.val AS rank_value
    FROM emp24
    JOIN JSON_TABLE(rank_arr, '$[*]' COLUMNS (val INT PATH '$')) jt
)
SELECT name
FROM exploded
GROUP BY name
ORDER BY SUM(rank_value = 1) DESC
LIMIT 1;

-- ====================================================================
-- 25) write a sQL to return all employee whose salary is same in same department
-- ====================================================================

drop table emp_salary25;CREATE TABLE emp_salary25 (emp_id INT NOT NULL, name VARCHAR(20) NOT NULL, salary VARCHAR(30), dept_id INT); INSERT INTO emp_salary25 (emp_id, name, salary, dept_id) VALUES (101,'sohan','3000',11),(102,'rohan','4000',12),(103,'mohan','5000',13),(104,'cat','3000',11),(105,'suresh','4000',12),(109,'mahesh','7000',12),(108,'kamal','8000',11);
select * from emp_salary25;

select dept_id,salary,count(1) from emp_salary25 group by dept_id,salary having count(1)>1;
-------
select * from emp_salary25 e where (e.dept_id,e.salary) in (
select dept_id,salary  from emp_salary25 group by dept_id,salary having count(*)>1);
------

select e1.* from emp_salary25 e join emp_salary25 e1 on e.dept_id=e1.dept_id and e.salary=e1.salary and
e.emp_id !=e1.emp_id;




-- ====================================================================
-- 26) Find customers who placed orders in consecutive months.
-- ====================================================================

drop table customers26;create table customers26 as  select * from wd.customers;
drop table orders26;create table orders26 as select * from wd.orders;

with cte as (select  customers26.customer_name,orders26.*,   lag(order_date) over(partition by customer_name order by order_date)  as prev_order from orders26 join customers26 on customers26.customer_id=orders26.customer_id)

select distinct customer_name from cte where  timestampdiff( month,prev_order,order_date )=1;


WITH cte AS (
    SELECT 
        c.customer_name,
        o.order_date,
        LAG(o.order_date) OVER (
            PARTITION BY c.customer_id 
            ORDER BY o.order_date
        ) AS prev_order
    FROM customers26 c
    JOIN orders26 o 
    ON c.customer_id = o.customer_id
)

SELECT DISTINCT customer_name
FROM cte
WHERE TIMESTAMPDIFF(MONTH, prev_order, order_date) = 1;



-- ====================================================================
-- 27) For every customer that bought Photoshop, return a list of the customers, and the total spent on all the products except for Photoshop products.
-- Sort your answer by customer ids in ascending order.
-- ====================================================================

drop table adobe_transactions;CREATE TABLE adobe_transactions (customer_id INT, product VARCHAR(50), revenue INT); INSERT INTO adobe_transactions VALUES (123,'Photoshop',50),(123,'Premier Pro',100),(123,'After Effects',50),(234,'Illustrator',200),(234,'Premier Pro',100);

select * from adobe_transactions;


select customer_id, sum(revenue) as total from adobe_transactions where customer_id in
(select distinct customer_id from adobe_transactions where product='Photoshop')
and product!='Photoshop'
group by customer_id;




-- ====================================================================
-- 28)  Repeat Purchases on Multiple Days
-- ====================================================================

drop table purchases;CREATE TABLE purchases (user_id INT, product_id INT, quantity INT, purchase_date DATETIME); INSERT INTO purchases VALUES (333,1122,8,'2022-06-02 14:56:03'),(333,1122,10,'2022-06-02 02:00:00'),(333,1122,9,'2022-06-02 01:00:00'),(536,1435,10,'2022-03-02 08:40:00'),(536,3223,6,'2022-01-11 12:33:44'),(536,3223,5,'2022-03-02 09:33:28'),(827,3585,35,'2022-02-20 14:05:26');

select * from purchases;

SELECT 
    user_id,
    product_id
FROM purchases
GROUP BY user_id, product_id
HAVING COUNT(DISTINCT DATE(purchase_date)) > 1;



-- ====================================================================
-- 29)
-- ====================================================================
drop table artists;CREATE TABLE artists (artist_id INT, artist_name VARCHAR(50), label_owner VARCHAR(100)); INSERT INTO artists VALUES (101,'Ed Sheeran','Warner Music Group'),(120,'Drake','Warner Music Group'),(125,'Bad Bunny','Rimas Entertainment'),(145,'Lady Gaga','Interscope Records'),(160,'Chris Brown','RCA Records'),(200,'Adele','Columbia Records'),(240,'Katy Perry','Capitol Records'),(250,'The Weeknd','Universal Music Group'),(260,'Taylor Swift','Universal Music Group'),(270,'Ariana Grande','Universal Music Group');
drop table songs;CREATE TABLE songs (song_id INT, artist_id INT, name VARCHAR(100)); INSERT INTO songs VALUES (55511,101,'Perfect'),(45202,101,'Shape of You'),(22222,120,'One Dance'),(19960,120,'Hotline Bling'),(12636,125,'Mia'),(69820,125,'Dakiti'),(44552,125,'Callaita'),(11254,145,'Bad Romance'),(33101,160,'Go Crazy'),(23299,200,'Hello'),(89633,240,'Last Friday Night'),(28079,200,'Someone Like You'),(13997,120,'Rich Flex'),(14525,260,'Cruel Summer'),(23689,260,'Blank Space'),(54622,260,'Wildest Dreams'),(62887,260,'Anti-Hero'),(56112,270,'7 Rings'),(86645,270,'Thank U, Next'),(87752,260,'Karma'),(23339,250,'Blinding Lights');
drop table global_song_rank;CREATE TABLE global_song_rank (day INT, song_id INT, ranks INT); INSERT INTO global_song_rank VALUES (1,45202,2),(3,45202,2),(15,45202,6),(2,55511,2),(1,19960,3),(9,19960,15),(23,12636,9),(24,12636,7),(2,12636,23),(29,12636,7),(1,69820,1),(17,44552,8),(11,44552,16),(11,11254,5),(12,11254,16),(3,33101,16),(6,23299,1),(14,89633,2),(9,28079,9),(7,28079,10),(40,11254,1),(37,23299,5),(19,11254,10),(23,89633,10),(52,33101,7),(20,55511,10),(7,22222,8),(8,44552,1),(1,54622,34),(2,44552,1),(2,19960,3),(3,260,1),(3,22222,35),(3,56112,3),(4,14525,1),(4,23339,29),(4,13997,5),(13,87752,1),(14,87752,1),(1,11254,12),(51,13997,1),(52,28079,75),(15,87752,1),(5,14525,1),(6,14525,2),(7,14525,1),(40,33101,13),(1,54622,84),(7,62887,2),(50,89633,67),(50,13997,1),(33,13997,3),(1,23299,9);

select * from artists;
select * from songs;
select * from global_song_rank;

with cte as 
(
select  * , dense_rank() over (order by no_of_appearance desc )  as artist_rank from 
(select s.artist_id,count(1) no_of_appearance from songs s join 

global_song_rank r on r.song_id=s.song_id where r.ranks<=10 

group by  s.artist_id  ) as a)

select artists.artist_name, cte.artist_rank from cte join artists
on artists.artist_id=cte.artist_id where artist_rank<=5 ORDER BY artist_rank, artist_name ;



-- ====================================================================
-- 30)  -write a query to print highest and lowest salary emp in each deprtment  (AAA)
-- ====================================================================
drop table emp30;CREATE TABLE emp30 (emp_name VARCHAR(10), dep_id INT, salary INT); INSERT INTO emp30 VALUES ('Siva',1,30000),('Ravi',2,40000),('Prasad',1,50000),('Sai',2,20000);
select * from emp30;

select d.dep_id, e.emp_name,d.max_sal,d.min_sal  from emp30 e join 
(select dep_id, max(salary) as max_sal, min(salary) as min_sal from emp30 group by dep_id) d on e.dep_id=d.dep_id;
---------------

with cte as 
(select dep_id, max(salary) as max_sal, min(salary) as min_sal from emp30 group by dep_id)
select e.dep_id,
max(case when salary=max_sal then emp_name end) as max_sal_emp,
max(case when salary=min_sal then emp_name end) as min_sal_emp

from emp30 e join cte  on e.dep_id=cte.dep_id group by dep_id;


-- ====================================================================
-- 31) write a query to get start time and end time of each call from below 2 tables.
-- Also create a column of call duration in minutes. Please do take into account that there will be multiple calls from one phone number and each entry in start table has a corresponding entry in end table.
-- ====================================================================
drop table call_start_logs;drop table call_end_logs; CREATE TABLE call_start_logs (phone_number VARCHAR(10), start_time DATETIME); INSERT INTO call_start_logs VALUES ('PN1','2022-01-01 10:20:00'),('PN1','2022-01-01 16:25:00'),('PN2','2022-01-01 12:30:00'),('PN3','2022-01-02 10:00:00'),('PN3','2022-01-02 12:30:00'),('PN3','2022-01-03 09:20:00'); CREATE TABLE call_end_logs (phone_number VARCHAR(10), end_time DATETIME); INSERT INTO call_end_logs VALUES ('PN1','2022-01-01 10:45:00'),('PN1','2022-01-01 17:05:00'),('PN2','2022-01-01 12:55:00'),('PN3','2022-01-02 10:20:00'),('PN3','2022-01-02 12:50:00'),('PN3','2022-01-03 09:40:00');
select * from call_start_logs;
select * from call_end_logs


select a.phone_number, a.start_time, b.end_time, a.rn, timestampdiff(minute, start_time, end_time) as durations from 
(select phone_number, start_time, row_number() over ( partition by phone_number order by start_time ) as rn from call_start_logs) a   join 
(select  phone_number, end_time , row_number() over( partition by phone_number order by end_time ) as rn from call_end_logs) b
on a.phone_number=b.phone_number and a.rn=b.rn;


-- ====================================================================
-- 32) infosys-
-- ====================================================================

drop table input;CREATE TABLE input (id INT, formula VARCHAR(10), value INT); INSERT INTO input VALUES (1,'1+4',10),(2,'2+1',5),(3,'3-2',40),(4,'4-1',20);
select * from input;

drop table input1;CREATE TABLE input1 (id INT, formula VARCHAR(10), value INT); INSERT INTO input1 VALUES (1,'1+4',10),(2,'2-3',30),(3,'2+4',50),(4,'2+1',40);
select * from input1;


SELECT 
    i.id,
    i.formula,
    i.value,
    CASE 
        WHEN i.formula LIKE '%+%' THEN a.value + b.value
        ELSE a.value - b.value
    END AS output
FROM input1 i
JOIN input1 a 
    ON a.id = CAST(SUBSTRING_INDEX(i.formula, 
        CASE WHEN i.formula LIKE '%+%' THEN '+' ELSE '-' END, 1) AS UNSIGNED)
JOIN input1 b 
    ON b.id = CAST(SUBSTRING_INDEX(i.formula, 
        CASE WHEN i.formula LIKE '%+%' THEN '+' ELSE '-' END, -1) AS UNSIGNED)
ORDER BY i.id;
--     ----------------    
  
  select * from input;
	SELECT 
    CASE 
        WHEN i.formula LIKE '%+%' THEN a.value + b.value
        ELSE a.value - b.value
    END AS output
FROM input i
JOIN input a 
    ON a.id = CAST(SUBSTRING_INDEX(i.formula, 
        CASE WHEN i.formula LIKE '%+%' THEN '+' ELSE '-' END, 1) AS UNSIGNED)
JOIN input b 
    ON b.id = CAST(SUBSTRING_INDEX(i.formula, 
        CASE WHEN i.formula LIKE '%+%' THEN '+' ELSE '-' END, -1) AS UNSIGNED);


-- ====================================================================
-- 33)-Ameriprise_LLC--get qualified team, Criteria1 &Criteria2 need to be Y, and need two member Y for qualify.
-- ====================================================================
use ankit;
DROP TABLE IF EXISTS Ameriprise_LLC; CREATE TABLE Ameriprise_LLC (teamID VARCHAR(2), memberID VARCHAR(10), Criteria1 VARCHAR(1), Criteria2 VARCHAR(1)); INSERT INTO Ameriprise_LLC VALUES ('T1','T1_mbr1','Y','Y'),('T1','T1_mbr2','Y','Y'),('T1','T1_mbr3','Y','Y'),('T1','T1_mbr4','Y','Y'),('T1','T1_mbr5','Y','N'),('T2','T2_mbr1','Y','Y'),('T2','T2_mbr2','Y','N'),('T2','T2_mbr3','N','Y'),('T2','T2_mbr4','N','N'),('T2','T2_mbr5','N','N'),('T3','T3_mbr1','Y','Y'),('T3','T3_mbr2','Y','Y'),('T3','T3_mbr3','N','Y'),('T3','T3_mbr4','N','Y'),('T3','T3_mbr5','Y','N');

select * from Ameriprise_LLC;

WITH qualified_team AS (
    SELECT 
        teamID, 
        COUNT(1) AS no_of_eligible_members 
    FROM Ameriprise_LLC
    WHERE Criteria1 = 'Y' 
      AND Criteria2 = 'Y'
    GROUP BY teamID
    HAVING COUNT(1) >= 2
)
SELECT 
    al.*,
    qt.no_of_eligible_members,
    CASE 
        WHEN al.Criteria1 = 'Y' 
         AND al.Criteria2 = 'Y'
         AND qt.no_of_eligible_members IS NOT NULL 
        THEN 'Y' 
        ELSE 'N' 
    END AS qualified_flag
FROM Ameriprise_LLC al
LEFT JOIN qualified_team qt 
    ON al.teamID = qt.teamID;



-- ====================================================================
-- 34) Tiger Analytics---Given a table of people categorized as Adults and Children, pair each Adult with one Child for a ride, 
-- and if there are extra Adults, list them with NULL as no Child is available.
-- ====================================================================

DROP TABLE IF EXISTS family; CREATE TABLE family (person VARCHAR(5), type VARCHAR(10), age INT); INSERT INTO family VALUES ('A1','Adult',54),('A2','Adult',53),('A3','Adult',52),('A4','Adult',58),('A5','Adult',54),('C1','Child',20),('C2','Child',19),('C3','Child',22),('C4','Child',15);
DROP TABLE IF EXISTS family1; CREATE TABLE family1 (person VARCHAR(5), type VARCHAR(10)); INSERT INTO family1 VALUES ('A1','Adult'),('A2','Adult'),('A3','Adult'),('A4','Adult'),('A5','Adult'),('C1','Child'),('C2','Child'),('C3','Child'),('C4','Child');
select * from family;
select * from family1;
------

SELECT 
    a.person AS Adult,
    c.person AS Child
FROM 
(
    SELECT person, ROW_NUMBER() OVER (ORDER BY person) rn
    FROM family1
    WHERE type = 'Adult'
) a
LEFT JOIN 
(
    SELECT person, ROW_NUMBER() OVER (ORDER BY person) rn
    FROM family1
    WHERE type = 'Child'
) c
ON a.rn = c.rn;

-----
-- ====================================================================
-- 35)
-- ====================================================================




-- ====================================================================
-- 36)
-- ====================================================================



-- ====================================================================
-- 37)
-- ====================================================================



-- ====================================================================
-- 38)
-- ====================================================================














-- ====================================================================
-- 39)
-- ====================================================================


-- ====================================================================
-- 40)
-- ====================================================================




-- ====================================================================
-- 41)
-- ====================================================================



-- ====================================================================
-- 42)
-- ====================================================================




-- ====================================================================
-- 43)
-- ====================================================================


-- ====================================================================
-- 44)
-- ====================================================================


-- ====================================================================
-- 45)
-- ====================================================================


-- ====================================================================
-- 46)
-- ====================================================================




-- ====================================================================
-- 47)
-- ====================================================================



-- ====================================================================
-- 48)
-- ====================================================================




-- ====================================================================
-- 49)
-- ====================================================================



-- ====================================================================
-- 50)
-- ====================================================================



-- ====================================================================
-- 51)
-- ====================================================================
















-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================

-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================


















-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================

-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================
















-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================

-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================










-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================

-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================



-- ====================================================================
-- 
-- ====================================================================




-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================


-- ====================================================================
-- 
-- ====================================================================

-- ====================================================================
-- 
-- ====================================================================





