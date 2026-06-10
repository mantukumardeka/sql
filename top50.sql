use top100;

-- ============================================================================================
-- 1) ICC World Cup-
-- =============================================================================================
DROP TABLE IF EXISTS icc_world_cup1; CREATE TABLE icc_world_cup1(Team_1 VARCHAR(20),Team_2 VARCHAR(20),Winner VARCHAR(20)); INSERT INTO icc_world_cup1 VALUES('India','SL','India'); INSERT INTO icc_world_cup1 VALUES('SL','Aus','Aus'); INSERT INTO icc_world_cup1 VALUES('SA','Eng','Eng'); INSERT INTO icc_world_cup1 VALUES('Eng','NZ','NZ'); INSERT INTO icc_world_cup1 VALUES('Aus','India','India'); 
SELECT * FROM icc_world_cup1;

-- +--------+--------+--------+
-- | Team_1 | Team_2 | Winner |
-- +--------+--------+--------+
-- | India  | SL     | India  |
-- | SL     | Aus    | Aus    |
-- | SA     | Eng    | Eng    |
-- | Eng    | NZ     | NZ     |
-- | Aus    | India  | India  |
-- +--------+--------+--------+

-- o/p

-- +-----------+----------------------+-------------------+--------------+
-- | team_name | no_of_matches_played | no_of_matches_won | no_of_losses |
-- +-----------+----------------------+-------------------+--------------+
-- | India     |                    2 |                 2 |            0 |
-- | Eng       |                    2 |                 1 |            1 |
-- | Aus       |                    2 |                 1 |            1 |
-- | NZ        |                    1 |                 1 |            0 |
-- | SL        |                    2 |                 0 |            2 |
-- | SA        |                    1 |                 0 |            1 |
-- +-----------+----------------------+-------------------+--------------+

select team_name, count(1) as no_of_matches_played, sum(win_flag) as no_of_matches_won, count(1) - sum(win_flag) as no_of_losses
from (
    select team_1 as team_name, case when team_1=winner then 1 else 0 end as win_flag
    from icc_world_cup1
    union all
    select team_2 as team_name, case when team_2=winner then 1 else 0 end as win_flag
    from icc_world_cup1
) A
group by team_name
order by no_of_matches_won desc;


-- ============================================================================================
-- 2) EMP is greater than-Manager Salary
-- =============================================================================================
DROP TABLE IF EXISTS emp1; CREATE TABLE emp1(emp_id INT,emp_name VARCHAR(10),salary INT,manager_id INT); INSERT INTO emp1 VALUES(1,'Ankit',10000,4); INSERT INTO emp1 VALUES(2,'Mohit',15000,5); INSERT INTO emp1 VALUES(3,'Vikas',10000,4); INSERT INTO emp1 VALUES(4,'Rohit',5000,2); INSERT INTO emp1 VALUES(5,'Mudit',12000,6); INSERT INTO emp1 VALUES(6,'Agam',12000,2); INSERT INTO emp1 VALUES(7,'Sanjay',9000,2); INSERT INTO emp1 VALUES(8,'Ashish',5000,2); SELECT * FROM emp1;
-- +--------+----------+--------+------------+
-- | emp_id | emp_name | salary | manager_id |
-- +--------+----------+--------+------------+
-- |      1 | Ankit    |  10000 |          4 |
-- |      2 | Mohit    |  15000 |          5 |
-- |      3 | Vikas    |  10000 |          4 |
-- |      4 | Rohit    |   5000 |          2 |
-- |      5 | Mudit    |  12000 |          6 |
-- |      6 | Agam     |  12000 |          2 |
-- |      7 | Sanjay   |   9000 |          2 |
-- |      8 | Ashish   |   5000 |          2 |
-- +--------+----------+--------+------------+

-- 

select e.emp_id, e.emp_name, m.emp_name as manager_name, e.salary, m.salary as manager_salary
from emp1 e
inner join emp1 m on e.manager_id = m.emp_id
where e.salary > m.salary;



-- ============================================================================================
-- 3)  New and repeated customer
-- =============================================================================================
DROP TABLE IF EXISTS customer_orders1; CREATE TABLE customer_orders1(order_id INTEGER,customer_id INTEGER,order_date DATE,order_amount INTEGER); INSERT INTO customer_orders1 VALUES(1,100,CAST('2022-01-01' AS DATE),2000),(2,200,CAST('2022-01-01' AS DATE),2500),(3,300,CAST('2022-01-01' AS DATE),2100),(4,100,CAST('2022-01-02' AS DATE),2000),(5,400,CAST('2022-01-02' AS DATE),2200),(6,500,CAST('2022-01-02' AS DATE),2700),(7,100,CAST('2022-01-03' AS DATE),3000),(8,400,CAST('2022-01-03' AS DATE),1000),(9,600,CAST('2022-01-03' AS DATE),3000); SELECT * FROM customer_orders1;
-- +----------+-------------+------------+--------------+
-- | order_id | customer_id | order_date | order_amount |
-- +----------+-------------+------------+--------------+
-- |        1 |         100 | 2022-01-01 |         2000 |
-- |        2 |         200 | 2022-01-01 |         2500 |
-- |        3 |         300 | 2022-01-01 |         2100 |
-- |        4 |         100 | 2022-01-02 |         2000 |
-- |        5 |         400 | 2022-01-02 |         2200 |
-- |        6 |         500 | 2022-01-02 |         2700 |
-- |        7 |         100 | 2022-01-03 |         3000 |
-- |        8 |         400 | 2022-01-03 |         1000 |
-- |        9 |         600 | 2022-01-03 |         3000 |
-- +----------+-------------+------------+--------------+


WITH first_visit AS (
    SELECT customer_id, MIN(order_date) AS first_visit_date
    FROM customer_orders1
    GROUP BY customer_id
)
SELECT co.order_date,
       SUM(CASE WHEN co.order_date = fv.first_visit_date THEN 1 ELSE 0 END) AS first_visit_flag,
       SUM(CASE WHEN co.order_date != fv.first_visit_date THEN 1 ELSE 0 END) AS repeat_visit_flag
FROM customer_orders1 co
INNER JOIN first_visit fv ON co.customer_id = fv.customer_id
GROUP BY co.order_date;



-- ============================================================================================
-- 4) Most Visited floor
-- =============================================================================================

DROP TABLE IF EXISTS entries1; CREATE TABLE entries1(name VARCHAR(20),address VARCHAR(20),email VARCHAR(20),floor INT,resources VARCHAR(10)); INSERT INTO entries1 VALUES('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP'),('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR'); SELECT * FROM entries1;

-- +------+-----------+--------------+-------+-----------+
-- | name | address   | email        | floor | resources |
-- +------+-----------+--------------+-------+-----------+
-- | A    | Bangalore | A@gmail.com  |     1 | CPU       |
-- | A    | Bangalore | A1@gmail.com |     1 | CPU       |
-- | A    | Bangalore | A2@gmail.com |     2 | DESKTOP   |
-- | B    | Bangalore | B@gmail.com  |     2 | DESKTOP   |
-- | B    | Bangalore | B1@gmail.com |     2 | DESKTOP   |
-- | B    | Bangalore | B2@gmail.com |     1 | MONITOR   |
-- +------+-----------+--------------+-------+-----------+

-- o/p

-- +------+--------------------+--------------+-----------------+
-- | name | most_visited_floor | total_visits | used_resources  |
-- +------+--------------------+--------------+-----------------+
-- | A    |                  1 |            3 | CPU,DESKTOP     |
-- | B    |                  2 |            3 | DESKTOP,MONITOR |
-- +------+--------------------+--------------+-----------------+


WITH distinct_resources AS (
    SELECT DISTINCT 
        name,
        resources 
    FROM entries1
),

agg_resources AS (
    SELECT 
        name,
        GROUP_CONCAT(resources) AS used_resources 
    FROM distinct_resources 
    GROUP BY name
),

total_visits AS (
    SELECT 
        name,
        COUNT(1) AS total_visits,
        GROUP_CONCAT(resources) AS resources_used 
    FROM entries1 
    GROUP BY name
),

floor_visit AS (
    SELECT 
        name,
        floor,
        COUNT(1) AS no_of_floor_visit,
        RANK() OVER (
            PARTITION BY name 
            ORDER BY COUNT(1) DESC
        ) AS rn 
    FROM entries1 
    GROUP BY name, floor
)

SELECT 
    fv.name,
    fv.floor AS most_visited_floor,
    tv.total_visits,
    ar.used_resources 
FROM floor_visit fv 
INNER JOIN total_visits tv 
    ON fv.name = tv.name 
INNER JOIN agg_resources ar 
    ON fv.name = ar.name 
WHERE rn = 1;



-- ============================================================================================
-- 5) Pivot Unpivot
-- =============================================================================================
DROP TABLE IF EXISTS emp_compensation1; CREATE TABLE emp_compensation1(emp_id INT,salary_component_type VARCHAR(20),val INT); INSERT INTO emp_compensation1 VALUES(1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10),(2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8),(3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7); SELECT * FROM emp_compensation1;

-- +--------+-----------------------+-------+
-- | emp_id | salary_component_type |   val |
-- +--------+-----------------------+-------+
-- |      1 | salary                | 10000 |
-- |      1 | bonus                 |  5000 |
-- |      1 | hike_percent          |    10 |
-- |      2 | salary                | 15000 |
-- |      2 | bonus                 |  7000 |
-- |      2 | hike_percent          |     8 |
-- |      3 | salary                | 12000 |
-- |      3 | bonus                 |  6000 |
-- |      3 | hike_percent          |     7 |
-- +--------+-----------------------+-------+

-- o/p 

-- +--------+--------+-------+--------------+
-- | emp_id | salary | bonus | hike_percent |
-- +--------+--------+-------+--------------+
-- |      1 |  10000 |  5000 |           10 |
-- |      2 |  15000 |  7000 |            8 |
-- |      3 |  12000 |  6000 |            7 |
-- +--------+--------+-------+--------------+

select 
    emp_id,
    sum(case when salary_component_type = 'salary' then val end) as salary,
    sum(case when salary_component_type = 'bonus' then val end) as bonus,
    sum(case when salary_component_type = 'hike_percent' then val end) as hike_percent
from emp_compensation1
group by emp_id;


-- ============================================================================================
-- 6) Amazon Interview Questions-
-- =============================================================================================

-- How do I find the date of the $n$-th occurrence of a specific day of the week (specifically Sunday) following a given start date?"
declare @today_date date;
declare @n int;
set @today_date = '2022-01-01'; -- saturday
set @n = 3;

declare @today_date date;
declare @n int;
set @today_date = '2022-01-03'; -- saturday
set @n = 3;

select dateadd(week, @n-1, dateadd(day, 8 - datepart(weekday, @today_date), @today_date));


-- ============================================================================================
-- 7) Pareto principal-
-- =============================================================================================






-- ============================================================================================
-- 8) 
-- =============================================================================================
DROP TABLE IF EXISTS friend1; CREATE TABLE friend1(pid INT,fid INT); INSERT INTO friend1(pid,fid) VALUES(1,2); INSERT INTO friend1(pid,fid) VALUES(1,3); INSERT INTO friend1(pid,fid) VALUES(2,1); INSERT INTO friend1(pid,fid) VALUES(2,3); INSERT INTO friend1(pid,fid) VALUES(3,5); INSERT INTO friend1(pid,fid) VALUES(4,2); INSERT INTO friend1(pid,fid) VALUES(4,3); INSERT INTO friend1(pid,fid) VALUES(4,5); DROP TABLE IF EXISTS person1; CREATE TABLE person1(PersonID INT,Name VARCHAR(50),Score INT); INSERT INTO person1(PersonID,Name,Score) VALUES(1,'Alice',88); INSERT INTO person1(PersonID,Name,Score) VALUES(2,'Bob',11); INSERT INTO person1(PersonID,Name,Score) VALUES(3,'Devis',27); INSERT INTO person1(PersonID,Name,Score) VALUES(4,'Tara',45); INSERT INTO person1(PersonID,Name,Score) VALUES(5,'John',63); SELECT * FROM person1; SELECT * FROM friend1;

select *  from friend1;
-- +----------+-------+-------+
-- | PersonID | Name  | Score |
-- +----------+-------+-------+
-- |        1 | Alice |    88 |
-- |        2 | Bob   |    11 |
-- |        3 | Devis |    27 |
-- |        4 | Tara  |    45 |
-- |        5 | John  |    63 |
-- +----------+-------+-------+

select * from person1;
-- +-----+-----+
-- | pid | fid |
-- +-----+-----+
-- |   1 |   2 |
-- |   1 |   3 |
-- |   2 |   1 |
-- |   2 |   3 |
-- |   3 |   5 |
-- |   4 |   2 |
-- |   4 |   3 |
-- |   4 |   5 |

-- o/p

-- Find the persons whose total friends’ score is greater than 100 and display pid, total_friend_score, 
-- no_of_friends, and person_name using person1 and friend1 tables.

-- +-----+--------------------+---------------+-------------+
-- | pid | total_friend_score | no_of_friends | person_name |
-- +-----+--------------------+---------------+-------------+
-- |   2 |                115 |             2 | Bob         |
-- |   4 |                101 |             3 | Tara        |
-- +-----+--------------------+---------------+-------------+

WITH score_details AS (
    SELECT f.pid, 
           SUM(p.score) AS total_friend_score, 
           COUNT(1) AS no_of_friends
    FROM friend1 f
    INNER JOIN person1 p ON f.fid = p.personid
    GROUP BY f.pid
    HAVING SUM(p.score) > 100
)
SELECT s.*, p.name AS person_name
FROM person1 p
INNER JOIN score_details s ON p.personid = s.pid;







-- ============================================================================================
-- 9)  Where VS Having 
-- =============================================================================================

DROP TABLE IF EXISTS emp1; CREATE TABLE emp1(emp_id INT,emp_name VARCHAR(10),salary INT,manager_id INT); INSERT INTO emp1 VALUES(1,'Ankit',10000,4); INSERT INTO emp1 VALUES(2,'Mohit',15000,5); INSERT INTO emp1 VALUES(3,'Vikas',10000,4); INSERT INTO emp1 VALUES(4,'Rohit',5000,2); INSERT INTO emp1 VALUES(5,'Mudit',12000,6); INSERT INTO emp1 VALUES(6,'Agam',12000,2); INSERT INTO emp1 VALUES(7,'Sanjay',9000,2); INSERT INTO emp1 VALUES(8,'Ashish',5000,2); SELECT * FROM emp1;

-- +--------+----------+--------+------------+
-- | emp_id | emp_name | salary | manager_id |
-- +--------+----------+--------+------------+
-- |      1 | Ankit    |  10000 |          4 |
-- |      2 | Mohit    |  15000 |          5 |
-- |      3 | Vikas    |  10000 |          4 |
-- |      4 | Rohit    |   5000 |          2 |
-- |      5 | Mudit    |  12000 |          6 |
-- |      6 | Agam     |  12000 |          2 |
-- |      7 | Sanjay   |   9000 |          2 |
-- |      8 | Ashish   |   5000 |          2 |
-- +--------+----------+--------+------------+


-- ============================================================================================
-- 10 )  Trips and Users
-- =============================================================================================
DROP TABLE IF EXISTS Trips; CREATE TABLE Trips(id INT,client_id INT,driver_id INT,city_id INT,status VARCHAR(50),request_at VARCHAR(50)); INSERT INTO Trips VALUES(1,1,10,1,'completed','2013-10-01'); INSERT INTO Trips VALUES(2,2,11,1,'cancelled_by_driver','2013-10-01'); INSERT INTO Trips VALUES(3,3,12,6,'completed','2013-10-01'); INSERT INTO Trips VALUES(4,4,13,6,'cancelled_by_client','2013-10-01'); INSERT INTO Trips VALUES(5,1,10,1,'completed','2013-10-02'); INSERT INTO Trips VALUES(6,2,11,6,'completed','2013-10-02'); INSERT INTO Trips VALUES(7,3,12,6,'completed','2013-10-02'); INSERT INTO Trips VALUES(8,2,12,12,'completed','2013-10-03'); INSERT INTO Trips VALUES(9,3,10,12,'completed','2013-10-03'); INSERT INTO Trips VALUES(10,4,13,12,'cancelled_by_driver','2013-10-03'); DROP TABLE IF EXISTS Users; CREATE TABLE Users(users_id INT,banned VARCHAR(50),role VARCHAR(50)); INSERT INTO Users VALUES(1,'No','client'); INSERT INTO Users VALUES(2,'Yes','client'); INSERT INTO Users VALUES(3,'No','client'); INSERT INTO Users VALUES(4,'No','client'); INSERT INTO Users VALUES(10,'No','driver'); INSERT INTO Users VALUES(11,'No','driver'); INSERT INTO Users VALUES(12,'No','driver'); INSERT INTO Users VALUES(13,'No','driver');

-- +----+-----------+-----------+---------+---------------------+------------+
-- | id | client_id | driver_id | city_id | status              | request_at |
-- +----+-----------+-----------+---------+---------------------+------------+
-- |  1 |         1 |        10 |       1 | completed           | 2013-10-01 |
-- |  2 |         2 |        11 |       1 | cancelled_by_driver | 2013-10-01 |
-- |  3 |         3 |        12 |       6 | completed           | 2013-10-01 |
-- |  4 |         4 |        13 |       6 | cancelled_by_client | 2013-10-01 |
-- |  5 |         1 |        10 |       1 | completed           | 2013-10-02 |
-- |  6 |         2 |        11 |       6 | completed           | 2013-10-02 |
-- |  7 |         3 |        12 |       6 | completed           | 2013-10-02 |
-- |  8 |         2 |        12 |      12 | completed           | 2013-10-03 |
-- |  9 |         3 |        10 |      12 | completed           | 2013-10-03 |
-- | 10 |         4 |        13 |      12 | cancelled_by_driver | 2013-10-03 |
-- +----+-----------+-----------+---------+---------------------+------------+

-- Calculate daily cancelled trip count, total trips, and cancellation percentage considering only non-banned clients and drivers from Trips and Users tables.

-- op

-- | request_at | cancelled_trip_count | total_trips | cancelled_percent |
-- +------------+----------------------+-------------+-------------------+
-- | 2013-10-01 |                    1 |           3 |          33.33300 |
-- | 2013-10-02 |                    0 |           2 |           0.00000 |
-- | 2013-10-03 |                    1 |           2 |          50.00000 |
-- +------------+----------------------+-------------+-------------------+

SELECT request_at, 
       COUNT(CASE WHEN status IN ('cancelled_by_client', 'cancelled_by_driver') 
                 THEN 1 ELSE NULL END) AS cancelled_trip_count, 
       COUNT(1) AS total_trips, 
       1.0 * COUNT(CASE WHEN status IN ('cancelled_by_client', 'cancelled_by_driver') 
                        THEN 1 ELSE NULL END) / COUNT(1) * 100 AS cancelled_percent
FROM trips t
INNER JOIN users c ON t.client_id = c.users_id
INNER JOIN users d ON t.driver_id = d.users_id
WHERE c.banned = 'No' 
  AND d.banned = 'No'
GROUP BY request_at;


-- ============================================================================================
-- 11) Mediun Salary
-- =============================================================================================
DROP TABLE IF EXISTS emp2; CREATE TABLE emp2(emp_id INT,emp_name VARCHAR(20),department_id INT,salary INT,manager_id INT,emp_age INT); INSERT INTO emp2 VALUES(1,'Ankit',100,10000,4,39),(2,'Mohit',100,15000,5,48),(3,'Vikas',100,10000,4,37),(4,'Rohit',100,5000,2,16),(5,'Mudit',200,12000,6,55),(6,'Agam',200,12000,2,14),(7,'Sanjay',200,9000,2,13),(8,'Ashish',200,5000,2,12),(9,'Mukesh',300,6000,6,51),(10,'Rakesh',300,7000,6,50); SELECT * FROM emp2;
-- 
-- +--------+----------+---------------+--------+------------+---------+
-- | emp_id | emp_name | department_id | salary | manager_id | emp_age |
-- +--------+----------+---------------+--------+------------+---------+
-- |      1 | Ankit    |           100 |  10000 |          4 |      39 |
-- |      2 | Mohit    |           100 |  15000 |          5 |      48 |
-- |      3 | Vikas    |           100 |  10000 |          4 |      37 |
-- |      4 | Rohit    |           100 |   5000 |          2 |      16 |
-- |      5 | Mudit    |           200 |  12000 |          6 |      55 |
-- |      6 | Agam     |           200 |  12000 |          2 |      14 |
-- |      7 | Sanjay   |           200 |   9000 |          2 |      13 |
-- |      8 | Ashish   |           200 |   5000 |          2 |      12 |
-- |      9 | Mukesh   |           300 |   6000 |          6 |      51 |
-- |     10 | Rakesh   |           300 |   7000 |          6 |      50 |
-- +--------+----------+---------------+--------+------------+---------+

-- O/p:

-- +---------------+---------------+
-- | department_id | median_salary |
-- +---------------+---------------+
-- |           100 |    10000.0000 |
-- |           200 |    12000.0000 |
-- |           300 |     7000.0000 |
-- +---------------+---------------+

WITH ordered_salaries AS (
  SELECT 
    department_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary) AS rn,
    COUNT(*) OVER (PARTITION BY department_id) AS cnt
  FROM emp2
)
SELECT 
    department_id,
    AVG(salary) AS median_salary
FROM ordered_salaries
WHERE rn IN ( (cnt + 1) / 2, (cnt + 2) / 2 )   -- handles odd/even counts
GROUP BY department_id;



-- ============================================================================================
-- 12) - Tournament Winners
-- =============================================================================================

DROP TABLE IF EXISTS players; CREATE TABLE players(player_id INT,group_id INT); INSERT INTO players VALUES(15,1); INSERT INTO players VALUES(25,1); INSERT INTO players VALUES(30,1); INSERT INTO players VALUES(45,1); INSERT INTO players VALUES(10,2); INSERT INTO players VALUES(35,2); INSERT INTO players VALUES(50,2); INSERT INTO players VALUES(20,3); INSERT INTO players VALUES(40,3); DROP TABLE IF EXISTS matches; CREATE TABLE matches(match_id INT,first_player INT,second_player INT,first_score INT,second_score INT); INSERT INTO matches VALUES(1,15,45,3,0); INSERT INTO matches VALUES(2,30,25,1,2); INSERT INTO matches VALUES(3,30,15,2,0); INSERT INTO matches VALUES(4,40,20,5,2); INSERT INTO matches VALUES(5,35,50,1,1); SELECT * FROM players; SELECT * FROM matches;

select * from players;
-- +-----------+----------+
-- | player_id | group_id |
-- +-----------+----------+
-- |        15 |        1 |
-- |        25 |        1 |
-- |        30 |        1 |
-- |        45 |        1 |
-- |        10 |        2 |
-- |        35 |        2 |
-- |        50 |        2 |
-- |        20 |        3 |
-- |        40 |        3 |
-- +-----------+----------+

select * from matches;
-- +----------+--------------+---------------+-------------+--------------+
-- | match_id | first_player | second_player | first_score | second_score |
-- +----------+--------------+---------------+-------------+--------------+
-- |        1 |           15 |            45 |           3 |            0 |
-- |        2 |           30 |            25 |           1 |            2 |
-- |        3 |           30 |            15 |           2 |            0 |
-- |        4 |           40 |            20 |           5 |            2 |
-- |        5 |           35 |            50 |           1 |            1 |
-- +----------+--------------+---------------+-------------+--------------+

-- Find the top-scoring player from each group based on total match scores, and in case of a tie return the player with the smaller player_id.

-- o/p:

-- +----------+-----------+-------+----+
-- | group_id | player_id | score | rn |
-- +----------+-----------+-------+----+
-- |        1 |        15 |     3 |  1 |
-- |        2 |        35 |     1 |  1 |
-- |        3 |        40 |     5 |  1 |
-- +----------+-----------+-------+----+

WITH player_scores AS (
    SELECT first_player AS player_id, first_score AS score FROM matches
    UNION ALL
    SELECT second_player AS player_id, second_score AS score FROM matches
),
final_scores AS (
    SELECT p.group_id, ps.player_id, SUM(score) AS score
    FROM player_scores ps
    INNER JOIN players p ON p.player_id = ps.player_id
    GROUP BY p.group_id, ps.player_id
),
final_ranking AS (
    SELECT *,
           RANK() OVER(PARTITION BY group_id ORDER BY score DESC, player_id ASC) AS rn
    FROM final_scores
)
select * from final_ranking  where rn=1;

-- ============================================================================================
-- 13) - Market Data Analysis
-- =============================================================================================
DROP TABLE IF EXISTS users; CREATE TABLE users(user_id INT,join_date DATE,favorite_brand VARCHAR(50)); INSERT INTO users VALUES(1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP'); DROP TABLE IF EXISTS orders; CREATE TABLE orders(order_id INT,order_date DATE,item_id INT,buyer_id INT,seller_id INT); INSERT INTO orders VALUES(1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2),(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4); DROP TABLE IF EXISTS items; CREATE TABLE items(item_id INT,item_brand VARCHAR(50)); INSERT INTO items VALUES(1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP'); SELECT * FROM users; SELECT * FROM orders; SELECT * FROM items;

SELECT * FROM users; 
-- +---------+------------+----------------+
-- | user_id | join_date  | favorite_brand |
-- +---------+------------+----------------+
-- |       1 | 2019-01-01 | Lenovo         |
-- |       2 | 2019-02-09 | Samsung        |
-- |       3 | 2019-01-19 | LG             |
-- |       4 | 2019-05-21 | HP             |
-- +---------+------------+----------------+
SELECT * FROM orders; 
-- +----------+------------+---------+----------+-----------+
-- | order_id | order_date | item_id | buyer_id | seller_id |
-- +----------+------------+---------+----------+-----------+
-- |        1 | 2019-08-01 |       4 |        1 |         2 |
-- |        2 | 2019-08-02 |       2 |        1 |         3 |
-- |        3 | 2019-08-03 |       3 |        2 |         3 |
-- |        4 | 2019-08-04 |       1 |        4 |         2 |
-- |        5 | 2019-08-04 |       1 |        3 |         4 |
-- |        6 | 2019-08-05 |       2 |        2 |         4 |
-- +----------+------------+---------+----------+-----------+

SELECT * FROM items;

-- +---------+------------+
-- | item_id | item_brand |
-- +---------+------------+
-- |       1 | Samsung    |
-- |       2 | Lenovo     |
-- |       3 | LG         |
-- |       4 | HP         |
-- +---------+------------+

-- Find whether the second item sold by each seller matches their favorite brand, and return ‘Yes’ or ‘No’ for every seller.
-- o/p;
-- +-----------+----------------+
-- | seller_id | item_fav_brand |
-- +-----------+----------------+
-- |         1 | NO             |
-- |         2 | Yes            |
-- |         3 | Yes            |
-- |         4 | NO             |
-- +-----------+----------------+

with rnk_orders as
(select *,
rank() over(partition by seller_id order by order_date asc) as rn 
from orders
)
select u.user_id as seller_id
, case when i.item_brand=u.favorite_brand then 'Yes' else 'NO' end as item_fav_brand
from users u
LEFT join rnk_orders ro on ro.seller_id=u.user_id and rn=2
LEFT join items i on i.item_id=ro.item_id


-- ============================================================================================
-- 14)  Users Purchase Platform
-- =============================================================================================
DROP TABLE IF EXISTS spending; CREATE TABLE spending(user_id INT,spend_date DATE,platform VARCHAR(10),amount INT); INSERT INTO spending VALUES(1,'2019-07-01','mobile',100),(1,'2019-07-01','desktop',100),(2,'2019-07-01','mobile',100),(2,'2019-07-02','mobile',100),(3,'2019-07-01','desktop',100),(3,'2019-07-02','desktop',100); SELECT * FROM spending;

-- +---------+------------+----------+--------+
-- | user_id | spend_date | platform | amount |
-- +---------+------------+----------+--------+
-- |       1 | 2019-07-01 | mobile   |    100 |
-- |       1 | 2019-07-01 | desktop  |    100 |
-- |       2 | 2019-07-01 | mobile   |    100 |
-- |       2 | 2019-07-02 | mobile   |    100 |
-- |       3 | 2019-07-01 | desktop  |    100 |
-- |       3 | 2019-07-02 | desktop  |    100 |
-- +---------+------------+----------+--------+

-- Find the total amount spent and total users per day for each platform category (mobile, desktop, and both), where ‘both’ represents users who used both platforms on the same day.
-- +------------+----------+--------------+-------------+
-- | spend_date | platform | total_amount | total_users |
-- +------------+----------+--------------+-------------+
-- | 2019-07-01 | mobile   |          100 |           1 |
-- | 2019-07-01 | desktop  |          100 |           1 |
-- | 2019-07-01 | both     |          200 |           1 |
-- | 2019-07-02 | mobile   |          100 |           1 |
-- | 2019-07-02 | desktop  |          100 |           1 |
-- | 2019-07-02 | both     |            0 |           0 |
-- +------------+----------+--------------+-------------+


with all_spend as (
    select spend_date, user_id, max(platform) as platform, sum(amount) as amount from spending
    group by spend_date, user_id having count(distinct platform) = 1
    union all
    select spend_date, user_id, 'both' as platform, sum(amount) as amount from spending
    group by spend_date, user_id having count(distinct platform) = 2
    union all
    select distinct spend_date, null as user_id, 'both' as platform, 0 as amount from spending
)
select spend_date, platform, sum(amount) as total_amount, count(distinct user_id) as total_users
from all_spend
group by spend_date, platform
order by spend_date, platform desc


-- ============================================================================================
-- 15) -- Recursive CTE
-- =============================================================================================
DROP TABLE IF EXISTS sales; CREATE TABLE sales(product_id INT,period_start DATE,period_end DATE,average_daily_sales INT); INSERT INTO sales VALUES(1,'2019-01-25','2019-02-28',100),(2,'2018-12-01','2020-01-01',10),(3,'2019-12-01','2020-01-31',1); SELECT * FROM sales;

Select * from sales;

-- +------------+--------------+------------+---------------------+
-- | product_id | period_start | period_end | average_daily_sales |
-- +------------+--------------+------------+---------------------+
-- |          1 | 2019-01-25   | 2019-02-28 |                 100 |
-- |          2 | 2018-12-01   | 2020-01-01 |                  10 |
-- |          3 | 2019-12-01   | 2020-01-31 |                   1 |
-- +------------+--------------+------------+---------------------+

-- Find the yearly total sales amount for each product by expanding the date range between period_start and period_end and aggregating average_daily_sales for each year.


WITH RECURSIVE r_cte AS (
    -- Anchor Member: Find the start and end of the entire timeline
    SELECT 
        MIN(period_start) AS dates,
        MAX(period_end) AS max_date 
    FROM sales
    
    UNION ALL 
    
    -- Recursive Member: Increment day by day until max_date is reached
    SELECT 
        DATE_ADD(dates, INTERVAL 1 DAY) AS dates,
        max_date 
    FROM r_cte 
    WHERE dates < max_date
)

-- Final Evaluation: Aggregate sales per product for each calendar year

-- o/p:

-- +------------+-------------+--------------+
-- | product_id | report_year | total_amount |
-- +------------+-------------+--------------+
-- |          1 |        2019 |         3500 |
-- |          2 |        2018 |          310 |
-- |          2 |        2019 |         3650 |
-- |          2 |        2020 |           10 |
-- |          3 |        2019 |           31 |
-- |          3 |        2020 |           31 |
-- +------------+-------------+--------------+


-- ============================================================================================
-- 16) Amazon Prime Subscription rate-
-- =============================================================================================
DROP TABLE IF EXISTS users1; CREATE TABLE users1(user_id INTEGER,name VARCHAR(20),join_date DATE); INSERT INTO users1 VALUES(1,'Jon',CAST('2020-02-14' AS DATE)),(2,'Jane',CAST('2020-02-14' AS DATE)),(3,'Jill',CAST('2020-02-15' AS DATE)),(4,'Josh',CAST('2020-02-15' AS DATE)),(5,'Jean',CAST('2020-02-16' AS DATE)),(6,'Justin',CAST('2020-02-17' AS DATE)),(7,'Jeremy',CAST('2020-02-18' AS DATE)); DROP TABLE IF EXISTS events; CREATE TABLE events(user_id INTEGER,type VARCHAR(10),access_date DATE); INSERT INTO events VALUES(1,'Pay',CAST('2020-03-01' AS DATE)),(2,'Music',CAST('2020-03-02' AS DATE)),(2,'P',CAST('2020-03-12' AS DATE)),(3,'Music',CAST('2020-03-15' AS DATE)),(4,'Music',CAST('2020-03-15' AS DATE)),(1,'P',CAST('2020-03-16' AS DATE)),(3,'P',CAST('2020-03-22' AS DATE)); SELECT * FROM users1; SELECT * FROM events;

Select * from users1;
-- +---------+--------+------------+
-- | user_id | name   | join_date  |
-- +---------+--------+------------+
-- |       1 | Jon    | 2020-02-14 |
-- |       2 | Jane   | 2020-02-14 |
-- |       3 | Jill   | 2020-02-15 |
-- |       4 | Josh   | 2020-02-15 |
-- |       5 | Jean   | 2020-02-16 |
-- |       6 | Justin | 2020-02-17 |
-- |       7 | Jeremy | 2020-02-18 |
-- +---------+--------+------------+

select * from events;
-- +---------+-------+-------------+
-- | user_id | type  | access_date |
-- +---------+-------+-------------+
-- |       1 | Pay   | 2020-03-01  |
-- |       2 | Music | 2020-03-02  |
-- |       2 | P     | 2020-03-12  |
-- |       3 | Music | 2020-03-15  |
-- |       4 | Music | 2020-03-15  |
-- |       1 | P     | 2020-03-16  |
-- |       3 | P     | 2020-03-22  |
-- +---------+-------+-------------+

-- Find the percentage of users who purchased (‘P’) within 30 days of joining among users who accessed ‘Music’, along with total users and converted users.
-- +-------------+-------------+-------------------+
-- | total_users | total_trips | cancelled_percent |
-- +-------------+-------------+-------------------+
-- |           3 |           1 |          33.33333 |
-- +-------------+-------------+-------------------+

SELECT 
    COUNT(DISTINCT u.user_id) AS total_users,
    
    COUNT(DISTINCT CASE 
        WHEN DATEDIFF(e.access_date, u.join_date) <= 30 THEN u.user_id 
    END) AS total_trips,
    
    COUNT(DISTINCT CASE 
        WHEN DATEDIFF(e.access_date, u.join_date) <= 30 THEN u.user_id 
    END) * 100.0 / COUNT(DISTINCT u.user_id) AS cancelled_percent 
FROM users1 u 
LEFT JOIN events e 
    ON u.user_id = e.user_id 
    AND e.type = 'P' 
WHERE u.user_id IN (
    SELECT user_id 
    FROM events 
    WHERE type = 'Music'
);




-- ============================================================================================
-- 17) Data Science SQL Interview Questions-
-- =============================================================================================
DROP TABLE IF EXISTS orders1; CREATE TABLE orders1(order_id INT,customer_id INT,product_id INT); INSERT INTO orders1 VALUES(1,1,1),(1,1,2),(1,1,3),(2,2,1),(2,2,2),(2,2,4),(3,1,5); DROP TABLE IF EXISTS products; CREATE TABLE products(id INT,name VARCHAR(10)); INSERT INTO products VALUES(1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'); SELECT * FROM orders1; SELECT * FROM products;

select * from orders1;
-- +----------+-------------+------------+
-- | order_id | customer_id | product_id |
-- +----------+-------------+------------+
-- |        1 |           1 |          1 |
-- |        1 |           1 |          2 |
-- |        1 |           1 |          3 |
-- |        2 |           2 |          1 |
-- |        2 |           2 |          2 |
-- |        2 |           2 |          4 |
-- |        3 |           1 |          5 |
-- +----------+-------------+------------+

Select * from Products1;
-- +----+------+
-- | id | name |
-- +----+------+
-- |  1 | A    |
-- |  2 | B    |
-- |  3 | C    |
-- |  4 | D    |
-- |  5 | E    |
-- +----+------+


-- o/p:

-- Find the frequency of each pair of products purchased together in the same order and display the product pair along with the number of times it was purchased together.

-- +------+---------------+
-- | pair | purchase_freq |
-- +------+---------------+
-- | AB   |             2 |
-- | AC   |             1 |
-- | BC   |             1 |
-- | AD   |             1 |
-- | BD   |             1 |
-- +------+---------------+



SELECT 
    CONCAT(LEAST(p1.name, p2.name), GREATEST(p1.name, p2.name)) AS pair,
    COUNT(*) AS purchase_freq 
FROM orders1 o1 
INNER JOIN orders1 o2 
    ON o1.order_id = o2.order_id 
    AND o1.product_id < o2.product_id 
INNER JOIN products p1 
    ON o1.product_id = p1.id 
INNER JOIN products p2 
    ON o2.product_id = p2.id 
GROUP BY 
    CONCAT(LEAST(p1.name, p2.name), GREATEST(p1.name, p2.name)) 
ORDER BY 
    purchase_freq DESC;



-- ============================================================================================
-- 18) Customer retension and chum analysis part 1
-- =============================================================================================
DROP TABLE IF EXISTS transactions; CREATE TABLE transactions(order_id INT,cust_id INT,order_date DATE,amount INT); DELETE FROM transactions; INSERT INTO transactions VALUES(1,1,'2020-01-15',150),(2,1,'2020-02-10',150),(3,2,'2020-01-16',150),(4,2,'2020-02-25',150),(5,3,'2020-01-10',150),(6,3,'2020-02-20',150),(7,4,'2020-01-20',150),(8,5,'2020-02-20',150); SELECT * FROM transactions;

-- +----------+---------+------------+--------+
-- | order_id | cust_id | order_date | amount |
-- +----------+---------+------------+--------+
-- |        1 |       1 | 2020-01-15 |    150 |
-- |        2 |       1 | 2020-02-10 |    150 |
-- |        3 |       2 | 2020-01-16 |    150 |
-- |        4 |       2 | 2020-02-25 |    150 |
-- |        5 |       3 | 2020-01-10 |    150 |
-- |        6 |       3 | 2020-02-20 |    150 |
-- |        7 |       4 | 2020-01-20 |    150 |
-- |        8 |       5 | 2020-02-20 |    150 |
-- +----------+---------+------------+--------+

-- Find the number of repeat customers for each month, where a repeat customer is someone who placed orders in consecutive months.

-- o/p:

-- +------------+------------------+
-- | month_date | repeat_customers |
-- +------------+------------------+
-- |          1 |                0 |
-- |          2 |                2 |
-- +------------+------------------+

SELECT 
    MONTH(this_month.order_date) AS month_date,
    COUNT(DISTINCT last_month.cust_id) AS repeat_customers 
FROM transactions this_month 
LEFT JOIN transactions last_month 
    ON this_month.cust_id = last_month.cust_id 
    AND TIMESTAMPDIFF(MONTH, last_month.order_date, this_month.order_date) = 1 
GROUP BY 
    MONTH(this_month.order_date);

-- ============================================================================================
-- 19) Customer retension and chum analysis part 2
-- =============================================================================================
DROP TABLE IF EXISTS transactions1; CREATE TABLE transactions1(order_id INT,cust_id INT,order_date DATE,amount INT); DELETE FROM transactions1; INSERT INTO transactions1 VALUES(1,1,'2020-01-15',150),(2,1,'2020-02-10',150),(3,2,'2020-01-16',150),(4,2,'2020-02-25',150),(5,3,'2020-01-10',150),(6,3,'2020-02-20',150),(7,4,'2020-01-20',150),(8,5,'2020-02-20',150); SELECT * FROM transactions1;

-- +----------+---------+------------+--------+
-- | order_id | cust_id | order_date | amount |
-- +----------+---------+------------+--------+
-- |        1 |       1 | 2020-01-15 |    150 |
-- |        2 |       1 | 2020-02-10 |    150 |
-- |        3 |       2 | 2020-01-16 |    150 |
-- |        4 |       2 | 2020-02-25 |    150 |
-- |        5 |       3 | 2020-01-10 |    150 |
-- |        6 |       3 | 2020-02-20 |    150 |
-- |        7 |       4 | 2020-01-20 |    150 |
-- |        8 |       5 | 2020-02-20 |    150 |
-- +----------+---------+------------+--------+


-- “Find customers who made a transaction in a given month but did not make any transaction in the next month.”**
-- o/p:

-- +------------+------------------------------+
-- | month_date | customers_without_next_month |
-- +------------+------------------------------+
-- |          1 |                            1 |
-- |          2 |                            4 |
-- +------------+------------------------------+


WITH cte AS (
    SELECT 
        cust_id,
        order_date,
        MONTH(order_date) AS month_date,
        LEAD(MONTH(order_date)) OVER (
            PARTITION BY cust_id 
            ORDER BY order_date
        ) AS next_month
    FROM transactions
)
SELECT 
    month_date,
    COUNT(DISTINCT cust_id) AS customers_without_next_month
FROM cte
WHERE next_month IS NULL OR next_month <> month_date + 1
GROUP BY month_date;


-- ============================================================================================
-- 20) LeetCode Hard SQl Queations.
-- =============================================================================================

DROP TABLE IF EXISTS UserActivity; CREATE TABLE UserActivity(username VARCHAR(20), activity VARCHAR(20), startDate DATE, endDate DATE); INSERT INTO UserActivity VALUES ('Alice','Travel','2020-02-12','2020-02-20'),('Alice','Dancing','2020-02-21','2020-02-23'),('Alice','Travel','2020-02-24','2020-02-28'),('Bob','Travel','2020-02-11','2020-02-18');

-- +----------+----------+------------+------------+
-- | username | activity | startDate  | endDate    |
-- +----------+----------+------------+------------+
-- | Alice    | Travel   | 2020-02-12 | 2020-02-20 |
-- | Alice    | Dancing  | 2020-02-21 | 2020-02-23 |
-- | Alice    | Travel   | 2020-02-24 | 2020-02-28 |
-- | Bob      | Travel   | 2020-02-11 | 2020-02-18 |
-- +----------+----------+------------+------------+




-- "Return the second most recent activity for each user. If a user has only one activity, return that activity."
-- o/p

-- +----------+----------+------------+------------+------------------+-----+
-- | username | activity | startDate  | endDate    | total_activities | rnk |
-- +----------+----------+------------+------------+------------------+-----+
-- | Alice    | Dancing  | 2020-02-21 | 2020-02-23 |                3 |   2 |
-- | Bob      | Travel   | 2020-02-11 | 2020-02-18 |                1 |   1 |
-- +----------+----------+------------+------------+------------------+-----+


WITH cte AS (
    SELECT 
        *, 
        COUNT(*) OVER(PARTITION BY username) AS total_activities, 
        ROW_NUMBER() OVER(PARTITION BY username ORDER BY startDate DESC) AS rnk 
    FROM 
        UserActivity
) 
SELECT 
    username, 
    activity, 
    startDate, 
    endDate, 
    total_activities, 
    rnk 
FROM 
    cte 
WHERE 
    (total_activities = 1 AND rnk = 1) 
    OR (total_activities > 1 AND rnk = 2);




-- ============================================================================================
-- 21-- **"Calculate the total billing amount for each employee by applying the billing rate that was effective on the date the hours were worked."**

-- =============================================================================================
DROP TABLE IF EXISTS billings; CREATE TABLE billings(emp_name VARCHAR(10), bill_date DATE, bill_rate INT); INSERT INTO billings VALUES ('Sachin','1990-01-01',25),('Sehwag','1989-01-01',15),('Dhoni','1989-01-01',20),('Sachin','1991-02-05',30); DROP TABLE IF EXISTS HoursWorked; CREATE TABLE HoursWorked(emp_name VARCHAR(20), work_date DATE, bill_hrs INT); INSERT INTO HoursWorked VALUES ('Sachin','1990-07-01',3),('Sachin','1990-08-01',5),('Sehwag','1990-07-01',2),('Sachin','1991-07-01',4);
-- +----------+------------+-----------+
-- | emp_name | bill_date  | bill_rate |
-- +----------+------------+-----------+
-- | Sachin   | 1990-01-01 |        25 |
-- | Sehwag   | 1989-01-01 |        15 |
-- | Dhoni    | 1989-01-01 |        20 |
-- | Sachin   | 1991-02-05 |        30 |
-- +----------+------------+-----------+


-- **"Calculate the total billing amount for each employee by applying the billing rate that was effective on the date the hours were worked."**

-- o/p

-- +----------+------------+
-- | emp_name | total_bill |
-- +----------+------------+
-- | Sachin   |        320 |
-- | Sehwag   |         30 |
-- +----------+------------+

WITH date_range AS (
    SELECT *,
           LEAD(DATE_SUB(bill_date, INTERVAL 1 DAY), 1, '9999-12-31')
           OVER(PARTITION BY emp_name ORDER BY bill_date) AS bill_date_end
    FROM billings
)
SELECT hw.emp_name,
       SUM(dr.bill_rate * hw.bill_hrs) AS total_bill
FROM date_range dr
JOIN HoursWorked hw
  ON hw.emp_name = dr.emp_name
 AND hw.work_date BETWEEN dr.bill_date AND dr.bill_date_end
GROUP BY hw.emp_name;





-- ============================================================================================
-- 22) Spotyfy case studies
-- =============================================================================================

DROP TABLE IF EXISTS activity; CREATE TABLE activity(user_id VARCHAR(20), event_name VARCHAR(20), event_date DATE, country VARCHAR(20)); INSERT INTO activity VALUES (1,'app-installed','2022-01-01','India'),(1,'app-purchase','2022-01-02','India'),(2,'app-installed','2022-01-01','USA'),(3,'app-installed','2022-01-01','USA'),(3,'app-purchase','2022-01-03','USA'),(4,'app-installed','2022-01-03','India'),(4,'app-purchase','2022-01-03','India'),(5,'app-installed','2022-01-03','SL'),(5,'app-purchase','2022-01-03','SL'),(6,'app-installed','2022-01-04','Pakistan'),(6,'app-purchase','2022-01-04','Pakistan');

-- +---------+---------------+------------+----------+
-- | user_id | event_name    | event_date | country  |
-- +---------+---------------+------------+----------+
-- | 1       | app-installed | 2022-01-01 | India    |
-- | 1       | app-purchase  | 2022-01-02 | India    |
-- | 2       | app-installed | 2022-01-01 | USA      |
-- | 3       | app-installed | 2022-01-01 | USA      |
-- | 3       | app-purchase  | 2022-01-03 | USA      |
-- | 4       | app-installed | 2022-01-03 | India    |
-- | 4       | app-purchase  | 2022-01-03 | India    |
-- | 5       | app-installed | 2022-01-03 | SL       |
-- | 5       | app-purchase  | 2022-01-03 | SL       |
-- | 6       | app-installed | 2022-01-04 | Pakistan |
-- | 6       | app-purchase  | 2022-01-04 | Pakistan |
-- +---------+---------------+------------+----------+


-- Fine the total acrive users each day?

SELECT event_date, COUNT(DISTINCT user_id) AS total_active_users FROM activity GROUP BY event_date ORDER BY event_date;

-- Find the total active users each week?

SELECT YEAR(event_date) AS year_no, WEEK(event_date) AS week_no, COUNT(DISTINCT user_id) AS total_active_users FROM activity GROUP BY YEAR(event_date), WEEK(event_date) ORDER BY year_no, week_no;

-- "Find the number of users per date who purchased the app on the same day they installed it."

SELECT a.event_date, COUNT(DISTINCT a.user_id) AS active_users_same_day_purchase FROM activity a JOIN activity b ON a.user_id = b.user_id AND a.event_date = b.event_date WHERE a.event_name = 'app-installed' AND b.event_name = 'app-purchase' GROUP BY a.event_date ORDER BY a.event_date;

SELECT event_date, COUNT(DISTINCT CASE WHEN purchase_flag = 1 THEN user_id END) AS active_users_same_day_purchase FROM (SELECT user_id, event_date, MAX(CASE WHEN event_name='app-installed' THEN 1 ELSE 0 END) AS install_flag, MAX(CASE WHEN event_name='app-purchase' THEN 1 ELSE 0 END) AS purchase_flag FROM activity GROUP BY user_id, event_date) t WHERE install_flag = 1 GROUP BY event_date ORDER BY event_date;

-- "Find the percentage of paid users by country, showing India and USA separately and grouping all other countries as 'Others'."

WITH paid_users AS (SELECT DISTINCT user_id, CASE WHEN country IN ('India','USA') THEN country ELSE 'Others' END AS country_group FROM activity WHERE event_name = 'app-purchase') SELECT country_group, COUNT(*) AS paid_users, ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS percentage_paid_users FROM paid_users GROUP BY country_group;


-- "For each install date, find how many users made an in-app purchase on the very next day after installing the app."
SELECT i.event_date AS install_date, COUNT(DISTINCT i.user_id) AS users_purchased_next_day FROM activity i JOIN activity p ON i.user_id = p.user_id AND p.event_name = 'app-purchase' AND p.event_date = DATE_ADD(i.event_date, INTERVAL 1 DAY) WHERE i.event_name = 'app-installed' GROUP BY i.event_date ORDER BY i.event_date;



-- ============================================================================================
-- 23) Consecutive Empty seats
-- =============================================================================================

DROP TABLE IF EXISTS bms; CREATE TABLE bms(seat_no INT, is_empty VARCHAR(10)); INSERT INTO bms VALUES (1,'N'),(2,'Y'),(3,'N'),(4,'Y'),(5,'Y'),(6,'Y'),(7,'N'),(8,'Y'),(9,'Y'),(10,'Y'),(11,'Y'),(12,'N'),(13,'Y'),(14,'Y');

-- +---------+----------+
-- | seat_no | is_empty |
-- +---------+----------+
-- |       1 | N        |
-- |       2 | Y        |
-- |       3 | N        |
-- |       4 | Y        |
-- |       5 | Y        |
-- |       6 | Y        |
-- |       7 | N        |
-- |       8 | Y        |
-- |       9 | Y        |
-- |      10 | Y        |
-- |      11 | Y        |
-- |      12 | N        |
-- |      13 | Y        |
-- |      14 | Y        |
-- +---------+----------+



-- "Find all seats that belong to a block of at least 3 consecutive empty seats (Y)."
-- METHOD 1

select * from (
    select *,
        lag(is_empty, 1) over (order by seat_no) as prev_1,
        lag(is_empty, 2) over (order by seat_no) as prev_2,
        lead(is_empty, 1) over (order by seat_no) as next_1,
        lead(is_empty, 2) over (order by seat_no) as next_2
    from bms
) A
where is_empty = 'Y' and prev_1 = 'Y' and prev_2 = 'Y'
   or (is_empty = 'Y' and prev_1 = 'Y' and next_1 = 'Y')
   or (is_empty = 'Y' and next_1 = 'Y' and next_2 = 'Y');

-- METHOD 2

select * from (
    select *,
        sum(case when is_empty = 'Y' then 1 else 0 end) over (
            order by seat_no rows between 2 preceding and current row
        ) as prev_2,
        sum(case when is_empty = 'Y' then 1 else 0 end) over (
            order by seat_no rows between 1 preceding and 1 following
        ) as prev_next_1,
        sum(case when is_empty = 'Y' then 1 else 0 end) over (
            order by seat_no rows between current row and 2 following
        ) as next_2
    from bms
) a
where prev_2 = 3 or prev_next_1 = 3 or next_2 = 3;


-- METHOD 3

with diff_num as (
  select
    *,
    row_number() over(order by seat_no) as rn,
    seat_no - row_number() over(order by seat_no) as diff
  from bms
  where is_empty = 'Y'
),
cnt as (
  select
    diff,
    count(1) as c
  from diff_num
  group by diff
  having count(1) >= 3
)
select
  *
from diff_num
where diff in (
  select
    diff
  from cnt
);





-- ============================================================================================
-- 24) -- Missing Quarter using 3 methods
-- =============================================================================================

DROP TABLE IF EXISTS STORES; CREATE TABLE STORES(Store VARCHAR(10), Quarter VARCHAR(10), Amount INT); INSERT INTO STORES VALUES ('S1','Q1',200),('S1','Q2',300),('S1','Q4',400),('S2','Q1',500),('S2','Q3',600),('S2','Q4',700),('S3','Q1',800),('S3','Q2',750),('S3','Q3',900);
--  Method 1

SELECT
    store,
    CONCAT('Q', 10 - SUM(CAST(RIGHT(quarter,1) AS UNSIGNED))) AS q_no
FROM stores
GROUP BY store;

-- Method 2

WITH RECURSIVE cte AS (
    SELECT DISTINCT store, 1 AS q_no
    FROM stores

    UNION ALL

    SELECT store, q_no + 1
    FROM cte
    WHERE q_no < 4
),
q AS (
    SELECT store, CONCAT('Q', q_no) AS q_no
    FROM cte
)
SELECT q.*
FROM q
LEFT JOIN stores s
    ON q.store = s.store
   AND q.q_no = s.quarter
WHERE s.store IS NULL;

--  Method 3


with cte as (
  select distinct
    s1.store,
    s2.quarter
  from stores s1, stores s2
)
select
  q.*
from cte q
left join stores s
  on q.store = s.store and q.quarter = s.quarter
where
  s.store is null;


-- ============================================================================================
-- 25  Deadly combination of  having and group by clause
-- =============================================================================================

DROP TABLE IF EXISTS exams; CREATE TABLE exams(student_id INT, subject VARCHAR(20), marks INT); INSERT INTO exams VALUES (1,'Chemistry',91),(1,'Physics',91),(2,'Chemistry',80),(2,'Physics',90),(3,'Chemistry',80),(4,'Chemistry',71),(4,'Physics',54);
-- +------------+-----------+-------+
-- | student_id | subject   | marks |
-- +------------+-----------+-------+
-- |          1 | Chemistry |    91 |
-- |          1 | Physics   |    91 |
-- |          2 | Chemistry |    80 |
-- |          2 | Physics   |    90 |
-- |          3 | Chemistry |    80 |
-- |          4 | Chemistry |    71 |
-- |          4 | Physics   |    54 |
-- +------------+-----------+-------+

-- "Find students who scored the same marks in both Chemistry and Physics."

select
  student_id
from exams
where
  subject in ('Chemistry', 'Physics')
group by
  student_id
having
  count(distinct subject) = 2 and count(distinct marks) = 1;




-- ============================================================================================
--  26 --Return cities where every day's cases are greater than the previous day's cases.
-- =============================================================================================
DROP TABLE IF EXISTS covid; CREATE TABLE covid(city VARCHAR(50), days DATE, cases INT); INSERT INTO covid VALUES ('DELHI','2022-01-01',100),('DELHI','2022-01-02',200),('DELHI','2022-01-03',300),('MUMBAI','2022-01-01',100),('MUMBAI','2022-01-02',100),('MUMBAI','2022-01-03',300),('CHENNAI','2022-01-01',100),('CHENNAI','2022-01-02',200),('CHENNAI','2022-01-03',150),('BANGALORE','2022-01-01',100),('BANGALORE','2022-01-02',300),('BANGALORE','2022-01-03',200),('BANGALORE','2022-01-04',400);

-- +-----------+------------+-------+
-- | city      | days       | cases |
-- +-----------+------------+-------+
-- | DELHI     | 2022-01-01 |   100 |
-- | DELHI     | 2022-01-02 |   200 |
-- | DELHI     | 2022-01-03 |   300 |
-- | MUMBAI    | 2022-01-01 |   100 |
-- | MUMBAI    | 2022-01-02 |   100 |
-- | MUMBAI    | 2022-01-03 |   300 |
-- | CHENNAI   | 2022-01-01 |   100 |
-- | CHENNAI   | 2022-01-02 |   200 |
-- | CHENNAI   | 2022-01-03 |   150 |
-- | BANGALORE | 2022-01-01 |   100 |
-- | BANGALORE | 2022-01-02 |   300 |
-- | BANGALORE | 2022-01-03 |   200 |
-- | BANGALORE | 2022-01-04 |   400 |
-- +-----------+------------+-------+


-- Return cities where every day's cases are greater than the previous day's cases.

WITH cte AS (
    SELECT city,
           days,
           cases,
           LAG(cases) OVER(PARTITION BY city ORDER BY days) AS prev_cases
    FROM covid
)
SELECT city
FROM cte
GROUP BY city
HAVING SUM(CASE WHEN prev_cases IS NOT NULL AND cases <= prev_cases THEN 1 ELSE 0 END) = 0;



-- ============================================================================================
--  27) --"Find companies that have at least two users who speak both English and German."
-- =============================================================================================

DROP TABLE IF EXISTS company_users; CREATE TABLE company_users(company_id INT, user_id INT, language VARCHAR(20)); INSERT INTO company_users VALUES (1,1,'English'),(1,1,'German'),(1,2,'English'),(1,3,'German'),(1,3,'English'),(1,4,'English'),(2,5,'English'),(2,5,'German'),(2,5,'Spanish'),(2,6,'German'),(2,6,'Spanish'),(2,7,'English');

-- +------------+---------+----------+
-- | company_id | user_id | language |
-- +------------+---------+----------+
-- |          1 |       1 | English  |
-- |          1 |       1 | German   |
-- |          1 |       2 | English  |
-- |          1 |       3 | German   |
-- |          1 |       3 | English  |
-- |          1 |       4 | English  |
-- |          2 |       5 | English  |
-- |          2 |       5 | German   |
-- |          2 |       5 | Spanish  |
-- |          2 |       6 | German   |
-- |          2 |       6 | Spanish  |
-- |          2 |       7 | English  |
-- +------------+---------+----------+



select
  company_id,
  count(1)
from
  (
    select
      company_id,
      user_id
    from
      company_users
    where
      language in ('English', 'German')
    group by
      company_id,
      user_id
    having
      count(1) = 2
  ) a
group by
  company_id
having
  count(1) >= 2;




-- ============================================================================================
-- 28) -"For each customer, find the maximum number of products that can be purchased within their budget when products are selected from the cheapest to the most expensive."
-- =============================================================================================

DROP TABLE IF EXISTS products; CREATE TABLE products(product_id VARCHAR(20), cost INT); INSERT INTO products VALUES ('P1',200),('P2',300),('P3',500),('P4',800); DROP TABLE IF EXISTS customer_budget; CREATE TABLE customer_budget(customer_id INT, budget INT); INSERT INTO customer_budget VALUES (100,400),(200,800),(300,1500);

-- +------------+------+
-- | product_id | cost |
-- +------------+------+
-- | P1         |  200 |
-- | P2         |  300 |
-- | P3         |  500 |
-- | P4         |  800 |
-- +------------+------+

-- "For each customer, find the maximum number of products that can be purchased within their budget when products are selected from the cheapest to the most expensive."
-- o/p

-- +-------------+--------+----------------+------------------+
-- | customer_id | budget | no_of_products | list_of_products |
-- +-------------+--------+----------------+------------------+
-- |         100 |    400 |              1 | P1               |
-- |         200 |    800 |              2 | P1,P2            |
-- |         300 |   1500 |              3 | P1,P2,P3         |
-- +-------------+--------+----------------+------------------+

WITH running_cost AS (
    SELECT *,
           SUM(cost) OVER (ORDER BY cost) AS r_cost
    FROM products
)
SELECT customer_id,
       budget,
       COUNT(product_id) AS no_of_products,
       GROUP_CONCAT(product_id ORDER BY cost SEPARATOR ',') AS list_of_products
FROM customer_budget cb
LEFT JOIN running_cost rc
    ON rc.r_cost <= cb.budget
GROUP BY customer_id, budget;


-- ============================================================================================
-- 29) "Calculate the total number of SMS exchanged between every pair of users on each date, irrespective of who sent or received the messages."
-- =============================================================================================

DROP TABLE IF EXISTS subscriber; CREATE TABLE subscriber(sms_date DATE, sender VARCHAR(20), receiver VARCHAR(20), sms_no INT); INSERT INTO subscriber VALUES ('2020-04-01','Avinash','Vibhor',10),('2020-04-01','Vibhor','Avinash',20),('2020-04-01','Avinash','Pawan',30),('2020-04-01','Pawan','Avinash',20),('2020-04-01','Vibhor','Pawan',5),('2020-04-01','Pawan','Vibhor',8),('2020-04-01','Vibhor','Deepak',50);

-- +------------+---------+----------+--------+
-- | sms_date   | sender  | receiver | sms_no |
-- +------------+---------+----------+--------+
-- | 2020-04-01 | Avinash | Vibhor   |     10 |
-- | 2020-04-01 | Vibhor  | Avinash  |     20 |
-- | 2020-04-01 | Avinash | Pawan    |     30 |
-- | 2020-04-01 | Pawan   | Avinash  |     20 |
-- | 2020-04-01 | Vibhor  | Pawan    |      5 |
-- | 2020-04-01 | Pawan   | Vibhor   |      8 |
-- | 2020-04-01 | Vibhor  | Deepak   |     50 |
-- +------------+---------+----------+--------+

-- o/p
-- "Calculate the total number of SMS exchanged between every pair of users on each date, irrespective of who sent or received the messages."
-- +------------+---------+--------+-----------+
-- | sms_date   | p1      | p2     | total_sms |
-- +------------+---------+--------+-----------+
-- | 2020-04-01 | Avinash | Vibhor |        30 |
-- | 2020-04-01 | Avinash | Pawan  |        50 |
-- | 2020-04-01 | Pawan   | Vibhor |        13 |
-- | 2020-04-01 | Deepak  | Vibhor |        50 |
-- +------------+---------+--------+-----------+


select sms_date, p1, p2, sum(sms_no) as total_sms 
from (
    select sms_date, 
           case when sender < receiver then sender else receiver end as p1,
           case when sender > receiver then sender else receiver end as p2,
           sms_no
    from subscriber
) A
group by sms_date, p1, p2;


-- ============================================================================================
-- 30)
-- =============================================================================================
DROP TABLE IF EXISTS students; CREATE TABLE students(studentid INT, studentname VARCHAR(255), subject VARCHAR(255), marks INT, testid INT, testdate DATE); INSERT INTO students VALUES (2,'Max Ruin','Subject1',63,1,'2022-01-02'),(3,'Arnold','Subject1',95,1,'2022-01-02'),(4,'Krish Star','Subject1',61,1,'2022-01-02'),(5,'John Mike','Subject1',91,1,'2022-01-02'),(4,'Krish Star','Subject2',71,1,'2022-01-02'),(3,'Arnold','Subject2',32,1,'2022-01-02'),(5,'John Mike','Subject2',61,2,'2022-11-02'),(1,'John Deo','Subject2',60,1,'2022-01-02'),(2,'Max Ruin','Subject2',84,1,'2022-01-02'),(2,'Max Ruin','Subject3',29,3,'2022-01-03'),(5,'John Mike','Subject3',98,2,'2022-11-02');

-- +-----------+-------------+----------+-------+--------+------------+
-- | studentid | studentname | subject  | marks | testid | testdate   |
-- +-----------+-------------+----------+-------+--------+------------+
-- |         2 | Max Ruin    | Subject1 |    63 |      1 | 2022-01-02 |
-- |         3 | Arnold      | Subject1 |    95 |      1 | 2022-01-02 |
-- |         4 | Krish Star  | Subject1 |    61 |      1 | 2022-01-02 |
-- |         5 | John Mike   | Subject1 |    91 |      1 | 2022-01-02 |
-- |         4 | Krish Star  | Subject2 |    71 |      1 | 2022-01-02 |
-- |         3 | Arnold      | Subject2 |    32 |      1 | 2022-01-02 |
-- |         5 | John Mike   | Subject2 |    61 |      2 | 2022-11-02 |
-- |         1 | John Deo    | Subject2 |    60 |      1 | 2022-01-02 |
-- |         2 | Max Ruin    | Subject2 |    84 |      1 | 2022-01-02 |
-- |         2 | Max Ruin    | Subject3 |    29 |      3 | 2022-01-03 |
-- |         5 | John Mike   | Subject3 |    98 |      2 | 2022-11-02 |
-- +-----------+-------------+----------+-------+--------+------------+


-- Problem 1 -- Find students who scored above the average marks in their respective subjects.

with avg_cte as (
    select subject, avg(marks) as avg_marks 
    from students
    group by subject
)
select 
    s.*, ac.*
from students s
inner join avg_cte ac on s.subject = ac.subject
where s.marks > ac.avg_marks;


-- Problem 2 -- What percentage of students scored more than 90 marks in at least one subject?

select
    count(distinct case when marks > 90 then studentid else null end) * 1.0 / count(distinct studentid) * 100 as perc
from students;


-- Problem 3 -- For each subject, find the second highest and second lowest marks.

select 
    subject,
    sum(case when rnk_desc = 2 then marks else null end) as second_highest_marks,
    sum(case when rnk_asc = 2 then marks else null end) as second_lowest_marks
from
(
    select 
        subject,
        marks,
        rank() over(partition by subject order by marks asc) as rnk_asc,
        rank() over(partition by subject order by marks desc) as rnk_desc
    from students
) A
group by subject;


-- Problem 4 -- For each student, determine whether their marks increased or decreased compared to their previous test.

select 
    *,
    case 
        when marks > prev_marks then 'inc'
        when marks < prev_marks then 'dec'
        else null 
    end as statys
from (
    select 
        *,
        lag(marks,1) over(partition by studentid order by testdate, subject) as prev_marks
    from students
) A;




-- ============================================================================================
-- 31) -- Find the order details (order_number, order_date, cust_id, salesperson_id, amount) for each salesperson where the order amount is the maximum among all orders placed by that salesperson.

-- =============================================================================================

DROP TABLE IF EXISTS int_orders; CREATE TABLE int_orders(order_number INT NOT NULL, order_date DATE NOT NULL, cust_id INT NOT NULL, salesperson_id INT NOT NULL, amount FLOAT NOT NULL); INSERT INTO int_orders VALUES (30,'1995-07-14',9,1,460),(10,'1996-08-02',4,2,540),(40,'1998-01-29',7,2,2400),(50,'1998-02-03',6,7,600),(60,'1998-03-02',6,7,720),(70,'1998-05-06',9,7,150),(20,'1999-01-30',4,8,1800);

SELECT * FROM int_orders;
-- +--------------+------------+---------+----------------+--------+
-- | order_number | order_date | cust_id | salesperson_id | amount |
-- +--------------+------------+---------+----------------+--------+
-- |           30 | 1995-07-14 |       9 |              1 |  460.0 |
-- |           10 | 1996-08-02 |       4 |              2 |  540.0 |
-- |           40 | 1998-01-29 |       7 |              2 | 2400.0 |
-- |           50 | 1998-02-03 |       6 |              7 |  600.0 |
-- |           60 | 1998-03-02 |       6 |              7 |  720.0 |
-- |           70 | 1998-05-06 |       9 |              7 |  150.0 |
-- |           20 | 1999-01-30 |       4 |              8 | 1800.0 |
-- +--------------+------------+---------+----------------+--------+
-- Find the order details (order_number, order_date, cust_id, salesperson_id, amount) for each salesperson where the order amount is the maximum among all orders placed by that salesperson.

-- o/p 

-- +--------------+------------+---------+----------------+--------+
-- | order_number | order_date | cust_id | salesperson_id | amount |
-- +--------------+------------+---------+----------------+--------+
-- |           30 | 1995-07-14 |       9 |              1 |  460.0 |
-- |           40 | 1998-01-29 |       7 |              2 | 2400.0 |
-- |           60 | 1998-03-02 |       6 |              7 |  720.0 |
-- |           20 | 1999-01-30 |       4 |              8 | 1800.0 |
-- +--------------+------------+---------+----------------+--------+

SELECT 
    a.order_number, 
    a.order_date, 
    a.cust_id, 
    a.salesperson_id, 
    a.amount
FROM int_orders a
LEFT JOIN int_orders b 
    ON a.salesperson_id = b.salesperson_id
GROUP BY 
    a.order_number, 
    a.order_date, 
    a.cust_id, 
    a.salesperson_id, 
    a.amount
HAVING a.amount >= MAX(b.amount);



-- ============================================================================================
-- 32)  SQL ON OFF prooblem
-- =============================================================================================
DROP TABLE IF EXISTS event_status; CREATE TABLE event_status(event_time VARCHAR(10), status VARCHAR(10)); INSERT INTO event_status VALUES ('10:01','on'),('10:02','on'),('10:03','on'),('10:04','off'),('10:07','on'),('10:08','on'),('10:09','off'),('10:11','on'),('10:12','off');

-- +------------+--------+
-- | event_time | status |
-- +------------+--------+
-- | 10:01      | on     |
-- | 10:02      | on     |
-- | 10:03      | on     |
-- | 10:04      | off    |
-- | 10:07      | on     |
-- | 10:08      | on     |
-- | 10:09      | off    |
-- | 10:11      | on     |
-- | 10:12      | off    |
-- +------------+--------+

-- Here is the **one-line interview question**:

-- Identify continuous “ON” sessions from the `event_status` table and compute each session’s start time, end time, and duration based on status transitions ordered by event_time.

-- o/p

-- +-------+--------+----------+
-- | login | logout | on_count |
-- +-------+--------+----------+
-- | 10:01 | 10:04  |        3 |
-- | 10:07 | 10:09  |        2 |
-- | 10:11 | 10:12  |        1 |
-- +-------+--------+----------+

with xxx as (
  select
    *,
    sum(case when status = 'on' and prev_status = 'off' then 1 else 0 end) over (order by event_time) as group_key
  from (
    select
      *,
      lag(status, 1, status) over (order by event_time asc) as prev_status
    from
      event_status) A
)
select
  min(event_time) as login,
  max(event_time) as logout,
  count(1) - 1 as on_count
from
  xxx
group by group_key;


-- ============================================================================================
-- 33) STudent report-
-- =============================================================================================

DROP TABLE IF EXISTS players_location; CREATE TABLE players_location(name VARCHAR(20), city VARCHAR(20)); INSERT INTO players_location VALUES ('Sachin','Mumbai'),('Virat','Delhi'),('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');

-- +--------+-----------+
-- | name   | city      |
-- +--------+-----------+
-- | Sachin | Mumbai    |
-- | Virat  | Delhi     |
-- | Rahul  | Bangalore |
-- | Rohit  | Mumbai    |
-- | Mayank | Bangalore |
-- +--------+-----------+

--  Pivot the `players_location` table to display player names as columns for each city (Bangalore, Mumbai, Delhi), aligning names row-wise based on alphabetical order within each city.


-- o/p-

-- +-----------+--------+--------+
-- | Bangalore | Mumbai | Delhi  |
-- +-----------+--------+--------+
-- | Mayank    | Rohit  | Virat  |
-- | Rahul     | Sachin | <null> |
-- +-----------+--------+--------+

select
  max(case when city = 'Bangalore' then name end) as Bangalore,
  max(case when city = 'Mumbai' then name end) as Mumbai,
  min(case when city = 'Delhi' then name end) as Delhi
from
  (
    select
      *,
      row_number() over (partition by city order by name asc) as player_groups
    from
      players_location ) A
group by
  player_groups
order by
  player_groups;



-- ============================================================================================
-- 34) -- 
-- =============================================================================================

DROP TABLE IF EXISTS employee; CREATE TABLE employee(emp_id INT, company VARCHAR(10), salary INT); INSERT INTO employee VALUES (1,'A',2341),(2,'A',341),(3,'A',15),(4,'A',15314),(5,'A',451),(6,'A',513),(7,'B',15),(8,'B',13),(9,'B',1154),(10,'B',1345),(11,'B',1221),(12,'B',234),(13,'C',2345),(14,'C',2645),(15,'C',2645),(16,'C',2652),(17,'C',65);

-- +--------+---------+--------+
-- | emp_id | company | salary |
-- +--------+---------+--------+
-- |      1 | A       |   2341 |
-- |      2 | A       |    341 |
-- |      3 | A       |     15 |
-- |      4 | A       |  15314 |
-- |      5 | A       |    451 |
-- |      6 | A       |    513 |
-- |      7 | B       |     15 |
-- |      8 | B       |     13 |
-- |      9 | B       |   1154 |
-- |     10 | B       |   1345 |
-- |     11 | B       |   1221 |
-- |     12 | B       |    234 |
-- |     13 | C       |   2345 |
-- |     14 | C       |   2645 |
-- |     15 | C       |   2645 |
-- |     16 | C       |   2652 |
-- |     17 | C       |     65 |
-- +--------+---------+--------+

-- o/p 

-- +---------+-------------+
-- | company | avg(salary) |
-- +---------+-------------+
-- | A       |    482.0000 |
-- | B       |    694.0000 |
-- | C       |   2645.0000 |
-- +---------+-------------+

-- > Find the median salary for each company from the `employee` table.



select
  company,
  avg(salary)
from
  (
    select
      *,
      row_number() over (partition by company order by salary) as rn,
      count(1) over (partition by company) as total_cnt
    from
      employee
  ) a
where
  rn between total_cnt * 1.0 / 2 and total_cnt * 1.0 / 2 + 1
group by
  company;


-- ============================================================================================
-- 35)
-- =============================================================================================
 DROP TABLE IF EXISTS emp; CREATE TABLE emp(emp_id INT, emp_name VARCHAR(50), salary INT, manager_id INT, emp_age INT, dep_id INT, dep_name VARCHAR(20), gender VARCHAR(10)); INSERT INTO emp VALUES (1,'Ankit',14300,4,39,100,'Analytics','Female'),(2,'Mohit',14000,5,48,200,'IT','Male'),(3,'Vikas',12100,4,37,100,'Analytics','Female'),(4,'Rohit',7260,2,16,100,'Analytics','Female'),(5,'Mudit',15000,6,55,200,'IT','Male'),(6,'Agam',15600,2,14,200,'IT','Male'),(7,'Sanjay',12000,2,13,200,'IT','Male'),(8,'Ashish',7200,2,12,200,'IT','Male'),(9,'Mukesh',7000,6,51,300,'HR','Male'),(10,'Rakesh',8000,6,50,300,'HR','Male'),(11,'Akhil',4000,1,31,500,'Ops','Male');
 
--  +--------+----------+--------+------------+---------+--------+-----------+--------+
-- | emp_id | emp_name | salary | manager_id | emp_age | dep_id | dep_name  | gender |
-- +--------+----------+--------+------------+---------+--------+-----------+--------+
-- |      1 | Ankit    |  14300 |          4 |      39 |    100 | Analytics | Female |
-- |      2 | Mohit    |  14000 |          5 |      48 |    200 | IT        | Male   |
-- |      3 | Vikas    |  12100 |          4 |      37 |    100 | Analytics | Female |
-- |      4 | Rohit    |   7260 |          2 |      16 |    100 | Analytics | Female |
-- |      5 | Mudit    |  15000 |          6 |      55 |    200 | IT        | Male   |
-- |      6 | Agam     |  15600 |          2 |      14 |    200 | IT        | Male   |
-- |      7 | Sanjay   |  12000 |          2 |      13 |    200 | IT        | Male   |
-- |      8 | Ashish   |   7200 |          2 |      12 |    200 | IT        | Male   |
-- |      9 | Mukesh   |   7000 |          6 |      51 |    300 | HR        | Male   |
-- |     10 | Rakesh   |   8000 |          6 |      50 |    300 | HR        | Male   |
-- |     11 | Akhil    |   4000 |          1 |      31 |    500 | Ops       | Male   |
-- +--------+----------+--------+------------+---------+--------+-----------+--------+

-- > For each department, find the 3rd highest salary employee (or the lowest-ranked employee if the department has less than 3 employees), returning their employee details.

-- o/p
-- +--------+----------+--------+--------+-----------+----+-----+
-- | emp_id | emp_name | salary | dep_id | dep_name  | rn | cnt |
-- +--------+----------+--------+--------+-----------+----+-----+
-- |      4 | Rohit    |   7260 |    100 | Analytics |  3 |   3 |
-- |      2 | Mohit    |  14000 |    200 | IT        |  3 |   5 |
-- |      9 | Mukesh   |   7000 |    300 | HR        |  2 |   2 |
-- |     11 | Akhil    |   4000 |    500 | Ops       |  1 |   1 |
-- +--------+----------+--------+--------+-----------+----+-----+


-- ============================================================================================
-- 36) - Leetcode human trafic of stadium
-- =============================================================================================

DROP TABLE IF EXISTS stadium; CREATE TABLE stadium(id INT, visit_date DATE, no_of_people INT); INSERT INTO stadium VALUES (1,'2017-07-01',10),(2,'2017-07-02',109),(3,'2017-07-03',150),(4,'2017-07-04',99),(5,'2017-07-05',145),(6,'2017-07-06',1455),(7,'2017-07-07',199),(8,'2017-07-08',188);

-- +----+------------+--------------+
-- | id | visit_date | no_of_people |
-- +----+------------+--------------+
-- |  1 | 2017-07-01 |           10 |
-- |  2 | 2017-07-02 |          109 |
-- |  3 | 2017-07-03 |          150 |
-- |  4 | 2017-07-04 |           99 |
-- |  5 | 2017-07-05 |          145 |
-- |  6 | 2017-07-06 |         1455 |
-- |  7 | 2017-07-07 |          199 |
-- |  8 | 2017-07-08 |          188 |
-- +----+------------+--------------+


-- o/prepare
-- > Find all consecutive sequences of at least 3 days where the stadium had 100 or more visitors each day, and return the corresponding records (id, visit_date, no_of_people).


with grp_number as (
  select
    *,
    row_number() over (order by visit_date) as rn,
    id-row_number() over (order by visit_date) as grp -- This function is non-standard
  from
    stadium
  where
    no_of_people >= 100
)
select
  id,
  visit_date,
  no_of_people
from
  grp_number
where
  grp in (
    select
      grp
    from
      grp_number
    group by
      grp
    having
      count(1) >= 3
  );





-- ============================================================================================
-- 37)
-- =============================================================================================


DROP TABLE IF EXISTS business_city; CREATE TABLE business_city(business_date DATE, city_id INT); INSERT INTO business_city VALUES ('2020-01-02',3),('2020-07-01',7),('2021-01-01',3),('2021-02-03',19),('2022-12-01',3),('2022-12-15',3),('2022-02-28',12);

-- +---------------+---------+
-- | business_date | city_id |
-- +---------------+---------+
-- | 2020-01-02    |       3 |
-- | 2020-07-01    |       7 |
-- | 2021-01-01    |       3 |
-- | 2021-02-03    |      19 |
-- | 2022-12-01    |       3 |
-- | 2022-12-15    |       3 |
-- | 2022-02-28    |      12 |
-- +---------------+---------+

-- o/p

-- +----------+-----------------+
-- | bus_year | #_of_new_cities |
-- +----------+-----------------+
-- |     2020 |               2 |
-- |     2021 |               1 |
-- |     2022 |               1 |
-- +----------+-----------------+


-- Find the number of new cities introduced in each year, where a city is considered new in a year if it appears in that year for the first time and did not exist in any previous year in the `business_city` table.



WITH cte AS (
  SELECT
    YEAR(business_date) AS bus_year,
    city_id
  FROM business_city
)
SELECT
  c1.bus_year,
  COUNT(DISTINCT CASE WHEN c2.city_id IS NULL THEN c1.city_id END) AS "#_of_new_cities"
FROM cte c1
LEFT JOIN cte c2 
  ON c1.city_id = c2.city_id 
 AND c1.bus_year > c2.bus_year
GROUP BY c1.bus_year;



-- ============================================================================================
-- 38)
-- =============================================================================================
DROP TABLE IF EXISTS movie; CREATE TABLE movie(seat VARCHAR(50), occupancy INT); INSERT INTO movie VALUES ('a1',1),('a2',1),('a3',0),('a4',0),('a5',0),('a6',0),('a7',1),('a8',1),('a9',0),('a10',0),('b1',0),('b2',0),('b3',0),('b4',1),('b5',1),('b6',1),('b7',1),('b8',0),('b9',0),('b10',0),('c1',0),('c2',1),('c3',0),('c4',1),('c5',1),('c6',0),('c7',1),('c8',0),('c9',0),('c10',1);

-- +------+-----------+
-- | seat | occupancy |
-- +------+-----------+
-- | a1   |         1 |
-- | a2   |         1 |
-- | a3   |         0 |
-- | a4   |         0 |
-- | a5   |         0 |
-- | a6   |         0 |
-- | a7   |         1 |
-- | a8   |         1 |
-- | a9   |         0 |
-- | a10  |         0 |
-- | b1   |         0 |
-- | b2   |         0 |
-- | b3   |         0 |
-- | b4   |         1 |
-- | b5   |         1 |
-- | b6   |         1 |
-- | b7   |         1 |
-- | b8   |         0 |
-- | b9   |         0 |
-- | b10  |         0 |
-- | c1   |         0 |
-- | c2   |         1 |
-- | c3   |         0 |
-- | c4   |         1 |
-- | c5   |         1 |
-- | c6   |         0 |
-- | c7   |         1 |
-- | c8   |         0 |
-- | c9   |         0 |
-- | c10  |         1 |
-- +------+-----------+

-- Find all groups of 4 consecutive seats in the same row where all seats are empty (occupancy = 0) in the `movie` table.
-- o/p
-- +------+-----------+--------+---------+------------+-----+
-- | seat | occupancy | row_id | seat_id | is_4_empty | cnt |
-- +------+-----------+--------+---------+------------+-----+
-- | a3   |         0 | a      |     3.0 |          0 |   4 |
-- | a4   |         0 | a      |     4.0 |          1 |   4 |
-- | a5   |         0 | a      |     5.0 |          1 |   4 |
-- | a6   |         0 | a      |     6.0 |          1 |   4 |
-- +------+-----------+--------+---------+------------+-----+


WITH cte1 AS (
    SELECT *,
           LEFT(seat,1) AS row_id,
           SUBSTRING(seat,2) + 0 AS seat_id
    FROM movie
),
cte2 AS (
    SELECT *,
           MAX(occupancy) OVER (
               PARTITION BY row_id 
               ORDER BY seat_id 
               ROWS BETWEEN CURRENT ROW AND 3 FOLLOWING
           ) AS is_4_empty,
           COUNT(occupancy) OVER (
               PARTITION BY row_id 
               ORDER BY seat_id 
               ROWS BETWEEN CURRENT ROW AND 3 FOLLOWING
           ) AS cnt
    FROM cte1
),
cte3 AS (
    SELECT * 
    FROM cte2 
    WHERE is_4_empty = 0 AND cnt = 4
)
SELECT cte2.*
FROM cte2
INNER JOIN cte3 
    ON cte2.row_id = cte3.row_id 
   AND cte2.seat_id BETWEEN cte3.seat_id AND cte3.seat_id + 3;




-- ============================================================================================
-- 39) Bosch scenario based interview questions
-- =============================================================================================

DROP TABLE IF EXISTS call_details; CREATE TABLE call_details(call_type VARCHAR(10), call_number VARCHAR(12), call_duration INT); INSERT INTO call_details VALUES ('OUT','181868',13),('OUT','2159010',8),('OUT','2159010',178),('SMS','4153810',1),('OUT','2159010',152),('OUT','9140152',18),('SMS','4162672',1),('SMS','9168204',1),('OUT','9168204',576),('INC','2159010',5),('INC','2159010',4),('SMS','2159010',1),('SMS','4535614',1),('OUT','181868',20),('INC','181868',54),('INC','218748',20),('INC','2159010',9),('INC','197432',66),('SMS','2159010',1),('SMS','4535614',1);

-- +-----------+-------------+---------------+
-- | call_type | call_number | call_duration |
-- +-----------+-------------+---------------+
-- | OUT       | 181868      |            13 |
-- | OUT       | 2159010     |             8 |
-- | OUT       | 2159010     |           178 |
-- | SMS       | 4153810     |             1 |
-- | OUT       | 2159010     |           152 |
-- | OUT       | 9140152     |            18 |
-- | SMS       | 4162672     |             1 |
-- | SMS       | 9168204     |             1 |
-- | OUT       | 9168204     |           576 |
-- | INC       | 2159010     |             5 |
-- | INC       | 2159010     |             4 |
-- | SMS       | 2159010     |             1 |
-- | SMS       | 4535614     |             1 |
-- | OUT       | 181868      |            20 |
-- | INC       | 181868      |            54 |
-- | INC       | 218748      |            20 |
-- | INC       | 2159010     |             9 |
-- | INC       | 197432      |            66 |
-- | SMS       | 2159010     |             1 |
-- | SMS       | 4535614     |             1 |
-- +-----------+-------------+---------------+


-- METHOD 1 -- Find all call numbers where total outgoing call duration is greater than incoming call duration, and both outgoing and incoming calls exist for that number.

With cte as (
  select
    call_number,
    sum(case when call_type = 'OUT' then call_duration else null end) as out_duration,
    sum(case when call_type = 'INC' then call_duration else null end) as inc_duration
  from
    call_details
  group by
    call_number
)
select
  call_number
from
  cte
where
  out_duration is not null and inc_duration is not null and out_duration > inc_duration;


-- METHOD 2 -- Identify call numbers where total outgoing call duration is greater than incoming call duration, ensuring that both OUT and INC calls exist for the same call number using conditional aggregation.

select call_number
from call_details
group by call_number
having sum(case when call_type='OUT' then call_duration else null end)>0
and sum(case when call_type='INC' then call_duration else null end)>0
and sum(case when call_type='OUT' then call_duration else null end) > sum(case when call_type='INC' then call_duration else null end);


-- METHOD 3 -- Find call numbers where the total outgoing call duration is greater than incoming call duration by separately aggregating OUT and INC call durations and joining the results.

with cte_out as (
  select
    call_number,
    sum(call_duration) as duration
    from call_details
where call_type='OUT'
group by call_number
),
cte_in as (
select call_number,
sum(call_duration) as duration
from call_details
where call_type='INC'
group by call_number
)
select
cte_out.call_number
from cte_out
inner join cte_in on cte_out.call_number=cte_in.call_number
where cte_out.duration>cte_in.duration







-- ============================================================================================
-- 40) Deloitte Interview questions
-- =============================================================================================

DROP TABLE IF EXISTS brands; CREATE TABLE brands(category VARCHAR(20), brand_name VARCHAR(20)); INSERT INTO brands VALUES ('chocolates','5-star'),(null,'dairy milk'),(null,'perk'),(null,'eclair'),('Biscuits','britannia'),(null,'good day'),(null,'boost');

-- +------------+------------+
-- | category   | brand_name |
-- +------------+------------+
-- | chocolates | 5-star     |
-- | <null>     | dairy milk |
-- | <null>     | perk       |
-- | <null>     | eclair     |
-- | Biscuits   | britannia  |
-- | <null>     | good day   |
-- | <null>     | boost      |
-- +------------+------------+

-- o/p

-- +------------+------------+
-- | category   | brand_name |
-- +------------+------------+
-- | chocolates | 5-star     |
-- | chocolates | dairy milk |
-- | chocolates | perk       |
-- | chocolates | eclair     |
-- | Biscuits   | britannia  |
-- | Biscuits   | good day   |
-- | Biscuits   | boost      |
-- +------------+------------+



 -- > Fill down the `category` values in the `brands` table so that each NULL category inherits the last non-null category above it, and return the category–brand mapping after forward-propagating categories to all subsequent rows until the next category appears.


with cte1 as (
  select
    *,
    row_number() over (order by (select null)) as rn
  from brands
),
cte2 as (
  select
    *,
    lead(rn, 1) over (order by rn) as next_rn
  from cte1
  where category is not null
)
select
  cte2.category,
  cte1.brand_name
from cte1
inner join cte2 on cte1.rn >= cte2.rn and (cte1.rn <= cte2.next_rn - 1 or cte2.next_rn is null)


-- ============================================================================================
-- 41) Leetcode-find the quite student in all exam
-- =============================================================================================

DROP TABLE IF EXISTS students; CREATE TABLE students(student_id INT, student_name VARCHAR(20)); INSERT INTO students VALUES (1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will'); DROP TABLE IF EXISTS exams; CREATE TABLE exams(exam_id INT, student_id INT, score INT); INSERT INTO exams VALUES (10,1,70),(10,2,80),(10,3,90),(20,1,80),(30,1,70),(30,3,80),(30,4,90),(40,1,60),(40,2,70),(40,4,80);

-- students
-- +------------+--------------+
-- | student_id | student_name |
-- +------------+--------------+
-- |          1 | Daniel       |
-- |          2 | Jade         |
-- |          3 | Stella       |
-- |          4 | Jonathan     |
-- |          5 | Will         |
-- +------------+--------------+

-- exam:

-- +---------+------------+-------+
-- | exam_id | student_id | score |
-- +---------+------------+-------+
-- |      10 |          1 |    70 |
-- |      10 |          2 |    80 |
-- |      10 |          3 |    90 |
-- |      20 |          1 |    80 |
-- |      30 |          1 |    70 |
-- |      30 |          3 |    80 |
-- |      30 |          4 |    90 |
-- |      40 |          1 |    60 |
-- |      40 |          2 |    70 |
-- |      40 |          4 |    80 |
-- +---------+------------+-------+

-- > Find students who never scored the minimum or maximum score in any exam they participated in.
-- +------------+
-- | student_id |
-- +------------+
-- |          2 |
-- +------------+


with all_scores as (
  select
    exam_id,
    min(score) as min_score,
    max(score) as max_score
  from exams
  group by exam_id
)
select
  exams.student_id
from exams
inner join all_scores on exams.exam_id = all_scores.exam_id
group by student_id
having max(case when score = min_score or score = max_score then 1 else 0 end) = 0


-- ============================================================================================
-- 42) Warlmart lab --
-- =============================================================================================
DROP TABLE IF EXISTS phonelog; CREATE TABLE phonelog(Callerid INT, Recipientid INT, Datecalled DATETIME); INSERT INTO phonelog VALUES (1,2,'2019-01-01 09:00:00.000'),(1,3,'2019-01-01 17:00:00.000'),(1,4,'2019-01-01 23:00:00.000'),(2,5,'2019-07-05 09:00:00.000'),(2,3,'2019-07-05 17:00:00.000'),(2,3,'2019-07-05 17:20:00.000'),(2,5,'2019-07-05 23:00:00.000'),(2,3,'2019-08-01 09:00:00.000'),(2,3,'2019-08-01 17:00:00.000'),(2,5,'2019-08-01 19:30:00.000'),(2,4,'2019-08-02 09:00:00.000'),(2,5,'2019-08-02 10:00:00.000'),(2,5,'2019-08-02 10:45:00.000'),(2,4,'2019-08-02 11:00:00.000');

-- +----------+-------------+---------------------+
-- | Callerid | Recipientid | Datecalled          |
-- +----------+-------------+---------------------+
-- |        1 |           2 | 2019-01-01 09:00:00 |
-- |        1 |           3 | 2019-01-01 17:00:00 |
-- |        1 |           4 | 2019-01-01 23:00:00 |
-- |        2 |           5 | 2019-07-05 09:00:00 |
-- |        2 |           3 | 2019-07-05 17:00:00 |
-- |        2 |           3 | 2019-07-05 17:20:00 |
-- |        2 |           5 | 2019-07-05 23:00:00 |
-- |        2 |           3 | 2019-08-01 09:00:00 |
-- |        2 |           3 | 2019-08-01 17:00:00 |
-- |        2 |           5 | 2019-08-01 19:30:00 |
-- |        2 |           4 | 2019-08-02 09:00:00 |
-- |        2 |           5 | 2019-08-02 10:00:00 |
-- |        2 |           5 | 2019-08-02 10:45:00 |
-- |        2 |           4 | 2019-08-02 11:00:00 |
-- +----------+-------------+---------------------+


-- > For each caller and each day, identify whether the same recipient was contacted in both the first and last call of that day, and return those caller-day combinations along with the recipient.
-- o/p

-- +----------+-------------+---------------------+---------------------+-------------+
-- | callerid | called_date | first_call          | last_call           | Recipientid |
-- +----------+-------------+---------------------+---------------------+-------------+
-- |        2 | 2019-07-05  | 2019-07-05 09:00:00 | 2019-07-05 23:00:00 |           5 |
-- |        2 | 2019-08-02  | 2019-08-02 09:00:00 | 2019-08-02 11:00:00 |           4 |
-- +----------+-------------+---------------------+---------------------+-------------+


With calls as (
  select
    callerid,
    cast(datecalled as date) as called_date,
    min(datecalled) as first_call,
    max(datecalled) as last_call
  from phonelog
  group by
    callerid,
    cast(datecalled as date)
)
select
  c.*,
  p1.Recipientid
from calls c
inner join phonelog p1 on c.callerid = p1.callerid and c.first_call = p1.datecalled
inner join phonelog p2 on c.callerid = p2.callerid and c.last_call = p2.datecalled
where p1.Recipientid = p2.Recipientid



-- ============================================================================================
-- 43) Double selft join
-- =============================================================================================
DROP TABLE IF EXISTS emp; CREATE TABLE emp(emp_id INT, emp_name VARCHAR(20), department_id INT, salary INT, manager_id INT, emp_age INT); INSERT INTO emp VALUES (1,'Ankit',100,10000,4,39),(2,'Mohit',100,15000,5,48),(3,'Vikas',100,12000,4,37),(4,'Rohit',100,14000,2,16),(5,'Mudit',200,20000,6,55),(6,'Agam',200,12000,2,14),(7,'Sanjay',200,9000,2,13),(8,'Ashish',200,5000,2,12),(9,'Mukesh',300,6000,6,51),(10,'Rakesh',500,7000,6,50);

-- +--------+----------+---------------+--------+------------+---------+
-- | emp_id | emp_name | department_id | salary | manager_id | emp_age |
-- +--------+----------+---------------+--------+------------+---------+
-- |      1 | Ankit    |           100 |  10000 |          4 |      39 |
-- |      2 | Mohit    |           100 |  15000 |          5 |      48 |
-- |      3 | Vikas    |           100 |  12000 |          4 |      37 |
-- |      4 | Rohit    |           100 |  14000 |          2 |      16 |
-- |      5 | Mudit    |           200 |  20000 |          6 |      55 |
-- |      6 | Agam     |           200 |  12000 |          2 |      14 |
-- |      7 | Sanjay   |           200 |   9000 |          2 |      13 |
-- |      8 | Ashish   |           200 |   5000 |          2 |      12 |
-- |      9 | Mukesh   |           300 |   6000 |          6 |      51 |
-- |     10 | Rakesh   |           500 |   7000 |          6 |      50 |
-- +--------+----------+---------------+--------+------------+---------+

-- > Find employees whose salary is greater than the salary of their senior manager (i.e., their manager’s manager), and return the employee, manager, senior manager, and manager salary details.
-- o/p

-- +--------+----------+--------------+----------------+----------------+
-- | emp_id | emp_name | manager_name | senior_manager | manager_salary |
-- +--------+----------+--------------+----------------+----------------+
-- |      5 | Mudit    | Agam         | Mohit          |          12000 |
-- |      2 | Mohit    | Mudit        | Agam           |          20000 |
-- +--------+----------+--------------+----------------+----------------+



select e.emp_id,e.emp_name,m.emp_name as manager_name ,sm.emp_name as senior_manager
,m.salary as manager_salary
from emp e
left join emp m on e.manager_id=m.emp_id
left join emp sm on m.manager_id=sm.emp_id
where e.salary>sm.salary;


-- ============================================================================================
-- 44) --
-- =============================================================================================
DROP TABLE IF EXISTS candidates; CREATE TABLE candidates(emp_id INT, experience VARCHAR(20), salary INT); INSERT INTO candidates VALUES (1,'Junior',10000),(2,'Junior',15000),(3,'Junior',40000),(4,'Senior',16000),(5,'Senior',20000),(6,'Senior',50000);

-- +--------+------------+--------+
-- | emp_id | experience | salary |
-- +--------+------------+--------+
-- |      1 | Junior     |  10000 |
-- |      2 | Junior     |  15000 |
-- |      3 | Junior     |  40000 |
-- |      4 | Senior     |  16000 |
-- |      5 | Senior     |  20000 |
-- |      6 | Senior     |  50000 |
-- +--------+------------+--------+

-- > Given a total budget of **70,000**, select the maximum number of candidates by hiring **Senior candidates first (in ascending salary order)** and then using the remaining budget to hire **Junior candidates (also in ascending salary order)**, returning all selected candidates.
-- o/p

-- +--------+------------+--------+-------------+
-- | emp_id | experience | salary | running_sal |
-- +--------+------------+--------+-------------+
-- |      1 | Junior     |  10000 |       10000 |
-- |      2 | Junior     |  15000 |       25000 |
-- |      4 | Senior     |  16000 |       16000 |
-- |      5 | Senior     |  20000 |       36000 |
-- +--------+------------+--------+-------------+

with total_sal as (
  select
    *,
    sum(salary) over (partition by experience order by salary asc rows between unbounded preceding and current row) as running_sal
  from candidates
),
seniors as (
  select
    *
  from total_sal
  where
    experience = 'Senior' and running_sal <= 70000
)
select
  *
from total_sal
where
  experience = 'Junior' and running_sal <= 70000 - (select sum(salary) from seniors)
union all
select
  *
from seniors;



-- ============================================================================================
-- 45) SQL- Pre Screening Interview
-- =============================================================================================

DROP TABLE IF EXISTS tbl_orders; CREATE TABLE tbl_orders(order_id INT, order_date DATE); INSERT INTO tbl_orders VALUES (1,'2022-10-21'),(2,'2022-10-22'),(3,'2022-10-25'),(4,'2022-10-25'); DROP TABLE IF EXISTS tbl_orders_copy; CREATE TABLE tbl_orders_copy AS SELECT * FROM tbl_orders; INSERT INTO tbl_orders VALUES (5,'2022-10-26'),(6,'2022-10-26'); DELETE FROM tbl_orders WHERE order_id=1;

-- +----------+------------+
-- | order_id | order_date |
-- +----------+------------+
-- |        2 | 2022-10-22 |
-- |        3 | 2022-10-25 |
-- |        4 | 2022-10-25 |
-- |        5 | 2022-10-26 |
-- |        6 | 2022-10-26 |
-- +----------+------------+

-- o/p

-- +----------+------+
-- | order_id | flag |
-- +----------+------+
-- |        5 | I    |
-- |        6 | I    |
-- |        1 | D    |
-- +----------+------+

-- > Compare `tbl_orders` and `tbl_orders_copy` and identify the orders that were inserted into or deleted from `tbl_orders` since the copy was created.



SELECT o.order_id, 'I' AS flag
FROM tbl_orders o
LEFT JOIN tbl_orders_copy c
ON o.order_id = c.order_id
WHERE c.order_id IS NULL

UNION ALL

SELECT c.order_id, 'D' AS flag
FROM tbl_orders_copy c
LEFT JOIN tbl_orders o
ON c.order_id = o.order_id
WHERE o.order_id IS NULL;


-- ============================================================================================
-- 46)  UBER -
-- =============================================================================================
DROP TABLE IF EXISTS drivers; CREATE TABLE drivers(id VARCHAR(10), start_time TIME, end_time TIME, start_loc VARCHAR(10), end_loc VARCHAR(10)); INSERT INTO drivers VALUES ('dri_1','09:00:00','09:30:00','a','b'),('dri_1','09:30:00','10:30:00','b','c'),('dri_1','11:00:00','11:30:00','d','e'),('dri_1','12:00:00','12:30:00','f','g'),('dri_1','13:30:00','14:30:00','c','h'),('dri_2','12:15:00','12:30:00','f','g'),('dri_2','13:30:00','14:30:00','c','h');
-- +-------+------------+----------+-----------+---------+
-- | id    | start_time | end_time | start_loc | end_loc |
-- +-------+------------+----------+-----------+---------+
-- | dri_1 | 09:00:00   | 09:30:00 | a         | b       |
-- | dri_1 | 09:30:00   | 10:30:00 | b         | c       |
-- | dri_1 | 11:00:00   | 11:30:00 | d         | e       |
-- | dri_1 | 12:00:00   | 12:30:00 | f         | g       |
-- | dri_1 | 13:30:00   | 14:30:00 | c         | h       |
-- | dri_2 | 12:15:00   | 12:30:00 | f         | g       |
-- | dri_2 | 13:30:00   | 14:30:00 | c         | h       |
-- +-------+------------+----------+-----------+---------+

-- o/p 

-- 


-- METHOD 1--For each driver, calculate the total number of rides and the number of profitable rides, where a ride is considered profitable if its drop-off location matches the pick-up location of the driver's next ride.

select id, count(1) as total_rides
,sum(case when end_loc=next_start_location then 1 else 0 end) as profit_rides
from (
select *
,lead(start_loc,1) over(partition by id order by start_time asc) as next_start_location
from drivers) A
group by id;


-- METHOD 2 -- For each driver, determine the total rides and count how many consecutive rides are connected, such that the end location of one ride is the same as the start location of the immediately following ride.

with rides as (
select *,row_number() over(partition by id order by start_time asc) as rn
from drivers)
select r1.id , count(1) total_rides, count(r2.id) as profit_rides
from rides r1
left join rides r2
on r1.id=r2.id and r1.end_loc=r2.start_loc and r1.rn+1=r2.rn
group by r1.id



-- ============================================================================================
-- 47)
-- =============================================================================================
DROP TABLE IF EXISTS purchase_history; CREATE TABLE purchase_history(userid INT, productid INT, purchasedate DATE); INSERT INTO purchase_history VALUES (1,1,'2012-01-23'),(1,2,'2012-01-23'),(1,3,'2012-01-25'),(2,1,'2012-01-23'),(2,2,'2012-01-23'),(2,2,'2012-01-25'),(2,4,'2012-01-25'),(3,4,'2012-01-23'),(3,1,'2012-01-23'),(4,1,'2012-01-23'),(4,2,'2012-01-25');

-- +--------+-----------+--------------+
-- | userid | productid | purchasedate |
-- +--------+-----------+--------------+
-- |      1 |         1 | 2012-01-23   |
-- |      1 |         2 | 2012-01-23   |
-- |      1 |         3 | 2012-01-25   |
-- |      2 |         1 | 2012-01-23   |
-- |      2 |         2 | 2012-01-23   |
-- |      2 |         2 | 2012-01-25   |
-- |      2 |         4 | 2012-01-25   |
-- |      3 |         4 | 2012-01-23   |
-- |      3 |         1 | 2012-01-23   |
-- |      4 |         1 | 2012-01-23   |
-- |      4 |         2 | 2012-01-25   |
-- +--------+-----------+--------------+

-- > Find the users who made purchases on more than one distinct date and never purchased the same product more than once across all their purchases.

-- o/p
-- --+--------+
-- | userid |
-- +--------+
-- |      1 |
-- |      4 |
-- +--------+

select userid from purchase_history
group by userid
having count(distinct purchasedate)>1 and count(productid)=count(distinct productid);


-- ============================================================================================
-- 48) Marketing campain-
-- =============================================================================================

DROP TABLE IF EXISTS marketing_campaign; CREATE TABLE marketing_campaign(user_id INT, created_at DATE, product_id INT, quantity INT, price INT); INSERT INTO marketing_campaign VALUES (10,'2019-01-01',101,3,55),(10,'2019-01-02',119,5,29),(10,'2019-03-31',111,2,149),(11,'2019-01-02',105,3,234),(11,'2019-03-31',120,3,99),(12,'2019-01-02',112,2,200),(12,'2019-03-31',110,2,299),(13,'2019-01-05',113,1,67),(13,'2019-03-31',118,3,35),(14,'2019-01-06',109,5,199),(14,'2019-01-06',107,2,27),(14,'2019-03-31',112,3,200),(15,'2019-01-08',105,4,234),(15,'2019-01-09',110,4,299),(15,'2019-03-31',116,2,499),(16,'2019-01-10',113,2,67),(16,'2019-03-31',107,4,27),(17,'2019-01-11',116,2,499),(17,'2019-03-31',104,1,154),(18,'2019-01-12',114,2,248),(18,'2019-01-12',113,4,67),(19,'2019-01-12',114,3,248),(20,'2019-01-15',117,2,999),(21,'2019-01-16',105,3,234),(21,'2019-01-17',114,4,248),(22,'2019-01-18',113,3,67),(22,'2019-01-19',118,4,35),(23,'2019-01-20',119,3,29),(24,'2019-01-21',114,2,248),(25,'2019-01-22',114,2,248),(25,'2019-01-22',115,2,72),(25,'2019-01-24',114,5,248),(25,'2019-01-27',115,1,72),(26,'2019-01-25',115,1,72),(27,'2019-01-26',104,3,154),(28,'2019-01-27',101,4,55),(29,'2019-01-27',111,3,149),(30,'2019-01-29',111,1,149),(31,'2019-01-30',104,3,154),(32,'2019-01-31',117,1,999),(33,'2019-01-31',117,2,999),(34,'2019-01-31',110,3,299),(35,'2019-02-03',117,2,999),(36,'2019-02-04',102,4,82),(37,'2019-02-05',102,2,82),(38,'2019-02-06',113,2,67),(39,'2019-02-07',120,5,99),(40,'2019-02-08',115,2,72),(41,'2019-02-08',114,1,248),(42,'2019-02-10',105,5,234),(43,'2019-02-11',102,1,82),(43,'2019-03-05',104,3,154),(44,'2019-02-12',105,3,234),(44,'2019-03-05',102,4,82),(45,'2019-02-13',119,5,29),(45,'2019-03-05',105,3,234),(46,'2019-02-14',102,4,82),(46,'2019-02-14',102,5,29),(46,'2019-03-09',102,2,35),(46,'2019-03-10',103,1,199),(46,'2019-03-11',103,1,199),(47,'2019-02-14',110,2,299),(47,'2019-03-11',105,5,234),(48,'2019-02-14',115,4,72),(48,'2019-03-12',105,3,234),(49,'2019-02-18',106,2,123),(49,'2019-02-18',114,1,248),(49,'2019-02-18',112,4,200),(49,'2019-02-18',116,1,499),(50,'2019-02-20',118,4,35),(50,'2019-02-21',118,4,29),(50,'2019-03-13',118,5,299),(50,'2019-03-14',118,2,199),(51,'2019-02-21',120,2,99),(51,'2019-03-13',108,4,120),(52,'2019-02-23',117,2,999),(52,'2019-03-18',112,5,200),(53,'2019-02-24',120,4,99),(53,'2019-03-19',105,5,234),(54,'2019-02-25',119,4,29),(54,'2019-03-20',110,1,299),(55,'2019-02-26',117,2,999),(55,'2019-03-20',117,5,999),(56,'2019-02-27',115,2,72),(56,'2019-03-20',116,2,499),(57,'2019-02-28',105,4,234),(57,'2019-02-28',106,1,123),(57,'2019-03-20',108,1,120),(57,'2019-03-20',103,1,79),(58,'2019-02-28',104,1,154),(58,'2019-03-01',101,3,55),(58,'2019-03-02',119,2,29),(58,'2019-03-25',102,2,82),(59,'2019-03-04',117,4,999),(60,'2019-03-05',114,3,248),(61,'2019-03-26',120,2,99),(62,'2019-03-27',106,1,123),(63,'2019-03-27',120,5,99),(64,'2019-03-27',105,3,234),(65,'2019-03-27',103,4,79),(66,'2019-03-31',107,2,27),(67,'2019-03-31',102,5,82);

-- +---------+------------+------------+----------+-------+
-- | user_id | created_at | product_id | quantity | price |
-- +---------+------------+------------+----------+-------+
-- |      10 | 2019-01-01 |        101 |        3 |    55 |
-- |      10 | 2019-01-02 |        119 |        5 |    29 |
-- |      10 | 2019-03-31 |        111 |        2 |   149 |
-- |      11 | 2019-01-02 |        105 |        3 |   234 |
-- |      11 | 2019-03-31 |        120 |        3 |    99 |
-- |      12 | 2019-01-02 |        112 |        2 |   200 |
-- |      12 | 2019-03-31 |        110 |        2 |   299 |
-- |      13 | 2019-01-05 |        113 |        1 |    67 |
-- |      13 | 2019-03-31 |        118 |        3 |    35 |
-- |      14 | 2019-01-06 |        109 |        5 |   199 |
-- |      14 | 2019-01-06 |        107 |        2 |    27 |
-- |      14 | 2019-03-31 |        112 |        3 |   200 |
-- |      15 | 2019-01-08 |        105 |        4 |   234 |
-- |      15 | 2019-01-09 |        110 |        4 |   299 |
-- |      15 | 2019-03-31 |        116 |        2 |   499 |
-- |      16 | 2019-01-10 |        113 |        2 |    67 |
-- |      16 | 2019-03-31 |        107 |        4 |    27 |
-- |      17 | 2019-01-11 |        116 |        2 |   499 |
-- |      17 | 2019-03-31 |        104 |        1 |   154 |
-- |      18 | 2019-01-12 |        114 |        2 |   248 |
-- |      18 | 2019-01-12 |        113 |        4 |    67 |
-- |      19 | 2019-01-12 |        114 |        3 |   248 |
-- |      20 | 2019-01-15 |        117 |        2 |   999 |
-- |      21 | 2019-01-16 |        105 |        3 |   234 |
-- |      21 | 2019-01-17 |        114 |        4 |   248 |
-- |      22 | 2019-01-18 |        113 |        3 |    67 |
-- |      22 | 2019-01-19 |        118 |        4 |    35 |
-- |      23 | 2019-01-20 |        119 |        3 |    29 |
-- |      24 | 2019-01-21 |        114 |        2 |   248 |
-- |      25 | 2019-01-22 |        114 |        2 |   248 |
-- |      25 | 2019-01-22 |        115 |        2 |    72 |
-- |      25 | 2019-01-24 |        114 |        5 |   248 |
-- |      25 | 2019-01-27 |        115 |        1 |    72 |
-- |      26 | 2019-01-25 |        115 |        1 |    72 |
-- |      27 | 2019-01-26 |        104 |        3 |   154 |
-- |      28 | 2019-01-27 |        101 |        4 |    55 |
-- |      29 | 2019-01-27 |        111 |        3 |   149 |
-- |      30 | 2019-01-29 |        111 |        1 |   149 |
-- |      31 | 2019-01-30 |        104 |        3 |   154 |
-- |      32 | 2019-01-31 |        117 |        1 |   999 |
-- |      33 | 2019-01-31 |        117 |        2 |   999 |
-- |      34 | 2019-01-31 |        110 |        3 |   299 |
-- |      35 | 2019-02-03 |        117 |        2 |   999 |
-- |      36 | 2019-02-04 |        102 |        4 |    82 |
-- |      37 | 2019-02-05 |        102 |        2 |    82 |

-- > Find all users who purchased at least one product after their first purchase date that was not among the products they bought on their first purchase date, and return those user IDs (including duplicates if multiple qualifying purchases exist).

-- output-
-- +---------+
-- | user_id |
-- +---------+
-- |      10 |
-- |      11 |
-- |      12 |
-- |      13 |
-- |      14 |
-- |      15 |
-- |      16 |
-- |      17 |
-- |      21 |
-- |      22 |
-- |      43 |
-- |      44 |
-- |      45 |
-- |      46 |
-- |      47 |
-- |      48 |
-- |      51 |
-- |      52 |
-- |      53 |
-- |      54 |
-- |      56 |
-- |      57 |
-- |      58 |
-- +---------+


WITH rnk_data AS (
    SELECT *,
           RANK() OVER(PARTITION BY user_id ORDER BY created_at) AS rn
    FROM marketing_campaign
),
first_app_purchases AS (
    SELECT *
    FROM rnk_data
    WHERE rn = 1
),
except_first_app_purchases AS (
    SELECT *
    FROM rnk_data
    WHERE rn > 1
)
SELECT DISTINCT a.user_id
FROM except_first_app_purchases a
LEFT JOIN first_app_purchases b
    ON a.user_id = b.user_id
   AND a.product_id = b.product_id
WHERE b.product_id IS NULL
ORDER BY a.user_id;




-- ============================================================================================
-- 49) Fintech SQL
-- =============================================================================================
DROP TABLE IF EXISTS Trade_tbl; CREATE TABLE Trade_tbl(TRADE_ID VARCHAR(20), Trade_Timestamp TIME, Trade_Stock VARCHAR(20), Quantity INT, Price FLOAT); INSERT INTO Trade_tbl VALUES ('TRADE1','10:01:05','ITJunction4All',100,20),('TRADE2','10:01:06','ITJunction4All',20,15),('TRADE3','10:01:08','ITJunction4All',150,30),('TRADE4','10:01:09','ITJunction4All',300,32),('TRADE5','10:10:00','ITJunction4All',-100,19),('TRADE6','10:10:01','ITJunction4All',-300,19);

-- +----------+-----------------+----------------+----------+-------+
-- | TRADE_ID | Trade_Timestamp | Trade_Stock    | Quantity | Price |
-- +----------+-----------------+----------------+----------+-------+
-- | TRADE1   | 10:01:05        | ITJunction4All |      100 |  20.0 |
-- | TRADE2   | 10:01:06        | ITJunction4All |       20 |  15.0 |
-- | TRADE3   | 10:01:08        | ITJunction4All |      150 |  30.0 |
-- | TRADE4   | 10:01:09        | ITJunction4All |      300 |  32.0 |
-- | TRADE5   | 10:10:00        | ITJunction4All |     -100 |  19.0 |
-- | TRADE6   | 10:10:01        | ITJunction4All |     -300 |  19.0 |
-- +----------+-----------------+----------------+----------+-------+


-- o/p 

-- +----------------+----------+----------+-----------------+-----------------+-------+-------+--------------------+
-- | Trade_stock    | Trade_ID | Trade_ID | Trade_Timestamp | Trade_Timestamp | Price | Price |         pct_change |
-- +----------------+----------+----------+-----------------+-----------------+-------+-------+--------------------+
-- | ITJunction4All | TRADE1   | TRADE2   | 10:01:05        | 10:01:06        |  20.0 |  15.0 |               25.0 |
-- | ITJunction4All | TRADE1   | TRADE3   | 10:01:05        | 10:01:08        |  20.0 |  30.0 |               50.0 |
-- | ITJunction4All | TRADE1   | TRADE4   | 10:01:05        | 10:01:09        |  20.0 |  32.0 |               60.0 |
-- | ITJunction4All | TRADE2   | TRADE3   | 10:01:06        | 10:01:08        |  15.0 |  30.0 |              100.0 |
-- | ITJunction4All | TRADE2   | TRADE4   | 10:01:06        | 10:01:09        |  15.0 |  32.0 | 113.33333333333333 |
-- +----------------+----------+----------+-----------------+-----------------+-------+-------+--------------------+

-- Identify pairs of trades for the same stock that occurred within 10 seconds of each other and had a price difference greater than 10%.

SELECT t1.Trade_stock,t1.Trade_ID,t2.Trade_ID,t1.Trade_Timestamp,t2.Trade_Timestamp,t1.Price,t2.Price,ABS(t1.Price-t2.Price)*100.0/t1.Price AS pct_change
FROM Trade_tbl t1
INNER JOIN Trade_tbl t2
ON t1.Trade_Stock=t2.Trade_Stock
WHERE t1.Trade_Timestamp<t2.Trade_Timestamp
AND TIMESTAMPDIFF(SECOND,t1.Trade_Timestamp,t2.Trade_Timestamp)<10
AND ABS(t1.Price-t2.Price)*100.0/t1.Price>10
ORDER BY t1.Trade_ID;


-- ============================================================================================
-- 50) Data Analyst Case Study
-- =============================================================================================

DROP TABLE IF EXISTS booking_table; CREATE TABLE booking_table (Booking_id VARCHAR(3) NOT NULL, Booking_date DATE NOT NULL, User_id VARCHAR(2) NOT NULL, Line_of_business VARCHAR(6) NOT NULL); INSERT INTO booking_table VALUES ('b1','2022-03-23','u1','Flight'),('b2','2022-03-27','u2','Flight'),('b3','2022-03-28','u1','Hotel'),('b4','2022-03-31','u4','Flight'),('b5','2022-04-02','u1','Hotel'),('b6','2022-04-02','u2','Flight'),('b7','2022-04-06','u5','Flight'),('b8','2022-04-06','u6','Hotel'),('b9','2022-04-06','u2','Flight'),('b10','2022-04-10','u1','Flight'),('b11','2022-04-12','u4','Flight'),('b12','2022-04-16','u1','Flight'),('b13','2022-04-19','u2','Flight'),('b14','2022-04-20','u5','Hotel'),('b15','2022-04-22','u6','Flight'),('b16','2022-04-26','u4','Hotel'),('b17','2022-04-28','u2','Hotel'),('b18','2022-04-30','u1','Hotel'),('b19','2022-05-04','u4','Hotel'),('b20','2022-05-06','u1','Flight'); DROP TABLE IF EXISTS user_table; CREATE TABLE user_table (User_id VARCHAR(3) NOT NULL, Segment VARCHAR(2) NOT NULL); INSERT INTO user_table VALUES ('u1','s1'),('u2','s1'),('u3','s1'),('u4','s2'),('u5','s2'),('u6','s3'),('u7','s3'),('u8','s3'),('u9','s3'),('u10','s3');

-- select * from booking_table;
-- +------------+--------------+---------+------------------+
-- | Booking_id | Booking_date | User_id | Line_of_business |
-- +------------+--------------+---------+------------------+
-- | b1         | 2022-03-23   | u1      | Flight           |
-- | b2         | 2022-03-27   | u2      | Flight           |
-- | b3         | 2022-03-28   | u1      | Hotel            |
-- | b4         | 2022-03-31   | u4      | Flight           |
-- | b5         | 2022-04-02   | u1      | Hotel            |
-- | b6         | 2022-04-02   | u2      | Flight           |
-- | b7         | 2022-04-06   | u5      | Flight           |
-- | b8         | 2022-04-06   | u6      | Hotel            |
-- | b9         | 2022-04-06   | u2      | Flight           |
-- | b10        | 2022-04-10   | u1      | Flight           |
-- | b11        | 2022-04-12   | u4      | Flight           |
-- | b12        | 2022-04-16   | u1      | Flight           |
-- | b13        | 2022-04-19   | u2      | Flight           |
-- | b14        | 2022-04-20   | u5      | Hotel            |
-- | b15        | 2022-04-22   | u6      | Flight           |
-- | b16        | 2022-04-26   | u4      | Hotel            |
-- | b17        | 2022-04-28   | u2      | Hotel            |
-- | b18        | 2022-04-30   | u1      | Hotel            |
-- | b19        | 2022-05-04   | u4      | Hotel            |
-- | b20        | 2022-05-06   | u1      | Flight           |
-- +------------+--------------+---------+------------------+

-- select * from user_table;
-- +---------+---------+
-- | User_id | Segment |
-- +---------+---------+
-- | u1      | s1      |
-- | u2      | s1      |
-- | u3      | s1      |
-- | u4      | s2      |
-- | u5      | s2      |
-- | u6      | s3      |
-- | u7      | s3      |
-- | u8      | s3      |
-- | u9      | s3      |
-- | u10     | s3      |
-- +---------+---------+


# SOLUTION 1-
-- Find the total number of users in each segment and the number of users who booked at least one Flight in April 2022.
SELECT u.segment, COUNT(DISTINCT u.user_id) AS no_of_users, COUNT(DISTINCT CASE WHEN b.Line_of_business='Flight' AND YEAR(b.Booking_date)=2022 AND MONTH(b.Booking_date)=4 THEN b.user_id END) AS User_who_booked_flight_in_apr2022 FROM user_table u LEFT JOIN booking_table b ON u.User_id=b.User_id GROUP BY u.segment;

# SOLUTION 2 - METHOD 1
-- Find all users whose first-ever booking was a Hotel booking.

SELECT * FROM (SELECT *, RANK() OVER(PARTITION BY user_id ORDER BY booking_date) AS rn FROM booking_table) a WHERE rn=1 AND Line_of_business='Hotel';

# SOLUTION 2 - METHOD 2
-- 

SELECT DISTINCT user_id FROM (SELECT *, FIRST_VALUE(Line_of_business) OVER(PARTITION BY user_id ORDER BY booking_date) AS first_booking FROM booking_table) A WHERE first_booking='Hotel';

# SOLUTION 3
-- For each user, calculate the number of days between their first booking date and last booking date.
SELECT user_id, MIN(booking_date) AS first_booking, MAX(booking_date) AS last_booking, DATEDIFF(MAX(booking_date),MIN(booking_date)) AS no_of_days FROM booking_table GROUP BY user_id;

# SOLUTION 4 -- 
-- For each user segment, count the total number of Flight bookings and Hotel bookings made during 2022.
SELECT segment, SUM(CASE WHEN Line_of_business='Flight' THEN 1 ELSE 0 END) AS flight_bookings, SUM(CASE WHEN Line_of_business='Hotel' THEN 1 ELSE 0 END) AS hotel_bookings FROM booking_table b INNER JOIN user_table u ON b.user_id=u.user_id WHERE YEAR(booking_date)=2022 GROUP BY segment;



-- ============================================================================================
-- 51) Amazon SQl-
-- =============================================================================================
DROP TABLE IF EXISTS hall_events; CREATE TABLE hall_events (hall_id INT, start_date DATE, end_date DATE); INSERT INTO hall_events VALUES (1,'2023-01-13','2023-01-14'),(1,'2023-01-14','2023-01-17'),(1,'2023-01-15','2023-01-17'),(1,'2023-01-18','2023-01-25'),(2,'2022-12-09','2022-12-23'),(2,'2022-12-13','2022-12-17'),(3,'2022-12-01','2023-01-30');

-- +---------+------------+------------+
-- | hall_id | start_date | end_date   |
-- +---------+------------+------------+
-- |       1 | 2023-01-13 | 2023-01-14 |
-- |       1 | 2023-01-14 | 2023-01-17 |
-- |       1 | 2023-01-15 | 2023-01-17 |
-- |       1 | 2023-01-18 | 2023-01-25 |
-- |       2 | 2022-12-09 | 2022-12-23 |
-- |       2 | 2022-12-13 | 2022-12-17 |
-- |       3 | 2022-12-01 | 2023-01-30 |
-- +---------+------------+------------+

-- o/p 
-- +---------+------+------------+------------+
-- | hall_id | flag | start_date | end_date   |
-- +---------+------+------------+------------+
-- |       1 |    1 | 2023-01-13 | 2023-01-17 |
-- |       1 |    2 | 2023-01-18 | 2023-01-25 |
-- |       2 |    3 | 2022-12-09 | 2022-12-23 |
-- |       3 |    4 | 2022-12-01 | 2023-01-30 |
-- +---------+------+------------+------------+

-- Merge overlapping or continuous event date ranges for each hall and return the consolidated start and end dates.

WITH RECURSIVE cte AS (
    SELECT *,
           ROW_NUMBER() OVER(ORDER BY hall_id,start_date) AS event_id
    FROM hall_events
),
r_cte AS (
    SELECT hall_id,start_date,end_date,event_id,1 AS flag
    FROM cte
    WHERE event_id=1

    UNION ALL

    SELECT cte.hall_id,
           cte.start_date,
           cte.end_date,
           cte.event_id,
           CASE
               WHEN cte.hall_id=r_cte.hall_id
                AND (
                     cte.start_date BETWEEN r_cte.start_date AND r_cte.end_date
                     OR r_cte.start_date BETWEEN cte.start_date AND cte.end_date
                    )
               THEN 0
               ELSE 1
           END + r_cte.flag
    FROM r_cte
    JOIN cte
      ON r_cte.event_id+1=cte.event_id
)
SELECT hall_id,
       flag,
       MIN(start_date) AS start_date,
       MAX(end_date) AS end_date
FROM r_cte
GROUP BY hall_id,flag;



-- ============================================================================================
-- 52)
-- =============================================================================================










-- ============================================================================================
-- 53)
-- =============================================================================================












-- ============================================================================================
-- 54)
-- =============================================================================================













-- ============================================================================================
-- 55)
-- =============================================================================================













-- ============================================================================================
-- 56)
-- =============================================================================================











-- ============================================================================================
-- 57)
-- =============================================================================================












-- ============================================================================================
-- 58)
-- =============================================================================================












-- ============================================================================================
-- 59)
-- =============================================================================================














-- ============================================================================================
-- 60)
-- =============================================================================================














-- ============================================================================================
-- 61)
-- =============================================================================================

















-- ============================================================================================
-- 62)
-- =============================================================================================















-- ============================================================================================
-- 63)
-- =============================================================================================













-- ============================================================================================
-- 64)
-- =============================================================================================














-- ============================================================================================
-- 65)
-- =============================================================================================














-- ============================================================================================
-- 66)
-- =============================================================================================













-- ============================================================================================
-- 67)
-- =============================================================================================












-- ============================================================================================
-- 68)
-- =============================================================================================













-- ============================================================================================
-- 69)
-- =============================================================================================













-- ============================================================================================
-- 70)
-- =============================================================================================












-- ============================================================================================
-- 71)
-- =============================================================================================












-- ============================================================================================
-- 72)
-- =============================================================================================












-- ============================================================================================
-- 73)
-- =============================================================================================











-- ============================================================================================
-- 74)
-- =============================================================================================






















-- ============================================================================================
-- 75)
-- =============================================================================================




-- ============================================================================================
-- 76)
-- =============================================================================================







-- ============================================================================================
-- 77)
-- =============================================================================================










-- ============================================================================================
-- 78)
-- =============================================================================================












-- ============================================================================================
--  79)
-- =============================================================================================













-- ============================================================================================
-- 80)
-- =============================================================================================













-- ============================================================================================
-- 81)
-- =============================================================================================











-- ============================================================================================
-- 82)
-- =============================================================================================












-- ============================================================================================
-- 83)
-- =============================================================================================












-- ============================================================================================
-- 84)
-- =============================================================================================














-- ============================================================================================
-- 85)
-- =============================================================================================














-- ============================================================================================
-- 86)
-- =============================================================================================

















-- ============================================================================================
-- 87)
-- =============================================================================================















-- ============================================================================================
-- 88)
-- =============================================================================================













-- ============================================================================================
-- 89)
-- =============================================================================================














-- ============================================================================================
-- 90)
-- =============================================================================================














-- ============================================================================================
-- 91)
-- =============================================================================================













-- =========== =================================================================================
-- 92)
-- =============================================================================================












-- ============================================================================================
-- 93)
-- =============================================================================================













-- ============================================================================================
-- 94)
-- =============================================================================================













-- ============================================================================================
-- 95)
-- =============================================================================================












-- ============================================================================================
-- 96)
-- =============================================================================================












-- ============================================================================================
-- 97)
-- =============================================================================================












-- ============================================================================================
-- 98)
-- =============================================================================================











-- ============================================================================================
-- 99)
-- =============================================================================================













-- ============================================================================================
-- 100)
-- =============================================================================================




-- ============================================================================================
--
-- =============================================================================================







-- ============================================================================================
--
-- =============================================================================================










-- ============================================================================================
--
-- =============================================================================================












-- ============================================================================================
--
-- =============================================================================================













-- ============================================================================================
--
-- =============================================================================================













-- ============================================================================================
--
-- =============================================================================================











-- ============================================================================================
--
-- =============================================================================================












-- ============================================================================================
--
-- =============================================================================================












-- ============================================================================================
--
-- =============================================================================================














-- ============================================================================================
--
-- =============================================================================================














-- ============================================================================================
--
-- =============================================================================================

















-- ============================================================================================
--
-- =============================================================================================















-- ============================================================================================
--
-- =============================================================================================













-- ============================================================================================
--
-- =============================================================================================














-- ============================================================================================
--
-- =============================================================================================














-- ============================================================================================
--
-- =============================================================================================













-- ============================================================================================
--
-- =============================================================================================












-- ============================================================================================
--
-- =============================================================================================













-- ============================================================================================
--
-- =============================================================================================













-- ============================================================================================
--
-- =============================================================================================












-- ============================================================================================
--
-- =============================================================================================












-- ============================================================================================
--
-- =============================================================================================












-- ============================================================================================
--
-- =============================================================================================











-- ============================================================================================
--
-- =============================================================================================

