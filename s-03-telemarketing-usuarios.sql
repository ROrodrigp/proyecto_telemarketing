
prompt creando usuarios 
alter session set container=&&p_pdb1_p;


--eliminamos los tablespaces
begin
  execute immediate 'drop tablespace BLOB_TS INCLUDING CONTENTS AND DATAFILES';
exception
  when others then
    if sqlcode = -959 then
      dbms_output.put_line('borra tablespace para crear de nuevo BLOB_TS');
    else
      raise;
    end if;
end;
/
begin
  execute immediate 'drop tablespace PERSONA_TS INCLUDING CONTENTS AND DATAFILES';
exception
  when others then
    if sqlcode = -959 then
      dbms_output.put_line('borra tablespace para crear de nuevo PERSONA_TS');
    else
      raise;
    end if;
end;
/
begin
  execute immediate 'drop tablespace INDICES_TS INCLUDING CONTENTS AND DATAFILES';
exception
  when others then
    if sqlcode = -959 then
      dbms_output.put_line('borra tablespace para crear de nuevo INDICES_TS');
    else
      raise;
    end if;
end;
/

CREATE TABLESPACE BLOB_TS 
datafile '+DATA'  size 1G,
         '+DIP123RFY'  size 1G 
 autoextend on next 200M;

CREATE TABLESPACE PERSONA_TS 
datafile '+DATA'  size 1G, 
         '+DIP123RFY'  size 1G  autoextend on next 200M;

CREATE TABLESPACE INDICES_TS
datafile '+DATA'  size 1G, 
         '+DIP123RFY'  size 1G  autoextend on next 200M;

SELECT tablespace_name FROM dba_tablespaces;

begin
  execute immediate 'drop user &&p_usuario_p cascade';
exception
  when others then
    if sqlcode = -1918 then
      dbms_output.put_line('El usuario no existe, será creado');
    else
      raise;
    end if;
end;
/

create user &&p_usuario_p identified by &&p_usr_pwd_p default tablespace PERSONA_TS quota unlimited on PERSONA_TS;
grant create session ,INSERT ANY TABLE, create table, create trigger,create tablespace, create procedure, CREATE ANY DIRECTORY to &&p_usuario_p;

alter session set container=&&p_pdb1_t;

begin
  execute immediate 'drop tablespace TRANSACCIONES_TS INCLUDING CONTENTS AND DATAFILES';
exception
  when others then
    if sqlcode = -959 then
      dbms_output.put_line('borra tablespace para crear de nuevo TRANSACCIONES_TS');
    else
      raise;
    end if;
end;
/
CREATE TABLESPACE TRANSACCIONES_TS 
datafile '+DATA'  size 1G,
         '+DIP123RFY' size 1G
 autoextend on next 200M;

 CREATE TABLESPACE BLOB_TS 
datafile '+DATA'  size 1G,
         '+DIP123RFY'  size 1G 
 autoextend on next 200M;

CREATE TABLESPACE INDICES_TS
datafile '+DATA'  size 1G, 
         '+DIP123RFY'  size 1G  autoextend on next 200M;

SELECT tablespace_name FROM dba_tablespaces;
begin
  execute immediate 'drop user &&p_usuario_t cascade';
exception
  when others then
    if sqlcode = -1918 then
      dbms_output.put_line('El usuario no existe, será creado');
    else
      raise;
    end if;
end;
/

create user &&p_usuario_t identified by &&p_usr_pwd_t default tablespace TRANSACCIONES_TS quota unlimited on TRANSACCIONES_TS;
grant create session ,INSERT ANY TABLE, create table, create trigger,create tablespace, create procedure, CREATE ANY DIRECTORY to &&p_usuario_t;



