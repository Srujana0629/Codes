# Write your MySQL query statement below
with n1 as(
    select requester_id, accepter_id from requestaccepted
    union all
    select accepter_id,requester_id from requestaccepted
)
select requester_id id,count(requester_id) as num
from n1
group by requester_id
order by num desc
limit 1

