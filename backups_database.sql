--Backupset en FRA 
-- Realiza un backup completo de la base de datos
RMAN TARGET /
BACKUP DATABASE PLUS ARCHIVELOG;


--Backupset en carpeta /home/oracle/backup
-- Realiza un backup en una ubicación específica
RMAN TARGET /
BACKUP AS BACKUPSET DATABASE FORMAT '/backup/%U';


--Backup copy en FRA
RMAN TARGET /
BACKUP AS COPY DATABASE;


--Backup copy en carpeta /opt/backups_copy
RMAN TARGET /
BACKUP AS COPY DATABASE FORMAT '/opt/backups_copy/%U';


--Backup incremental de nivel 0 
RMAN TARGET /
BACKUP INCREMENTAL LEVEL 0 DATABASE;


--Backup incremental de nivel 1 
RMAN TARGET / 
BACKUP INCREMENTAL LEVEL 1 DATABASE;