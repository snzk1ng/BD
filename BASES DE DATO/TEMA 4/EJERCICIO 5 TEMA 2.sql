/*Seleccionar los nombres de los productos que hayan 
sido solicitados en pedidos que hayan sido enviados por la empresa United Package.
*/
SELECT DISTINCT product_name
FROM products p JOIN order_details USING
	(product_id) JOIN orders USING (order_id)
	JOIN shippers ON (shipper_id = ship_via)
WHERE company_name = 'United Package'

/*2*/

SELECT DISTINCT product_name , category_name
FROM categories JOIN products USING (category_id)
	JOIN order_details USING (product_id)
	JOIN orders USING (order_id)
WHERE EXTRACT (month FROM order_date)= 8;

/*3*/

SELECT company_name
FROM  customers 


/*4*/

SELECT DISTINCT e.first_name, e.last_name
FROM customers c JOIN orders USING (customer_id)
		JOIN employees e USING (employee_id)
WHERE c.country = 'Brazil'


/*5*/

SELECT DISTINCT product_name , category_name
FROM orders JOIN employees e USING (employee_id)
		JOIN order_details USING (order_id)
		JOIN products USING (product_id)
		JOIN categories USING (category_id)
WHERE e.first_name = 'Janet'
	AND e.last_name = 'Leverling'
	
/*6*/
--selecciona el nombre de la compañia , su numero de telefono respectivo y el nombre del producto
-- donde el id del empleado tenga al menos un 1 o un 2
--la region desde donde se venda sea Isle of Wight
-- donde los productos tengan mas de un 2% de descuento
--y el nombre del producto tenga una a 
--ordena el nombre de la compañia por orden de telefono

SELECT company_name , phone , product_name
FROM shippers  LEFT JOIN orders  ON (shipper_id=ship_via)
		JOIN order_details  USING (order_id)
		JOIN products USING (product_id)
WHERE employee_id IN ('1','2')
	AND discount::text = '0.15'
	AND product_name ILIKE ('%a')


SELECT DISTINCT*
FROM customers LEFT JOIN orders USING (customer_id)
WHERE order_id IS NULL
