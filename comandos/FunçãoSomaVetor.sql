CREATE OR REPLACE FUNCTION Soma ( VARIADIC x int[] , OUT total int ) AS 
	$$ BEGIN
		SELECT INTO total sum( x[ i ] ) 
		FROM generate_subscripts( x, 1 ) AS g( i );
	END; $$
LANGUAGE PLPGSQL;

SELECT soma(1,2,3,4,5,6,7);