create table public.dentista (
  id serial not null,
  cro character varying(20) not null,
  cpf character varying(11) not null,
  nome character varying(100) not null,
  email character varying(100) null,
  telefone character varying(20) null,
  id_especialidade integer not null,
  constraint dentista_pkey primary key (id),
  constraint fk_dentista_especialidade foreign KEY (id_especialidade) references especialidade (id)
) TABLESPACE pg_default;