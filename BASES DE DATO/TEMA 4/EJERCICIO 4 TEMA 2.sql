1
--Seleccionar el COMPANY_NAME y CONTACT_NAME de aquellos CUSTOMERS 
--que hayan hecho pedidos (ORDERS).

SELECT DISTINCT company_name, contact_name
FROM customers JOIN orders USING(customer_id);


2
--Seleccionar el número de 
--pedidos que hemos enviado en la década de los 90 con las empresas Federal Shipping o United Package.
	SELECT COUNT (*) AS "PEDIDIOS"
	FROM orders o 
		JOIN shippers s ON (ship_via=s.shipper_id)
	WHERE company_name IN ('Federal Shipping','United Package')
	AND TO_CHAR (shipped_date,'YYYY') BETWEEN '1990'AND '1999'
	

3.
--Seleccionar el nombre de aquellos productos que han sido solicitados en algún pedido.
SELECT DISTINCT (product_name)
FROM products
WHERE units_on_order!=0

--correccion
SELECT DISTINCT product_name
FROM products JOIN order_details USING (product_id)

4.

--Seleccionar la suma de los importes "cobrados" en todos los pedidos realizados en el año 96.

SELECT SUM(o.unit_price * quantity * (1 - discount))
FROM products JOIN order_details o USING (product_id)
	JOIN orders USING (order_id)
WHERE TO_CHAR (order_date,'YYYY')IN ('1996')


5.
--Seleccionar el nombre de contacto del cliente y el del empleado para aquellos 
--clientes y empleados que han participado en pedidos donde la diferencia entre 
--la fecha de envío y la fecha de requisito sea menos de 20 días

SELECT DISTINCT contact_name, first_name , last_name
	FROM orders JOIN customers USING (customer_id)
		JOIN employees USING (employee_id)
WHERE AGE (required_date, shipped_date) BETWEEN -('19 day'::interval) AND ('19 day'::interval)

--correcion

SELECT contact_name, first_name , last_name
	FROM orders JOIN customers USING (customer_id)
		JOIN employees USING (employee_id)
--WHERE required_date - shipped_date < 20


6.
SELECT s.company_name , required_date
FROM shippers s JOIN orders o ON (s.shipper_id=o.ship_via)
        JOIN customers  USING (customer_id)
        JOIN customer_customer_demo USING (customer_id)
        JOIN customer_demographics USING (customer_type_id)
    WHERE s.company_name ILIKE '%a'
        AND TO_CHAR(required_date,'MM')IN ('05','04','10')
ORDER BY required_date DESC


