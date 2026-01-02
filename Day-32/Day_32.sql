use window_functions;

drop table employees;

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

select e.*, d.total_sal
from employees e
join
(
select department, sum(salary) as total_sal
from employees
group by department
) d 
on e.department = d.department;

select *,
sum(salary) over (partition by department) as total_sal
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
-- total salary for each city
select *,
sum(salary) over (partition by city) as total_sal
from employees;

select city, sum(salary)
from employees
group by city;

-- total salary for each department in each city
select *,
sum(salary) over (partition by city, department) as total_sal
from employees;



select *,
sum(salary) over (partition by  department) as total_sal,
min(salary) over (partition by  department) as min_sal,
max(salary) over (partition by  department) as max_sal,
avg(salary) over (partition by  department) as avg_sal,
count(salary) over (partition by  department) as department_count
from employees;


select *,
sum(salary) over () as total_sal,
min(salary) over () as min_sal,
max(salary) over () as max_sal,
avg(salary) over () as avg_sal,
count(salary) over () as department_count
from employees;
