DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select matches.id, champions.teams, champions.date,
teams1.id, teams1.teams, teams2.id, teams2.teams 
from matches 
left join teams as teams1 on matches.player1=teams1.id
left join teams as teams2 on matches.player2=teams2.id
inner join champions on champions.date=matches.date
where champions.teams=teams1.id or champions.teams=teams2.id