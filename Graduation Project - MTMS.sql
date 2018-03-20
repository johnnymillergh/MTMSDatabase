# Retrieve the top sales movies in ascending order
# 根据票房从高到低查询出电影
select movie_title, sum(total_price) as sales, (@ranking:=@ranking + 1) as ranking
from customer_order, (select @ranking:=0) as x
group by movie_title
order by ranking asc;