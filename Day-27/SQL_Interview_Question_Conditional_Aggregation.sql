use interview_questions;

Create table If Not Exists Accounts (account_id int, income int);
-- Truncate table Accounts
insert into Accounts (account_id, income) values ('3', '108939');
insert into Accounts (account_id, income) values ('2', '12747');
insert into Accounts (account_id, income) values ('8', '87709');
insert into Accounts (account_id, income) values ('6', '91796');

select 'Low Salary' as category, sum(case when income < 20000 then 1 else 0 end) as accounts_count
from accounts
union all
select 'Average Salary', sum(case when income >= 20000 and income <=50000 then 1 else 0 end)
from accounts
union all
select 'High Salary', sum(case when income > 50000 then 1 else 0 end)
from accounts;


select 'Low Salary' as category, sum(income < 20000 ) as accounts_count
from accounts
union all
select 'Average Salary', sum(income >= 20000 and income <=50000)
from accounts
union all
select 'High Salary', sum(income > 50000)
from accounts;

select case
when income < 20000 then 'Low Salary'
when income >= 20000 and income <=50000 then 'Average Salary'
else 'High Salary'
end
as category from accounts;

select category, count(*) as accounts_count
from
(select case
when income < 20000 then 'Low Salary'
when income >= 20000 and income <=50000 then 'Average Salary'
else 'High Salary'
end
as category from accounts) d group by category;

with temp as 
(select 'High Salary' as category
union all
select 'Low Salary'
union all
select 'Average Salary'
)

select * from temp;

with temp as 
(select 'High Salary' as category
union all
select 'Low Salary'
union all
select 'Average Salary'
)
select temp.category, coalesce(accounts_count, 0) as accounts_count
from temp left join
(select category, count(*) as accounts_count
from
(select case
when income < 20000 then 'Low Salary'
when income >= 20000 and income <=50000 then 'Average Salary'
else 'High Salary'
end
as category from accounts) d group by category) e
on temp.category = e.category;

-- ------------------------------------------------------------------------------------------

with temp1 as 
(select 'High Salary' as category
union all
select 'Low Salary'
union all
select 'Average Salary'
),
temp2 as (select category, count(*) as accounts_count
from
(select case
when income < 20000 then 'Low Salary'
when income >= 20000 and income <=50000 then 'Average Salary'
else 'High Salary'
end
as category from accounts) d group by category)
select temp1.category, coalesce(accounts_count, 0) as accounts_count
from temp1 left join temp2
on temp1.category = temp2.category;

