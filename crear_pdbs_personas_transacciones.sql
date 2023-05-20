--Script para la creacion de las dos PDB en el proyecto de telemarketing 
alter session set container=cdb$root;
alter system set db_create_file_dest='+DATA' scope=memory;
create pluggable database transacciones_pdb admin user admin_s3 identified by admin_s3;
create pluggable database personas_pdb admin user admin_s3 identified by admin_s3;

alter pluggable database transacciones_pdb open read write;
alter pluggable database transacciones_pdb save state;
alter pluggable database personas_pdb open read write;
alter pluggable database personas_pdb save state;


--Creacion de los tablespaces por modulo 

alter session set container=personas_pdb;
CREATE TABLESPACE BLOB_TS DATAFILE  SIZE 100M AUTOEXTEND ON;
CREATE TABLESPACE PERSONA_TS DATAFILE  SIZE 100M AUTOEXTEND ON;
CREATE TABLESPACE INDICES_TS DATAFILE SIZE 100M AUTOEXTEND ON;

alter session set container=transacciones_pdb;
CREATE TABLESPACE BLOB_TS DATAFILE  SIZE 100M AUTOEXTEND ON;
CREATE TABLESPACE TRANSACCIONES_TS DATAFILE  SIZE 100M AUTOEXTEND ON;
CREATE TABLESPACE INDICES_TS DATAFILE SIZE 100M AUTOEXTEND ON;


--Creacion de los usuarios 
alter session set container=personas_pdb;
CREATE USER usuario_personas IDENTIFIED BY D1Dd1c913a46485946bd## DEFAULT TABLESPACE PERSONA_TS QUOTA UNLIMITED ON PERSONA_TS;
grant create session, create table, create trigger, create procedure, CREATE ANY DIRECTORY to usuario_personas;
GRANT CREATE ANY INDEX TO usuario_personas;
ALTER USER usuario_personas QUOTA UNLIMITED ON INDICES_TS;
grant EXECUTE ON DBMS_LOB to usuario_personas;

alter session set container=transacciones_pdb;
CREATE USER usuario_transacciones IDENTIFIED BY D1Dd1c913a46485946bd## DEFAULT TABLESPACE TRANSACCIONES_TS QUOTA UNLIMITED ON TRANSACCIONES_TS;
grant create session, create table, create trigger, create procedure, CREATE ANY DIRECTORY to usuario_transacciones;
GRANT CREATE ANY INDEX TO usuario_transacciones;
ALTER USER usuario_transacciones QUOTA UNLIMITED ON INDICES_TS;
grant EXECUTE ON DBMS_LOB to usuario_transacciones;

commit;