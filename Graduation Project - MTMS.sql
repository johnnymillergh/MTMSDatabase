# Retrieve the top sales movies in ascending order
# 根据票房从高到低查询出电影
select movie_title, sum(total_price) as sales, (@ranking:=@ranking + 1) as ranking
from customer_order, (select @ranking:=0) as x
group by movie_title
order by ranking asc;

# Retrieve movie schedule sorted by theater with lowest price in ascending order of theater id.
# 根据影院的不同查询出正在上映的同一部电影，并获得该影院放的该电影对应最低的票价，按照影院的ID升序排序
SELECT id,movie_id,movie_title,auditorium_theater_id,theater_name,location,auditorium_id,auditorium_name,min(price),showtime
FROM movie_ticket_management_system.movie_schedule
where movie_id=1
group by auditorium_theater_id
order by auditorium_theater_id asc;