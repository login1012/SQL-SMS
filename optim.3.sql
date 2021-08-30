DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
set statistics time on
select players.players, salary
from players inner join cards on players.id=cards.players
inner join contracts on players.id=contracts.players 
inner join salary on contracts.id=salary.contracts
where players.id in
(select top 3 players
from cards group by players order by count(players))
set statistics time off