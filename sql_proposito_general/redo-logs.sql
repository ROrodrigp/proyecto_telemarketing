--base de datos debe estar en modo noarchived para nombrar los datos
define syslogon='sys/system2 as sysdba'

connect syslogon 
shutdown immediate

startup mount
prompt consulta redo log rutas  existentes
select l.group#, l.thread#,f.member,l.archived,
l.status,(bytes/1024/1024) fsize FROM 
v$log l, v$logfile f 
where f.group# = l.group#  order by 1,2;

prompt agregamos el grupo faltante

alter database add logfile member '+DIP123RFY/DIP123RFY/ONLINELOG/redo01c_60.log' reuse to group 1 ;
alter database add logfile member '+DIP123RFY/DIP123RFY/ONLINELOG/redo02c_60.log' reuse to group 2 ;
alter database add logfile member '+DIP123RFY/DIP123RFY/ONLINELOG/redo03c_60.log' reuse to group 3;


prompt borramos grupos para volverlos a crear y renombrar con una u otra

ALTER DATABASE DROP LOGFILE MEMBER '+DATA/DIP123RFY/ONLINELOG/group_3.263.1132763667'; 
 alter database drop logfile group 1;

 --Crear 3 nuevos grupos de Online Redo Logs. Su tamaño será de 60 MB con un tamaño de bloque de 512K.
--Agregar únicamente 2 miembros. Emplear la siguientes ubicaciones ,nombres y número de grupo

prompt creando grupo 1
alter database add logfile group 1 (
    '+DATA/DIP123RFY/ONLINELOG/redo01a_60.log',
    '+FRA/DIP123RFY/ONLINELOG/redo01b_60.log'
)size 100m blocksize 512;
prompt creando grupo 2
alter database add logfile group 2 (
    '+DATA/DIP123RFY/ONLINELOG/redo02a_60.log',
    '+FRA/DIP123RFY/ONLINELOG/redo02b_60.log'
)size 100m blocksize 512;
prompt creando grupo 3
alter database add logfile group 3 (
    '+DATA/DIP123RFY/ONLINELOG/redo03a_60.log',
    '+FRA/DIP123RFY/ONLINELOG/redo03b_60.log'
)size 100m blocksize 512 reuse;


prompt consulta redo log rutas  
select l.group#, l.thread#,f.member,l.archived,
l.status,(bytes/1024/1024) fsize FROM 
v$log l, v$logfile f 
where f.group# = l.group#  order by 1,2
