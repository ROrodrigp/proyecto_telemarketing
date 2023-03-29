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
 ------------
 SELECT df.file_id, df.tablespace_name, df.file_name, df.bytes, df.status
FROM dba_data_files df;
--------------
SELECT tablespace_name, encrypted
FROM dba_tablespaces;