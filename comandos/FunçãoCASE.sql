
CREATE OR REPLACE FUNCTION categoria_preco_cd2 (IN codcd int, 
						OUT categoria Text) AS $$ 
	DECLARE valor float;
	BEGIN
	   SELECT preco_venda INTO valor FROM cd WHERE idcd = codcd;
	   CASE
		WHEN valor < 10.00 THEN categoria := 'Bronze';
		WHEN valor BETWEEN 10.00 AND 13.00 THEN categoria := 'Prata';
	   	ELSE categoria := 'Ouro';
	   END CASE;
   	END; $$
LANGUAGE PLPGSQL;

SELECT * FROM categoria_preco_cd2 (6);