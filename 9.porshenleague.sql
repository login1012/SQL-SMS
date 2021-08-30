DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select player1
from teams inner join matches on teams.id=matches.player1
inner join league on matches.league=league.id
where teams.id in 
(select top 1 player1 from matches
where league='4'
group by player1
order by count(player1) desc)
group by player1