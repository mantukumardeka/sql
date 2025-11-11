#icc_world_cup
-- +----------+--------------------------+---------+--------+
-- | teamname | number_of_matched_played | winners | losser |
-- +----------+--------------------------+---------+--------+
-- | SL       |                        2 |       0 |      2 |
-- | SA       |                        1 |       0 |      1 |
-- | Eng      |                        2 |       1 |      1 |
-- | Aus      |                        2 |       1 |      1 |
-- | NZ       |                        1 |       1 |      0 |
-- | India    |                        2 |       2 |      0 |
-- +----------+--------------------------+---------+--------+


use top40;

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
-- INSERT INTO icc_world_cup values('India','SL','India');
-- INSERT INTO icc_world_cup values('SL','Aus','Aus');
-- INSERT INTO icc_world_cup values('SA','Eng','Eng');
-- INSERT INTO icc_world_cup values('Eng','NZ','NZ');
-- INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;


select teamname,count(1) as number_of_matched_played,sum(winflag) as winners,count(1)-sum(winflag) as losser from (select Team_1 as teamname ,case when Team_1=Winner then 1 else 0 end as winflag from icc_world_cup union all select Team_2 as teamname ,case when Team_2=Winner then 1 else 0 end as winflag from icc_world_cup) A group by teamname order by winners;


