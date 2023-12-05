1./*Seleccionar el número de pedidos atendidos 
por cada empleado, sí y sólo si dicho número está entre 100 y 150.*/

SELECT first_name  , COUNT (*) AS "empleado"
FROM orders JOIN employees USING (employee_id) 
GROUP BY first_name
HAVING  COUNT (*) BETWEEN 100 AND 150
ORDER BY COUNT (*) ASC 

2./*Seleccionar el nombre de las empresas que no han realizado ningún pedido.*/

SELECT company_name , COUNT (*)
FROM shippers RIGHT JOIN orders ON (shipper_id=order_id)
WHERE order_id IS NULL
GROUP BY company_name
