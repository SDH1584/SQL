/*
select문
select 절
from 절;
*/

--직원 테이블 전체 조회
SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    departments;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;

SELECT
    first_name,
    phone_number,
    hire_date,
    salary
FROM
    employees;
--예
SELECT
    first_name,
    last_name,
    salary,
    phone_number,
    email,
    hire_date
FROM
    employees;
    
--출력할 컬럼명 별명 적용
select employee_id as empNO,
    first_name as "f-name",
    salary AS "연봉"
    
from employees;

select employee_id as "이름",
    first_name as "성",
    salary AS "연봉",
    phone_number as "전화번호",
    email as "이메일",
    hire_date as "입사일"
from employees;

--연결연산자 사용
select first_name || last_name
from employees;

select first_name || ' ' || last_name
from employees;

select first_name || ' 입사일은 ' || hire_date
from employees;

--산술연산자사용
select first_name,
salary as 월급,
salary*12 as 연봉,
(salary+300)*12
from employees;

select job_id*12
from employees;

select first_name,
last_name,
salary ,
salary*12 as 연봉,
(salary*12)+5000,
phone_number
from employees;


/*where 절*/
--비교연산자
--부서번호가 10인사람을 구해
select first_name,
last_name,
salary,
department_id
from employees
where department_id>=10;

/*급여가 15000 이상인사원들의이름과월급을출력하세요*/
select first_name,
salary
from employees
where salary>= 5000;
--07/01/01 일이후에입사한사원들의이름과입사일을출력하세요
SELECT   first_name,
    hire_date    
FROM   employees
where hire_date>='07/01/01';
--이름이Lex인직원의연봉을출력하세요
select
salary
from employees
where first_name='Lex';

--조건이2개이상일때한꺼번에조회하기
select first_name,
salary
from employees
where salary>=14000
and salary<=17000;

--연봉이14000 이하이거나17000 이상인사원의이름과연봉을출력하세요
select first_name,
salary*12,
salary
from employees
where salary <= 14000
or salary >= 17000;
--입사일이04/01/01 에서05/12/31 사이의사원의이름과입사일을출력하세요
select first_name,
hire_date
from employees
where hire_date>='04/01/01'
and hire_date<='05/12/31';

select first_name, 
salary
from employees
where salary between 14000 and 17000;

select *
from employees
where first_name like 'L%';
--이름에am 을포함한사원의이름과연봉을출력하세요
select *
from employees
where first_name like '%am%';

select first_name,
salary
from employees
where first_name like '%am%';
--이름의두번째글자가a 인사원의이름과연봉을출력하세요
select first_name,
salary
from employees
where first_name like '_a%';

--이름의네번째글자가a 인사원의이름을출력하세요
select first_name,
salary
from employees
where first_name like '___a%';
--이름이4글자인사원중끝에서두번째글자가a인사원의이름을출력하세요
select first_name,
salary
from employees
where first_name like '__a_';
--in 연산자로여러조건을검사하기
select first_name, last_name, salary
from employees
where first_name ='Neena' 
or first_name = 'Lex' 
or first_name ='John';

select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');
--연봉이2100, 3100, 4100, 5100 인사원의이름과연봉을구하시오
select first_name, salary
from employees
where salary in(2100,3100,4100,5100);

--null
select first_name,
salary, 
commission_pct, 
salary*commission_pct
from employees
where salary between 13000 and 15000;
--is null/not null;
select*
from employees
where commission_pct is null;

--커미션비율이있는사원의이름과연봉커미션비율을출력하세요
select first_name,
salary,
commission_pct
from employees
where commission_pct is not null ;
--담당매니저가없고커미션비율이없는직원의이름을출력하세요
select first_name
from employees
where manager_id is null
and commission_pct is null;

--order by
select *
from employees
order by salary desc;

select *
from employees
order by salary asc, first_name desc;

select *
from employees
where salary>=9000
order by salary asc;

--부서번호를오름차순으로정렬하고부서번호, 급여, 이름을출력하세요
select department_id,
salary,
first_name
from employees
order by department_id asc;
--급여가10000 이상인직원의이름급여를급여가큰직원부터출력하세요
select first_name,salary
from employees
where salary>=10000
order by salary desc;
--부서번호를오름차순으로정렬하고부서번호가같으면급여가높은사람부터부서번호급여이름을출력하세요
select department_id,
salary,
first_name
from employees
order by department_id asc, salary desc ;