-- POLITICA DE AUTENTICAÇÃO --

CREATE POLICY "paciente visualiza proprio prontuario"
ON prontuario
FOR SELECT
TO authenticated
USING (
    id_paciente IN (
        SELECT id
        FROM paciente
        WHERE id_paciente = auth.uid()
    )
);