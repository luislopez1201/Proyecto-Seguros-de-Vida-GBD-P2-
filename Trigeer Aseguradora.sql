CREATE OR REPLACE FUNCTION tg_Control() RETURNS TRIGGER AS
$$
DECLARE
	NumBeneficiarios int;
BEGIN
   Select  count (*) into NumBeneficiarios FROM beneficiario WHERE id_asegurado = new.id_asegurado;
   if (NumBeneficiarios >= 2) then
    RAISE  EXCEPTION 'No puede registrar un debeneficiario más';
    END if;
RETURN new;
END
$$
LANGUAGE plpgsql;
create trigger tg_Control before insert
on beneficiario FOR EACH ROW
execute procedure tg_Control();


insert into beneficiario (id_asegurado,nombre_beneficiario,apellido_beneficiario,cedula_beneficiario,
domicilio_beneficiario,telefono_beneficiario,relacion_asegurado,fecha_de_nacimiento)
values ('2','Fernando','Cedeño','1304532346','Urbanizacion Si Vivienda','0987512356','Hijo','2010-02-14');


select * from beneficiario


delete from beneficiario
where id_beneficiario = 45;


