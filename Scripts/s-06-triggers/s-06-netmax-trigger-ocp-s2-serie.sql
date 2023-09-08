--@Autor: Oswaldo Cabrera Pérez y Luis Axel Nuñez Quintana
--@Fecha creación:  22/06/2023
--@Descripción: Creación de trigger para serie en ocp_s2

create or replace trigger t_dml_serie
instead of insert or update or delete on serie
declare
  v_count number;
begin
  case
    when inserting then
      --Siempre hara acceso remoto, sigue mismo procedimiento que ocp-s1-serie
      select count(*) into v_count
      from programa_f1
      where programa_id = :new.programa_id;
      --Si 1, insercion en sitio remoto de f1
      if v_count > 0 then
        insert into serie_f1(programa_id, num_capitulos, duracion_capitulo, tipo_serie_id)
          values(:new.programa_id, :new.num_capitulos, :new.duracion_capitulo, :new.tipo_serie_id);
      --Revisa f2 y f3
      else
        select count(*) into v_count
        from programa_f2
        where programa_id = :new.programa_id;
        --Inserta para sitio remoto de f2
        if v_count > 0 then
          insert into serie_f2(programa_id, num_capitulos, duracion_capitulo, tipo_serie_id)
            values(:new.programa_id, :new.num_capitulos, :new.duracion_capitulo, :new.tipo_serie_id);
        --Revisa sitio de f3
        else
          select count(*) into v_count
          from programa_f3
          where programa_id = :new.programa_id;
          if v_count > 0 then
            insert into serie_f3(programa_id, num_capitulos, duracion_capitulo, tipo_serie_id)
              values(:new.programa_id, :new.num_capitulos, :new.duracion_capitulo, :new.tipo_serie_id);
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
      --Verifica si hay correspondencia en f1
      select count(*) into v_count
      from serie_f1
      where programa_id = :old.programa_id;
      --Si 1, eliminación remota
      if v_count > 0 then
        delete from serie_f1 where programa_id = :old.programa_id;
      --Revisa sitios remotos f2 y f3  
      else
        select count(*) into v_count
        from serie_f2
        where programa_id = :old.programa_id;
        --Elimina para sitio remoto de f2
        if v_count > 0 then
          delete from serie_f2 where programa_id = :old.programa_id;
        --Revisa sitio de f3
        else
          select count(*) into v_count
          from serie_f3
          where programa_id = :old.programa_id;
          if v_count > 0 then
            delete from serie_f3 where programa_id = :old.programa_id;
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
