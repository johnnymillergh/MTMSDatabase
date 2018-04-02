# Retrieve the top sales movies in ascending order
# 根据票房从高到低查询出电影
select movie_title, sum(total_price) as sales, (@ranking:=@ranking + 1) as ranking
from customer_order, (select @ranking:=0) as x
group by movie_title
order by ranking asc;

select movie_title, sum(total_price) as gross
from customer_order
group by movie_title
order by gross desc;

# Retrieve movie schedule sorted by theater with lowest price in ascending order of theater id.
# 根据影院的不同查询出正在上映的同一部电影，并获得该影院放的该电影对应最低的票价，按照影院的ID升序排序
SELECT id,movie_id,movie_title,auditorium_theater_id,theater_name,location,auditorium_id,auditorium_name,min(price),showtime
FROM movie_schedule
where movie_id=1
group by auditorium_theater_id
order by auditorium_theater_id asc;

# Retrieve movie schedule going to be shown the same movie in the same theater in ascending order of its price.
# 查询某一个影院上映的同一部电影，按照价格升序排序
SELECT *
FROM movie_schedule
WHERE auditorium_theater_id=1 AND movie_title='The Greatest Showman (2017)'
GROUP BY auditorium_id
ORDER BY price asc;

# Retrieve the top rated movies by each movies average score in descending order
# 按照电影评分平均分的高到低，查询出热门电影
select (select title from movie where id=movie_id) as title, avg(score) as average_score
from user_review
group by movie_id
order by average_score desc, title asc;
