--@Autor: Luis Axel Nuñez Quintana y Oswaldo Cabrera Pérez
--@Fecha creación: 21/06/2022
--@Descripción: Crea las ligas para la conexión entre pdbs

clear screen
whenever sqlerror exit rollback;

--Ligas en la pdb ocp_s1
Prompt ============================================
Prompt Creando ligas en ocp_s1
Prompt ============================================
connect netmax_bdd/net@ocp_s1

--PDB local
create database link ocp_s2.fi.unam using 'OCP_S2';

--PDB Remota
create database link lanq_s1.fi.unam using 'LANQ_S1';
create database link lanq_s2.fi.unam using 'LANQ_S2';

--Ligas en la pdb ocp_s2
Prompt ============================================
Prompt Creando ligas en ocp_s2
Prompt ============================================
connect netmax_bdd/net@ocp_s2

--PDB local
create database link ocp_s1.fi.unam using 'OCP_S1';

--PDB Remota
create database link lanq_s1.fi.unam using 'LANQ_S1';
create database link lanq_s2.fi.unam using 'LANQ_S2';

--Ligas en la pdb lanq_s1
Prompt ============================================
Prompt Creando ligas en lanq_s1
Prompt ============================================
connect netmax_bdd/net@lanq_s1

--PDB local
create database link lanq_s2.fi.unam using 'LANQ_S2';

--PDB Remota
create database link ocp_s1.fi.unam using 'OCP_S1';
create database link ocp_s2.fi.unam using 'OCP_S2';

--Ligas en la pdb lanq_s2
Prompt ============================================
Prompt Creando ligas en lanq_s2
Prompt ============================================
connect netmax_bdd/net@lanq_s2

--PDB local
create database link lanq_s1.fi.unam using 'LANQ_S1';

--PDB Remota
create database link ocp_s1.fi.unam using 'OCP_S1';
create database link ocp_s2.fi.unam using 'OCP_S2';

Prompt Listo!


