-- POLITICA DE categoria_equip --

CREATE POLICY "dentista e recepcionista visualizam categorias de equipamento"
ON categoria_equip
FOR SELECT
TO authenticated
USING (
    is_dentista() OR is_recepcionista()
);

CREATE POLICY "dentista e recepcionista cadastram categoria de equipamento"
ON categoria_equip
FOR INSERT
TO authenticated
WITH CHECK (
   is_dentista() OR is_recepcionista()
);

CREATE POLICY "dentista e recepcionista atualizam categoria de equipamento"
ON categoria_equip
FOR UPDATE
TO authenticated
USING (
    is_dentista() OR is_recepcionista()
)
WITH CHECK (
    is_dentista() OR is_recepcionista()
);

CREATE POLICY "dentista e recepcionista excluem categoria de equipamento"
ON categoria_equip
FOR DELETE
TO authenticated
USING (
   is_dentista() OR is_recepcionista()
);
