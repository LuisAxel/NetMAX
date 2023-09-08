--@Autor: Luis Axel Nuñez Quintana y Oswaldo Cabrera Pérez
--@Fecha creación: 21/06/2022
--@Descripción: Crea sinonimos de ocp_s2

Prompt Fragmentos de usuario...

create or replace synonym usuario_f1 for usuario_f1_lanq_s1@lanq_s1.fi.unam;
create or replace synonym usuario_f2 for usuario_f2_lanq_s2@lanq_s2.fi.unam;
create or replace synonym usuario_f3 for usuario_f3_ocp_s2;
create or replace synonym usuario_f4 for usuario_f4_lanq_s1@lanq_s1.fi.unam;
create or replace synonym usuario_f5 for usuario_f5_ocp_s1@ocp_s1.fi.unam;

Prompt Fragmentos de programa...

create or replace synonym programa_f1 for programa_f1_ocp_s1@ocp_s1.fi.unam;
create or replace synonym programa_f2 for programa_f2_lanq_s1@lanq_s1.fi.unam;
create or replace synonym programa_f3 for programa_f3_lanq_s2@lanq_s2.fi.unam;

Prompt Fragmentos de documental...

create or replace synonym documental_f1 for documental_f1_ocp_s1@ocp_s1.fi.unam;
create or replace synonym documental_f2 for documental_f2_lanq_s1@lanq_s1.fi.unam;
create or replace synonym documental_f3 for documental_f3_lanq_s2@lanq_s2.fi.unam;

Prompt Fragmentos de pelicula...

create or replace synonym pelicula_f1 for pelicula_f1_ocp_s1@ocp_s1.fi.unam;
create or replace synonym pelicula_f2 for pelicula_f2_lanq_s1@lanq_s1.fi.unam;
create or replace synonym pelicula_f3 for pelicula_f3_lanq_s2@lanq_s2.fi.unam;

Prompt Fragmentos de serie...

create or replace synonym serie_f1 for serie_f1_ocp_s1@ocp_s1.fi.unam;
create or replace synonym serie_f2 for serie_f2_lanq_s1@lanq_s1.fi.unam;
create or replace synonym serie_f3 for serie_f3_lanq_s2@lanq_s2.fi.unam;

Prompt Fragmentos de historico_status_programa...

create or replace synonym historico_status_programa_f1 for historico_status_programa_lanq_s2@lanq_s2.fi.unam;

Prompt Fragmentos de archivo_programa...

create or replace synonym archivo_programa_f1 for archivo_programa_f1_ocp_s2;
create or replace synonym archivo_programa_f2 for archivo_programa_f2_lanq_s1@lanq_s1.fi.unam;

Prompt Fragmentos de playlist....

create or replace synonym playlist_f1 for playlist_f1_lanq_s2@lanq_s2.fi.unam;
create or replace synonym playlist_f2 for playlist_f2_ocp_s2;
create or replace synonym playlist_f3 for playlist_f3_lanq_s1@lanq_s1.fi.unam;
create or replace synonym playlist_f4 for playlist_f4_ocp_s1@ocp_s1.fi.unam;

Prompt Fragmentos de tipo_cuenta

create or replace synonym tipo_cuenta_r2 for tipo_cuenta_r_ocp_s1@ocp_s1.fi.unam;
create or replace synonym tipo_cuenta_r1 for tipo_cuenta_r_ocp_s2;
create or replace synonym tipo_cuenta_r3 for tipo_cuenta_r_lanq_s1@lanq_s1.fi.unam;
create or replace synonym tipo_cuenta_r4 for tipo_cuenta_r_lanq_s2@lanq_s2.fi.unam;

Prompt Fragmentos de pais

create or replace synonym pais_r2 for pais_r_ocp_s1@ocp_s1.fi.unam;
create or replace synonym pais_r1 for pais_r_ocp_s2;
create or replace synonym pais_r3 for pais_r_lanq_s1@lanq_s1.fi.unam;
create or replace synonym pais_r4 for pais_r_lanq_s2@lanq_s2.fi.unam;

Prompt Fragmentos de tipo_serie

create or replace synonym tipo_serie_r2 for tipo_serie_r_ocp_s1@ocp_s1.fi.unam;
create or replace synonym tipo_serie_r1 for tipo_serie_r_ocp_s2;
create or replace synonym tipo_serie_r3 for tipo_serie_r_lanq_s1@lanq_s1.fi.unam;
create or replace synonym tipo_serie_r4 for tipo_serie_r_lanq_s2@lanq_s2.fi.unam;

Prompt Listo!

