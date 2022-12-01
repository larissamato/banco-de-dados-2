CREATE OR REPLACE FUNCTION soma_dois_numeros (IN x int, IN y int)
	RETURNS int as
	$$BEGIN
		return x + y;
	END;$$
LANGUAGE 'plpgsql';

select soma_dois_numeros(10,20);