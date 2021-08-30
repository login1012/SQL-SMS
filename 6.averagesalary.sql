DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
select distinct teams.id
from teams inner join champions on teams.id=champions.teams
inner join titles on champions.titles=titles.id
where teams.id in 
(select top 10 teams from champions 
group by teams)
intersect
select top 10 currentTeam from(
select top 10 currentTeam, sum(salary) avg_sal
from cards inner join players on cards.players=players.id 
inner join contracts on players.id=contracts.players 
inner join salary on contracts.id=salary.contracts
group by currentTeam
order by avg_sal desc) x