select d.name, round(sum(a.hours*150.0 * (1 + bonus/100.0)), 1) as salary
from doctors d join attendances a
on d.id = a.id_doctor
join work_shifts ws
on a.id_work_shift = ws.id
group by d.name
order by salary desc