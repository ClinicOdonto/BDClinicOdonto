-- POLITICA DE CONSULTA--

CREATE POLICY "paciente visualiza suas consultas"
ON consulta
FOR SELECT
TO authenticated
USING (
    id_paciente IN (
        SELECT id
        FROM paciente
        WHERE id_paciente = auth.uid()
    )
);