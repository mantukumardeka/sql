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
-- 20)
-- =============================================================================================













-- ============================================================================================
-- 21)
-- =============================================================================================












-- ============================================================================================
-- 22)
-- =============================================================================================












-- ============================================================================================
-- 22)
-- =============================================================================================












-- ============================================================================================
-- 23)
-- =============================================================================================











-- ============================================================================================
-- 24)
-- =============================================================================================













-- ============================================================================================
-- 25
-- =============================================================================================




-- ============================================================================================
--  26
-- =============================================================================================







-- ============================================================================================
--  27)
-- =============================================================================================










-- ============================================================================================
-- 28)
-- =============================================================================================












-- ============================================================================================
-- 29)
-- =============================================================================================













-- ============================================================================================
-- 30)
-- =============================================================================================













-- ============================================================================================
-- 31)
-- =============================================================================================











-- ============================================================================================
-- 32)
-- =============================================================================================












-- ============================================================================================
-- 33)
-- =============================================================================================












-- ============================================================================================
-- 34)
-- =============================================================================================














-- ============================================================================================
-- 35)
-- =============================================================================================














-- ============================================================================================
-- 36)
-- =============================================================================================

















-- ============================================================================================
-- 37)
-- =============================================================================================















-- ============================================================================================
-- 38)
-- =============================================================================================













-- ============================================================================================
-- 39)
-- =============================================================================================














-- ============================================================================================
-- 40)
-- =============================================================================================














-- ============================================================================================
-- 41)
-- =============================================================================================













-- ============================================================================================
-- 42)
-- =============================================================================================












-- ============================================================================================
-- 43)
-- =============================================================================================













-- ============================================================================================
-- 44)
-- =============================================================================================













-- ============================================================================================
-- 45)
-- =============================================================================================












-- ============================================================================================
-- 46)
-- =============================================================================================












-- ============================================================================================
-- 47)
-- =============================================================================================












-- ============================================================================================
-- 48)
-- =============================================================================================











-- ============================================================================================
-- 49)
-- =============================================================================================

















-- ============================================================================================
-- 50)
-- =============================================================================================




-- ============================================================================================
-- 51)
-- =============================================================================================







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

