-- POLITICAS DE DENTISTA--

CREATE POLICY "autenticados visualizam dentistas"
ON dentista
FOR SELECT
TO authenticated
USING (
    true
);

CREATE POLICY "recepcionista cadastra dentista"
ON dentista
FOR INSERT
TO authenticated
WITH CHECK (
   is_recepcionista()
);


CREATE POLICY "dentista atualiza próprio perfil ou recepcionista atualiza"
ON dentista
FOR UPDATE
TO authenticated
USING (
    is_recepcionista() OR id_usuario = auth.uid()
)
WITH CHECK (
    is_recepcionista() OR id_usuario = auth.uid()
);


