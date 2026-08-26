create table public.consulta_equipamento (
  id_consulta integer not null,
  id_equipamento integer not null,
  data_uso date not null,
  constraint pk_consulta_equipamento primary key (id_consulta, id_equipamento),
  constraint fk_consulta foreign KEY (id_consulta) references consulta (id),
  constraint fk_equipamento foreign KEY (id_equipamento) references equipamento (id)
) TABLESPACE pg_default;