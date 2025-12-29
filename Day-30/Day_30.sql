
use window_functions;

drop table employees;

select * from employees;

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
(1, 'Amit', 'HR', 'Mumbai', 550000, '2022-01-15'),
(2, 'Neha', 'HR', 'Mumbai', 55000, '2023-03-10'),
(3, 'Suresh', 'HR', 'Delhi', 48000, '2021-11-20'),
(4, 'Rohit', 'HR', 'Delhi', 48000, '2022-09-05'),
(5, 'Raj', 'Finance', 'Mumbai', 60000, '2021-07-23'),
(6, 'Ravi', 'Finance', 'Delhi', 62000, '2022-09-01'),
(7, 'Kiran', 'Finance', 'Mumbai', 58000, '2021-02-14'),
(8, 'Sunita', 'Finance', 'Delhi', 61000, '2023-01-11'),
(9, 'Priya', 'IT', 'Mumbai', 70000, '2020-12-02'),
(10, 'Anjali', 'IT', 'Delhi', 67000, '2021-11-19'),
(11, 'Vikas', 'IT', 'Mumbai', 69000, '2022-05-20'),
(12, 'Sanjay', 'IT', 'Delhi', 70000, '2023-04-30'),
(13, 'Meena', 'IT', 'Delhi', 70000, '2021-03-15');


-- ROW_NUMBER
-- RANK
-- DENSE_RANK

select count(distinct salary) from employees;

select *,
row_number() over (order by hire_date) as row_num,
rank() over (order by hire_date) as rnk,
dense_rank() over (order by hire_date) as dense_rnk
from employees;

select *,
row_number() over (order by salary desc) as row_num,
rank() over (order by salary desc) as rnk,
dense_rank() over (order by salary desc) as dense_rnk
from employees;


select * from (select *,
row_number() over (order by salary desc) as row_num,
rank() over (order by salary desc) as rnk,
dense_rank() over (order by salary desc) as dense_rnk
from employees) temp where rnk <= 5;

select * from (select *,
row_number() over (order by salary desc) as row_num,
rank() over (order by salary desc) as rnk,
dense_rank() over (order by salary desc) as dense_rnk
from employees) temp where dense_rnk <= 5;

