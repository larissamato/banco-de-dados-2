CREATE OR REPLACE FUNCTION contagem (valor_inicial INTEGER, valor_final INTEGER, passo INTEGER) RETURNS INTEGER AS $$
	DECLARE
		valor INTEGER;
		cont INTEGER;
	BEGIN
		cont := 0;
		LOOP
			valor := valor_inicial + cont;
			cont := cont + passo;
			RAISE NOTICE 'Valor: %', valor; 
			EXIT WHEN (cont >= valor_final);
		END LOOP;
		RETURN valor;
	END;$$
LANGUAGE PLPGSQL;
	
SELECT contagem(1,10,1);