use window_functions;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10, 2),
hire_date DATE
);
INSERT INTO employees (employee_id, employee_name, department, salary, hire_date)
VALUES
(1, 'Amit', 'HR', 50000, '2022-01-15'),
(2, 'Neha', 'HR', 55000, '2023-03-10'),
(3, 'Suresh', 'HR', 48000, '2021-11-20'),
(4, 'Rohit', 'HR', 52000, '2022-09-05'),
(5, 'Raj', 'Finance', 60000, '2021-07-23'),
(6, 'Ravi', 'Finance', 62000, '2022-09-01'),
(7, 'Kiran', 'Finance', 58000, '2021-02-14'),
(8, 'Sunita', 'Finance', 61000, '2023-01-11'),
(9, 'Priya', 'IT', 70000, '2020-12-02'),
(10, 'Anjali', 'IT', 67000, '2021-11-19'),
(11, 'Vikas', 'IT', 69000, '2022-05-20'),
(12, 'Sanjay', 'IT', 72000, '2023-04-30'),
(13, 'Meena', 'IT', 68000, '2021-03-15');

select * from employees;

select employee_id,
employee_name,
department,
salary,
hire_date,
row_number() over (partition by department order by salary desc) as row_num
from employees;

select employee_id,
employee_name,
department,
salary,
hire_date,
row_number() over (partition by department order by salary) as row_num
from employees;

select employee_id,
employee_name,
department,
salary,
hire_date,
row_number() over (order by salary desc) as row_num
from employees;

select employee_id,
employee_name,
department,
salary,
hire_date,
row_number() over () as row_num
from employees;

select employee_id,
employee_name,
department,
salary,
hire_date,
row_number() over (partition by department) as row_num
from employees;

drop table employees;

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
(6, 'Ravi', 'Finance', 'Delhi', 62000, '2022-09-01'),
(7, 'Kiran', 'Finance', 'Mumbai', 58000, '2021-02-14'),
(8, 'Sunita', 'Finance', 'Delhi', 61000, '2023-01-11'),
(9, 'Priya', 'IT', 'Mumbai', 70000, '2020-12-02'),
(10, 'Anjali', 'IT', 'Delhi', 67000, '2021-11-19'),
(11, 'Vikas', 'IT', 'Mumbai', 69000, '2022-05-20'),
(12, 'Sanjay', 'IT', 'Delhi', 72000, '2023-04-30'),
(13, 'Meena', 'IT', 'Delhi', 68000, '2021-03-15');

select * from employees;

select employee_id,
employee_name,
department,
city,
salary,
hire_date,
row_number() over (partition by department, city order by salary desc) as row_num
from employees;

delete from employees;


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

select employee_id,
employee_name,
department,
city,
salary,
hire_date,
row_number() over (partition by department, city order by salary desc) as row_num
from employees;

select employee_id,
employee_name,
department,
city,
salary,
hire_date,
row_number() over (partition by department, city order by salary desc, hire_date) as row_num
from employees;

select employee_id,
employee_name,
department,
city,
salary,
hire_date,
row_number() over (order by salary desc, hire_date) as row_num
from employees;

select 
employee_id,
employee_name,
department,
city,
salary,
hire_date,
row_number() over (partition by department order by salary desc, hire_date) as row_num
from employees
where row_num <=2;

select * from (select 
employee_id,
employee_name,
department,
city,
salary,
hire_date,
row_number() over (partition by department order by salary desc, hire_date) as row_num
from employees) e
where row_num <=2;

select * from (select 
employee_id,
employee_name,
department,
city,
salary,
hire_date,
row_number() over (partition by department order by salary desc, hire_date) as row_num
from employees) e
where row_num <=3;

select * from (select 
employee_id,
employee_name,
department,
city,
salary,
hire_date,
row_number() over (partition by department order by salary desc, hire_date) as row_num
from employees) e
where row_num <=1;

with emp_cte as (select 
employee_id,
employee_name,
department,
city,
salary,
hire_date,
row_number() over (partition by department order by salary desc, hire_date) as row_num
from employees)
select * from emp_cte where row_num <= 2;












