# Write your MySQL query statement below
with r as (
    select d.name as Department, e.name as Employee, e.salary as Salary, 
    dense_rank()over(partition by d.id order by salary desc) as rnk
    from employee e left join department d on e.departmentId =d.id
)
select Department, Employee, Salary
from r 
where rnk<4