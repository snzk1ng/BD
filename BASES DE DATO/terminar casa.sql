SELECT postal_code , street_address
FROM locations;


SELECT region_name
	FROM regions JOIN countries USING (region_id)
				JOIN locations USING (country_id)
				
		