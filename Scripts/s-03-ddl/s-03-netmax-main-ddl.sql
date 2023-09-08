--@Autor: Luis Axel Nuñez Quintana y Oswaldo Cabrera Pérez
--@Fecha creación: 21/06/2022
--@Descripción: Crea los fragmentos en los 4 nodos

clear screen
whenever sqlerror exit rollback;


Prompt ============================================
Prompt Creando fragmentos para ocp_s1
Prompt ============================================
connect netmax_bdd/net@ocp_s1
@s-03-netmax-ocp-s1-ddl.sql

Prompt ============================================
Prompt Creando fragmentos para ocp_s2
Prompt ============================================
connect netmax_bdd/net@ocp_s2
@s-03-netmax-ocp-s2-ddl.sql

Prompt ============================================
Prompt Creando fragmentos para lanq_s1
Prompt ============================================
connect netmax_bdd/net@lanq_s1
@s-03-netmax-lanq-s1-ddl.sql

Prompt ============================================
Prompt Creando fragmentos para lanq_s2
Prompt ============================================
connect netmax_bdd/net@lanq_s2
@s-03-netmax-lanq-s2-ddl.sql

Prompt Listo!
