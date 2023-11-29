SELECT DISTINCT jefe.first_name , jefe.last_name
FROM employees emp JOIN employees jefe
	ON (emp.manager_id = jefe.employee_id)
	JOIN departments d ON (emp.department_id = d.department_id)
WHERE department_name = 'IT'


JOIN DENTRO DE OTRO JOIN 