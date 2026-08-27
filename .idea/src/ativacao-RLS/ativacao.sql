-- ATIVAÇÃO DO RLS EM TODAS AS TABELAS--

alter table paciente enable row level security
alter table dentista enable row level security
alter table prontuario enable row level security
alter table equipamento enable row level security
alter table categoria_equip enable row level security
alter table consulta enable row level security
alter table consulta_equipamento enable row level security
alter table recepcionista enable row level security
alter table especialidade enable row level security
alter table pagamento enable row level security