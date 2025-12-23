-- Window Functions
create database window_Functions;

use window_Functions;

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

-- find max salary for each department
select department, max(salary) as max_sal
from
employees 
group by department;

-- employee_id, employee_name
select department, max(salary) as max_sal, employee_id, employee_name
from
employees 
group by department;


select * from employees;

select department, max(salary) as max_sal
from
employees 
group by department;


select e.employee_id,
e.employee_name,
e.department,
e.salary,
e.hire_date
 from employees e
join (select department, max(salary) as max_sal
from employees
group by department) d
on e.department = d.department
and e.salary = d.max_sal;

-- I want top 2 employees from each department

select * from employees order by salary desc limit 2;














