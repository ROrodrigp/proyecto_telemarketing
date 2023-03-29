--hace uso de todo el ancho de la terminal
set linesize window
--emplear nano para editar sentencias SQL
define _editor=nano

--personalizar el prompt
define prompt_value=idle
col prompt_name new_value prompt_value
col prompt_name noprint
set heading off
set termout off
select lower(sys_context('userenv','current_user')
  ||'@'||sys_context('userenv','db_name')) as prompt_name
from dual;
set sqlprompt '&prompt_value> '
set heading on
set termout on
col prompt_name print

location 0 /u01/app/oracle/product/19.3.0/dbhome_1/sqlplus/admin
