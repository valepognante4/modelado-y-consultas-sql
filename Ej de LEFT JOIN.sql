use sakila;
SELECT 
    actor.actor_id,
    actor.first_name,
    actor.last_name,
    film.film_id,
    film.title
FROM actor
LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id
LEFT JOIN film ON film_actor.film_id = film.film_id
ORDER BY actor.actor_id;

SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    payment.payment_id,
    payment.amount,
    payment.payment_date
FROM 
    customer
LEFT JOIN 
    payment ON customer.customer_id = payment.customer_id
ORDER BY 
    customer.customer_id;
    
SELECT customer.first_name AS Nombre, 
       customer.last_name AS Apellido, 
       SUM(payment.amount) AS Total_Pagos
FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY Nombre, Apellido;

SELECT 
 film.film_id,
 film.title,
 category.category_id,
 category.name as category_name
 FROM film
 LEFT JOIN film_category ON film.film_id=film_category.film_id
 LEFT JOIN category ON film_category.category_id=category.category_id
 ORDER BY film.film_id;

SELECT film.title AS Película, COUNT(rental.rental_id) AS Cantidad_Alquileres
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY Película;

SELECT store.store_id AS id_Tienda, store.store_name AS Nombre_Tienda,
CONCAT(staff.first_name,' ',staff.last_name)AS Empleado
FROM store
LEFT JOIN staff ON store.store_id=staff.store_id
ORDER BY store.store_id, Empleado; 

SELECT film.title AS Película, 
       CONCAT(actor.first_name, ' ', actor.last_name) AS Actor
FROM film
LEFT JOIN film_actor ON film.film_id = film_actor.film_id
LEFT JOIN actor ON film_actor.actor_id = actor.actor_id
ORDER BY film.title, Actor;

SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS Cliente, 
       film.title AS Película
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
LEFT JOIN inventory ON rental.inventory_id = inventory.inventory_id
LEFT JOIN film ON inventory.film_id = film.film_id
ORDER BY Cliente, Película;

SELECT CONCAT(actor.first_name, ' ', actor.last_name) AS Actor, 
       category.name AS Categoría
FROM actor
LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id
LEFT JOIN film ON film_actor.film_id = film.film_id
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id
ORDER BY Actor, Categoría;

SELECT store.store_id AS ID_Tienda, 
       store.store_name AS Nombre_Tienda, 
       CONCAT(customer.first_name, ' ', customer.last_name) AS Cliente
FROM store
LEFT JOIN customer ON store.store_id = customer.store_id
ORDER BY store.store_id, Cliente;

SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS Cliente,
       payment.payment_id AS ID_Pago,
       payment.amount AS Monto,
       payment.payment_date AS Fecha_Pago
FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id
ORDER BY Cliente, Fecha_Pago;

SELECT film.title, language.name AS language
FROM film
LEFT JOIN language ON film.language_id = language.language_id;

SELECT rental.rental_id,rental.rental_date, payment.payment_id, payment.amount, payment.payment_date
FROM rental
LEFT JOIN payment ON rental.rental_id=payment.rental_id;

SELECT staff.staff_id, staff.first_name, staff.last_name, film.title, rental.rental_date
FROM staff
LEFT JOIN rental ON rental.staff_id=staff.staff_id
LEFT JOIN inventory ON rental.inventory_id=inventory.inventory_id
LEFT JOIN film ON inventory.film_id=film.film_id;

SELECT film.title, language.name AS language
FROM film
LEFT JOIN language ON film.language_id=film.language_id;

SELECT category.name, film.title
FROM category
LEFT JOIN film_category ON category.category_id=film_category.category_id
LEFT JOIN film ON film_category.film_id=film.film_id;

SELECT actor.first_name, actor.last_name, film.title AS film_title, language.name AS language_name
FROM actor
LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id
LEFT JOIN film ON film_actor.film_id = film.film_id
LEFT JOIN language ON film.language_id = language.language_id;

SELECT customer.first_name, customer.last_name, staff.first_name, staff.last_name
FROM customer
LEFT JOIN rental ON customer.customer_id=rental.customer_id
LEFT JOIN staff ON rental.staff_id=staff.staff_id;

SELECT category.name, film.title
FROM category
LEFT JOIN film_category ON category.category_id=film_category.category_id
LEFT JOIN film ON film_category.film_id=film.film_id;

SELECT staff.first_name, staff.last_name, store.store_id, store.store_name
FROM staff
LEFT JOIN store ON staff.store_id=store.store_id;

SELECT actor.first_name, actor.last_name, film.title, COUNT(film.film_id) OVER (PARTITION BY actor.actor_id) AS film_count
FROM actor
LEFT JOIN film_actor ON actor.actor_id=film_actor.actor_id
LEFT JOIN film ON film.film_id=film_actor.film_id;

