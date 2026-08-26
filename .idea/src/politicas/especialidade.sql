create table public.especialidade (
  id serial not null,
  nome character varying(100) not null,
  constraint especialidade_pkey primary key (id)
) TABLESPACE pg_default;