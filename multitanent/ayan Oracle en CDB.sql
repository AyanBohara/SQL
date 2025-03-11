SELECT SYS_CONTEXT('USERENV','CON_NAME') FROM DUAL;

//Creating a new PDB
CREATE PLUGGABLE DATABASE NEWPDB 
ADMIN USER pdb_admin IDENTIFIED BY MyPassword123 
ROLES = (pdb_dba)
CREATE_FILE_DEST = 'D:\oracle_21c\oradata\';

//creating a Pdb by cloning another PDB
SELECT name FROM v$pdbs;

CREATE PLUGGABLE DATABASE NEWPDB_1
FROM NEWPDB
FILE_NAME_CONVERT = ('D:\oracle_21c\oradata\NEWPDB', 'D:\oracle_21c\oradata\NEWPDB_1');
