create table public.categoria_equip (
    id serial not null,
    descricao character varying(100) not null,
    constraint categoria_equip_pkey primary key (id)
) TABLESPACE pg_default;

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

create table public.consulta_equipamento (
    id_consulta integer not null,
    id_equipamento integer not null,
    data_uso date not null,
    constraint pk_consulta_equipamento primary key (id_consulta, id_equipamento),
    constraint fk_consulta foreign KEY (id_consulta) references consulta (id),
    constraint fk_equipamento foreign KEY (id_equipamento) references equipamento (id)
) TABLESPACE pg_default;

create table public.dentista (
    id serial not null,
    cro character varying(20) not null,
    cpf character varying(11) not null,
    nome character varying(100) not null,
    email character varying(100) null,
    telefone character varying(20) null,
    id_especialidade integer not null,
    id_usuario uuid null,
    constraint dentista_pkey primary key (id),
    constraint dentista_id_usuario_key unique (id_usuario),
    constraint dentista_id_usuario_fkey foreign KEY (id_usuario) references auth.users (id),
    constraint fk_dentista_especialidade foreign KEY (id_especialidade) references especialidade (id)
) TABLESPACE pg_default;

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

create table public.especialidade (
    id serial not null,
    nome character varying(100) not null,
    constraint especialidade_pkey primary key (id)
) TABLESPACE pg_default;

create table public.paciente (
    id serial not null,
    cpf character varying(11) not null,
    nome character varying(100) not null,
    data_nasc date not null,
    telefone character varying(20) null,
    email character varying(100) null,
    endereco character varying(200) null,
    id_paciente uuid null,
    constraint paciente_pkey primary key (id),
    constraint paciente_id_paciente_fkey foreign KEY (id_paciente) references auth.users (id)
) TABLESPACE pg_default;

create table public.pagamento (
    id serial not null,
    id_consulta integer not null,
    id_recepcionista integer not null,
    valor numeric(10, 2) not null,
    data_pag date not null,
    forma_pagamento character varying(50) not null,
    status character varying(50) not null,
    constraint pagamento_pkey primary key (id),
    constraint pagamento_id_consulta_key unique (id_consulta),
    constraint fk_pagamento_consulta foreign KEY (id_consulta) references consulta (id),
    constraint fk_pagamento_recepcionista foreign KEY (id_recepcionista) references recepcionista (id)
) TABLESPACE pg_default;

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

create table public.recepcionista (
  id serial not null,
  cpf character varying(11) not null,
  nome character varying(100) not null,
  telefone character varying(20) null,
  email character varying(100) null,
  id_usuario uuid null,
  constraint recepcionista_pkey primary key (id),
  constraint recepcionista_id_usuario_key unique (id_usuario),
  constraint recepcionista_id_usuario_fkey foreign KEY (id_usuario) references auth.users (id)
) TABLESPACE pg_default;