use empleados;
SELECT apellido1 FROM empleado;
SELECT*FROM empleado;
SELECT nombre, apellido1, apellido2 FROM empleado;
SELECT id FROM empleado;
SELECT DISTINCT id FROM empleado;
SELECT CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, '')) AS 'Nombre Completo'
FROM empleado;
SELECT UPPER(CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, ''))) AS 'Nombre Completo'
FROM empleado;
SELECT LOWER(CONCAT(nombre, ' ', apellido1, ' ', IFNULL(apellido2, ''))) AS 'Nombre Completo'
FROM empleado;
SELECT nombre, presupuesto - gastos AS presupuesto_actual
FROM departamento;
SELECT nombre, presupuesto - gastos AS presupuesto_actual
FROM departamento
ORDER BY presupuesto_actual ASC;
SELECT nombre FROM departamento ORDER BY nombre ASC;
SELECT nombre FROM departamento ORDER BY nombre DESC;
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto DESC LIMIT 3;
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto ASC LIMIT 3;

SELECT   nombre, gastos
FROM departamento
ORDER BY gastos ASC LIMIT 2;

SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 150000;
SELECT nombre, gastos FROM departamento WHERE gastos < 5000;
SELECT nombre, presupuesto, gastos FROM departamento WHERE gastos < presupuesto AND presupuesto BETWEEN 100000 AND 200000;

SELECT nombre, presupuesto, gastos
FROM departamento
WHERE presupuesto  NOT BETWEEN 100000 AND 200000;

SELECT nombre, gastos, presupuesto
FROM departamento
WHERE gastos > presupuesto;

SELECT * FROM empleado WHERE apellido2 IS NULL;
SELECT * FROM empleado WHERE apellido2 IS NOT NULL;
SELECT nombre, apellido2 FROM empleado WHERE apellido2 IN ('Díaz', 'Moreno');
SELECT nombre,apellido1, apellido2, nif  FROM empleado WHERE id_departamento=3;
SELECT nombre,apellido1, apellido2, nif
FROM empleado
WHERE id_departamento IN (2, 4, 5);


