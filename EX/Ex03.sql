--group by

select
    department_id,
    avg(salary)
from
    employees
group by
    department_id
order by
    department_id;

select
    department_id,
    avg(salary),
    count(*)
from
    employees
group by
    department_id;

select
    count(*)
from
    employees
group by
    department_id,
    job_id;

select
    department_id,
    job_id,
    count(*),
    avg(salary)
from
    employees
group by
    department_id,
    job_id
order by
    department_id asc;

--where절엔 그룹함수사용 불가능
select
    department_id,
    count(*),
    sum(salary)
from
    employees
where
    sum(salary) >= 20000
group by
    department_id;

--having절
select
    department_id,
    count(*),
    sum(salary)
from
    employees
group by
    department_id
having sum(salary) >= 20000
       or department_id = 40;


--case-end문
select
    employee_id,
    first_name,
    salary,
    job_id,
    case
    when job_id = 'AC_ACCOUNT' then
    salary + salary * 0.1
    when job_id = 'SA_REF'     then
    salary + salary * 0.2
    when job_id = 'ST_CLERK'   then
    salary + salary * 0.3
    else
    salary
    end realsalary
from
    employees;

select
    employee_id,
    salary,
    job_id,
    decode(
        job_id, 'AC_ACCOUNT', salary + salary * 0.1, 'SA_REF', salary + salary * 0.2, 'ST_CLERK', salary + salary * 0.3, salary
    ) realsalry
from
    employees;

select
    first_name,
    department_id,
    job_id,
    case
    when department_id between 10 and 50   then
    'A-TEAM'
    when department_id between 60 and 100  then
    'B-TEAM'
    when department_id between 110 and 150 then
    'C-TEAM'
    else
    '팀없음'
    end team
from
    employees;