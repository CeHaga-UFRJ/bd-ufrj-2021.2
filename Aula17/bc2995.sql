select temperature, count(temperature)
from records
group by mark, temperature
order by mark