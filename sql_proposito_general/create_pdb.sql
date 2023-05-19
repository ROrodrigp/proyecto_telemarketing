

alter system set db_create_file_dest='+DATA' scope=memory;
create pluggable database rodrigog_pdb2 admin user admin_s3 identified by admin_s3;
ALTER PLUGGABLE DATABASE RODRIGOG_PDB2 OPEN READ WRITE;
ALTER PLUGGABLE DATABASE RODRIGOG_PDB2 SAVE STATE;

dbcli list-databases
dbcli update-tdekey -n RODRIGOG_PDB2 -p D1Dd1c913a46485946bd## -i 197706ec-bbbd-4f2c-95e7-c07bc08d8c59


CREATE TABLESPACE USERS
datafile  SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

CREATE TABLESPACE transacciones_ts DATAFILE  SIZE 100M AUTOEXTEND ON;
