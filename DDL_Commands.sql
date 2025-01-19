--to add a new column to Users table
ALter table Users Add address INT;

--to change datatype of address
Alter table Users Modify address Varchar(50);

--to change datatype size
Alter table Messages Modify m_title Varchar(25);

--alter to add a constraints
Alter table Messages 
ADD CONSTRAINT un_feedback UNIQUE (m_feedback);

Desc Users;
Desc Messages;


Create table review(re_id int,re_name varchar(20),re_messages varchar(50));

Insert into review values(101,'monitor','this is good one');
Insert into review values(102,'keyword','poor one');

Select * from review;
Truncate Table review;
select * from review;


Desc Users;

//to turncate Admin
INSERT INTO Admin (admin_id, user_id)
VALUES (1, 1);
INSERT INTO Admin (admin_id, user_id)
VALUES (102, 2);
Select * from Admin;
Truncate table Admin;

//to drop the table 
desc messages;
desc review;
Drop table messages;
drop table review;

//to check the table is dropped by using insert
Insert into  messages Values(1,'Order details','Didn;t recieve orders',1);

//to drop birth_date column in table
Rename Users to Customers;
Select * from Customers;
Rename Customers to Users;
ALTER TABLE Users DROP COLUMN birth_date;
Desc Users;

