

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

---------------------------Preparar una consulta que muestre un resumen simple de los backups realizados----------------------





/*Preparar una consulta que muestre  la cantidad en MB que se han almacenado  
para los diferentes segmentos de la base de datos.   Se deberá  realizar una consulta por PDB.*/

