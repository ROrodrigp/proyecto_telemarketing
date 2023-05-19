prompt creando PDB: &&p_pdb1_p y PDB: &&p_pdb1_t


alter session set container=cdb$root;
alter pluggable database &&p_pdb1_p close;
drop pluggable database &&p_pdb1_p including datafiles;
alter pluggable database &&p_pdb1_t close;
drop pluggable database &&p_pdb1_t including datafiles;


show PDBS
create pluggable database &&p_pdb1_p admin user admin_s1 identified by admin_s1;
alter pluggable database &&p_pdb1_p open read write;
alter pluggable database &&p_pdb1_p save state;

show PDBS
create pluggable database &&p_pdb1_t admin user admin_s1 identified by admin_s1;
alter pluggable database &&p_pdb1_t open read write;
alter pluggable database &&p_pdb1_t save state;
show PDBS

