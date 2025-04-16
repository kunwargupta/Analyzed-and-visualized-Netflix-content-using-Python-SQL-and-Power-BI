
-- 1. Number of TV Shows vs Movies
SELECT type, COUNT(DISTINCT title) AS total_titles
FROM netflix_cleaned
GROUP BY type;

-- 2. Top 10 Countries with Most Content
SELECT country, COUNT(DISTINCT title) AS no_of_shows
FROM netflix_cleaned
GROUP BY country
ORDER BY no_of_shows DESC
LIMIT 10;

-- 3. Content Added Over Years
SELECT release_year, COUNT(title) AS no_of_shows
FROM netflix_cleaned
GROUP BY release_year
ORDER BY release_year DESC;

-- 4. Most Common Ratings
SELECT rating, COUNT(rating) AS total
FROM netflix_cleaned
GROUP BY rating
ORDER BY total DESC;

-- 5. Most Common Durations (for Movies)
SELECT duration_int, COUNT(duration_int) AS count
FROM netflix_cleaned
WHERE type = 'Movie'
GROUP BY duration_int
ORDER BY count DESC;

-- 6. Top 5 Genres
SELECT listed_in, COUNT(listed_in) AS count
FROM netflix_cleaned
GROUP BY listed_in
ORDER BY count DESC
LIMIT 5;

-- 7. Monthly/Yearly Trends of Content on Netflix
SELECT YEAR(date_added) AS years, COUNT(title) AS count
FROM netflix_cleaned
GROUP BY years
ORDER BY years;

-- 8. Top Directors
SELECT director, type, COUNT(*) AS no_of_directs
FROM netflix_cleaned
WHERE director != 'not given'
GROUP BY director, type
ORDER BY no_of_directs DESC;

-- 9. Most Common Combinations of Genre + Type
SELECT type, listed_in, COUNT(*) AS total
FROM netflix_cleaned
GROUP BY type, listed_in
ORDER BY total DESC
LIMIT 10;

-- 10. Oldest Content
SELECT title, release_year
FROM netflix_cleaned
ORDER BY release_year ASC
LIMIT 1;

-- 11. Newest Content
SELECT title, release_year
FROM netflix_cleaned
ORDER BY release_year DESC
LIMIT 1;

-- 12. Content Growth Over Time
SELECT release_year, COUNT(*) AS total
FROM netflix_cleaned
GROUP BY release_year
ORDER BY total DESC, release_year
LIMIT 10;

-- 13. Content by Country and Type
SELECT country, type, COUNT(*) AS no_of_content
FROM netflix_cleaned
GROUP BY country, type
ORDER BY no_of_content DESC
LIMIT 10;

-- 14. Content Types Over the Years
SELECT YEAR(date_added) AS years, type, COUNT(type) AS content_type
FROM netflix_cleaned
GROUP BY years, type
ORDER BY years;
