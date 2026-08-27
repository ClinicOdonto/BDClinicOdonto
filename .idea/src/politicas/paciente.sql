-- POLITICA DE PACIENTE--

CREATE POLICY "paciente visualiza próprio perfil"
ON paciente
FOR SELECT
TO authenticated
USING (
    id_paciente = auth.uid()
);


CREATE POLICY "dentista visualiza pacientes"
ON paciente
FOR SELECT
TO authenticated
USING (
    EXISTS (
        SELECT 1
        FROM dentista
        WHERE dentista.id_usuario = auth.uid()
    )
);


CREATE POLICY "recepcionista visualiza pacientes"
ON paciente
FOR SELECT
TO authenticated
USING (
    EXISTS (
        SELECT 1
        FROM recepcionista
        WHERE recepcionista.id_usuario = auth.uid()
    )
);

INSERT
CREATE POLICY "paciente cadastra próprio perfil"
ON paciente
FOR INSERT
TO authenticated
WITH CHECK (
    id_paciente = auth.uid()
);


CREATE POLICY "recepcionista cadastra paciente"
ON paciente
FOR INSERT
TO authenticated
WITH CHECK (
    EXISTS (
        SELECT 1
        FROM recepcionista
        WHERE recepcionista.id_usuario = auth.uid()
    )
);

UPDATE
CREATE POLICY "paciente atualiza próprio perfil"
ON paciente
FOR UPDATE
TO authenticated
USING (
    id_paciente = auth.uid()
)
WITH CHECK (
    id_paciente = auth.uid()
);

CREATE POLICY "recepcionista atualiza paciente"
ON paciente
FOR UPDATE
TO authenticated
USING (
    EXISTS (
        SELECT 1
        FROM recepcionista
        WHERE recepcionista.id_usuario = auth.uid()
    )
)
WITH CHECK (
    EXISTS (
        SELECT 1
        FROM recepcionista
        WHERE recepcionista.id_usuario = auth.uid()
    )
);


DELETE
CREATE POLICY "recepcionista exclui paciente"
ON paciente
FOR DELETE
TO authenticated
USING (
    EXISTS (
        SELECT 1
        FROM recepcionista
        WHERE recepcionista.id_usuario = auth.uid()
    )
);