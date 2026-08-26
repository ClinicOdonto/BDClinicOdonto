create table public.categoria_equip (
  id serial not null,
  descricao character varying(100) not null,
  constraint categoria_equip_pkey primary key (id)
) TABLESPACE pg_default;