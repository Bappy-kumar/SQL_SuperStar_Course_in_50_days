drop table students;

select * from students;

select distinct 
source_of_joining from
students where location in ('Banglore', 'Hyderabad', 'Pune')
order by years_of_exp desc
limit 5;

select student_fname 
from students 
where years_of_exp > 15;


select * from employees;

-- from -> where -> select

select first_name, salary * 1.1 as revised_salary 
from employees 
where revised_salary > 60000;

select first_name, salary * 1.1 as revised_salary
from employees 
where job_title != 'Manager'
order by revised_salary desc;

select first_name, salary * 1.1 as revised_salary
from employees 
where job_title != 'Manager'
order by revised_salary desc
limit 5;

select first_name from employees 
where job_title != 'Manager'
order by salary desc
limit 5;





