DBCC DROPCLEANBUFFERS;   --Clears query cache  
DBCC FREEPROCCACHE;   --Clears execution plan cache
select distinct matches, player1, 
player2, inj_count, league.league
from inj_match inner join matches
on inj_match.matches=matches.id 
inner join league 
on matches.league=league.id 
where inj_count=(select MAX(inj_count) 
from inj_match);