select
  movie_title,
  Budget_,
  Revenue,
  sum(cast(revenue as float64)) as top_grossing_movies,
  cast(budget_/revenue as float64) as budget_to_revenue_ratio
from `vast-tributary-407516.movies.movie_database`
group by Movie_Title, Budget_,Revenue
order by top_grossing_movies desc
limit 5
## this query returns the tiop five grossing movies and their budget to revenue ratio