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