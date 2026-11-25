-- Função auxiliar usada na Query 3 (faixa etária).
-- O PostgreSQL não tem datediff nativo: execute este script uma vez antes das queries.

create or replace function datediff (unidade varchar, data_inicial date, data_final date)
returns integer
language sql
as
$$
select
    case
        when unidade in ('d', 'day', 'days') then (data_final - data_inicial)
        when unidade in ('w', 'week', 'weeks') then (data_final - data_inicial)/7
        when unidade in ('m', 'month', 'months') then (data_final - data_inicial)/30
        when unidade in ('y', 'year', 'years') then (data_final - data_inicial)/365
    end as diferenca
$$;
