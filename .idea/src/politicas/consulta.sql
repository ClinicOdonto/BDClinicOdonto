create table public.consulta (
  id serial not null,
  id_paciente integer not null,
  id_dentista integer not null,
  id_recepcionista integer not null,
  data date not null,
  hora time without time zone not null,
  observacoes character varying(255) null,
  status character varying(150) null,
  constraint consulta_pkey primary key (id),
  constraint fk_consulta_dentista foreign KEY (id_dentista) references dentista (id),
  constraint fk_consulta_paciente foreign KEY (id_paciente) references paciente (id),
  constraint fk_consulta_recepcionista foreign KEY (id_recepcionista) references recepcionista (id)
) TABLESPACE pg_default;