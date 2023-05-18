--@Autor:          Pedro Sanchez, Rodrigo
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     script principal

--
-- Configurar las siguientes variables en caso de ser necesario
--

whenever sqlerror exit rollback

--usuario pdb productos
define p_usuario_p=user_p
--contraseña usuario productos
define p_usr_pwd_p=user01

--usuario pdb transacciones
define p_usuario_t=user_t
--contraseña usuario transacciones
define p_usr_pwd_t=user01

--nombre de la pdb donde se crearán las tablas productos
define p_pdb1_p=dip123rfyp_s1
--nombre de la pdb donde se crearán las tablas transacciones
define p_pdb1_t=dip123rfyt_s1

--sys
define p_sys_pwd=system07


Prompt =========================================================
Prompt Creando objetos - Control médico -
Prompt Presionar Enter si los valores configurados son correctos.
Prompt De lo contario editar este archvo 
Prompt O en su defecto proporcionar nuevos valores
Prompt =========================================================

Prompt Datos de Entrada:
accept p_usuario_p default '&&p_usuario_p' prompt '1. Proporcionar el nombre de usuario productos que será creado [&&p_usuario_p]: '
accept p_usr_pwd_p default '&&p_usr_pwd_p' prompt '2. Proporcionar password del usuario productos &&p_usuario_p [configurado en script]: '

accept p_usuario_t default '&&p_usuario_t' prompt '1. Proporcionar el nombre de usuario transacciones que será creado [&&p_usuario_t]: '
accept p_usr_pwd_t default '&&p_usr_pwd_t' prompt '2. Proporcionar password del usuario transacciones &&p_usuario_t [configurado en script]: '
accept p_sys_pwd default '&&p_sys_pwd' prompt '3. Proporcionar password de sys [configurado en script]: '

accept p_pdb1_p default '&&p_pdb1_p' prompt '3. Nombre de la PDB a emplear. [&&p_pdb1_p]: '
accept p_pdb1_t default '&&p_pdb1_t' prompt '3. Nombre de la PDB a emplear. [&&p_pdb1_t]: '

Prompt creando PDB Productos
connect sys/&&p_sys_pwd as sysdba
@s-02-telemarketing-pdbs.sql

Prompt creando al usuarios PDBs
set serveroutput on
@s-03-telemarketing-usuarios.sql

set serveroutput on

Prompt creando objetos ddl
@s-04-telemarketing-ddl.sql

Prompt cargando Datos
Prompt conectando como &&p_usuario_p a PDB &&p_pdb1_p
connect &&p_usuario_p/&&p_usr_pwd_p@&&p_pdb1_p
Prompt insertando datos
@s-05-telemarketing-dml.sql
commit;
Prompt conectando como &&p_usuario_t a PDB &&p_pdb1_t
connect user_t/user01@dip123rfyt_s1
Prompt insertando datos
@s-06-telemarketing-dml.sql
commit;

Prompt Listo!

Pause Enter para realizar limpieza
@s-07-telemarketing-limpieza.sql

whenever sqlerror continue



