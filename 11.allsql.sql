--1
select distinct matches, player1, player2, inj_count, league.league
from inj_match inner join matches on inj_match.matches=matches.id inner join league on matches.league=league.id
where inj_count=(select MAX(inj_c) 
from (Select count(matches) inj_c
from injuries
group by matches) x);

--2
select top 3 injuries, count(injuries) num from matches inner join injuries on matches.id=injuries.matches
where MONTH(matches.date) IN (12,1,2)
group by injuries.injuries 
order by num desc

--3
select players.players, salary
from cards inner join players on cards.players=players.id 
inner join contracts on players.id=contracts.players 
inner join salary on contracts.players=salary.id
where players.id in (select players from
(select top 3 players, count(players) k
from cards group by players order by count(players)) x)

--4
select player1
from matches inner join teams on matches.player1=teams.id 
inner join stadiums on teams.id=stadiums.teams
where teams.id in 
(select top 1 player1 
from(select top 1 player1, count(player1) k from matches 
group by player1)x)
group by player1

--5
select *
from teams inner join champions on teams.id=champions.teams
inner join titles on champions.titles=titles.id
where teams.id in 
(select top 1 teams from champions 
group by teams)

--6
select teams.id
from teams inner join champions on teams.id=champions.teams
inner join titles on champions.titles=titles.id
where teams.id in 
(select top 10 teams from champions 
group by teams)
intersect
select top 10 currentTeam from(
select top 10 currentTeam, avg(salary) avg_sal
from cards inner join players on cards.players=players.id 
inner join contracts on players.id=contracts.players 
inner join salary on contracts.players=salary.id
group by currentTeam
order by avg_sal desc) x

--7
select players.players, salary, cards.matches
from cards inner join players on cards.players=players.id 
inner join contracts on players.id=contracts.players 
inner join salary on contracts.players=salary.id
where players.id in (select players from
(select top 3 players, count(players) k
from cards
where yellow0red1='true' group by players order by count(players)) x)

--8
select top 1 currentTeam, count(currentTeam) c
from cards inner join players on cards.players=players.id 
inner join contracts on players.id=contracts.players 
inner join salary on contracts.players=salary.id
where players.id in (select players from
contracts where expiryDate<GETDATE())
group by currentTeam
order by c desc

--9
select player1
from matches inner join teams on matches.player1=teams.id 
inner join league on matches.league=league.id
where teams.id in 
(select top 1 player1 from matches
where league='4'
group by player1
order by count(player1) desc)
group by player1

--10
select matches.id, champions.teams, champions.date,
teams1.id, teams1.teams, teams2.id, teams2.teams 
from matches 
left join teams as teams1 on matches.player1=teams1.id
left join teams as teams2 on matches.player2=teams2.id
inner join champions on champions.date=matches.date
where champions.teams=teams1.id or champions.teams=teams2.id