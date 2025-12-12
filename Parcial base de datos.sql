use sakila;
-- 1-obtener actores con mas de 10 peliculas
-- encuentra los nombres de los actores que han actuado en mas de 10 peliculas. usa una subconsulta para contar las peliculas de cada actor
SELECT actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id IN (
    SELECT film_actor.actor_id
    FROM film_actor
    GROUP BY film_actor.actor_id
    HAVING COUNT(film_actor.film_id) > 10
);


-- 2-peliculas que no han sido alquiladas
-- listar los titulos de las peliculas que no han sido alquiladas
SELECT f.title
FROM film f
WHERE f.film_id NOT IN (
    SELECT r.film_id
    FROM rental r
);


-- 3 clientes que alquilaron peliculas especificas
-- encuentra los nombres de los clientes que han alquilado alguna pelicula en la categoria comedy
SELECT first_name, last_name
   FROM customer
   WHERE customer_id IN (
       SELECT customer_id
       FROM rental
       WHERE inventory_id IN (
           SELECT inventory_id
           FROM inventory
           WHERE film_id IN (
               SELECT film_id
               FROM film
               WHERE film_id IN (
                   SELECT film_id
                   FROM film_category
                   WHERE category_id = (
                       SELECT category_id
                       FROM category
                       WHERE name = 'Comedy'
                   )
               )
           )
       )
   );


-- 4-paises con mas de 50 ciudades
-- encuentra los paises que tienen mas de 50 ciudades registradas
SELECT c.country_id, c.country, COUNT(ci.city_id) AS num_cities
FROM country c
JOIN city ci ON c.country_id = ci.country_id
GROUP BY c.country_id, c.country
HAVING num_cities > 50;


-- 5 peliculas mas larga que el promedio
-- muestra las peliculas cuya duracion es mayor al promedio de todas las peliculas
SELECT title, length
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film
);


-- 6-alquileres mas recientes por cliente
-- encuentre el alquiler mas reciente para cada cliente
SELECT customer_id, rental_date
FROM rental
WHERE rental_date=(
SELECT max(rental_date) FROM rental AS r2
WHERE r2.customer_id=rental.customer_id);


-- 7 categorias con mas peliculas
-- muestra la categoria que tiene el mayor numero de peliculas
SELECT name
FROM category 
WHERE category_id =(
    SELECT category_id
    FROM film_category 
    GROUP BY category_id
    ORDER BY count(film_id) DESC
);



-- 8 clientes que no han alquilado el ultimo año
-- listar los clientes que no han alquilado peliculas el ultimo año
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.customer_id NOT IN (
    SELECT r.customer_id
    FROM rental r
    WHERE r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);


-- 9 peliculas que no estan en el inventario
-- muestra los titulos de peliculas que no estan en el inventario
SELECT title
FROM film
WHERE film_id NOT IN (
    SELECT DISTINCT film_id
    FROM inventory
);


-- 10 clientes con mas de 5 alquileres
-- muestra los nombres de los clientes que han realizado mas de 5 alquileres
SELECT c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
HAVING MAX(r.rental_id) > 5;




 
