conn / as sysdba
startup nomount

alter database mount;

alter database clear unarchived logfile group 1;
alter database clear unarchived logfile group 2;
alter database clear unarchived logfile group 3;
shutdown immediate;
startup;