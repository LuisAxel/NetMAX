--@Autor:          Jorge A. Rodríguez C 
--@Fecha creación:  dd/mm/yyyy 
--@Descripción:     Archivo de carga inicial. 
clear screen 
whenever sqlerror exit rollback; 
 
Prompt ====================================== 
Prompt Cargando catalogos replicados en ocp_s1 
Prompt ====================================== 
connect netmax_bdd/net@ocp_s1
delete from status_programa; 
@carga-inicial/netmax-carga-inicial-status-programa.sql 
commit; 
 
Prompt ====================================== 
Prompt Cargando catalogos replicados en ocp_s2 
Prompt ====================================== 
connect netmax_bdd/net@ocp_s2 
delete from status_programa; 
@carga-inicial/netmax-carga-inicial-status-programa.sql 
commit; 
 
Prompt ====================================== 
Prompt Cargando catalogos replicados en lanq_s1 
Prompt ====================================== 
connect netmax_bdd/net@lanq_s1 
delete from status_programa; 
@carga-inicial/netmax-carga-inicial-status-programa.sql 
commit; 
 
Prompt ====================================== 
Prompt Cargando catalogos replicados en lanq_s2 
Prompt ====================================== 
connect netmax_bdd/net@lanq_s2 
delete from status_programa; 
@carga-inicial/netmax-carga-inicial-status-programa.sql 
commit; 
 
Prompt Carga de datos replicados exitosa!. 
exit
