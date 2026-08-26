create table public.paciente (
  id serial not null,
  cpf character varying(11) not null,
  nome character varying(100) not null,
  data_nasc date not null,
  telefone character varying(20) null,
  email character varying(100) null,
  endereco character varying(200) null,
  constraint paciente_pkey primary key (id)
) TABLESPACE pg_default;