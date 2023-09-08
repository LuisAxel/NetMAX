--@Autor: Oswaldo Cabrera Pérez y Luis Axel Nuñez Quintana
--@Fecha creación:  22/06/2023
--@Descripción: Creación de trigger para todos los sitios

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt ===========================================
prompt Creando triggers para ocp_s1
prompt ===========================================
connect netmax_bdd/net@ocp_s1
prompt trigger usuario
@s-06-netmax-trigger-usuario.sql
prompt trigger programa
@s-06-netmax-trigger-programa.sql
prompt trigger ocp-s1-serie
@s-06-netmax-trigger-ocp-s1-serie.sql
prompt trigger ocp-s1-documental
@s-06-netmax-trigger-ocp-s1-documental.sql
prompt trigger ocp-s1-pelicula
@s-06-netmax-trigger-ocp-s1-pelicula.sql
prompt trigger ocp_s1-archivo-programa
@s-06-netmax-trigger-ocp-s1-archivo-programa.sql
prompt trigger ocp_s1-playlist
@s-06-netmax-trigger-ocp-s1-playlist.sql
prompt trigger tipo-cuenta
@s-06-netmax-trigger-tipo-cuenta.sql
prompt trigger tipo-serie
@s-06-netmax-trigger-tipo-serie.sql
prompt trigger pais
@s-06-netmax-trigger-pais.sql

prompt ===========================================
prompt Creando triggers para ocp_s2
prompt ===========================================
connect netmax_bdd/net@ocp_s2
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-ocp-s2-serie.sql
@s-06-netmax-trigger-ocp-s2-documental.sql
@s-06-netmax-trigger-ocp-s2-pelicula.sql
@s-06-netmax-trigger-ocp-s2-archivo-programa.sql
@s-06-netmax-trigger-ocp-s2-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql

prompt ===========================================
prompt Creando triggers para lanq_s1
prompt ===========================================
connect netmax_bdd/net@lanq_s1
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-lanq-s1-serie.sql
@s-06-netmax-trigger-lanq-s1-documental.sql
@s-06-netmax-trigger-lanq-s1-pelicula.sql
@s-06-netmax-trigger-lanq-s1-archivo-programa.sql
@s-06-netmax-trigger-lanq-s1-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql

prompt ===========================================
prompt Creando triggers para lanq_s2
prompt ===========================================
connect netmax_bdd/net@lanq_s2
@s-06-netmax-trigger-usuario.sql
@s-06-netmax-trigger-programa.sql
@s-06-netmax-trigger-lanq-s2-serie.sql
@s-06-netmax-trigger-lanq-s2-documental.sql
@s-06-netmax-trigger-lanq-s2-pelicula.sql
@s-06-netmax-trigger-lanq-s2-archivo-programa.sql
@s-06-netmax-trigger-lanq-s2-playlist.sql
@s-06-netmax-trigger-tipo-cuenta.sql
@s-06-netmax-trigger-tipo-serie.sql
@s-06-netmax-trigger-pais.sql

Prompt Listo!
