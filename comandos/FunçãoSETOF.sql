-- Faça uma função que retorne os nomes das músicas de um CD. 
-- Deve-se passar como parâmetro o código do CD. 

CREATE OR REPLACE FUNCTION Musicas_CD ( IN codcd int )
   RETURNS SETOF RECORD AS $$ 
   BEGIN
	RETURN QUERY SELECT m.nomemusica, m.duracao 
		       FROM cd NATURAL JOIN faixa f 
			       NATURAL JOIN musica m
		      WHERE idcd = codcd;
   END; $$
LANGUAGE PLPGSQL;

SELECT * 
FROM Musicas_CD(1) AS (nomeMusica VARCHAR, duracao TIME);