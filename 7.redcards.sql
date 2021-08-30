DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select distinct players.players, salary
from players inner join cards on players.id=cards.players 
inner join contracts on players.id=contracts.players 
inner join salary on contracts.id=salary.contracts
where players.id in (select players from
(select top 3 players, count(players) k
from cards
where yellow0red1='true' group by players order by count(players) desc) x)