DBCC DROPCLEANBUFFERS;   --Clears query cache
DBCC FREEPROCCACHE;   --Clears execution plan cache
set statistics time on
select top 3 injuries, count(injuries) num 
from matches inner join injuries on matches.id=injuries.matches
where MONTH(matches.date) IN (12,1,2)
group by injuries.injuries 
order by num desc
set statistics time off