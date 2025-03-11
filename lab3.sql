-- Create a tablespace named 'school_ts' with a datafile of size 10M
CREATE TABLESPACE school_ts 
DATAFILE 'school_ts.dbf' 
SIZE 10M;

-- Verify the tablespace and datafile
SELECT TABLESPACE_NAME, FILE_NAME, BYTES 
FROM DBA_DATA_FILES 
WHERE TABLESPACE_NAME = 'SCHOOL_TS';

-- Create a locally managed tablespace named 'school_lm' with automatic segment management
CREATE TABLESPACE school_lm 
DATAFILE 'school_lm.dbf' 
SIZE 50M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO;

-- Verify the tablespace properties
SELECT TABLESPACE_NAME, EXTENT_MANAGEMENT, SEGMENT_SPACE_MANAGEMENT
FROM DBA_TABLESPACES 
WHERE TABLESPACE_NAME = 'SCHOOL_LM';

-- Add a new datafile of size 5M to the 'school_ts' tablespace
ALTER TABLESPACE school_ts 
ADD DATAFILE 'school_ts_2.dbf' SIZE 5M;

-- Verify the datafile
SELECT TABLESPACE_NAME, FILE_NAME, BYTES 
FROM DBA_DATA_FILES 
WHERE TABLESPACE_NAME = 'SCHOOL_TS';

-- Create a bigfile tablespace named 'school_big'
CREATE BIGFILE TABLESPACE school_big 
DATAFILE 'school_big.dbf' 
SIZE 100M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO;

-- Verify the tablespace type
SELECT TABLESPACE_NAME, BIGFILE 
FROM DBA_TABLESPACES 
WHERE TABLESPACE_NAME = 'SCHOOL_BIG';

-- Make the 'school_ts' tablespace offline
ALTER TABLESPACE school_ts OFFLINE;

-- Bring the 'school_ts' tablespace online
ALTER TABLESPACE school_ts ONLINE;

-- Verify the tablespace status
SELECT TABLESPACE_NAME, STATUS 
FROM DBA_TABLESPACES 
WHERE TABLESPACE_NAME = 'SCHOOL_TS';

-- Add a new datafile of size 10M to the 'school_ts' tablespace with auto-extend
ALTER TABLESPACE school_ts 
ADD DATAFILE 'school_ts_3.dbf' SIZE 10M 
AUTOEXTEND ON NEXT 512K;

-- Verify the datafile properties
SELECT FILE_NAME, AUTOEXTENSIBLE, INCREMENT_BY 
FROM DBA_DATA_FILES 
WHERE TABLESPACE_NAME = 'SCHOOL_TS';

-- Resize the datafile 'school_ts_3.dbf' from 10M to 50M
ALTER DATABASE DATAFILE 'school_ts_3.dbf' RESIZE 50M;

-- Verify the datafile size
SELECT FILE_NAME, BYTES 
FROM DBA_DATA_FILES 
WHERE FILE_NAME LIKE '%SCHOOL_TS_3.DBF%';

-- Check the current datafile name
SELECT FILE_NAME FROM DBA_DATA_FILES WHERE FILE_NAME LIKE '%SCHOOL_TS_3.DBF%';

-- Take the tablespace offline
ALTER TABLESPACE school_ts OFFLINE;

-- Rename the datafile
ALTER DATABASE RENAME FILE 'C:\APP\ACER-SITA\PRODUCT\21C\DBHOMEXE\DATABASE\SCHOOL_TS_3.DBF' 
TO 'C:\APP\ACER-SITA\PRODUCT\21C\DBHOMEXE\DATABASE\PRIME.DBF';

--Check the current location and name of the datafile in the database.
SELECT FILE_NAME 
FROM DBA_DATA_FILES 
WHERE FILE_NAME LIKE '%SCHOOL_TS_3.DBF%';

-- Bring the tablespace online
ALTER TABLESPACE school_ts ONLINE;

-- Verify the datafile name
SELECT FILE_NAME FROM DBA_DATA_FILES WHERE TABLESPACE_NAME = 'SCHOOL_TS';


-- Take the tablespace offline
ALTER TABLESPACE school_ts OFFLINE;

-- Copy the datafile using the operating system
-- Example (Windows Command Prompt):
-- copy "D:\ORACLE\DATABASE_NEW\PRIME.DBF" "D:\ORACLE\DATABASE\PRIME.DBF"

-- Update the datafile location in the database
ALTER DATABASE RENAME FILE 'C:\APP\ACER-SITA\PRODUCT\21C\DBHOMEXE\DATABASE\PRIME.DBF' 
TO 'C:\APP\ACER-SITA\PRODUCT\21C\DBHOMEXE\DATABASE_NEW\PRIME.DBF';

-- Bring the tablespace online
ALTER TABLESPACE school_ts ONLINE;

-- Verify the datafile location
SELECT FILE_NAME FROM DBA_DATA_FILES WHERE FILE_NAME LIKE '%PRIME%';


-- Take the tablespace offline
ALTER TABLESPACE school_ts OFFLINE;

-- Copy the datafile using the operating system
-- Example (Windows Command Prompt):
-- copy "D:\ORACLE\DATABASE_NEW\PRIME.DBF" "D:\ORACLE\DATABASE\PRIME.DBF"

-- Update the datafile location in the database
ALTER DATABASE RENAME FILE 'C:\APP\ACER-SITA\PRODUCT\21C\DBHOMEXE\DATABASE_NEW\PRIME.DBF' 
TO 'C:\APP\ACER-SITA\PRODUCT\21C\DBHOMEXE\DATABASE\PRIME.DBF';

-- Bring the tablespace online
ALTER TABLESPACE school_ts ONLINE;

-- Verify the datafile location
SELECT FILE_NAME FROM DBA_DATA_FILES WHERE FILE_NAME LIKE '%PRIME%';


-- a query to get information about the datafile prime.dbf.
SELECT file_name, tablespace_name, bytes, autoextensible, increment_by
FROM DBA_DATA_FILES
WHERE file_name LIKE '%prime.dbf%';


-- Take the tablespace offline
ALTER TABLESPACE TS1 OFFLINE;
--Check if the tablespace TS1 exists in the database.
SELECT tablespace_name 
FROM DBA_TABLESPACES 
WHERE tablespace_name = 'TS1';
--Create the Tablespace (If It Does Not Exist)
CREATE TABLESPACE TS1
  DATAFILE 'ts1.dbf' SIZE 10M;
--verify the tablespace status
SELECT tablespace_name, status 
FROM DBA_TABLESPACES 
WHERE tablespace_name = 'TS1';
--Check which tablespace the datafile
SELECT TABLESPACE_NAME, FILE_NAME 
FROM DBA_DATA_FILES 
WHERE FILE_NAME = 'C:\APP\ACER-SITA\PRODUCT\21C\DBHOMEXE\DATABASE\PRIME.DBF';

-- Drop the datafile
ALTER TABLESPACE SCHOOL_TS
  DROP DATAFILE 'C:\APP\ACER-SITA\PRODUCT\21C\DBHOMEXE\DATABASE\PRIME.DBF';

-- Bring the tablespace online
ALTER TABLESPACE TS1 ONLINE;

SELECT FILE_NAME 
FROM DBA_DATA_FILES 
WHERE TABLESPACE_NAME = 'SCHOOL_TS';