select p.year, rem.name as "sender", dest.name as "receiver"
from packages p join users rem
on p.id_user_sender = rem.id
join users dest
on p.id_user_receiver = dest.id
where rem.address != 'Taiwan'
and dest.address != 'Taiwan'
and (p.color = 'blue' or p.year=2015)
order by p.year desc