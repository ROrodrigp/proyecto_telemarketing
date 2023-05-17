--Script para la creacion de las dos PDB en el proyecto de telemarketing 

alter system set db_create_file_dest='+DATA' scope=memory;
create pluggable database transacciones_pdb admin user admin_s3 identified by admin_s3;
create pluggable database personas_pdb admin user admin_s3 identified by admin_s3;

alter pluggable database transacciones_pdb open read write;
alter pluggable database transacciones_pdb save state;
alter pluggable database personas_pdb open read write;
alter pluggable database personas_pdb save state;