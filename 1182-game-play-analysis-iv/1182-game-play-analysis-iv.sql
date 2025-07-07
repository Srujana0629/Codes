with f as (
    select player_id, min(event_date) as first_login
    from activity a
    group by player_id
),
s as (
    select a.player_id
    from activity a
    join f on a.player_id=f.player_id and
    a.event_date=date_add(f.first_login,interval 1 day)
)
select round(count(s.player_id)*1.0/count(f.player_id),2) as fraction
from f left join s on 
f.player_id=s.player_id