--Creamos tres grupos con miembros multiplexados en DATA y RECO

prompt creando grupo 4
alter database add logfile group 4 (
    '+DATA',
    '+RECO'
)size 100m blocksize 512;

prompt creando grupo 5
alter database add logfile group 5 (
    '+DATA',
    '+RECO'
)size 100m blocksize 512;

prompt creando grupo 6
alter database add logfile group 6 (
    '+DATA',
    '+RECO'
)size 100m blocksize 512;

--Revisamos los primeros tres grupos de redo logs
 select * from v$log;

--En caso de que un grupo tenga status de CURRENT
alter system switch logfile;


--En caso de que un grupo tenga status de ACTIVE 
alter system checkpoint; 

--Eliminando grupos anteriores no multiplexados 
alter database drop logfile group 1;
alter database drop logfile group 2;
alter database drop logfile group 3;

--Mostrando nuevos 
select * from v$log;
select * from v$logfile;
