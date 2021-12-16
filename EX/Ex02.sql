select first_name,
lower(first_name)
 l_last_name,
upper(first_name) u_last_name
from employees
where department_id=100;


select first_name,
substr(first_name,1,3),
substr(first_name,1,3)
from employees
where department_id=100;


select first_name,
lpad(first_name,10,'*'),
rpad(first_name,10,'*')
from employees;



select first_name,
replace(first_name,'a','*'),
replace(first_name,'a',substr(first_name,1,3),"****")
from employees
where department_id=100;

select round(123.456,2)"r2",
round(123.456,2)"r0",
round(123.456,2)"r-1"
from dual;

select trunc(123.462,2)"r2",
trunc(123.462,2)"r",
trunc(123.462,2)"r-1"
from dual;

select sysdate
from dual;

select sysdate, 
hire_date,
round(MONTHS_BETWEEN(SYSDATE,hire_date),0),
trunc(MONTHS_BETWEEN(SYSDATE,hire_date),0)

from employees
where department_id=100;
-- 숫자> 문자형 변환 to char
select first_name,
salary,
salary*12,
to_char(salary*12,'9999999'),
to_char(salary*12,'0999999'),
to_char(salary*12,'999999999'),
to_char(salary*12,'$999999'),
to_char(salary*12,'999999.99')
from employees
where department_id=100;
--변환함수 날짜>문자 to char

select sysdate,
       to_char (sysdate,'DAY'),
       hire_date,
       to_char(hire_date,'MM')
from employees;

select sysdate,
       to_char (sysdate,'ss')
from employees;

select sysdate,
       to_char (sysdate,'yyyy"년"-mm"월"-dd"일" DY"요일" hh24:mi:ss')
from dual;

select first_name,
commission_pct,
nvl(commission_pct,110),
nvl2(commission_pct,-1,0)
from employees
;