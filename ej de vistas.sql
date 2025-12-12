use sakila;
CREATE VIEW active_customers AS
SELECT customer_id, first_name, last_name, email, create_date
FROM customer
WHERE active = 1;

CREATE VIEW available_movies AS
SELECT f.film_id, f.title, f.description, f.release_year, f.rating, i.inventory_id
FROM film f
JOIN inventory i ON f.film_id = i.film_id
WHERE i.inventory_id NOT IN (
    SELECT r.inventory_id 
    FROM rental r 
    WHERE r.return_date IS NULL
);

CREATE VIEW film_categories AS
SELECT f.film_id, f.title, c.name AS category_name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

CREATE VIEW film_revenues AS
SELECT f.film_id, f.title, SUM(p.amount) AS total_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id, f.title;

CREATE VIEW customer_rentals AS
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

CREATE VIEW top_5_rented_movies AS
SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC
LIMIT 5;

CREATE VIEW film_actors AS
SELECT f.film_id, f.title, a.actor_id, a.first_name, a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id;

CREATE VIEW store_movies AS
SELECT s.store_id, s.store_id, f.film_id, f.title, i.inventory_id
FROM store s
JOIN inventory i ON s.store_id = i.store_id
JOIN film f ON i.film_id = f.film_id;

CREATE VIEW customer_payments AS
SELECT c.customer_id, c.first_name, c.last_name, p.payment_id, p.amount, p.payment_date
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id;

CREATE VIEW film_languages AS
SELECT f.film_id, f.title, l.name AS language
FROM film f
JOIN language l ON f.language_id = l.language_id;



