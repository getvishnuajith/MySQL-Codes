-- SQL_Constrains and Bulk_data_input

create database dress_data;
use dress_data;
create table if not exists dress(
`Dress_ID` varchar(30),	
`Style`	varchar(30),	
`Price`	varchar(30),	
`Rating`	varchar(30),	
`Size`	varchar(30),	
`Season`	varchar(30),	
`NeckLine`	varchar(30),	
`SleeveLength` varchar(30),		
`waiseline`	varchar(30),	
`Material`	varchar(30),	
`FabricType`	varchar(30),	
`Decoration`	varchar(30),	
`Pattern Type` varchar(30),		
`Recommendation` varchar(30));

select * from dress;

LOAD DATA INFILE
'D:/ineuron/AttributeDataSet.csv'
into table dress
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

drop table dress;

-- Primary Key, auto increment
create table if not exists test (
test_id int auto_increment ,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id))

select * from test;

insert into test values (1,'sudhanshu','sudhanshu@ineuron.ai','bengluru'),
(2,'krish','krish@ineuron.ai','bengluru'),
(3,'hitesh','hitesh@ineuron.ai','jaipur'),
(4,'shubam','shubham@ineuron.ai','jaipur');


-- Without Mapping
create table if not exists test2 (
test_id int not null auto_increment ,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id));

insert into test2 values ('sudhanshu','sudhanshu@ineuron.ai','bengluru'),
('krish','krish@ineuron.ai','bengluru'),
('hitesh','hitesh@ineuron.ai','jaipur'),
('shubam','shubham@ineuron.ai','jaipur');
-- is due to without mapping only 3 values provided for 4 columns
select * from test2;

-- With Mapping
create table if not exists test3 (
test_id int not null auto_increment ,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id));

insert into test3 (test_name, test_mailid, test_address ) values ('sudhanshu','sudhanshu@ineuron.ai','bengluru'),
('krish','krish@ineuron.ai','bengluru'),
('hitesh','hitesh@ineuron.ai','jaipur'),
('shubam','shubham@ineuron.ai','jaipur');
select * from test3;

-- check values
create table if not exists test4(
test_id int  ,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
test_salary int check (test_salary > 10000));

insert into test4 values 
(1,'sudhanshu','sudhanshu@ineuron.ai','bengluru',15000),
(2,'krish','krish@ineuron.ai','bengluru',30000),
(3,'hitesh','hitesh@ineuron.ai','jaipur',111000),
(4,'shubam','shubham@ineuron.ai','jaipur',5000);
select * from test4;
-- will not work , condition fails
insert into test4 values 
(1,'sudhanshu','sudhanshu@ineuron.ai','bengluru',15000),
(2,'krish','krish@ineuron.ai','bengluru',30000),
(3,'hitesh','hitesh@ineuron.ai','jaipur',111000),
(4,'shubam','shubham@ineuron.ai','jaipur',50000);
select * from test4;
-- will  work , condition satisfies

-- check values
create table if not exists test5(
test_id int  ,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30) check (test_address = 'bengluru'),
test_salary int check (test_salary > 10000));

insert into test5 values 
(1,'sudhanshu','sudhanshu@ineuron.ai','bengluru',15000),
(2,'krish','krish@ineuron.ai','bengluru',30000),
(3,'hitesh','hitesh@ineuron.ai','bengluru',111000),
(4,'shubam','shubham@ineuron.ai','bengluru',50000);
select * from test5;
-- will  work , condition satisfies

-- alter condition in check values
alter table  test3 add check (test_id > 0);

-- Not Null
create table if not exists test6(
test_id int NOT NULL ,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30) check (test_address = 'bengluru'),
test_salary int check (test_salary > 10000));

insert into test6 (test_id,test_name, test_mailid, test_address,test_salary ) values 
('sudhanshu','sudhanshu@ineuron.ai','bengluru',15000),
('krish','krish@ineuron.ai','bengluru',30000),
('hitesh','hitesh@ineuron.ai','jaipur',111000),
('shubam','shubham@ineuron.ai','jaipur',50000);

-- default constrains
create table if not exists test7(
test_id int NOT NULL default 0 ,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30) check (test_address = 'bengluru'),
test_salary int check (test_salary > 10000));

insert into test7 (test_name, test_mailid, test_address,test_salary ) values 
('sudhanshu','sudhanshu@ineuron.ai','bengluru',15000),
('krish','krish@ineuron.ai','bengluru',30000),
('hitesh','hitesh@ineuron.ai','bengluru',111000),
('shubam','shubham@ineuron.ai','bengluru',50000);

select * from test7;

-- unique constrain
create table if not exists test8(
test_id int NOT NULL default 0 ,
test_name varchar(30),
test_mailid varchar(30) unique,
test_address varchar(30) check (test_address = 'bengluru'),
test_salary int check (test_salary > 10000));

insert into test8 (test_name, test_mailid, test_address,test_salary ) values 
('sudhanshu','sudhanshu@ineuron.ai','bengluru',15000);

select * from test8;

-- auto increment
create table if not exists test9(
test_id int NOT NULL default 0 auto_increment ,
test_name varchar(30) NOT NULL default 'unknown',
test_mailid varchar(30) unique NOT NULL,
test_address varchar(30) check (test_address = 'bengluru') NOT NULL,
test_salary int check (test_salary > 10000) NOT NULL,
primary key (test_id));

select * from test9;

-- all conditions
create table if not exists test10( 
test_id int NOT NULL auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique NOT NULL,
teast_adress varchar(30) check (teast_adress= 'bengalore') NOT NULL,
test_salary int check (test_salary > 10000) NOT NULL,
primary key (test_id))

select * from test10;

insert into test8 ( test_id , test_name , test_mailid , teast_adress,test_salary) values (100 , 'sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

select * from dress where style = 'cute'