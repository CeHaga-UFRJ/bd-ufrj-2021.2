-- Ve descricao do caso
select description from crime_scene_report
where date = 20180115 -- Enunciado
and city = 'SQL City' -- Enunciado       
and type = 'murder' -- Enunciado

-- A partir da descricao do caso eh possivel obter duas testemunhas:
--  Ultima casa de "Northwestern Dr"
--  Annabel em algum lugar de "Franklin Ave"

-- Ve a entrevista de cada testemunha
select transcript from interview
where person_id in (
  select id from person
  where (address_street_name = 'Franklin Ave' and name like 'Annabel%') -- Testemunha 2
  or (address_street_name = 'Northwestern Dr' and address_number = (
    select max(address_number) from person
    where address_street_name = 'Northwestern Dr' -- Testemunha 1
  ))
)

-- Podemos resumir as entrevistas em:
-- Testemunha 1: Numero membro comeca com "48Z" e nivel ouro. Placa do carro contem "H42W"
-- Testemunha 2: Suspeito fez check-in na academia dia 09/01

-- Ve o nome do suspeito com base nas entrevistas
select name from get_fit_now_member
join get_fit_now_check_in
on membership_id = id
where check_in_date = 20180109 -- Testemunha 2
and membership_status = 'gold' -- Testemunha 1
and membership_id like '48Z%' -- Testemunha 1
and person_id in (
  select p.id from drivers_license d
  join person p
  on p.license_id = d.id
  where plate_number like '%H42W%' -- Testemunha 1
)