select * from client order by name;
select type, count(*) as count from train group by type;
select * from train where isWork = true limit 2;