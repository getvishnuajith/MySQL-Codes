-- create automated table header
-- year month date management
-- update and manupulate columns
-- security mode problem solution

create database if not exists sales;
use sales;
CREATE TABLE sales (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

-- use python to fetch data to create table header
-- Inside anaconda Terminal
-- pip install csvkit
-- D:\> csvsql --dialect mysql --snifflimit 100000 sales_data_final.csv > output_sales.sql

SET SESSION sql_mode = '';

load data infile 
'D:/sales_data_final.csv'
into table sales
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;

select * from sales ; 

select str_to_date(order_date,'%m/%d/%Y')from sales;

alter table sales
add column order_date_new date after order_date;

update sales
set order_date_new = str_to_date(order_date,'%m/%d/%Y');

alter table sales
add column ship_date_new date after ship_date;

update sales
set ship_date_new = str_to_date(ship_date, '%m/%d/%Y');

select * from sales;

SET SQL_SAFE_UPDATES = 0;

select * from sales where ship_date_new = '2011-01-05';
select * from sales where ship_date_new > '2011-01-05';
select * from sales where ship_date_new < '2011-01-05';
select * from sales where ship_date_new between '2011-01-05' and '2011-08-30';

-- current date and time
select now();
-- current date
select curdate();
-- current time
select curtime();

select * from sales where ship_date_new < date_sub(now(), interval 1 week);

select date_sub(now(), interval 1 week);
select date_sub(now(), interval 30 day);
select date_sub(now(), interval 30 year);

select year(now());
select dayname(now());
select dayname('2022-07-23 21:11:01');

alter table sales
add column flag date after order_id;

update sales
set flag  = now();

select * from sales;

alter table sales
modify column year datetime;

-- 2011-01-01
-- create 3 new columns year_new, month_new, day_new

alter table sales
add column year_new date after order_date_new;

alter table sales
add column month_new date after order_date_new;

alter table sales
add column day_new date after order_date_new;

select * from sales;

alter table sales
modify column year_new int;

alter table sales
modify column month_new int;

alter table sales
modify column day_new int;

update sales set year_new = year(order_date_new); 
update sales set month_new = month(order_date_new); 
update sales set day_new = day(order_date_new); 

select * from sales limit 5;

select year_new, avg(sales) from sales group by year_new;
select year_new, sum(sales) from sales group by year_new;
select year_new, min(sales) from sales group by year_new;
select year_new, max(sales) from sales group by year_new;
select year_new, sum(quantity) from sales group by year_new;

select ( (sales*discount )+ shipping_cost) as CTC from sales;
select order_id, discount ,	if (discount > 0, 'Yes' , 'No' ) as discount_flag from sales; 

alter table sales
add column discount_flag varchar(20) after discount;

select * from sales limit 5;

update sales
 set discount_flag = if (discount > 0, 'Yes' , 'No' );
 
select discount_flag, count(discount_flag) from sales group by discount_flag;
 
select count(*) from  sales where discount > 0 ;
select count(*) from  sales where discount = 0 ;



