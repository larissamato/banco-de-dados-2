CREATE OR REPLACE FUNCTION Quadrado ( IN OUT x int ) AS
	$$BEGIN
		x := x * x;
	END; $$
LANGUAGE PLPGSQL;
	
SELECT Quadrado ( 3 );