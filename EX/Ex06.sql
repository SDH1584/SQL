--이퀄조인
select
    em.first_name,
    em.salary,
    de.department_id,
    de.department_name
from
    employees   em,
    departments de
where
    em.department_id = de.department_id;

select
    count(*)
from
    employees   em,
    departments de
where
    em.department_id = de.department_id;

select
    em.first_name,
    de.department_name,
    jo.job_title
from
    employees   em,
    departments de,
    jobs        jo
where
    em.department_id = de.department_id
    and em.job_id = jo.job_id;

--아우터조인 left outer join
select
    em.first_name,
    em.salary,
    em.department_id,
    de.department_id,
    de.department_name
from
    employees   em
    left outer join departments de on em.department_id = de.department_id;

--오라클에서만
select
    *
from
    employees   em,
    departments de
where
    em.department_id = de.department_id (+);

--rigt outer join
select
    em.first_name,
    em.salary,
    em.department_id,
    de.department_id,
    de.department_name
from
    employees   em
    right outer join departments de on em.department_id = de.department_id;

select
    *
from
    employees   em,
    departments de
where
    em.department_id (+) = de.department_id;

--right join => left join
select
    em.first_name,
    em.salary,
    em.department_id,
    de.department_id,
    de.department_name
from
    departments de
    left outer join employees   em on de.department_id = em.department_id;

select
    em.first_name,
    em.salary,
    em.department_id,
    de.department_id,
    de.department_name
from
    departments de,
    employees   em
where
    de.department_id = em.department_id (+);


--full outer join
select
    em.first_name,
    em.salary,
    em.department_id,
    de.department_id,
    de.department_name
from
    employees   em
    full outer join departments de on em.department_id = de.department_id;

--사용불능
select
    em.first_name,
    em.salary,
    em.department_id,
    de.department_id,
    de.department_name
from
    departments de,
    employees   em
where
    de.department_id (+) = em.department_id (+);

select
    employee_id first_name,
    phone_number,
    salary,
    manager_id
from
    employees;
    
select *
from employees em
;

--셀프조인 
select em.employee_id,
    em.first_name,
    em.salary,
    em.phone_number,
    em.manager_id,
    ma.employee_id,
    ma.first_name,
    ma.phone_number,
    ma.manager_id
from employees em , employees ma
where em.manager_id=ma.employee_id;

--잘못된조인
select em.employee_id,
em.first_name,
em.salary,
lo.location_id,
lo.city
from employees em, locations lo
where em.salary= lo.location_id;

select *from employees;
 