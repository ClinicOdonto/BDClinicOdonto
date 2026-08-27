-- POLITICAS DE ESPECIALIDADE

CREATE POLICY "paciente e recepcionista visualizam especialidades"
ON especialidade
FOR SELECT
TO authenticated
USING (
is_paciente() OR is_recepcionista()
);

CREATE POLICY "dentista visualiza especialidades"
ON especialidade
FOR SELECT
TO authenticated
USING (
is_dentista()
 );

CREATE POLICY "dentista cadastra especialidade"
ON especialidade
FOR INSERT
TO authenticated
WITH CHECK (
   is_dentista()
);

CREATE POLICY "dentista atualiza especialidade"
ON especialidade
FOR UPDATE
TO authenticated
USING (
    is_dentista()
)
WITH CHECK (
    is_dentista()
);

CREATE POLICY "dentista exclui especialidade"
ON especialidade
FOR DELETE
TO authenticated
USING (
   is_dentista()
);
