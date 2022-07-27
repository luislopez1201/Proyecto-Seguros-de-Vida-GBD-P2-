DO $$
DECLARE
		PERIODO RECORD;
		CUR_VENTAS CURSOR FOR 
							  SELECT
							  asesor.nombre_asesor as Nombre_Asesor,
							  asesor.apellido_asesor as Apelllido_Asesor,
							  count(asesor) as Ventas,
							  contrato.estado_contrato as Estado
							  from asesor
							  inner join contrato on contrato.id_asegurado = contrato.id_contrato
							  inner join asegurado on asegurado.id_asegurado = contrato.id_contrato
							  group by asesor.nombre_asesor, asesor.apellido_asesor, contrato.estado_contrato;
BEGIN
OPEN CUR_VENTAS;
FETCH CUR_VENTAS INTO PERIODO;
WHILE(FOUND)LOOP
RAISE NOTICE 'nombre_asesor: %, apellido_asesor: %, Ventas: %, Estado: %',
	PERIODO.Nombre_Asesor,
	PERIODO.Apelllido_Asesor,
	PERIODO.Ventas,
	PERIODO.Estado;
FETCH CUR_VENTAS INTO PERIODO;
END LOOP;
END $$
LANGUAGE PLPGSQL;