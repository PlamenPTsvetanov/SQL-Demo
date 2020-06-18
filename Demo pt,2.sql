insert into coaches(first_name, last_name, salary, coach_level)
select first_name, last_name, salary * 2, char_length(first_name) 
from players 
where age >= 45;

update coaches 
set coach_level = coach_level + 1
where substring(first_name, 1, 1) = 'A'
and id = 1 or id = 2 or id = 4 or id = 5;

DELETE from players
where age >= 45;

select first_name, age, salary from players
order by salary desc;

select p.id, concat(p.first_name, " ", p.last_name), p.age, p.position, p.hire_date
from players as p
join skills_data as s
on p.skills_data_id = s.id
where p.hire_date is null and p.position = 'A' and p.age < 23 and s.strength > 50
order by salary asc, age asc;

select t.name, t.established, t.fan_base, count(p.first_name) as count_of_players
from teams as t
left join players as p
on t.id = p.team_id
group by t.id
order by count_of_players desc, t.fan_base desc;

select max(sd.speed) as  max_speed, tw.name as town_name
from players as p

right join skills_data as sd
on p.skills_data_id = sd.id

right join teams as t
on p.team_id = t.id

right join stadiums as st
on t.stadium_id = st.id

right join towns as tw
on tw.id = st.town_id

where t.name != 'Devify'
group by tw.name
order by max_speed desc, town_name;

select c.name, count(p.first_name) as total_players_count, sum(p.salary) as total_sum_of_salaries
from countries as c

left join towns as tw
on c.id = tw.country_id

left join stadiums as st
on tw.id = st.town_id

left join teams as te
on st.id = te.stadium_id

left join players as p
on p.team_id = te.id 

group by c.name
order by total_players_count desc, c.name asc;

