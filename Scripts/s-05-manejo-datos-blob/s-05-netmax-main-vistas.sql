--@Autor: Oswaldo Cabrera Pérez y Luis Axel Nuñez Quintana
--@Fecha creación:  22/06/2023
--@Descripción: Creación de vistas para todos los sitios

clear screen
whenever sqlerror exit rollback;

prompt ===========================================
prompt Creando vistas para ocp_s1
prompt ===========================================
connect netmax_bdd/net@ocp_s1
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-ocp-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para ocp_s2
prompt ===========================================
connect netmax_bdd/net@ocp_s2
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-ocp-s2-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para lanq_s1
prompt ===========================================
connect netmax_bdd/net@lanq_s1
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-lanq-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para lanq_s2
prompt ===========================================
connect netmax_bdd/net@lanq_s2
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-lanq-s2-vistas-blob.sql

Prompt Listo!