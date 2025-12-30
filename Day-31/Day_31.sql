use window_functions;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
department VARCHAR(50),
city VARCHAR(50),
salary DECIMAL(10, 2),
hire_date DATE
);

INSERT INTO employees (employee_id, employee_name, department, city, salary, hire_date)
VALUES
(1, 'Amit', 'HR', 'Mumbai', 50000, '2022-01-15'),
(2, 'Neha', 'HR', 'Mumbai', 55000, '2023-03-10'),
(3, 'Suresh', 'HR', 'Delhi', 48000, '2021-11-20'),
(4, 'Rohit', 'HR', 'Delhi', 52000, '2022-09-05'),
(5, 'Raj', 'Finance', 'Mumbai', 60000, '2021-07-23'),
(6, 'Ravi', 'Finance', 'Delhi', 60000, '2022-09-01'),
(7, 'Kiran', 'Finance', 'Mumbai', 58000, '2021-02-14'),
(8, 'Sunita', 'Finance', 'Delhi', 60000, '2023-01-11'),
(9, 'Priya', 'IT', 'Mumbai', 70000, '2020-12-02'),
(10, 'Anjali', 'IT', 'Delhi', 68000, '2021-11-19'),
(11, 'Vikas', 'IT', 'Mumbai', 68000, '2022-05-20'),
(12, 'Sanjay', 'IT', 'Delhi', 72000, '2023-04-30'),
(13, 'Meena', 'IT', 'Delhi', 68000, '2021-03-15');

select * from employees;
drop table employees;

select *, 
lead(salary) over (order by salary desc) as next_sal,
lag(salary) over (order by salary desc) as prev_sal
from employees;


select *, 
lead(salary,1) over (order by salary desc) as next_sal,
lag(salary,1) over (order by salary desc) as prev_sal
from employees;

select *, 
lead(salary,2) over (order by salary desc) as next_sal,
lag(salary,2) over (order by salary desc) as prev_sal
from employees;

select *, 
lead(salary,3) over (order by salary desc) as next_sal,
lag(salary,3) over (order by salary desc) as prev_sal
from employees;

select *, 
lead(salary, 3, salary) over (order by salary desc) as next_sal,
lag(salary,3, salary) over (order by salary desc) as prev_sal
from employees;

select *, 
lead(salary, 3, 0) over (order by salary desc) as next_sal,
lag(salary,3, 0) over (order by salary desc) as prev_sal
from employees;

CREATE TABLE sales (
sale_date DATE,
product_id INT,
product_name VARCHAR(100),
units_sold INT
);
INSERT INTO sales (sale_date, product_id, product_name, units_sold)
VALUES
('2024-08-15', 1, 'Laptop', 4),
('2024-08-16', 1, 'Laptop', 6),
('2024-08-17', 1, 'Laptop', 5),
('2024-08-18', 1, 'Laptop', 7),
('2024-08-19', 1, 'Laptop', 4),
('2024-08-20', 1, 'Laptop', 5),
('2024-08-21', 1, 'Laptop', 8),
('2024-08-22', 1, 'Laptop', 3),
('2024-08-23', 1, 'Laptop', 7),
('2024-08-24', 1, 'Laptop', 6),
('2024-08-25', 1, 'Laptop', 9),
('2024-08-26', 1, 'Laptop', 7),
('2024-08-15', 2, 'Smartphone', 15),
('2024-08-16', 2, 'Smartphone', 18),
('2024-08-17', 2, 'Smartphone', 12),
('2024-08-18', 2, 'Smartphone', 20),
('2024-08-19', 2, 'Smartphone', 17),
('2024-08-20', 2, 'Smartphone', 14),
('2024-08-21', 2, 'Smartphone', 19),
('2024-08-22', 2, 'Smartphone', 13),
('2024-08-23', 2, 'Smartphone', 21),
('2024-08-24', 2, 'Smartphone', 16),
('2024-08-25', 2, 'Smartphone', 18),
('2024-08-26', 2, 'Smartphone', 20),
('2024-08-15', 3, 'Tablet', 8),
('2024-08-16', 3, 'Tablet', 10),
('2024-08-17', 3, 'Tablet', 7),
('2024-08-18', 3, 'Tablet', 12),
('2024-08-19', 3, 'Tablet', 9),
('2024-08-20', 3, 'Tablet', 8),
('2024-08-21', 3, 'Tablet', 11),
('2024-08-22', 3, 'Tablet', 6),
('2024-08-23', 3, 'Tablet', 9),
('2024-08-24', 3, 'Tablet', 10),
('2024-08-25', 3, 'Tablet', 13),
('2024-08-26', 3, 'Tablet', 12);

select * from sales;

select sale_date,
product_id,
product_name,
units_sold,
lag(units_sold,1) over (partition by product_id order by sale_date)
as previous_day_sales,
lead(units_sold,1) over (partition by product_id order by sale_date)
as next_day_sales
from sales;

select sale_date,
product_id,
product_name,
units_sold,
lag(units_sold,1,0) over (partition by product_id order by sale_date)
as previous_day_sales,
lead(units_sold,1,0) over (partition by product_id order by sale_date)
as next_day_sales
from sales;

-- lead with order by asc

-- lag with order by desc
select sale_date,
product_id,
product_name,
units_sold,
lag(units_sold,1,0) over (partition by product_id order by sale_date)
as lag_result,
lead(units_sold,1,0) over (partition by product_id order by sale_date desc)
as lead_result
from sales;

CREATE TABLE social_media_followers (
user_id INT,
user_name VARCHAR(100),
month DATE,
linkedin_followers INT,
twitter_followers INT,
instagram_followers INT,
youtube_followers INT
);
INSERT INTO social_media_followers (user_id, user_name, month, linkedin_followers,
twitter_followers, instagram_followers, youtube_followers) VALUES
(1, 'Rajesh', '2023-08-01', 500, 1200, 800, 900),
(1, 'Rajesh', '2023-09-01', 550, 1300, 850, 950),
(1, 'Rajesh', '2023-10-01', 600, 1400, 900, 1000),
(1, 'Rajesh', '2023-11-01', 660, 1500, 950, 1050),
(1, 'Rajesh', '2023-12-01', 720, 1600, 1000, 1100),
(1, 'Rajesh', '2024-01-01', 790, 1700, 1060, 1160),
(1, 'Rajesh', '2024-02-01', 860, 1800, 1120, 1220),
(1, 'Rajesh', '2024-03-01', 940, 1900, 1190, 1290),
(1, 'Rajesh', '2024-04-01', 1020, 2000, 1260, 1360),
(1, 'Rajesh', '2024-05-01', 1100, 2100, 1330, 1430),
(1, 'Rajesh', '2024-06-01', 1190, 2200, 1410, 1510),
(1, 'Rajesh', '2024-07-01', 1280, 2300, 1490, 1590),
(1, 'Rajesh', '2024-08-01', 1380, 2400, 1580, 1680),
(2, 'Anjali', '2023-08-01', 800, 500, 600, 700),
(2, 'Anjali', '2023-09-01', 820, 510, 620, 710),
(2, 'Anjali', '2023-10-01', 840, 520, 640, 720),
(2, 'Anjali', '2023-11-01', 860, 530, 660, 730),
(2, 'Anjali', '2023-12-01', 880, 540, 680, 740),
(2, 'Anjali', '2024-01-01', 900, 550, 700, 750),
(2, 'Anjali', '2024-02-01', 920, 560, 720, 760),
(2, 'Anjali', '2024-03-01', 940, 570, 740, 770),
(2, 'Anjali', '2024-04-01', 960, 580, 760, 780),
(2, 'Anjali', '2024-05-01', 980, 590, 780, 790),
(2, 'Anjali', '2024-06-01', 1000, 600, 800, 800),
(2, 'Anjali', '2024-07-01', 1020, 610, 820, 810),
(2, 'Anjali', '2024-08-01', 1040, 620, 840, 820);


select * from social_media_followers;

-- calculate % of total follower gains for each user month on month

select user_id,
user_name,
month,
linkedin_followers + twitter_followers + instagram_followers + youtube_followers
as total_followers
from social_media_followers;

select *,
lead(total_followers,1) over (partition by user_id order by month) as next_mnth,
lag(total_followers,1) over (partition by user_id order by month) as prev_mnth
from
(select user_id,
user_name,
month,
linkedin_followers + twitter_followers + instagram_followers + youtube_followers
as total_followers
from social_media_followers) temp;

with cte1 as (select user_id,
user_name,
month,
linkedin_followers + twitter_followers + instagram_followers + youtube_followers
as total_followers
from social_media_followers), 
cte2 as (
select *,
lead(total_followers,1) over (partition by user_id order by month) as next_mnth,
lag(total_followers,1) over (partition by user_id order by month) as prev_mnth
from cte1)
select * from cte2;

with cte1 as (select user_id,
user_name,
month,
linkedin_followers + twitter_followers + instagram_followers + youtube_followers
as total_followers
from social_media_followers), 
cte2 as (
select *,
lead(total_followers,1) over (partition by user_id order by month) as next_mnth,
lag(total_followers,1) over (partition by user_id order by month) as prev_mnth
from cte1)
select *,
round((total_followers - prev_mnth) * 100 / prev_mnth, 2) as gain_percent
from cte2;


with cte1 as (select user_id,
user_name,
month,
linkedin_followers + twitter_followers + instagram_followers + youtube_followers
as total_followers
from social_media_followers), 
cte2 as (
select *,
lead(total_followers,1, total_followers) over (partition by user_id order by month) as next_mnth,
lag(total_followers,1, total_followers) over (partition by user_id order by month) as prev_mnth
from cte1)
select *,
round((total_followers - prev_mnth) * 100 / prev_mnth, 2) as gain_percent
from cte2;



