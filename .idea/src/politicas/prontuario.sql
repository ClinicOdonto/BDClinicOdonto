-- POLITICA DE PRONTUARIO --

CREATE POLICY "dentista visualiza prontuários"
ON prontuario
FOR SELECT
TO authenticated
USING (
    is_dentista()
);

CREATE POLICY "dentista registra prontuário"
ON prontuario
FOR INSERT
TO authenticated
WITH CHECK (
   is_dentista()
);

CREATE POLICY "dentista atualiza prontuário"
ON prontuario
FOR UPDATE
TO authenticated
USING (
    is_dentista()
)
 WITH CHECK (
    is_dentista()
);

CREATE POLICY "dentista exclui prontuário"
ON prontuario
FOR DELETE
TO authenticated
USING (
   is_dentista()
);