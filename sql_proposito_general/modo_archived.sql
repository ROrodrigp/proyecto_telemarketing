prompt habilitando el modo archive
prompt autenticando como sysdba

connect sys/system7 as sysdba
prompt 1.-  respaldar al SPFILE
create pfile from spfile;

prompt 2.- configurando parametros 
prompt Configurar 5 procesos ARCn encargados de realizar el proceso de archivado.
--procesos ARCn
alter system set log_archive_max_processes=5 scope=spfile;
--formato del archivo
alter system set log_archive_format='arch_%t_%s_%r.arc' scope=spfile;
--copias 2
prompt Configurar la creación de 2 copias en cada proceso de archivado empleando los 2 directorios creados en el punto anterior.
alter system set log_archive_dest_1='+DATA/DIP123RFY/arclogs MANDATORY' scope=spfile;
alter system set log_archive_dest_2='+FRA/DIP123RFY//arclogs' scope=spfile;

--copis obligatorias
alter system set log_archive_min_succeed_dest=2 scope=spfile;


prompt mostrando  parametros
show spparameter log_archive_max_processes
show spparameter log_archive_format
show spparameter log_archive_dest_1
show spparameter log_archive_dest_2
show spparameter log_archive_min_succeed_dest

pause Revisar [Enter para continuar]

prompt 3.-  reiniciando en modo mount
--adicional se deberia hacer un backup completo de la BD

shutdown immediate
startup mount

pause 4.- enter para cambiar a modo archive
alter database archivelog;

--aqui se deberia hacer un full backup

prompt 4.- abriendo base de datos en modo open
alter database  open;

prompt 5.- mostrando modo archivelog

archive log list

prompt 6.-  respaldar al SPFILE
create pfile from spfile;
startup pfile=$ORACLE_HOME/dbs/initdip123rfy.ora

prompt 7.- mostrando procesos ARCn

!ps -ef | grep ora_arc