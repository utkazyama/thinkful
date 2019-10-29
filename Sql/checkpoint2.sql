SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'film';

SELECT *
FROM film
LIMIT 100;

SELECT title, description, rental_rate, 
ROUND(rental_rate*1.02, 2) AS rental_rate_increase
FROM film;

SELECT CONCAT(INITCAP(title), '. Rated: ', rating) AS title_rating, release_year
FROM film;