--tripduration
select
start_station_id,
end_station_id,
format_time('%H:%M:%S',Time(starttime))as startime_,
format_time('%H:%M:%S',Time(stoptime))as stoptime_,
avg(timestamp_diff(stoptime,starttime,minute))as avg_tripduration_minutes
from `bigquery-public-data.new_york_citibike.citibike_trips`
group by start_station_id, end_station_id,starttime,stoptime
order by avg_tripduration_minutes desc;
-- calculate the most common start and stop stations
select
start_station_name,
count(start_station_id)as most_popular_station
from `bigquery-public-data.new_york_citibike.citibike_trips`
group by start_station_name,start_station_id
order by most_popular_station desc
limit 5;
-- calculate the peak hours
select
start_station_name,
left(cast (starttime as string),2) as hour_of_day,
count(*)as trip_hour
from `bigquery-public-data.new_york_citibike.citibike_trips`
where starttime is not null
group by hour_of_day,start_station_name
order by hour_of_day
limit 5;
--determine popular routes
select
start_station_id,
end_station_id,
concat(start_station_name,end_station_name)as route_name,
concat(left(cast(start_station_id as string),1),right(cast(end_station_id as string),2)) as routeID,
count(*) as popular_route_count
from `bigquery-public-data.new_york_citibike.citibike_trips`
where start_station_id is not null
group by start_station_id, end_station_id,route_name,routeID
order by popular_route_count desc
limit 5
