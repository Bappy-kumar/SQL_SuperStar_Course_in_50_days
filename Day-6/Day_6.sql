-- SQL Constraints
-- week 2 (session 2)
-- EMPLOYEE TABLE
-- AGE (INT)

-- specify the rules for data in a table
-- ensures the accuracy and reliability of data
-- when to specify these constraints
-- table creation time (create table)

-- later alter the table definition and add a constraint

drop database retail_db;

create database retail_db;

use retail_db;

show tables;

-- CHECK CONSTRAINT
-- =========================

CREATE TABLE orders (
order_id int,
order_item_id int,
order_date date,
customer_id int,
order_status varchar(20),
product_id int,
quantity int,
product_price float,
total_price float
);

INSERT INTO orders VALUES (1, 1, '2013-07-25', 11599, 'CLOSE', 957, 1,
299.98, 299.98);

select * from orders;

ALTER TABLE orders
ADD CHECK (order_status in ('CLOSED',
'PENDING_PAYMENT',
'COMPLETE',
'PROCESSING',
'ON_HOLD',
'SUSPECTED_FRAUD',
'PENDING'));

delete from orders;

ALTER TABLE orders
ADD CHECK (order_status in ('CLOSED',
'PENDING_PAYMENT',
'COMPLETE',
'PROCESSING',
'ON_HOLD',
'SUSPECTED_FRAUD',
'PENDING'));


INSERT INTO orders VALUES (1, 1, '2013-07-25', 11599, 'CLOSE', 957, 1,
299.98, 299.98);


show create table orders;

alter table orders
drop check orders_chk_1;

ALTER TABLE orders
ADD constraint Check_OrderStatus CHECK (order_status in ('CLOSED',
'PENDING_PAYMENT',
'COMPLETE',
'PROCESSING',
'ON_HOLD',
'SUSPECTED_FRAUD',
'PENDING'));


show create table orders;

use information_schema;

show tables;

select * from check_constraints;

use retail_db;

drop table orders;

CREATE TABLE orders (
order_id int,
order_item_id int,
order_date date,
customer_id int,
order_status varchar(20) constraint CHK_OrderStatus CHECK  (order_status in
('CLOSED','PENDING_PAYMENT','COMPLETE','PROCESSING','ON_HOLD',
'SUSPECTED_FRAUD','PENDING')) ,
product_id int,
quantity int,
product_price float,
total_price float
);

drop table orders;

CREATE TABLE orders (
order_id int,
order_item_id int,
order_date date,
customer_id int,
order_status varchar(20) CHECK (order_status in
('CLOSED','PENDING_PAYMENT','COMPLETE','PROCESSING','ON_HOLD',
'SUSPECTED_FRAUD','PENDING')) ,
product_id int,
quantity int CHECK (quantity <= 50),
product_price float,
total_price float
);

INSERT INTO orders VALUES (1, 1, '2013-07-25', 11599, 'CLOSED', 957, 52,
299.98, null);

INSERT INTO orders VALUES (1, 1, '2013-07-25', 11599, 'CLOSED', 957, 49,
299.98, null);

select * from orders;

CREATE TABLE persons (
person_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
age INT CHECK (age > 0)
);

INSERT INTO persons (person_id, first_name, last_name, age)
VALUES (1, 'Raj', 'Sharma', -5);

drop table persons;

CREATE TABLE persons (
person_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
age INT,
CHECK (age > 0)
);

INSERT INTO persons (person_id, first_name, last_name, age)
VALUES (1, 'Raj', 'Sharma', -5);

CREATE TABLE users (
user_id INT,
username VARCHAR(50),
email VARCHAR(100),
CHECK (email LIKE '%@%.%')
);

INSERT INTO users (user_id, username, email)
VALUES (1, 'sumitm', 'sumit@trendytech.in');

INSERT INTO users (user_id, username, email)
VALUES (2, 'kapilm', 'kapil.trendytech.in');

CREATE TABLE projects (
project_id INT,
project_name VARCHAR(100),
start_date DATE,
end_date DATE,
CHECK (end_date > start_date)
);

INSERT INTO projects (project_id, project_name, start_date, end_date)
VALUES (1, 'Project Alpha', '2023-01-01', '2023-12-31');

INSERT INTO projects (project_id, project_name, start_date, end_date)
VALUES (1, 'Project Beta', '2023-01-01', '2022-12-31');












