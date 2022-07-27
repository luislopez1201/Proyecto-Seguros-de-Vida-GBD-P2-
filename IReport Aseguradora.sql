select
asesor.nombre_asesor,
count (asesor) as asesores
from asesor
inner join asegurado on asegurado.id_asegurado = asegurado.id_asesor
group by asesor.nombre_asesor