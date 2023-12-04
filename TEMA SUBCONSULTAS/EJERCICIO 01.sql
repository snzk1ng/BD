/*1.Seleccionar el salario máximo de cada departamento, 
mostrando el nombre del departamento y dicha cantidad.*/

SELECT COALESCE(department_name , 'Sin departamento'), MAX (salary)
FROM departments RIGHT JOIN employees USING (department_id)
GROUP BY department_name

/*2Seleccionar el salario mínimo de cada departamento, 
para aquellos departamentos cuyo salario mínimo sea menor que 5000$.*/

SELECT MIN(salary) , department_name 
FROM departments  JOIN employees USING (department_id)
WHERE salary < 5000
GROUP BY  department_name

/*3. Seleccionar el número de empleados que trabajan en cada oficina, mostrando el STREET_ADDRESS
y dicho número; hay que ordenar la salida de mayor a menor.*/

SELECT street_address , COUNT (*)
FROM locations JOIN departments USING (location_id)
	JOIN employees USING (department_id)
GROUP BY street_address
ORDER BY street_address DESC