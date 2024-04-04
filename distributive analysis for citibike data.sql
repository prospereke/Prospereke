## this query shows the total number of bikes and docks available across stations.
select
sum(num_bikes_available) as bikes_available,
sum(num_docks_available) as docks_available
from `bigquery-public-data.new_york_citibike.citibike_stations`;
--now calculate the mean for the bikes and docks available.
select 
AVG(num_bikes_available) as mean_bikes,
avg(num_docks_available) as mean_docks
from `bigquery-public-data.new_york_citibike.citibike_stations`;
-- calculate the median
with ranked as(
select
  num_bikes_available,
  row_number()over(order by num_bikes_available) as A,
  count(num_bikes_available) over()as B
  from `bigquery-public-data.new_york_citibike.citibike_stations`
),
median as (
  select num_bikes_available,
  from ranked 
  where A in (floor((B+1)/2), ceiling((B+1)/2))
)
select avg(num_bikes_available) from median;
-- calculate the median for docks available
with d_ranked as(
select 
num_docks_available,
row_number()over (order by num_docks_available) as C,
count(num_docks_available) over ()as D
from `bigquery-public-data.new_york_citibike.citibike_stations`
),
median as (
  select num_docks_available,
  from d_ranked
  where C in (floor((D+1)/2), ceiling((D+1)/2))
)
select avg(num_docks_available) from median;
-- calculate the mode for bikes
select
num_bikes_available as mode_bikes,
count(*)
from `bigquery-public-data.new_york_citibike.citibike_stations`
group by num_bikes_available
order by count(*) desc
limit 3;
-- calculate the mode for docks
select
num_docks_available as mode_docks,
count(*) 
from `bigquery-public-data.new_york_citibike.citibike_stations`
group by num_docks_available
order by count(*) desc
limit 3


