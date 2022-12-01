CREATE OR REPLACE FUNCTION musicas_autor (nome VARCHAR)
   RETURNS SETOF INTEGER AS $$
   DECLARE
	registro RECORD;
   BEGIN	
	WHILE registro IN SELECT * 
			  FROM autor a 
			  NATURAL JOIN musica_autor ma 
			  NATURAL JOIN musica m 
			  WHERE a.nome_autor = nome LOOP
			    
		RETURN NEXT registro.nomemusica;
	END LOOP;
	
	RETURN;
   END; $$ 
LANGUAGE PLPGSQL;

SELECT * FROM musicas_autor('Renato Russo');