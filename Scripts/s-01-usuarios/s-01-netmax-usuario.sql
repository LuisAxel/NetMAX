--@Autor: Luis Axel Nuñez Quintana y Oswaldo Cabrera Pérez
--@Fecha creación: 21/06/2022
--@Descripción:	Crea al usuario netmax_bdd

set serveroutput on
declare
  v_count number(1,0);
begin
  select count(*) into v_count from dba_users
  where username ='NETMAX_BDD';
  if v_count > 0 then
    execute immediate 'drop user NETMAX_BDD cascade';
    dbms_output.put_line('Usuario eliminado');
  else
    dbms_output.put_line('El usuario no existe, no se requiere eliminar');
  end if;
end;
/
set serveroutput off

prompt Creando usuario netmax_bdd...

create user netmax_bdd identified by net quota unlimited on users;

prompt Asignando privilegios a netmax_bdd...

grant create session, create table, create procedure, create sequence, create database link, create any directory,
  create view, create synonym, create trigger to netmax_bdd;

prompt Listo!
