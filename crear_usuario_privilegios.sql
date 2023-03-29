
alter session set container=rgpdip_pdb1;
CREATE USER rodrigo05 IDENTIFIED BY D1Dd1c913a46485946bd## DEFAULT TABLESPACE users QUOTA UNLIMITED ON users;
grant create session, create table, create trigger, create procedure, CREATE ANY DIRECTORY, EXECUTE ON DBMS_LOB to rodrigo05;
commit;


--sql rodrigo05/D1Dd1c913a46485946bd##@rgpdip_pdb1
--sql rodrigo05/D1Dd1c913a46485946bd##@RODRIGOG_PDB1
