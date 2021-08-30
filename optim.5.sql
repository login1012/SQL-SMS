DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select teams.id, titles.titles
from champions inner join titles on champions.titles=titles.id
inner join teams on champions.teams=teams.id
where teams.id in 
(select top 1 teams from champions 
group by teams)