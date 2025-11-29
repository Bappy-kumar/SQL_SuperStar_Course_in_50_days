CREATE TABLE customers (
customer_id int,
customer_fname varchar(45) ,
customer_lname varchar(45),
customer_email varchar(45) UNIQUE KEY,
customer_phone varchar(45) UNIQUE KEY,
customer_street varchar(255) ,
customer_city varchar(45) ,
customer_state varchar(45) ,
customer_zipcode varchar(10)
);

INSERT INTO customers VALUES
(1,'Richard','Hernandez','richard@gmail.com','9191919191','6303 Heather
Plaza','Brownsville','TX','78521');

INSERT INTO customers VALUES
(2,'Mary','Barrett','mary@gmail.com','9191919191','9526 Noble Embers
Ridge','Littleton','CO','80126');

INSERT INTO customers VALUES
(2,'Mary','Barrett','mary@gmail.com',null,'9526 Noble Embers
Ridge','Littleton','CO','80126');

drop table customers;

CREATE TABLE customers (
customer_id int,
customer_fname varchar(45) ,
customer_lname varchar(45),
customer_email varchar(45) UNIQUE KEY,
customer_phone varchar(45) UNIQUE KEY,
customer_street varchar(255) ,
customer_city varchar(45) ,
customer_state varchar(45) ,
customer_zipcode varchar(10)
);

INSERT INTO customers VALUES
(1,'Richard','Hernandez','richard@gmail.com','9191919191','6303 Heather
Plaza','Brownsville','TX','78521');

INSERT INTO customers VALUES
(2,'Mary','Barrett','mary@gmail.com','9191919191','9526 Noble Embers
Ridge','Littleton','CO','80126');

delete from customers;

INSERT INTO customers VALUES
(1,'Richard','Hernandez','richard@gmail.com',null,'6303 Heather
Plaza','Brownsville','TX','78521');

INSERT INTO customers VALUES
(2,'Mary','Barrett','mary@gmail.com',null,'9526 Noble Embers
Ridge','Littleton','CO','80126');

delete from customers where customer_id = 2;

select * from customers;

INSERT INTO customers VALUES
(2,'Mary','Barrett','mary@gmail.com',null,'9526 Noble Embers
Ridge','Littleton','CO','80126');

select * from customers;


use retail_db;


drop table employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
hire_date DATE,
status VARCHAR(10)
);

INSERT INTO employees VALUES (1, 'Kapil', 'Raj', '2023-07-01');

INSERT INTO employees (employee_id, first_name, last_name, hire_date)
VALUES (1, 'Kapil', 'Raj', '2023-07-01');

select * from employees;

drop table employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
hire_date DATE,
status VARCHAR(10) default 'active'
);

INSERT INTO employees (employee_id, first_name, last_name, hire_date)
VALUES (1, 'Kapil', 'Raj', '2023-07-01');

select * from employees;

delete from employees;

select * from employees;

INSERT INTO employees
VALUES (2, 'rahul', 'sharma', '2023-07-02', default);

select * from employees;

INSERT INTO employees (employee_id, first_name, last_name, hire_date, status)
VALUES (3, 'Jane', 'Smith', '2023-07-01','inactive');

select * from employees;

INSERT INTO employees (employee_id, first_name, last_name, hire_date, status)
VALUES (4, 'Janey', 'Smith', '2023-07-01', null);

select * from employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
hire_date DATE,
status VARCHAR(10) not null default 'active'
);


drop table orders;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT,
order_date DATE DEFAULT (CURRENT_DATE)
);

INSERT INTO orders (order_id, customer_id, product_id, quantity)
VALUES (1, 101, 202, 3);

select * from orders;

INSERT INTO orders VALUES (2, 101, 202, 3, default);


select * from orders;

drop table customers;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
country VARCHAR(50) DEFAULT 'USA' );

INSERT INTO customers (customer_id, first_name, last_name)
VALUES (1, 'Alice', 'Smith');

select * from customers;

drop table employees;

CREATE TABLE employees (
employee_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
hire_date DATE
);

INSERT INTO employees (first_name, last_name, hire_date)
VALUES ('John', 'Doe', '2023-07-01');

select * from employees;

INSERT INTO employees (first_name, last_name, hire_date)
VALUES ('Jane', 'Smith', '2023-07-03');

select * from employees;

drop table employees;

CREATE TABLE employees (
employee_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
hire_date DATE
);

alter table employees auto_increment = 1000;

delete from employees where employee_id = 1000;

select * from employees;

SET @@auto_increment_increment = 2;

INSERT INTO employees (first_name, last_name, hire_date)
VALUES ('John', 'Doe', '2023-07-01');

select * from employees;

INSERT INTO employees (first_name, last_name, hire_date)
VALUES ('Jane', 'Smith', '2023-07-03');

select * from employees;







































