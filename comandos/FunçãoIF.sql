CREATE OR REPLACE FUNCTION categoria_preco_cd (IN codcd int, OUT categoria Text) AS $$ 
	DECLARE
		valor float;
	BEGIN

	   SELECT preco_venda INTO valor FROM cd WHERE idcd = codcd;

	   IF (valor <= 10) THEN
		categoria := 'Bronze';
	   ELSEIF (valor > 10 AND valor <= 13) THEN
		categoria := 'Prata';
	   ELSE
		categoria := 'Ouro';
	   END IF;
   	END; $$
LANGUAGE PLPGSQL;

SELECT * FROM categoria_preco_cd(1);