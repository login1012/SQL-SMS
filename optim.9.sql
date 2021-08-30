DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select player1
from matches m inner join teams on m.player1=teams.id 
inner join league on m.league=league.id
where exists 
(select top 1 player1 from(select top 1 player1 from matches
where league='4' 
group by player1
order by count(player1) desc) x where x.player1=m.player1)
group by player1