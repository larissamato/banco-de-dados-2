CREATE OR REPLACE FUNCTION MaxMin ( x int, y int, z int, OUT max int, OUT min int ) AS 
	$$BEGIN
		max := GREATEST(x, y, z);
		min := LEAST(x, y, z);
 	END; $$
LANGUAGE PLPGSQL;

SELECT maxmin ( 3, 10, 7 );