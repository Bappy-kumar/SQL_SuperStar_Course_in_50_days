drop table customers;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

INSERT INTO customers (customer_id, first_name, last_name)
VALUES (1, 'John', 'Doe');

drop table orders;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT
);

select * from customers;

INSERT INTO orders (order_id, order_date, customer_id)
VALUES (1, '2023-07-01', 1);

INSERT INTO orders (order_id, order_date, customer_id)
VALUES (2, '2023-07-02', 2);

select * from orders;

drop table orders;

drop table customers;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
foreign key (customer_id) references customers (customer_id)
);

INSERT INTO customers (customer_id, first_name, last_name)
VALUES (1, 'John', 'Doe');

INSERT INTO orders (order_id, order_date, customer_id)
VALUES (1, '2023-07-01', 1);
-- the below insert is failed because there is no customers in the customer table with customer_id = 2
INSERT INTO orders (order_id, order_date, customer_id)
VALUES (2, '2023-07-02', 2);

-- foreign key with on delete cascade

drop table customers;
drop table orders;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
foreign key (customer_id) references customers (customer_id)
on delete cascade
);

INSERT INTO customers (customer_id, first_name, last_name)
VALUES (1, 'John', 'Doe');

INSERT INTO orders (order_id, order_date, customer_id)
VALUES (1, '2023-07-01', 1);

delete from customers where customer_id = 1;

select * from orders;


drop table orders;

drop table customers;


CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
foreign key (customer_id) references customers (customer_id)
);

INSERT INTO customers (customer_id, first_name, last_name)
VALUES (1, 'John', 'Doe');

INSERT INTO orders (order_id, order_date, customer_id)
VALUES (1, '2023-07-01', 1);

delete from customers where customer_id = 1;


-- FOREIGN KEY WITH ON UPDATE CASCADE

drop table orders;

drop table customers;


CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
foreign key (customer_id) references customers (customer_id)
on update cascade
);

INSERT INTO customers (customer_id, first_name, last_name)
VALUES (1, 'John', 'Doe');

INSERT INTO orders (order_id, order_date, customer_id)
VALUES (1, '2023-07-01', 1);

update customers set customer_id = 101 where customer_id = 1;

select * from customers;

select * from orders;

drop table students;

drop table courses;

drop table  enrollments;

CREATE TABLE students (
student_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

CREATE TABLE courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(100)
);

CREATE TABLE enrollments (
student_id INT,
course_id INT,
enrollment_date DATE,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

INSERT INTO students (student_id, first_name, last_name)
VALUES (1, 'Alice', 'Johnson');
INSERT INTO courses (course_id, course_name)
VALUES (101, 'Math 101');

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 101, '2023-09-01');

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 102, '2023-09-01');


-- SELF REFERENCING FOREIGN KEY

drop table employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
manager_id INT
);


INSERT INTO employees (employee_id, first_name, last_name, manager_id)
VALUES (1, 'John', 'Doe', NULL);

INSERT INTO employees (employee_id, first_name, last_name, manager_id)
VALUES (2, 'Jane', 'Smith', 1);

INSERT INTO employees (employee_id, first_name, last_name, manager_id)
VALUES (3, 'Alice', 'Johnson', 99);

select * from employees;

drop table employees;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
manager_id INT,
foreign key (manager_id) references employees (employee_id)
);

INSERT INTO employees (employee_id, first_name, last_name, manager_id)
VALUES (1, 'John', 'Doe', NULL);

INSERT INTO employees (employee_id, first_name, last_name, manager_id)
VALUES (2, 'Jane', 'Smith', 1);

INSERT INTO employees (employee_id, first_name, last_name, manager_id)
VALUES (3, 'Alice', 'Johnson', 99);



















