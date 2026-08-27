-- POLITICA DE PACIENTE--

CREATE POLICY "paciente visualiza próprio perfil"
ON paciente
FOR SELECT
TO authenticated
USING (
    id_paciente = auth.uid()
);


CREATE POLICY "recepcionista cadastra paciente"
ON paciente
FOR INSERT
TO authenticated
WITH CHECK (
   is_recepcionista()
);

CREATE POLICY "paciente atualiza próprio perfil ou recepcionista atualiza"
ON paciente
FOR UPDATE
TO authenticated
USING (
    id_paciente = auth.uid() OR is_recepcionista()
)
WITH CHECK (
    id_paciente = auth.uid() OR is_recepcionista()
);

CREATE POLICY "recepcionista exclui paciente"
ON paciente
FOR DELETE
TO authenticated
USING (
   is_recepcionista()
);
