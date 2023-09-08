--@Autor: Luis Axel Nuñez Quintana y Oswaldo Cabrera Pérez
--@Fecha creación: 21/06/2022
--@Descripción: Crea y valida sinonimos

clear screen
whenever sqlerror exit rollback;

Prompt ============================================
Prompt Creando sinonimos para ocp_s1
Prompt ============================================
connect netmax_bdd/net@ocp_s1
@s-04-netmax-ocp-s1-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

Prompt ============================================
Prompt Creando sinonimos para ocp_s2
Prompt ============================================
connect netmax_bdd/net@ocp_s2
@s-04-netmax-ocp-s2-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

Prompt ============================================
Prompt Creando sinonimos para lanq_s1
Prompt ============================================
connect netmax_bdd/net@lanq_s1
@s-04-netmax-lanq-s1-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

Prompt ============================================
Prompt Creando sinonimos para lanq_s2
Prompt ============================================
connect netmax_bdd/net@lanq_s2
@s-04-netmax-lanq-s2-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

Prompt Listo!


