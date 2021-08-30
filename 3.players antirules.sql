DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
set statistics time on
select players.players, salary
from cards inner join players on cards.players=players.id 
inner join contracts on players.id=contracts.players 
inner join salary on contracts.id=salary.contracts
where players.id in (select players from
(select top 3 players, count(players) k
from cards group by players order by count(players)) x)
set statistics time off
