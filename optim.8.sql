DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select top 1 currentTeam, count(currentTeam) c
from players
where exists (select players from
contracts where expiryDate<GETDATE() and contracts.players=players.id)
group by currentTeam
order by c desc;
