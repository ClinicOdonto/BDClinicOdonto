-- POLITICA DE PAGAMENTO --


CREATE POLICY "paciente visualiza próprios pagamentos"
ON pagamento
FOR SELECT
TO authenticated
USING (
EXISTS (
SELECT 1 FROM consulta c
WHERE c.id = pagamento.id_consulta
AND c.id_paciente = auth_paciente_id())
);

CREATE POLICY "recepcionista visualiza todos os pagamentos"
ON pagamento
FOR SELECT
TO authenticated
USING (
    is_recepcionista()
);


CREATE POLICY "paciente registra próprio pagamento"
ON pagamento
FOR INSERT
TO authenticated
WITH CHECK (
   EXISTS (
       SELECT 1 FROM consulta c
       WHERE c.id = pagamento.id_consulta
         AND c.id_paciente = auth_paciente_id()
   )
);


CREATE POLICY "recepcionista registra pagamento"
ON pagamento
FOR INSERT
TO authenticated
WITH CHECK (
   is_recepcionista() AND id_recepcionista = auth_recepcionista_id()
);


CREATE POLICY "recepcionista atualiza pagamento"
ON pagamento
FOR UPDATE
TO authenticated
USING (
    is_recepcionista()
)
WITH CHECK (
    is_recepcionista()
);

CREATE POLICY "recepcionista exclui pagamento"
ON pagamento
FOR DELETE
TO authenticated
USING (
   is_recepcionista()
);

