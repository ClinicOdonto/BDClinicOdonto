-- POLITICAS DE CONSULTA_EQUIPAMENTO--


CREATE POLICY "dentista responsável ou recepcionista visualizam uso de equipamento"
ON consulta_equipamento
FOR SELECT
TO authenticated
USING (
    is_recepcionista()
    OR EXISTS (
        SELECT 1 FROM consulta c
        WHERE c.id = consulta_equipamento.id_consulta
         AND c.id_dentista = auth_dentista_id())
);

CREATE POLICY "dentista responsável ou recepcionista registram uso de equipamento"
ON consulta_equipamento
FOR INSERT
TO authenticated
WITH CHECK (
   is_recepcionista()
   OR EXISTS (
       SELECT 1 FROM consulta c
       WHERE c.id = consulta_equipamento.id_consulta
        AND c.id_dentista = auth_dentista_id()
   )
);


CREATE POLICY "dentista responsável ou recepcionista atualizam uso de equipamento"
ON consulta_equipamento
FOR UPDATE
TO authenticated
USING (
    is_recepcionista()
    OR EXISTS (
        SELECT 1 FROM consulta c
        WHERE c.id = consulta_equipamento.id_consulta
            AND c.id_dentista = auth_dentista_id()
    )
)
WITH CHECK (
    is_recepcionista()
    OR EXISTS (
        SELECT 1 FROM consulta c
        WHERE c.id = consulta_equipamento.id_consulta
          AND c.id_dentista = auth_dentista_id()
    )
);


CREATE POLICY "dentista responsável ou recepcionista excluem uso de equipamento"
ON consulta_equipamento
FOR DELETE
TO authenticated
USING (
   is_recepcionista()
   OR EXISTS (
       SELECT 1 FROM consulta c
       WHERE c.id = consulta_equipamento.id_consulta
         AND c.id_dentista = auth_dentista_id()
   )
);
