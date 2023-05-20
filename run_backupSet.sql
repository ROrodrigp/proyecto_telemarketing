run {
    allocate channel fs1 type disk
             format= '/unam-diplomado-bd/proyecto_telemarketing/bkp';
    allocate channel fs2 type disk
             format= '+FRA';
    backup
         incremental level = 0
         filesperset = 3
         database
         include current controlfile 
         tag = 'bkp_S1';
}