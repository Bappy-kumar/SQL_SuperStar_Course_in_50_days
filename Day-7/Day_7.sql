-- NOT NULL Constraint

drop table orders;

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
INSERT INTO orders VALUES
(1, 1, '2013-07-25', 11599, null, 957, 1, 299.98, 299.98);

drop table orders;
CREATE TABLE orders (
order_id int NOT NULL,
order_item_id int NOT NULL,
order_date date NOT NULL,
customer_id int NOT NULL,
order_status varchar(20) NOT NULL,
product_id int NOT NULL,
quantity int NOT NULL,
product_price float NOT NULL,
total_price float NOT NULL
);


INSERT INTO orders VALUES
(1, 1, '2013-07-25', 11599, null, 957, 1, 299.98, 299.98);


insert into orders (order_id) values (1);

CREATE TABLE customers (
customer_id int NOT NULL,
customer_fname varchar(45) NOT NULL,
customer_lname varchar(45) NOT NULL,
customer_email varchar(45) NOT NULL,
customer_phone varchar(45),
customer_street varchar(255),
customer_city varchar(45) NOT NULL,
customer_state varchar(45) NOT NULL,
customer_zipcode varchar(10)
);

-- PRIMARY KEY CONSTRAINT

drop table customers;

CREATE TABLE customers (
customer_id int,
customer_fname varchar(45) ,
customer_lname varchar(45),
customer_email varchar(45) ,
customer_phone varchar(45) ,
customer_street varchar(255) ,
customer_city varchar(45) ,
customer_state varchar(45) ,
customer_zipcode varchar(10)
);


INSERT INTO customers VALUES
(1,'Richard','Hernandez','richard@gmail.com',null,'6303 Heather Plaza','Brownsville','TX','78521');
INSERT INTO customers VALUES
(1,'Mary','Barrett','mary@gmail.com',null,'9526 Noble Embers Ridge','Littleton','CO','80126');
select * from customers;

drop table customers;

CREATE TABLE customers (
customer_id int,
customer_fname varchar(45) ,
customer_lname varchar(45),
customer_email varchar(45) ,
customer_phone varchar(45) ,
customer_street varchar(255) ,
customer_city varchar(45) ,
customer_state varchar(45) ,
customer_zipcode varchar(10)
);

INSERT INTO customers VALUES
(1,'Richard','Hernandez','richard@gmail.com',null,'6303 Heather Plaza','Brownsville','TX','78521');
INSERT INTO customers VALUES
(1,'Mary','Barrett','mary@gmail.com',null,'9526 Noble Embers Ridge','Littleton','CO','80126');
select * from customers;

alter table customers 
add primary key (customer_id);

delete from customers where customer_fname = 'Mary';

alter table customers 
add primary key (customer_id);

INSERT INTO customers VALUES
(1,'Mary','Barrett','mary@gmail.com',null,'9526 Noble Embers Ridge','Littleton','CO','80126');
select * from customers;

select * from customers;

use information_schema;

show tables;


select * from table_constraints where table_name = 'customers';

use retail_db;

show create table customers;

INSERT INTO customers VALUES
(null,'Mary','Barrett','mary@gmail.com',null,'9526 Noble Embers Ridge','Littleton',
'CO','80126');

alter table customers drop primary key;

drop table customers;

CREATE TABLE customers (
customer_id int primary key,
customer_fname varchar(45) ,
customer_lname varchar(45),
customer_email varchar(45) ,
customer_phone varchar(45) ,
customer_street varchar(255) ,
customer_city varchar(45) ,
customer_state varchar(45) ,
customer_zipcode varchar(10)
);

drop table customers;

CREATE TABLE customers (
customer_id int,
customer_fname varchar(45) ,
customer_lname varchar(45),
customer_email varchar(45) ,
customer_phone varchar(45) ,
customer_street varchar(255) ,
customer_city varchar(45) ,
customer_state varchar(45) ,
customer_zipcode varchar(10),
primary key (customer_id)
);

drop table customers;

create table order_items (
order_id int primary key,
product_id int primary key,
quantity int
);

CREATE TABLE order_items (
order_id INT,
product_id INT,
quantity INT,
PRIMARY KEY (order_id, product_id)
);

INSERT INTO order_items VALUES (1,101,2);
INSERT INTO order_items VALUES (1,102,3);
INSERT INTO order_items VALUES (1,102,5);












