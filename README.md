NetMAX
======
###### Realizado por Núñez Quintana Luis Axel y Cabrera Pérez Oswaldo


En este proyecto, se realiza la creación de una **base de datos relacional distribuida oracle** a partir de un caso de estudio.

Se estudia lo siguiente:
1. Elaboración de un [modelo relacional global](https://github.com/LuisAxel/NetMAX/blob/main/Modelos/ModeloGlobal.jpg) en [ERSTUDIO](https://github.com/LuisAxel/NetMAX/blob/main/Modelos/ModeloGlobal.DM1).
2. Cuatro modelos relacionales, uno para cada site: [OCP_S1](https://github.com/LuisAxel/NetMAX/blob/main/Modelos/OCP_S1.jpg), [OCP_S2](https://github.com/LuisAxel/NetMAX/blob/main/Modelos/OCP_S2.jpg), [LANQ_S1](https://github.com/LuisAxel/NetMAX/blob/main/Modelos/LANQ_S1.jpg) y [LANQ_S2](https://github.com/LuisAxel/NetMAX/blob/main/Modelos/LANQ_S2.jpg), tomando en cuenta las [especificaciones](https://github.com/LuisAxel/NetMAX/tree/main/Requerimientos) de cada uno.
3. Configuración de archivos tnsnames.ora, hosts y hostname para habilitar conexiones entre sitios.
4. [Creación de usuarios](https://github.com/LuisAxel/NetMAX/tree/main/Scripts/s-01-usuarios) para cada sitio.
5. [Creación de ligas](https://github.com/LuisAxel/NetMAX/blob/main/Scripts/s-02-netmax-ligas.sql) para permitir la conexión entre cada pluggable database (pdb).
6. [Creación de tablas y restricciones](https://github.com/LuisAxel/NetMAX/tree/main/Scripts/s-03-ddl) para cada sitio.
7. [Creación de sinónimos](https://github.com/LuisAxel/NetMAX/tree/main/Scripts/s-04-sinonimos) para implementar transparencia de localización.
8. [Creación de vistas, funciones y tablas temporales](https://github.com/LuisAxel/NetMAX/tree/main/Scripts/s-05-manejo-datos-blob) para implementar el manejo de datos blob.
9. [Creación de triggers](https://github.com/LuisAxel/NetMAX/tree/main/Scripts/s-06-triggers) para implementar transparencia de fragmentación.
10. [Creación de funciones y objetos de tipo directory](https://github.com/LuisAxel/NetMAX/tree/main/Scripts/s-07-soporte-blobs) para configurar el soporte de datos blob.
11. Ejecución de [scripts de verificación](https://github.com/LuisAxel/NetMAX/tree/main/Scripts/s-08-presentación) para evaluar la correcta implementación de la base de datos distribuida.
