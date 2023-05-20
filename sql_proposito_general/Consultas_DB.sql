select value from v$system_parameter where name = 'control_files'

----------Preparar una consulta que muestre las ubicaciones de los grupos de Redo Logs-------
select l.group#, l.thread#,f.member,l.archived,
l.status,(bytes/1024/1024) fsize FROM 
v$log l, v$logfile f 
where f.group# = l.group#  order by 1,2

---Preparar una consulta que muestre la distribución de todos sus datafiles---
  
  select name, file#,creation_change#,
to_char(creation_time,'dd/mm/yyyy hh24:mi:ss') creation_time,
checkpoint_change#, to_char(checkpoint_time,'dd/mm/yyyy hh24:mi:ss') checkpoint_time,
last_change#, to_char(last_time,'dd/mm/yyyy hh24:mi:ss') last_time
from v$datafile;

-------------Preparar una consulta que muestre las ubicaciones de los archive Redo logs----------

prompt mostrando  parametros
show spparameter log_archive_dest_1
show spparameter log_archive_dest_2


-----------Preparar una consulta que muestre  la configuración y uso de la FRA---------

prompt mostrando  parametros
show spparameter log_archive_max_processes
show spparameter log_archive_min_succeed_dest
select flashback_on from v$database;
show parameter db_recovery
show parameter db_flashback_retention_target


---------Backup  set fuera de FRA-----

creando carpeta y dando roll
mkdir -p /unam-diplomado-bd/proyecto_telemarketing/bkp
cd /unam-diplomado-bd/proyecto_telemarketing
chown oracle:oinstall bkp
chmod 750 bkp

@run_backupSet.sql

---------------------------Preparar una consulta que muestre un resumen simple de los backups realizados----------------------
rman
connect target "sys/system7 as sysdba"
list backup summary; 
list backup by file; 
show all;
archive log list;
report obsolete;
delete obsolete;


---backup as copy
 backup as copy tablespace TRANSACCIONES_TS format '+FRA'; 

----backup incremental-----
backup incremental level 1 database tag bkI_C1;

---respaldo de toda la BD--
backup database plus archivelog tag Initial_full_bkp;


/*Preparar una consulta que muestre  la cantidad en MB que se han almacenado  
para los diferentes segmentos de la base de datos.   Se deberá  realizar una consulta por PDB.*/

alter session set container=dip123rfyp_s1;
alter session set container=dip123rfyt_s1;
SELECT
  t.tablespace_name,
  t.contents,
  t.block_size,
  t.status,
  t.extent_management,
  t.allocation_type,
  t.segment_space_management,
  ROUND(SUM(NVL(df.bytes, 0)) / 1024 / 1024, 2) AS current_size_mb,
  ROUND(SUM(NVL(df.maxbytes, 0)) / 1024 / 1024, 2) AS max_size_mb
FROM
  dba_tablespaces t
  LEFT JOIN (
    SELECT tablespace_name, file_id, bytes, maxbytes
    FROM dba_data_files
    UNION ALL
    SELECT tablespace_name, file_id, bytes, maxbytes
    FROM dba_temp_files
  ) df ON t.tablespace_name = df.tablespace_name
GROUP BY
  t.tablespace_name,
  t.contents,
  t.block_size,
  t.status,
  t.extent_management,
  t.allocation_type,
  t.segment_space_management
ORDER BY
  t.tablespace_name;