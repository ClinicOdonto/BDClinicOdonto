-- POLITICA DE CONSULTA--


CREATE POLICY "paciente visualiza próprias consultas"
ON consulta
FOR SELECT
TO authenticated
USING (
    id_paciente = auth_paciente_id()
);


CREATE POLICY "dentista visualiza consultas que atende"
ON consulta
FOR SELECT
TO authenticated
USING (
    id_dentista = auth_dentista_id()
 );


CREATE POLICY "recepcionista visualiza todas as consultas"
ON consulta
FOR SELECT
TO authenticated
USING (
    is_recepcionista()
);

CREATE POLICY "recepcionista visualiza todas as consultas"
ON consulta
FOR SELECT
TO authenticated
USING (
    is_recepcionista()
);

CREATE POLICY "recepcionista agenda consulta"
ON consulta
FOR INSERT
TO authenticated
WITH CHECK (
   is_recepcionista() AND id_recepcionista = auth_recepcionista_id()
);

CREATE POLICY "dentista responsável ou recepcionista atualizam consulta"
ON consulta
FOR UPDATE
TO authenticated
USING (
    id_dentista = auth_dentista_id() OR is_recepcionista()
)
WITH CHECK (
    id_dentista = auth_dentista_id() OR is_recepcionista()
);

CREATE POLICY "recepcionista exclui consulta"
ON consulta
FOR DELETE
TO authenticated
USING (
   is_recepcionista()
);


--funçâo auth_recepcionista_id() --
CREATE OR REPLACE FUNCTION auth_recepcionista_id()
RETURNS int
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
SELECT id
FROM recepcionista
WHERE usuario_id = auth.uid()
    LIMIT 1;
$$;
