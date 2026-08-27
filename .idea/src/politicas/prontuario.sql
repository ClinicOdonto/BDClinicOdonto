create table public.prontuario (
  id serial not null,
  id_paciente integer not null,
  diagnostico character varying(255) not null,
  tratamento character varying(255) null,
  data_registro date not null,
  observacao character varying(255) null,
  constraint prontuario_pkey primary key (id),
  constraint fk_prontuario_paciente foreign KEY (id_paciente) references paciente (id)
) TABLESPACE pg_default;

-- POLITICA DE AUTENTICAÇÃO --

CREATE POLICY "paciente visualiza proprio prontuario"
ON prontuario
FOR SELECT
TO authenticated
USING (
    id_paciente IN (
        SELECT id
        FROM paciente
        WHERE id_paciente = auth.uid()
    )
);