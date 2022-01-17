select c.name, sum(amount)
from products p join categories c
on p.id_categories = c.id
group by c.name