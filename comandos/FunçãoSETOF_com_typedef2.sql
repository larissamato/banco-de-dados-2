-- Faça uma função que retorne os nomes das músicas de um CD. 
-- Deve-se passar como parâmetro o código do CD. 
CREATE TYPE infomusicas AS ( nomecd VARCHAR,
			     nomeMusica VARCHAR, 
			     duracao TIME);
CREATE OR REPLACE FUNCTION Info_CD ( IN codcd int )
   RETURNS SETOF infoMusicas AS $$ 
   BEGIN
	RETURN QUERY SELECT cd.nome_cd, m.nomemusica, m.duracao 
		       FROM cd NATURAL JOIN faixa f 
			       NATURAL JOIN musica m
		      WHERE idcd = codcd;
   END; $$
LANGUAGE PLPGSQL;

SELECT * FROM Info_CD(1);