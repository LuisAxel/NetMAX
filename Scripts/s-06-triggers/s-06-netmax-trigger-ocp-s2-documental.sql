--@Autor: Oswaldo Cabrera Pérez y Luis Axel Nuñez Quintana
--@Fecha creación:  22/06/2023
--@Descripción: Creación de trigger para documental en ocp_s2

create or replace trigger t_dml_documental
instead of insert or update or delete on documental
declare
  v_count number;
begin
  case
    when inserting then
      --Verifica si hay correspondencia en s1
      select count(*) into v_count
      from programa_f1
      where programa_id = :new.programa_id;
      --Si 1, insercion remota
      if v_count > 0 then
        --Inserta en la tabla temporal
        insert into ti_documental_1(programa_id, tematica, duracion, trailer, pais_id)
          values(:new.programa_id, :new.tematica, :new.duracion, :new.trailer, :new.pais_id);
        --Inserta en el sitio remoto a través de la tabla temporal
        insert into documental_f1
          select programa_id, tematica, duracion, trailer, pais_id
          from ti_documental_1
          where programa_id = :new.programa_id;
        --Borra registro de tabla temporal
        delete from ti_documental_1 where programa_id = :new.programa_id;
      --Revisa sitios remotos
      else
        select count(*) into v_count
        from programa_f2
        where programa_id = :new.programa_id;
        --Inserta para sitio remoto de f2
        if v_count > 0 then
          --Inserta en la tabla temporal
          insert into ti_documental_2(programa_id, tematica, duracion, trailer, pais_id)
            values(:new.programa_id, :new.tematica, :new.duracion, :new.trailer, :new.pais_id);
          --Inserta en el sitio remoto a través de la tabla temporal
          insert into documental_f2
            select programa_id, tematica, duracion, trailer, pais_id
            from ti_documental_2
            where programa_id = :new.programa_id;
          --Borra registro de tabla temporal
          delete from ti_documental_2 where programa_id = :new.programa_id;
        --Revisa sitio de f3
        else
          select count(*) into v_count
          from programa_f3
          where programa_id = :new.programa_id;
          if v_count > 0 then
            --Inserta en la tabla temporal
            insert into ti_documental_3(programa_id, tematica, duracion, trailer, pais_id)
              values(:new.programa_id, :new.tematica, :new.duracion, :new.trailer, :new.pais_id);
            --Inserta en el sitio remoto a través de la tabla temporal
            insert into documental_f3
              select programa_id, tematica, duracion, trailer, pais_id
              from ti_documental_3
              where programa_id = :new.programa_id;
            --Borra registro de tabla temporal
            delete from ti_documental_3 where programa_id = :new.programa_id;
            --No existe tabla en padre
          else
            raise_application_error(-20020,
              'Error de integridad para el campo programa_id: '
              || :new.programa_id
              || ' No se encontró el registro padre en fragmentos');
          end if; -- if sitio f3
        end if; -- if sitio f2
      end if;  -- if sitio f1
    when updating then
      raise_application_error(-20030,
        'Error al intentar realizar operación update: '
        || 'No se han implemendado las funcionalidades para las operaciones update');
    when deleting then
      --Verifica si hay correspondencia local para no hacer accesos remotos
      select count(*) into v_count
      from documental_f1
      where programa_id = :old.programa_id;
      --Si 1, eliminación local
      if v_count > 0 then
        delete from documental_f1 where programa_id = :old.programa_id;
      --Revisa sitios remotos     
      else
        select count(*) into v_count
        from documental_f2
        where programa_id = :old.programa_id;
        --Elimina para sitio remoto de f2
        if v_count > 0 then
          delete from documental_f2 where programa_id = :old.programa_id;
        --Revisa sitio de f3
        else
          select count(*) into v_count
          from documental_f3
          where programa_id = :old.programa_id;
          if v_count > 0 then
            delete from documental_f3 where programa_id = :old.programa_id;
          --No existe registro
          else
            raise_application_error(-20001,
              'Error de integridad para el campo programa_id: '
              || :old.programa_id
              || ' No se encontró el registro en fragmentos');
          end if; -- if f3
        end if; -- if f2
      end if; -- if f1
  end case;
end;
/
