create or replace function InfoContratos (varchar)
returns table (id_contrato integer, fechainicio_contrato date)
as
$$
select
id_contrato,fechainicio_contrato
from contrato
inner join asegurado on contrato.id_seguro = asegurado.id_asegurado
where contrato.id_contrato = 9;
$$
language SQL;

select InfoContratos('fechainicio_contrato')