DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
set statistics time on
select top 1 player1
from matches inner join teams on matches.player1=teams.id 
inner join stadiums on teams.id=stadiums.teams
where teams.id in 
(select top 1 player1 from matches 
group by player1)
set statistics time off