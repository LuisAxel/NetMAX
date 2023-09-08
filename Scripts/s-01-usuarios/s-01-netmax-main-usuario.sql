--@Autor: Luis Axel Nuñez Quintana y Oswaldo Cabrera Pérez
--@Fecha creación: 21/06/2022
--@Descripción: Crea al usuario netmax_bd en los 4 nodos

clear screen
whenever sqlerror exit rollback;
set serveroutput on

Prompt Iniciando la creación/eliminación de usuarios

Prompt ============================================
Prompt Creando usuario en ocp_s1
Prompt ============================================

connect sys/system@ocp_s1 as sysdba
@s-01-netmax-usuario.sql

Prompt ============================================
Prompt Creando usuario en ocp_s2
Prompt ============================================

connect sys/system@ocp_s2 as sysdba
@s-01-netmax-usuario.sql

Prompt ============================================
Prompt Creando usuario en lanq_s1
Prompt ============================================

connect sys/system@lanq_s1 as sysdba
@s-01-netmax-usuario.sql

Prompt ============================================
Prompt Creando usuario en lanq_s2
Prompt ============================================

connect sys/system@lanq_s2 as sysdba
@s-01-netmax-usuario.sql

Prompt Listo!
