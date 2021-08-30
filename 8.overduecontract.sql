DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select top 1 currentTeam, count(currentTeam) c
from cards inner join players on cards.players=players.id 
inner join contracts on players.id=contracts.players 
inner join salary on contracts.id=salary.contracts
where players.id in (select players from
contracts where expiryDate<GETDATE())
group by currentTeam
order by c desc;
