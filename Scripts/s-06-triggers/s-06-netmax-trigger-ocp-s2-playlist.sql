--@Autor: Oswaldo Cabrera Pérez y Luis Axel Nuñez Quintana
--@Fecha creación:  22/06/2023
--@Descripción: Creación de trigger para playlist en ocp_s2

create or replace trigger t_dml_playlist
instead of insert or update or delete on playlist
declare
    v_count number;
begin
    case
        when inserting then 
            select count(*) into v_count from usuario_f3
            where usuario_id = :new.usuario_id;
            if v_count > 0 then
                insert into playlist_f2(playlist_id, calificacion, indice, num_reproducciones, programa_id, usuario_id)
                values (:new.playlist_id, :new.calificacion, :new.indice, :new.num_reproducciones, :new.programa_id, :new.usuario_id);
            else
                select count(*) into v_count from usuario_f2
                where usuario_id = :new.usuario_id;
                if v_count > 0 then
                    insert into playlist_f1(playlist_id, calificacion, indice, num_reproducciones, programa_id, usuario_id)
                    values (:new.playlist_id, :new.calificacion, :new.indice, :new.num_reproducciones, :new.programa_id, :new.usuario_id);
                else
                    select count(*) into v_count from usuario_f4
                    where usuario_id = :new.usuario_id;
                    if v_count > 0 then
                        insert into playlist_f3(playlist_id, calificacion, indice, num_reproducciones, programa_id, usuario_id)
                        values (:new.playlist_id, :new.calificacion, :new.indice, :new.num_reproducciones, :new.programa_id, :new.usuario_id);
                    else
                        select count(*) into v_count from usuario_f5
                        where usuario_id = :new.usuario_id;
                        if v_count > 0 then
                            insert into playlist_f4(playlist_id, calificacion, indice, num_reproducciones, programa_id, usuario_id)
                            values (:new.playlist_id, :new.calificacion, :new.indice, :new.num_reproducciones, :new.programa_id, :new.usuario_id);
                        else
                            raise_application_error(-20020,
                            'Error de integridad para el campo usuario_id: '
                            || :new.programa_id
                            || ' No se encontró el registro padre en fragmentos');
                        end if;
                    end if;
                end if;
            end if;
        when updating then
            raise_application_error(-20030,
            'Error al intentar realizar operación update: '
            || 'No se han implemendado las funcionalidades para las operaciones update');
        when deleting then
            select count(*) into v_count from playlist_f2 
                where playlist_id = :old.playlist_id;
                if v_count > 0 then
                    delete from playlist_f2 where playlist_id = :old.playlist_id;
                else
                    select count(*) into v_count from playlist_f1
                    where playlist_id = :old.playlist_id;
                    if v_count > 0 then
                        delete from playlist_f1 where playlist_id = :old.playlist_id;
                    else
                        select count(*) into v_count from playlist_f4
                        where playlist_id = :old.playlist_id;
                        if v_count > 0 then
                            delete from playlist_f4 where playlist_id = :old.playlist_id;
                        else
                            select count(*) into v_count from playlist_f3
                            where playlist_id = :old.playlist_id;
                            if v_count > 0 then
                                delete from playlist_f3 where playlist_id = :old.playlist_id;
                            else
                                raise_application_error(-20020,
                                'Error de integridad para el campo playlist_id: '
                                || :old.playlist_id
                                || ' No se encontró el registro en fragmentos');
                            end if;
                        end if;
                    end if;
                end if;
    end case;
end;
/


