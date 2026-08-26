create table public.equipamento (
  id serial not null,
  nome character varying(100) not null,
  marca character varying(100) null,
  validade date null,
  custo numeric(10, 2) null,
  id_categoria integer not null,
  constraint equipamento_pkey primary key (id),
  constraint fk_equipamento_categoria foreign KEY (id_categoria) references categoria_equip (id)
) TABLESPACE pg_default;