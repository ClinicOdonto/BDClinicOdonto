CREATE POLICY "paciente visualiza próprio perfil"
ON paciente
FOR SELECT
TO authenticated
USING (
id_paciente = auth.uid()
);
