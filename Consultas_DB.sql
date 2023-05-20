----------Preparar una consulta que muestre las ubicaciones de los grupos de Redo Logs-------
select l.group#, l.thread#,f.member,l.archived,
l.status,(bytes/1024/1024) fsize FROM 
v$log l, v$logfile f 
where f.group# = l.group#  order by 1,2;

---Preparar una consulta que muestre la distribución de todos sus datafiles---
  
SELECT
  file_name,
  tablespace_name,
  ROUND(bytes / 1024 / 1024, 2) AS size_mb,
  autoextensible,
  ROUND(maxbytes / 1024 / 1024, 2) AS max_size_mb,
  increment_by * (SELECT value FROM v$parameter WHERE name = 'db_block_size') / 1024 / 1024 AS increment_mb
FROM
  dba_data_files
ORDER BY
  tablespace_name, file_name;

-----------Preparar una consulta que muestre  la configuración y uso de la FRA---------


show parameter db_recovery_file_dest
SELECT 
  file_type, 
  percent_space_used, 
  percent_space_reclaimable, 
  number_of_files 
FROM 
  V$FLASH_RECOVERY_AREA_USAGE;


-------------Preparar una consulta que muestre las ubicaciones de los archive Redo logs----------

SELECT 
    name AS archive_log_file_name,
    sequence# AS sequence,
    thread# AS thread,
    TO_CHAR(first_time, 'YYYY-MM-DD HH24:MI:SS') AS first_time,
    TO_CHAR(next_time, 'YYYY-MM-DD HH24:MI:SS') AS next_time,
    ROUND(blocks * block_size / 1024 / 1024, 2) AS size_mb
FROM 
    v$archived_log
ORDER BY 
    first_time;




---------------------------Preparar una consulta que muestre un resumen simple de los backups realizados----------------------


rman target /
LIST BACKUP SUMMARY;


/*Preparar una consulta que muestre  la cantidad en MB que se han almacenado  
para los diferentes segmentos de la base de datos.   Se deberá  realizar una consulta por PDB.*/
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

