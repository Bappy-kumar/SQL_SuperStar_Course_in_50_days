use retail_db;

select * from employees;

select * from customers;

select customer_state from customers;

select distinct customer_state from customers;

select count(distinct customer_state) as distinct_count from customers;

select count(distinct customer_city) as distinct_count from customers;

CREATE TABLE employees_new (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
department VARCHAR(255) NOT NULL,
role VARCHAR(255) NOT NULL
);

INSERT INTO employees_new (name, department, role) VALUES
('John Doe', 'Sales', 'Manager'),
('Jane Smith', 'Sales', 'Representative'),
('Alice Johnson', 'Marketing', 'Manager'),
('Chris Lee', 'IT', 'Developer'),
('Jack White', 'Sales', 'Representative'),
('Eve Davis', 'IT', 'Support'),
('Frank Brown', 'Marketing', 'Representative'),
('Grace Wilson', 'HR', 'Manager'),
('Henry Taylor', 'HR', 'Recruiter'),
('Chris Lee', 'IT', 'Developer');

set @@auto_increment_increment = 1;

select * from employees_new;

delete from employees_new;

drop table employees_new;

select distinct department, role from employees_new;

select count(distinct department, role) from employees_new;

select distinct id, name, department, role from employees_new;

create table students(
student_id INT AUTO_INCREMENT,
student_fname varchar(30) NOT NULL,
student_lname varchar(30) NOT NULL,
student_mname varchar(30),
student_email varchar(30) NOT NULL,
student_phone varchar(15) NOT NULL,
student_alternate_phone varchar(15),
years_of_exp INT NOT NULL,
student_company varchar(30),
batch_date varchar(30) NOT NULL,
source_of_joining varchar(30) NOT NULL,
location varchar(30) NOT NULL,
PRIMARY KEY(student_id),
UNIQUE KEY(student_email)
);

INSERT INTO students(student_fname, student_lname, student_email, student_phone,
years_of_exp, student_company, batch_date, source_of_joining, location)
VALUES ('Amit', 'Sharma', 'amit.sharma@gmail.com', '9191919191', 6, 'Walmart', '05-02-2021',
'LinkedIn', 'Bangalore');
INSERT INTO students(student_fname, student_lname, student_email, student_phone,
years_of_exp, student_company, batch_date, source_of_joining, location)
VALUES ('Priya', 'Rao', 'priya.rao@gmail.com', '9292929292', 3, 'Flipkart', '05-02-2021', 'LinkedIn',
'Hyderabad');
INSERT INTO students(student_fname, student_lname, student_email, student_phone,
years_of_exp, student_company, batch_date, source_of_joining, location)
VALUES ('Rahul', 'Verma', 'rahul.verma@gmail.com', '9393939393', 12, 'Google', '19-02-2021',
'Google', 'Bangalore');
INSERT INTO students(student_fname, student_lname, student_email, student_phone,
years_of_exp, student_company, batch_date, source_of_joining, location)
VALUES ('Anjali', 'Singh', 'anjali.singh@gmail.com', '9494949494', 8, 'Walmart', '19-02-2021', 'Quora',
'Chennai');
INSERT INTO students(student_fname, student_lname, student_email, student_phone,
years_of_exp, student_company, batch_date, source_of_joining, location)
VALUES ('Vikram', 'Patel', 'vikram.patel@gmail.com', '9294919191', 15, 'Microsoft', '05-02-2021',
'Friend', 'Pune'),
('Asha', 'Menon', 'asha.menon@gmail.com', '9394919191', 18, 'TCS', '05-02-2021', 'YouTube',
'Pune'),
('Kiran', 'Nair', 'kiran.nair@gmail.com', '9293519191', 20, 'Wipro', '19-02-2021', 'YouTube', 'Pune'),
('Ravi', 'Iyer', 'ravi.iyer@gmail.com', '9291975191', 14, 'Wipro', '19-02-2021', 'Google', 'Chennai');

select * from students;

-- 5 candidates with highest experience

select * from students order by years_of_exp desc limit 5;

-- second highest experience candidate
select * from students order by years_of_exp desc limit 1,1;


-- candidate with 4th highest and 5th highest experience
select * from students order by years_of_exp desc limit 3,2;

-- candidate wiht 3rd and 4th highest experience
select * from students order by years_of_exp desc limit 2,2;

-- 3 candidate with least experience
select * from students order by years_of_exp limit 3;

select * from students;

select distinct(location) from students;

select distinct(source_of_joining) from students;

select distinct(student_company) from students;

-- from which sources the 5 most experienced candidates got to know about me.

select source_of_joining 
from students 
order by years_of_exp 
desc limit 5;














