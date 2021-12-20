/*sub query*/

--1)전체 쿼리 구조
select
    first_name,
    salary
from
    employees
where
    salary > "Den의 급여";
         
--2)den의 급여
select
    salary
from
    employees
where
    first_name = 'Den';

--3)쿼리문완성 => 들여쓰기 중요
select
    first_name,
    salary,
    phone_number,
    department_id
from
    employees
where
    salary > (
        select
            salary
        from
            employees
        where
            first_name = 'Den'
    );
--급여를 가장 적게받는사람의 이름 급여 사원번호
--1)급여를 가장 적게받는사람의 급여
select
    min(salary)
from
    employees;
--2) 2100받는 사람의 이름 급여 사원번호
select
    first_name,
    salary,
    employee_id
from
    employees
where
    salary = 2100;


--3 식조합
select
    first_name,
    salary,
    employee_id
from
    employees
where
    salary = (
        select
            min(salary)
        from
            employees
    );



--)평균급여보다 적게받는사람의 이름 급여 출력
--1)평균급여
select
    avg(salary)
from
    employees;
--2) 평균급여보다 작게받는사람의 이름 급여
select
    first_name,
    salary
    
from
    employees
where
    salary < 6461.83;

--3)식조합
select
    first_name,
    salary
   
from
    employees
where
    salary < ( select  avg(salary)
              from  employees );  
