select lr.name, round(lr.omega*1.618,3) as "Fator N"
from life_registry lr join dimensions d
on lr.dimensions_id = d.id
where (d.name = 'C875' or d.name = 'C774')
and lr.name like 'Richard%'