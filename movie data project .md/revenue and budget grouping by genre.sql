select
  Genre,
  sum(revenue) as revenue_per_genre,
  sum(budget_) as budget_per_genre
from `vast-tributary-407516.movies.movie_database`
group by Genre
order by revenue_per_genre desc
