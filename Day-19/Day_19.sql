-- date related functions
use retail_db;

select current_date();

select current_time();

select current_timestamp();


CREATE TABLE orders1 (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT,
order_date DATE,
total_amount DECIMAL(10, 2)
);

INSERT INTO orders1 (customer_id, product_id, quantity, order_date, total_amount)
VALUES
(1, 101, 2, CURRENT_DATE, 199.98),
(2, 102, 1, CURRENT_DATE, 99.99),
(3, 103, 5, CURRENT_DATE, 499.95),
(4, 104, 3, CURRENT_DATE, 299.97),
(5, 105, 4, CURRENT_DATE, 399.96);


select * from orders1;

select date('2025-12-10 17:56:50') as date_only;

select time('2025-12-10 17:56:50') as time_only;

select extract(year from '2025-12-10 17:56:50') as year_only;

select extract(month from '2025-12-10 17:56:50') as month_only;

select extract(day from '2025-12-10 17:56:50') as day_only;

select * from sales;

select id, product, category, amount,
extract(year from sale_date) as sale_year
from sales;

select id, product, category, amount,
extract(month from sale_date) as sale_month
from sales;

select
concat(extract(year from sale_date), '-', extract(month from sale_date)) 
as yearmonth, sum(amount) as total_sales
from sales
group by yearmonth;

select
extract(year_month from sale_date) 
as yearmonth, sum(amount) as total_sales
from sales
group by yearmonth;

select extract(week from '2025-12-10'); 

select day('2025-12-10'); 

select month('2025-12-10'); 

select monthname('2025-12-10 09:34:21'); 

-- Date_add / Date_Sub

select date_add(current_date, interval 10 day) as newdate;

select date_add(current_date, interval 97 day) as newdate;

select date_sub(current_date, interval 43 day) as newdate;

-- datediff

select datediff('2024-08-05','2024-06-13');

select datediff(current_date, '2025-01-01');

select datediff(current_date, '2002-01-01');

-- date_format

select date_format('2017-06-15','%Y');

select date_format('2017-06-15','%y');

select date_format('2017-06-15','%m');

select date_format('2017-06-15','%M');

select date_format('2017-06-15','%d');

select date_format('2017-06-15','%D');

select date_format('2017-06-15','%M %D %Y');

select date_format('2017-06-15','%D %M %Y');

-- Unix Time - Epoch Time
-- Number of seconds since 1st Jan 1970

select unix_timestamp();

select from_unixtime(1765374636);

select unix_timestamp('2002-01-01');

-- Numeric Functions

select abs(-10);

select ceil(3.2);

select ceil(-3.2);

select ceil(5.1);

select floor(5.1);

select floor(5.9);

select round(4.567, 2);

select truncate(4.567, 2);

select mod(10,3);

select power(2,3);

select sqrt(16);

select sign(-5);

select sign(5);

select sign(0);

select rand();

-- Other functions

-- case 

select * from employees;

/* < 45000 then low
45000 and 55000 then medium
else high */

select *,
case
    when salary < 45000 then 'low'
    when salary between 45000 and 55000 then 'medium'
    else 'high'
end as salary_band
  from employees;   
  
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

select *,
case
    when years_of_exp < 3 then 'low experience'
    when years_of_exp < 8 then 'medium experience'
	when years_of_exp < 15 then 'high experience'
    else 'cant say'
end as experience_band
  from students;
  
-- cast function
-- casting from one datatype to another

show create table employees;

CREATE TABLE `employees101` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `department_id` int DEFAULT NULL,
  `salary` varchar(50) DEFAULT NULL,
  `hire_date` varchar(50) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
);

insert into employees101
select * from employees;

select * from employees101;

describe employees101;

select year(cast(hire_date as date))
from employees101;

select cast(salary as decimal(10,2)) * 1.1
from employees101;

-- coalesce
/* its a very useful function when you need to handle null values.
 ensures that you have a default or fallback value. */

CREATE TABLE products (
product_name VARCHAR(50),
discount_price DECIMAL(10, 2),
regular_price DECIMAL(10, 2)
);

INSERT INTO products (product_name, discount_price, regular_price) VALUES
('Laptop', NULL, 1200.00),
('Smartphone', 800.00, 1000.00),
('Tablet', NULL, 300.00);

select * from products;

select product_name,
coalesce(discount_price, regular_price) as display_price
from products; 


CREATE TABLE orders (
order_id INT,
billing_address VARCHAR(100),
shipping_address VARCHAR(100),
customer_address VARCHAR(100)
);
INSERT INTO orders (order_id, billing_address, shipping_address, customer_address) VALUES
(1, '123 Main St', NULL, '789 Oak Ave'),
(2, NULL, '456 Maple Rd', '101 Pine St'),
(3, NULL, NULL, '303 Elm St');

select * from orders;

select order_id, 
coalesce(billing_address, shipping_address, customer_address) as
preferred_address
from orders;

CREATE TABLE sales_new (
sale_id INT,
online_sales DECIMAL(10, 2),
store_sales DECIMAL(10, 2)
);

INSERT INTO sales_new (sale_id, online_sales, store_sales) VALUES
(1, 1500.50, NULL),
(2, NULL, 2500.75),
(3, 1000.25, 500.00);

select * from sales_new;

select 5+null;

select sale_id, 
online_sales + store_sales as total_sales
from sales_new;

select sale_id, 
coalesce(online_sales,0) + coalesce(store_sales,0) as total_sales
from sales_new;









































