drop database retail_db;

create database retail_db;

use retail_db;

CREATE TABLE retail_db.customers (
customer_id int,
customer_fname varchar(45) ,
customer_lname varchar(45),
customer_email varchar(45) ,
customer_phone varchar(45) ,
customer_street varchar(255) ,
customer_city varchar(45) ,
customer_state varchar(45) ,
customer_zipcode varchar(45)
);

select * from customers;

select customer_fname, customer_city, customer_state from customers;


select customer_fname, customer_city, customer_state from customers
where customer_state = 'CA';

select * from customers
where customer_state = 'CA';

create table employees (
 employee_id int auto_increment primary key,
 first_name varchar(50) not null,
 last_name varchar(50) not null,
 department_id int,
 salary decimal(10, 2),
 hire_date date,
 manager_id int,
 email varchar(100),
 phone_number varchar(20),
 job_title varchar(50)
);

INSERT INTO employees (
first_name, last_name, department_id, salary, hire_date, manager_id, email, phone_number,
job_title
) VALUES
('John', 'Doe', 1, 60000, '2018-01-15', NULL, 'john.doe@example.com', '555-1234', 'Manager'),
('Jane', 'Smith', 2, 50000, '2019-03-22', 1, 'jane.smith@example.com', '555-5678', 'Developer'),
('Michael', 'Johnson', 1, 45000, '2020-06-11', 1, 'michael.johnson@example.com', '555-8765',
'Analyst'),
('Emily', 'Davis', 3, 55000, '2017-09-30', NULL, 'emily.davis@example.com', '555-3456', 'Sales'),
('Daniel', 'Wilson', 3, 40000, '2018-11-10', 4, 'daniel.wilson@example.com', '555-6543', 'Sales
Representative'),
('Sophia', 'Martinez', 2, 47000, '2021-01-25', 2, 'sophia.martinez@example.com', '555-7898',
'Developer'),
('James', 'Brown', 1, 38000, '2020-04-18', 1, 'james.brown@example.com', '555-1239', 'Support'),
('Olivia', 'Jones', 2, 62000, '2019-07-21', 1, 'olivia.jones@example.com', '555-4321', 'Lead
Developer'),
('William', 'Garcia', 3, 52000, '2018-12-01', NULL, 'william.garcia@example.com', '555-5670', 'Sales
Manager'),
('Isabella', 'Miller', 2, 48000, '2020-08-15', 2, 'isabella.miller@example.com', '555-6789', 'QA
Engineer'),
('Alex', 'White', 1, 61000, '2020-11-23', 1, 'alex.white@example.com', '555-2345', 'HR Specialist'),
('Liam', 'Lee', 2, 55000, '2017-05-19', 8, 'liam.lee@example.com', '555-3457', 'Developer'),
('Emma', 'Clark', 3, 58000, '2021-03-14', 4, 'emma.clark@example.com', '555-4568', 'Sales
Executive'),
('Noah', 'Lopez', 1, 43000, '2019-12-10', 1, 'noah.lopez@example.com', '555-5679', 'HR Assistant'),
('Ava', 'Gonzalez', 2, 49000, '2018-07-25', 2, 'ava.gonzalez@example.com', '555-6780', 'QA
Analyst'),
('Mason', 'Harris', 3, 61000, '2016-08-29', 4, 'mason.harris@example.com', '555-7891', 'Senior
Sales Manager'),
('Ethan', 'Walker', 1, 42000, '2021-02-10', 1, 'ethan.walker@example.com', '555-8901', 'HR
Coordinator'),
('Mia', 'Young', 2, 57000, '2018-09-15', 8, 'mia.young@example.com', '555-9012', 'Developer'),
('Logan', 'Hall', 3, 45000, '2020-05-17', 4, 'logan.hall@example.com', '555-1230', 'Sales Associate'),
('Charlotte', 'Allen', 2, 53000, '2019-01-20', 8, 'charlotte.allen@example.com', '555-2341', 'UI/UX
Designer'),
('Benjamin', 'King', 1, 47000, '2017-11-22', 1, 'benjamin.king@example.com', '555-3452', 'HR
Manager'),
('Amelia', 'Wright', 2, 50000, '2020-06-13', 8, 'amelia.wright@example.com', '555-4563', 'Software
Tester'),
('Lucas', 'Scott', 3, 49000, '2016-10-30', 4, 'lucas.scott@example.com', '555-5674', 'Sales
Coordinator'),
('Ella', 'Green', 1, 53000, '2018-02-14', 1, 'ella.green@example.com', '555-6785', 'HR Specialist'),
('Aiden', 'Adams', 2, 51000, '2019-08-26', 8, 'aiden.adams@example.com', '555-7896', 'Backend
Developer'),
('Grace', 'Baker', 3, 52000, '2021-04-21', 4, 'grace.baker@example.com', '555-8907', 'Sales
Analyst'),
('Oliver', 'Nelson', 1, 45000, '2020-01-19', 1, 'oliver.nelson@example.com', '555-9018', 'HR
Associate'),
('Avery', 'Carter', 2, 60000, '2017-12-11', 8, 'avery.carter@example.com', '555-1239', 'Front-End
Developer'),
('Matthew', 'Mitchell', 3, 48000, '2018-06-07', 4, 'matthew.mitchell@example.com', '555-2340',
'Sales Representative'),
('Harper', 'Perez', 2, 56000, '2019-03-28', 8, 'harper.perez@example.com', '555-3451', 'Quality
Assurance');

select * from employees;

select * from employees limit 5;

select count(*) from employees;

select * from employees where first_name = 'John';

select * from employees where salary > 50000;

select * from employees where salary > 80000;

select * from employees where salary > 60000;

select count(*) from employees where salary > 60000;

select * from employees where first_name > 'John';

select * from employees where department_id = 3;

select * from employees where hire_date > '2019-12-31';

select * from employees where department_id = 1 and salary > 50000;

select * from employees where department_id = 1 or department_id = 2;

select * from employees where department_id = 1 or department_id = 2 and 
job_title = 'Manager';

select * from employees where department_id = 2 and job_title = 'Manager';

select * from employees where department_id = 1;

select * from employees where (department_id = 1 or department_id = 2) and 
job_title = 'Manager';

select * from employees where department_id = 3 and salary >50000 and hire_date > '2019-12-31';


select * from employees where department_id = 3 and salary <50000 and hire_date > '2019-12-31';

select * from employees where salary between 30000 and 50000;

select * from employees where hire_date
between '2020-01-01' and '2021-12-31';

select * from employees where department_id = 1
or department_id = 2
or department_id = 3;

select * from employees where department_id = 1
or department_id = 2
or department_id = 4;

select * from employees where department_id in (1, 2, 4);

select * from employees where department_id not in (1, 2, 4);

select * from employees where not (department_id = 1 or
department_id = 2 or department_id = 4);


select * from employees where job_title not in ('manager', 'sales manager');

select * from employees where manager_id  is null;

select * from employees where manager_id  is not null;



















