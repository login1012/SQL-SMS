DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select distinct matches, player1, 
player2, inj_count, league.league
from matches inner join inj_match 
on inj_match.matches=matches.id 
inner join league 
on league.id=matches.league
where inj_count=(select MAX(inj_c) 
from (Select count(matches) inj_c
from injuries
group by matches) x);