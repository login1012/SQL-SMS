DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select *
from teams inner join champions on teams.id=champions.teams
inner join titles on champions.titles=titles.id
where teams.id in 
(select top 1 teams from champions 
group by teams)