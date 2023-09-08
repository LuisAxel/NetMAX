--@Autor: Oswaldo Cabrera Pérez y Luis Axel Nuñez Quintana
--@Fecha creación: 22/06/2023
--@Descripción: trigger programa

create or replace trigger t_dml_programa
    instead of insert or update or delete on programa
declare
begin
    case 
    when inserting then
        if substr(:new.folio,1,1) between 'A' and 'M' then
            insert into programa_f1(programa_id,folio,nombre,descripcion,fecha_status,tipo, status_programa_id)
            values (:new.programa_id,:new.folio,:new.nombre,:new.descripcion,:new.fecha_status,:new.tipo,:new.status_programa_id);
        elsif substr(:new.folio,1,1) between 'N' and 'Z' then
            if :new.status_programa_id in (1,2,3) then
                insert into programa_f2(programa_id,folio,nombre,descripcion,fecha_status,tipo, status_programa_id)
                values (:new.programa_id,:new.folio,:new.nombre,:new.descripcion,:new.fecha_status,:new.tipo,:new.status_programa_id);
            elsif :new.status_programa_id in (4,5) then
                insert into programa_f3(programa_id,folio,nombre,descripcion,fecha_status,tipo, status_programa_id)
                values (:new.programa_id,:new.folio,:new.nombre,:new.descripcion,:new.fecha_status,:new.tipo,:new.status_programa_id);
            else
                raise_application_error(-20010,
                    'Valor incorrecto para el campo status_programa_id : '
                    || :new.status_programa_id
                    || ' Solo se permiten los valores 1 , 2, 3, 4, 5 ');
            end if;
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo folio : ');
        end if;
    when deleting then
        if substr(:old.folio,1,1) between 'A' and 'M' then
            delete from programa_f1 where programa_id = :old.programa_id;
        elsif substr(:old.folio,1,1) between 'N' and 'Z' then
            if :old.status_programa_id in (1,2,3) then
                delete from programa_f2 where programa_id = :old.programa_id;
            elsif :old.status_programa_id in (4,5) then
                delete from programa_f3 where programa_id = :old.programa_id;
            else
                raise_application_error(-20010,
                    'Valor incorrecto para el campo status_programa_id : '
                    || :old.status_programa_id
                    || ' Solo se permiten los valores 1 , 2, 3, 4, 5 ');
            end if;
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo folio : ');
        end if;
    when updating then
        raise_application_error(-20030,
                'No es soportada la actualización de la tabla usuario');
    end case;
end;
/
show errors;
