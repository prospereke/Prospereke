select
  released_year,
  count(released_year)as number_of_movies_per_year,
  sum(cast(revenue as float64))as total_revenue
  from
      (select
      release_date,
      left(cast(release_date as string),4)as released_year,revenue
from vast-tributary-407516.movies.movie_database) as movies_per_year
  group by released_year
  order by total_revenue desc