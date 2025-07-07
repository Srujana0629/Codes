# Write your MySQL query statement below
select name as customers
from customers c
where id not in (
    select customerId 
    from Orders
)