
alter session set container=rgpdip_pdb1;
create user rodrigo05 identified by D1Dd1c913a46485946bd## quota unlimited on users;
grant create session, create table, create trigger to rodrigo05;
commit;
