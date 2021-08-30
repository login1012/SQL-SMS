DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
set statistics time on
select player1
from teams inner join matches on teams.id=matches.player1 
inner join stadiums on teams.id=stadiums.teams
where teams.id in 
(select top 1 player1 
from(select top 1 player1, count(player1) k from matches 
group by player1)x)
group by player1
set statistics time off