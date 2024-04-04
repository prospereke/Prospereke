select
sum (cast(count_for_d1 as float64)) as total_num_of_movies_directed_by_d1,
sum(cast(count_for_d2 as float64)) as total_num_of_movies_directed_by_d2
from
(
select
Movie_Title, 
count(Director__1_) as count_for_d1,
count(Director__2_) as count_for_d2
from `vast-tributary-407516.movies.movie_database`
group by Movie_Title)