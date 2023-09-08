--@Autor: Oswaldo Cabrera Pérez y Luis Axel Nuñez Quintana
--@Fecha creación:  22/06/2023
--@Descripción: Creación de trigger para pelicula en ocp_s1

create or replace trigger t_dml_pelicula
instead of insert or update or delete on pelicula
declare
  v_count number;
begin
  case
    when inserting then
      --Verifica si hay correspondencia local para no hacer accesos remotos
      select count(*) into v_count
      from programa_f1
      where programa_id = :new.programa_id;
      --Si 1, insercion local
      if v_count > 0 then
        insert into pelicula_f1(programa_id, duracion, sinopsis, clasificacion, pelicula_antecedente_id)
          values(:new.programa_id, :new.duracion, :new.sinopsis, :new.clasificacion, :new.pelicula_antecedente_id);
      --Revisa sitios remotos
      else
        select count(*) into v_count
        from programa_f2
        where programa_id = :new.programa_id;
        --Inserta para sitio remoto de f2
        if v_count > 0 then
          insert into pelicula_f2(programa_id, duracion, sinopsis, clasificacion, pelicula_antecedente_id)
            values(:new.programa_id, :new.duracion, :new.sinopsis, :new.clasificacion, :new.pelicula_antecedente_id);
        --Revisa sitio de f3
        else
          select count(*) into v_count
          from programa_f3
          where programa_id = :new.programa_id;
          if v_count > 0 then
          insert into pelicula_f3(programa_id, duracion, sinopsis, clasificacion, pelicula_antecedente_id)
            values(:new.programa_id, :new.duracion, :new.sinopsis, :new.clasificacion, :new.pelicula_antecedente_id);
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
      from pelicula_f1
      where programa_id = :old.programa_id;
      --Si 1, eliminación local
      if v_count > 0 then
        delete from pelicula_f1 where programa_id = :old.programa_id;
      --Revisa sitios remotos     
      else
        select count(*) into v_count
        from pelicula_f2
        where programa_id = :old.programa_id;
        --Elimina para sitio remoto de f2
        if v_count > 0 then
          delete from pelicula_f2 where programa_id = :old.programa_id;
        --Revisa sitio de f3
        else
          select count(*) into v_count
          from pelicula_f3
          where programa_id = :old.programa_id;
          if v_count > 0 then
            delete from pelicula_f3 where programa_id = :old.programa_id;
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
