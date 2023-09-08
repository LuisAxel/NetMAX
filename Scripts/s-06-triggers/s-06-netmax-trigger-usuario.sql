--@Autor: Oswaldo Cabrera Pérez y Luis Axel Nuñez Quintana
--@Fecha creación: 22/06/2023
--@Descripción: trigger usuario

create or replace trigger t_dml_usuario
    instead of insert or update or delete on usuario
declare
begin
    case
    when inserting then
        --replica local
        if :new.vigente = 0 then
            insert into usuario_f2(usuario_id, email,nombre, ap_paterno, ap_materno,
                fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
            values (:new.usuario_id,:new.email,:new.nombre,:new.ap_paterno,:new.ap_materno,
                :new.fecha_ingreso,:new.fecha_cuenta_fin,:new.vigente,:new.tipo_cuenta_id);
        elsif :new.vigente = 1 then
            if :new.tipo_cuenta_id = 3 then
                insert into usuario_f3(usuario_id, email,nombre, ap_paterno, ap_materno,
                    fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id,:new.email,:new.nombre,:new.ap_paterno,:new.ap_materno,
                    :new.fecha_ingreso,:new.fecha_cuenta_fin,:new.vigente,:new.tipo_cuenta_id);
            elsif :new.tipo_cuenta_id = 2 then
                insert into usuario_f4(usuario_id, email,nombre, ap_paterno, ap_materno,
                    fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id,:new.email,:new.nombre,:new.ap_paterno,:new.ap_materno,
                    :new.fecha_ingreso,:new.fecha_cuenta_fin,:new.vigente,:new.tipo_cuenta_id);
            elsif :new.tipo_cuenta_id = 1 then
                insert into usuario_f5(usuario_id, email,nombre, ap_paterno, ap_materno,
                    fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
                values (:new.usuario_id,:new.email,:new.nombre,:new.ap_paterno,:new.ap_materno,
                    :new.fecha_ingreso,:new.fecha_cuenta_fin,:new.vigente,:new.tipo_cuenta_id);
            else
                raise_application_error(-20010,
                    'Valor incorrecto para el campo tipo : '
                    || :new.tipo_cuenta_id
                    || ' Solo se permiten los valores 1 , 2, 3 ');
            end if;
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo vigente : '
                || :new.vigente
                || ' Solo se permiten los valores 0 , 1 ');
        end if;
        insert into usuario_f1(usuario_id, password,num_tarjeta)
            values (:new.usuario_id,:new.password,:new.num_tarjeta);
    when deleting then
        --replica local
        delete from usuario_f1 where usuario_id = :old.usuario_id;
        if :old.vigente = 0 then
            delete from usuario_f2 where usuario_id = :old.usuario_id;
        elsif :old.vigente = 1 then
            if :old.tipo_cuenta_id = 3 then
                delete from usuario_f3 where usuario_id = :old.usuario_id;
            elsif :old.tipo_cuenta_id = 2 then
                delete from usuario_f4 where usuario_id = :old.usuario_id;
            elsif :old.tipo_cuenta_id = 1 then
                delete from usuario_f5 where usuario_id = :old.usuario_id;
            else
                raise_application_error(-20010,
                    'Valor incorrecto para el campo tipo : '
                    || :old.tipo_cuenta_id
                    || ' Solo se permiten los valores 1 , 2, 3 ');
            end if;
        else
            raise_application_error(-20010,
                'Valor incorrecto para el campo vigente : '
                || :old.vigente
                || ' Solo se permiten los valores 0 , 1 ');
        end if;
    when updating then
        raise_application_error(-20030,
                'No es soportada la actualización de la tabla usuario');
    end case;
end;
/
show errors;
