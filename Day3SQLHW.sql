SELECT *
FROM address;

--question 1

SELECT c.first_name, c.last_name, a.district
FROM customer c
JOIN address a
ON a.address_id = c.address_id
AND a.district IN ('Texas');

--question 2

SELECT c.first_name, c.last_name, p.amount
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
JOIN payment p 
ON r.rental_id = p.rental_id
GROUP BY c.first_name, c.last_name, p.amount
HAVING COUNT(amount) > 7;

--not sure where I went wrong on this one^^^^^^

--question 3

SELECT *
FROM payment;

SELECT c.first_name, c.last_name, p.amount
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
JOIN payment p 
ON r.rental_id = p.rental_id
GROUP BY c.first_name, c.last_name, p.amount
HAVING SUM(amount) > 175;

--question 4

SELECT *
FROM country;

SELECT cu.first_name, cu.last_name, a.district, ci.city, co.country
FROM customer cu
JOIN address a
ON cu.address_id = a.address_id
JOIN city ci
ON a.city_id = ci.city_id 
JOIN country co
ON ci.country_id = co.country_id
AND co.country IN ('Argentina');

--question 5
SELECT *
FROM film_category; 


SELECT c.category_id, c.name, COUNT(fc.category_id)
FROM category c
WHERE category_id = (
	SELECT category_id 
	FROM film_category fc
	GROUP BY c.category_id, c.name
	ORDER BY COUNT(fc.category_id) DESC 
);

--qeustion 6
SELECT *
FROM film_actor;

SELECT *
FROM actor;

SELECT film_id, SUM(actor_id)
FROM film_actor 
GROUP BY film_id 
ORDER BY SUM(actor_id) DESC
LIMIT 1;

--question 7

SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id)
FROM actor a
JOIN film_actor fa 
ON fa.actor_id = a.actor_id
GROUP BY a.actor_id 
ORDER BY COUNT(fa.film_id) ASC
LIMIT 1;

--question 8

SELECT c.country, SUM(ci.city_id)
FROM country c
JOIN city ci
ON ci.country_id = c.country_id 
GROUP BY country
ORDER BY SUM(ci.city_id) DESC;

--question 9

SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id)
FROM actor a
JOIN film_actor fa 
ON fa.actor_id = a.actor_id
GROUP BY a.actor_id 
ORDER BY COUNT(fa.film_id) ASC
OFFSET 10
LIMIT 65;





