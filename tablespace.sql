 //Create a tablespace with 10M size and assign the tablespace
CREATE TABLESPACE ecommerce 
DATAFILE 'ecommerce.dbf' 
SIZE 10M;

SELECT TABLESPACE_NAME, FILE_NAME, BYTES 
FROM DBA_DATA_FILES 
WHERE TABLESPACE_NAME = 'ECOMMERCE';

//Create a locally managed tablespace with 50M size with automatic segment management

CREATE TABLESPACE ecommerce_lm 
DATAFILE 'ecommerce_lm.dbf' 
SIZE 50M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO;

SELECT TABLESPACE_NAME, EXTENT_MANAGEMENT, SEGMENT_SPACE_MANAGEMENT
FROM DBA_TABLESPACES 
WHERE TABLESPACE_NAME = 'ECOMMERCE_LM';

// Add one more datafile of size 5M to the previously created tablespace

ALTER TABLESPACE ecommerce 
ADD DATAFILE 'ecommerce_2.dbf' SIZE 5M;

SELECT TABLESPACE_NAME, FILE_NAME, BYTES 
FROM DBA_DATA_FILES 
WHERE TABLESPACE_NAME = 'ECOMMERCE';


//4. Create a bigfile tablespace and verify it is created as bigfile
CREATE BIGFILE TABLESPACE ecommerce_big 
DATAFILE 'ecommerce_big.dbf' 
SIZE 100M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO;

SELECT TABLESPACE_NAME, BIGFILE 
FROM DBA_TABLESPACES 
WHERE TABLESPACE_NAME = 'ECOMMERCE_BIG';


//5.Make your tablespace offline first and then turn it online

ALTER TABLESPACE ecommerce OFFLINE;

ALTER TABLESPACE ecommerce ONLINE;

SELECT TABLESPACE_NAME, STATUS 
FROM DBA_TABLESPACES 
WHERE TABLESPACE_NAME = 'ECOMMERCE';

//6. Add one more datafile of size 10M to the existing tablespace and make that datafile auto-extensible by 512K

ALTER TABLESPACE ecommerce 
ADD DATAFILE 'ecommerce_3.dbf' SIZE 10M 
AUTOEXTEND ON NEXT 512K;

SELECT FILE_NAME, AUTOEXTENSIBLE, INCREMENT_BY 
FROM DBA_DATA_FILES 
WHERE TABLESPACE_NAME = 'ECOMMERCE';

//7. Resize the datafile from 10M to 50M
ALTER DATABASE DATAFILE 'ecommerce_3.dbf' RESIZE 50M;

SELECT FILE_NAME, BYTES 
FROM DBA_DATA_FILES 
WHERE FILE_NAME = 'ECOMMERCE_3.DBF';


//8. Rename your datafile to prime.dbf
SELECT FILE_NAME FROM DBA_DATA_FILES WHERE FILE_NAME LIKE '%ECOMMERCE_3.DBF%';
ALTER TABLESPACE ecommerce OFFLINE;
ALTER DATABASE RENAME FILE 'D:\ORACLE\DATABASE\ECOMMERCE_3.DBF' 
TO 'D:\ORACLE\DATABASE\PRIME.DBF';
ALTER TABLESPACE ecommerce ONLINE;

//lets check haita
SELECT FILE_NAME FROM DBA_DATA_FILES WHERE TABLESPACE_NAME = 'ECOMMERCE';

//9. Move prime.dbf from one location to another location
//first offline
ALTER TABLESPACE ecommerce OFFLINE;

//create new path in cmd and your old path is in number 8 D:\ORACLE\DATABASE\PRIME.DBF
--create by usimg cmd: mkdir "D:\ORACLE\DATABASE_NEW" 
--then move:move "D:\ORACLE\DATABASE\PRIME.DBF" "D:\ORACLE\DATABASE_NEW\PRIME.DBF"

//now come to cmd
ALTER DATABASE RENAME FILE 'D:\ORACLE\DATABASE\PRIME.DBF' TO 'D:\ORACLE\DATABASE_NEW\PRIME.DBF';

//make it online
ALTER TABLESPACE ecommerce ONLINE;

//verify did it move or not
SELECT FILE_NAME FROM DBA_DATA_FILES WHERE FILE_NAME LIKE '%PRIME%';


//10:Copy the file back to its original location:
--In Windows Command Prompt, use the copy command to copy the file from the new location back to the original location.
//copy "D:\ORACLE\DATABASE_NEW\PRIME.DBF" "D:\ORACLE\DATABASE\PRIME.DBF"

//make it offline first
ALTER TABLESPACE ecommerce OFFLINE;

//Update Oracle to point to the original location:
ALTER DATABASE RENAME FILE 'D:\ORACLE\DATABASE_NEW\PRIME.DBF' TO 'D:\ORACLE\DATABASE\PRIME.DBF';

ALTER TABLESPACE ecommerce ONLINE;

SELECT FILE_NAME FROM DBA_DATA_FILES WHERE FILE_NAME LIKE '%PRIME%';
SELECT * FROM V$RECOVERY_FILE_DEST;

ALTER TABLESPACE ecommerce ONLINE;






//bring back to online












