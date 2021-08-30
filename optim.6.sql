DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select top 10 teams from(
select top 10 teams, count(titles) c from champions 
group by teams
order by c asc) t
intersect
select top 10 currentTeam from(
select top 10 currentTeam, sum(salary) avg_sal
from players inner join contracts on players.id=contracts.players 
inner join salary on contracts.id=salary.contracts
group by currentTeam
order by avg_sal desc) x

