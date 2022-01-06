select e.cpf, e.enome, d.dnome
from empregados e join departamentos d
on e.dnumero = d.dnumero
where e.cpf not in
(select cpf_emp from trabalha)
order by cpf asc