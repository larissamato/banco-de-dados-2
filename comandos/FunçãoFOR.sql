CREATE OR REPLACE FUNCTION codigo_cd_preco_acima (valor INTEGER)
   RETURNS SETOF INTEGER AS $$
   DECLARE
	registro RECORD;
   BEGIN
	FOR registro IN SELECT * FROM cd WHERE preco_venda > valor LOOP
		RETURN NEXT registro.idcd;
	END LOOP;
	RETURN;
   END; $$ 
LANGUAGE PLPGSQL;

SELECT * FROM codigo_cd_preco_acima (10);