-- POLITICA DE RECEPCIONISTA --

CREATE POLICY "equipe visualiza recepcionistas"
ON recepcionista
FOR SELECT
TO authenticated
USING (
    is_dentista() OR is_recepcionista()
);

CREATE POLICY "recepcionista atualiza próprio perfil"
ON recepcionista
FOR UPDATE
TO authenticated
USING (
    id_usuario = auth.uid()
)
 WITH CHECK (
    id_usuario = auth.uid()
);

