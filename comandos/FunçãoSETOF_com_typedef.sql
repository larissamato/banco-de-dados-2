-- Faça uma função que retorne os nomes das músicas de um CD. 
-- Deve-se passar como parâmetro o código do CD. 
CREATE TYPE musicas AS (nomeMusica VARCHAR, duracao TIME);
CREATE OR REPLACE FUNCTION Musicas_CD ( IN codcd int )
   RETURNS SETOF Musicas AS $$ 
   BEGIN
	RETURN QUERY SELECT m.nomemusica, m.duracao 
		       FROM cd NATURAL JOIN faixa f 
			       NATURAL JOIN musica m
		      WHERE idcd = codcd;
   END; $$
LANGUAGE PLPGSQL;

SELECT * FROM Musicas_CD(1);