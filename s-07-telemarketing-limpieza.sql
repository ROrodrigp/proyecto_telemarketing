prompt limpieza...

alter session set container=&&p_pdb1_p;
DROP TABLESPACE PRODUCTOS INCLUDING CONTENTS AND DATAFILES; 
alter session set container=&&p_pdb1_t;
DROP TABLESPACE TRANSACCIONES INCLUDING CONTENTS AND DATAFILES; 

SELECT tablespace_name FROM dba_tablespaces;

alter session set container=cdb$root;
alter pluggable database &&p_pdb1_p close;
drop pluggable database &&p_pdb1_p including datafiles;
alter pluggable database &&p_pdb1_t close;
drop pluggable database &&p_pdb1_t including datafiles;

/*
alter session set container=cdb$root;
DROP TABLESPACE PRODUCTOS INCLUDING CONTENTS AND DATAFILES
DROP TABLESPACE TRANSACCIONES INCLUDING CONTENTS AND DATAFILES
alter pluggable database DIP123RFYP_S1 close;
alter pluggable database DIP123RFYT_S1 close;
drop pluggable database DIP123RFYP_S1 including datafiles;
drop pluggable database DIP123RFYT_S1 including datafiles;
*/
commit;

