-- POLITICAS DE EQUIPAMENTO --

CREATE POLICY "dentista e recepcionista cadastram equipamento"
ON equipamento
FOR INSERT
TO authenticated
WITH CHECK (
   is_dentista() OR is_recepcionista()
);

CREATE POLICY "dentista e recepcionista atualizam equipamento"
ON equipamento
FOR UPDATE
TO authenticated
USING (
    is_dentista() OR is_recepcionista()
)
WITH CHECK (
    is_dentista() OR is_recepcionista()
);


CREATE POLICY "dentista e recepcionista excluem equipamento"
ON equipamento
FOR DELETE
TO authenticated
USING (
   is_dentista() OR is_recepcionista()
);
