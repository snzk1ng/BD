SELECT 'valor: '|| 129;

SELECT char_length('jose jajajajajajajajaqja');

SELECT lower ('JIJIJJA');

SELECT upper('ñia');

SELECT left ('Betis',2);

SELECT right ('Betis',1);

SELECT replace ('betisbetisbetis','be','ti');

SELECT ltrim ('rbb1907','rbb');

SELECT repeat ('Viva el betis ',10);

SELECT reverse ('Derbi');

SELECT overlay ('Bxxxx' placing 'etis' from 2 for 5 ); 

SELECT substr('Animar',2,3	);

SELECT strpos('oriana','ri');

SELECT starts_with ('Betis','be');

SELECT split_part ('Beti€Sevilla€Barsa€Madrid','€',1);


SELECT estacion , temperatura_maxima,
    CASE 
		WHEN temperatura_maxima > 38 then 'Muito calor mnito'
		WHEN temperatura_maxima BETWEEN 30 AND 38 then 'No hace tanto crl'
		ELSE 'Nada de calor'
		
	END 
	CASE AS "another_name"
	FROM climatologia
	WHERE provincia ='Sevilla';
	
	
	
	
	
	
	
	
	
