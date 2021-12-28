
/*문제1.
평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
(56건*/
select count(salary)
from employees
where salary<=(select avg(salary)
                from employees)
        
;


/*문제2. 
평균급여 이상, 최대급여 이하의 월급을 받는 사원의
직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차
순으로 정렬하여 출력하세요
(51건)*/
select   employee_id,
         first_name,
         salary,
         round(em.avg,1),
         em.max 
from     employees , (select  avg(salary) avg,
                             max(salary) max
                             from  employees)em
where    salary>=avg and salary<=max 
order by salary asc;

/*문제
3.
직원중
Steven(first_name) king(last_name) 이 소속된 부서 ( 가 있는 곳의 주소
를 알아보려고 한다
도시아이디
(location_id), 거리명 (street_address), 우편번호 (postal_code), 도시명 (city), 주
(state_province), 나라아이디 (country_id) 를 출력하세요
(1
건*/
select lo.location_id,
        lo.street_address,
        lo.postal_code,
        lo.city,
        lo.state_province,
        lo.country_id
from departments de,locations lo
where de.location_id=lo.location_id
and de.department_id=(select  de.department_id
                            from    employees em, departments de
                            where   em.department_id = de.department_id
                            and     em.first_name = 'Steven'
                            and     em.last_name = 'King');
/*
문제4.
job_id 가 'ST_MAN' 인 직원의 급여보다 
작은 직원의 사번,이름,급여를 급여의 내림차순으로 출력하세요  -ANY연산자 사용
(74건)*/
select      employee_id ,
            first_name,
            salary 
from        employees
where       salary <any (select salary
                         from   employees
                         where  job_id = 'ST_MAN')
order by    salary desc;


/*문제
5 .
각
부서별로 최고의 급여를 받는 사원의 직원번호 (employee_id), 이름 (first_ 과 급여
( 부서번호 (department_ 를 조회하세요
단
조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다 .
조건절비교
, 테이블조인 2 가지 방법으로 작성하세요
(11
건

*/
--조건
select employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in( select  department_id, max(salary)
                                		from employees
                              			  group by department_id);
                              			  
--테이블조인
select em.employee_id,
        em.first_name,
        em.salary,
        em.department_id
from employees em ,( select department_id, max(salary)max
                    from        employees
                    group by    department_id)sel
where em.department_id=sel.department_id
and em.salary=sel.max
order by em.salary desc
;                     

/*문제
6
각
업무 (job) 별로 연봉 ( 의 총합을 구하고자 합니다 .
연봉
총합이 가장 높은 업무부터 업무명 (job_ 과 연봉 총합을 조 회하시오
(19
건*/
select jo.job_title,
        sum(em.salary)
from employees em, jobs jo
where em.job_id=jo.job_id
group by jo.job_title
order by sum(salary)desc;

/*문제
7
자신의
부서 평균 급여보다 연봉 ( 이 많은 직원의 직원번호 (employee_id), 이름
(first_ 과 급여 ( 을 조회하세요
(
38 건*/      

select first_name,
        salary
from employees em, (select   department_id,
                             avg(salary) avg
                    from     employees
                    group by department_id)sel
where salary>sel.avg
and em.department_id=sel.department_id
;

/*문제
8
직원
입사일이 11 번째에서 15 번째의 직원의 사번 , 이름 , 급여 , 입사일을 입사일 순서로 출력
하세요*/
select  rn,
        employee_id,
        first_name,
        salary,
        hire_date
from    (select     rownum rn,
                    ord.employee_id,
                    ord.first_name,
                    ord.salary,
                    ord.hire_date
         from       (select     employee_id, first_name, salary, hire_date
                    from        employees
                    order by    hire_date asc) ord)
where   rn between 11 and 15;

