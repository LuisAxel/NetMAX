--@Autor: Jorge A. Rodríguez C
--@Fecha creación:
--@Descripción: Script principal empleado para configurar el soporte
-- de datos BLOB en los 4 nodos.

Prompt configurando directorios y otorgando registros.
--ocp_s1
Prompt configurando soporte BLOB para ocp_s1
connect netmax_bdd/net@ocp_s1
@s-07-netmax-configuracion-soporte-blobs.sql

--ocp_s2
Prompt configurando soporte BLOB para ocp_s2
connect netmax_bdd/net@ocp_s2
@s-07-netmax-configuracion-soporte-blobs.sql

--lanq_s1
Prompt configurando soporte BLOB para lanq_s1
connect netmax_bdd/net@lanq_s1
@s-07-netmax-configuracion-soporte-blobs.sql

--lanq_s2
Prompt configurando soporte BLOB para lanq_s2
connect netmax_bdd/net@lanq_s2
@s-07-netmax-configuracion-soporte-blobs.sql
Prompt Listo !