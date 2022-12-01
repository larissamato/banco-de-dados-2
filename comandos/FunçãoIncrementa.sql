CREATE OR REPLACE FUNCTION incrementa ( x integer)
	RETURNS integer AS
 	$$ BEGIN
		RETURN x + 1 ;
 	END; $$
 LANGUAGE PLPGSQL;

SELECT incrementa ( 10 );


CREATE OR REPLACE FUNCTION soma ( x integer, y integer)
	RETURNS integer AS
 	$$ BEGIN
		RETURN x + y ;
 	END; $$
 LANGUAGE PLPGSQL;

SELECT soma ( 10, 5 );