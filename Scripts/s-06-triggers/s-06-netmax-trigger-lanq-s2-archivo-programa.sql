--@Autor: Oswaldo Cabrera Pérez y Luis Axel Nuñez Quintana
--@Fecha creación:  22/06/2023
--@Descripción: Creación de trigger para archivo-programa en ocp_s1

create or replace trigger t_dml_archivo_programa
instead of insert or update or delete on archivo_programa
declare
    v_count number;
begin
    case
        when inserting then
            select count(*) into v_count from programa_f1 
            where programa_id = :new.programa_id;
            if v_count > 0 then
                if :new.tamano > 10 then
                    insert into ti_archivo_programa_1(num_archivo, programa_id, archivo, tamano)
                        values (:new.num_archivo, :new.programa_id, :new.archivo, :new.tamano);
                    insert into archivo_programa_f1
                        select * from ti_archivo_programa_1
                        where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                        delete from ti_archivo_programa_1
                        where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                else
                    insert into ti_archivo_programa_2(num_archivo, programa_id, archivo, tamano)
                        values (:new.num_archivo, :new.programa_id, :new.archivo, :new.tamano);
                    insert into archivo_programa_f2
                        select * from ti_archivo_programa_2
                        where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                        delete from ti_archivo_programa_2
                        where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                end if;
            else
                select count(*) into v_count from programa_f2 
                where programa_id = :new.programa_id;
                if v_count > 0 then
                    if :new.tamano > 10 then
                        insert into ti_archivo_programa_1(num_archivo, programa_id, archivo, tamano)
                            values (:new.num_archivo, :new.programa_id, :new.archivo, :new.tamano);
                        insert into archivo_programa_f1
                            select * from ti_archivo_programa_1
                            where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                            delete from ti_archivo_programa_1
                            where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                    else
                        insert into ti_archivo_programa_2(num_archivo, programa_id, archivo, tamano)
                            values (:new.num_archivo, :new.programa_id, :new.archivo, :new.tamano);
                        insert into archivo_programa_f2
                            select * from ti_archivo_programa_2
                            where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                            delete from ti_archivo_programa_2
                            where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                    end if;
                else
                    select count(*) into v_count from programa_f3 
                    where programa_id = :new.programa_id;
                    if v_count > 0 then
                        if :new.tamano > 10 then
                            insert into ti_archivo_programa_1(num_archivo, programa_id, archivo, tamano)
                                values (:new.num_archivo, :new.programa_id, :new.archivo, :new.tamano);
                            insert into archivo_programa_f1
                                select * from ti_archivo_programa_1
                                where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                                delete from ti_archivo_programa_1
                                where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                        else
                            insert into ti_archivo_programa_2(num_archivo, programa_id, archivo, tamano)
                                values (:new.num_archivo, :new.programa_id, :new.archivo, :new.tamano);
                            insert into archivo_programa_f2
                                select * from ti_archivo_programa_2
                                where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                                delete from ti_archivo_programa_2
                                where num_archivo = :new.num_archivo and programa_id = :new.programa_id;
                        end if;
                    else
                        raise_application_error(-20020,
                            'Error de integridad para el campo programa_id: '
                            || :new.programa_id
                            || ' No se encontró el registro padre en fragmentos');
                    end if;
                end if;
            end if;
        when updating then
            raise_application_error(-20030,
            'Error al intentar realizar operación update: '
            || 'No se han implemendado las funcionalidades para las operaciones update');
        when deleting then
            select count(*) into v_count from archivo_programa_f1 
            where num_archivo = :old.num_archivo and programa_id = :old.programa_id;
            if v_count > 0 then
                delete from archivo_programa_f1
                where num_archivo = :old.num_archivo and programa_id = :old.programa_id;
            else
                select count(*) into v_count from archivo_programa_f2 
                where num_archivo = :old.num_archivo and programa_id = :old.programa_id;
                if v_count > 0 then
                    delete from archivo_programa_f2
                    where num_archivo = :old.num_archivo and programa_id = :old.programa_id;
                else
                    raise_application_error(-20020,
                        'Error de integridad para el campo programa_id: '
                        || :old.programa_id
                        || ' No se encontró el registro padre en fragmentos');
                end if;
            end if;
        when updating then
            raise_application_error(-20030,
                'Error al intentar realizar operación update: '
                || 'No se han implemendado las funcionalidades para las operaciones update');
    end case;
end;
/
show errors;




            
