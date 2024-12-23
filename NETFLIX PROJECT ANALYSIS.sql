CREATE DATABASE netflix_db;
USE netflix_db;

DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
	show_id	VARCHAR(5),
	movie_type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);

SELECT * FROM netflix;

-- [1] Count the number of Movies vs TV Shows

SELECT COUNT(*) AS total_content
FROM netflix;

-- [2] Find the most common rating for movies and TV shows

select movie_type , rating , count(*) as total_count
from netflix
group by movie_type , rating
order by  total_count desc;

-- [3] List All Movies Released in a Specific Year (e.g., 2020)

select title 
from netflix 
where release_year ='2020 ' and movie_type ='movie' ;

-- [4] Identify the Longest Movie

select title , duration 
from netflix  
where movie_type ='movie' 
ORDER BY  LENGTH(duration) DESC
LIMIT 1;

-- [5] Find All Movies/TV Shows by Director 'Ben Simms'

select director , title, movie_type
from netflix  
where director ='Ben Simms'; 

-- [6] Find All Content Without a Director

SELECT title
FROM netflix
WHERE director IS NULL OR director = '';

-- [7] List All Movies that are Documentaries

select title 
FROM netflix
where listed_in like '%Documentaries';

-- [8] Find All Movies with a Rating Above a Certain Threshold (e.g., '8.0')

select title 
from netflix
where movie_type ='movie' and rating >= '8.0';

-- [9] Determine the most frequently listed genres on Netflix.

select  listed_in , count(*) as Most_Listed_Genres 
from netflix
group by listed_in
order by Most_Listed_Genres desc
limit 10;

-- [10]  Identify the countries that contribute the most content to Netflix.  
   
select country , count(*) as Most_Contrinuted_Country
from netflix
where country is not null and country <>''
group by  country
order by Most_Contrinuted_Country desc
limit 3;

-- [11] Find out which actors/actresses appear most frequently on Netflix.  

select casts, count(*) as Cast_Count
from netflix
where casts is not null and casts <> ''
group by casts
order by Cast_Count desc
limit 5;

-- [12] Investigate which release years dominate Netflix’s catalog.

select  release_year , count(*) as Release_Year_and_Popularity
from netflix
group by release_year
order by Release_Year_and_Popularity desc
limit 10;

-- [13]  Explore how the duration of Movies and TV Shows varies across genres and ratings.  
    
SELECT movie_type, AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS Avg_Duration 
FROM netflix 
WHERE duration LIKE '%min%' 
GROUP BY movie_type;

-- [14] Calculate the average time gap between a title’s release year and the year it was added to Netflix.  
   
SELECT title, release_year, DATE_FORMAT(STR_TO_DATE(date_added, '%M %d, %Y'), '%Y') AS Added_year, 
           (DATE_FORMAT(STR_TO_DATE(date_added, '%M %d, %Y'), '%Y') - release_year) AS Time_gap 
FROM netflix 
WHERE date_added IS NOT NULL 
ORDER BY time_gap DESC 
LIMIT 10;

-- [15] Assess Netflix’s catalog diversity by analyzing the number of unique countries and genres represented.  

SELECT COUNT(DISTINCT country) AS Unique_Countries,
        COUNT(DISTINCT listed_in) AS Unique_Genres 
FROM netflix;
    
-- [16] Identify which genres or countries Netflix should invest in.

select listed_in, country, count(*) as  Invest_countries
FROM netflix
group by listed_in, country
order by Invest_countries desc
limit 10;

-- [17] Determine whether a director’s past content trends can predict future success.  

SELECT director, COUNT(*) AS content_count, GROUP_CONCAT(DISTINCT listed_in) AS genres 
FROM netflix 
where director is not null and director <>''
GROUP BY director 
ORDER BY content_count DESC 
LIMIT 10;    

-- [18]Explore how regional cultures influence Netflix’s catalog diversity

SELECT country, listed_in, COUNT(*) AS content_count 
FROM netflix 
GROUP BY country, listed_in 
ORDER BY content_count DESC 
LIMIT 20;

-- [19]Analyze whether certain ratings correlate with higher viewer interest

SELECT rating, AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS avg_duration 
FROM netflix 
WHERE duration LIKE '%min%' 
GROUP BY rating 
ORDER BY avg_duration DESC;

-- [20] Build a recommendation system using genres and cast members (e.g.Chris Hemsworth)  

SELECT title, listed_in, casts 
FROM netflix 
WHERE listed_in LIKE '%Action%' 
OR casts LIKE '%Chris Hemsworth%' 
LIMIT 10;









