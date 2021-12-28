/*문제
1
담당
매니저가 배정되어있으나 커미션비율이 없고 , 월급이 3000 초과인 직원의
이름
, 매니저아이디 , 커미션 비율 , 월급 을 출력하세요
(45
건*/
select  first_name,
        manager_id,
        commission_pct,
        salary
from    employees
where   manager_id is not null
and     commission_pct is null
and     salary > 3000;
/*
문제2. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 
급여(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/
select employee_id,
        first_name,
        salary,
        to_char(hire_date,'yyyy-mm-dd'),
         replace(phone_number, '.', '-'),
        department_id
from employees
where (department_id,salary) in(select  department_id,max(salary)
                                        from employees
                                        group by department_id)

order by salary desc;
	


/*제3
매니저별 담당직원들의 평균급여 최소급여 최대급여를 알아보려고 한다.
-통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-매니저별 평균급여가 5000이상만 출력합니다.
-매니저별 평균급여의 내림차순으로 출력합니다.
-매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매
니저별최대급여 입니다.
(9건)*/

select em.employee_id,
        first_name,
        round(me.av,1),
        me.mi,
        me.ma
            
from employees em,(select avg(Salary)av,
                           min(salary)mi,
                           max(salary)ma,
                            manager_id
                        from employees
                        group by manager_id)me
where em.hire_date>=  '05/01/01'
and em.employee_id=me.manager_id
order by salary desc;
 


/*문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명
(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)*/
select  em.employee_id,
        em.first_name,
        ma.first_name,
        de.department_id,
        ma.first_name
from    departments de, employees em, employees ma
where   em.manager_id = ma.employee_id
and     em.department_id = de.department_id(+);


/*문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의
사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요*/

select
   rns.rn,
   rns.employee_id,
    rns.first_name,
    de.department_id,
    rns.salary,
    rns.hire_date
from
    (
        select
            rownum rn,
            employee_id,
            first_name,
            department_id,
            salary,
            hire_date
        from
            (
                select
                    employee_id,
                    first_name,
                    department_id,
                    salary,
                    hire_date
                from
                    employees
                where
                    hire_date > '05/01/01'
                order by
                    hire_date asc
            ) asr)rns
            , departments de
where
rns.rn between 11 and 20
 and rns.department_id = de.department_id;
 
 /*
문제 6
가장 늦게 입사한 직원의 이름(first_name last_name)과 연봉(salary)과 근무하는 부서 이름
(department_name)*/

select  rns.rn , 
        rns.first_name||' '||rns.last_name , 
        rns.salary , 
        de.department_name,
        rns.hire_date
from    (select rownum rn,
                first_name, 
                last_name, 
                department_id, 
                salary, 
                hire_date
            from (select  first_name, 
                            last_name, 
                            department_id, 
                            salary, 
                            hire_date
                  from     employees
                 order by hire_date desc) des)rns, departments de
where   rns.rn = 1
and     rns.department_id = de.department_id;

/*문제7평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성
(last_name)과 업무(job_title), 연봉(salary)을 조회하시오*/

select em.employee_id,
        em.first_name,
        em.last_name,
        jo.job_title,
        rns.department_id,
        em.salary
        
        from
            (select rownum rn,
                            av,
                    department_id
                   from
                       (select avg(salary)av,department_id
                        from employees
                        group by department_id
                        order by avg(salary) desc))rns,employees em, jobs jo
where rns.rn=1
and rns.department_id=em.department_id
and em.job_id=jo.job_id;

/*
문제8.
평균 급여(salary)가 가장 높은 부서는? 
*/
select  em.employee_id, em.first_name , em.last_name , jo.job_title , rem.department_id , em.salary 
from    (select rownum rn, avg, department_id
        from    (select     avg(salary) av, department_id
                from        employees
                group by    department_id
                order by    avg(salary) desc))rns, employees em, jobs jo
where   rem.rno = 1
and     rem.department_id = em.department_id
and     em.job_id = jo.job_id;

/*
문제9.
평균 급여(salary)가 가장 높은 지역은? 
*/
select  rns.region_id ,rns.avg , re.region_name 
from    (select rownum rn, avg, region_id
        from    (select     avg(em.salary) avg, re.region_id
                from        employees em, departments de, locations lo, countries co, regions re
                where       em.department_id = de.department_id
                and         de.location_id = lo.location_id
                and         lo.country_id = co.country_id
                and         co.region_id = re.region_id
                group by    re.region_id
                order by    avg(em.salary) desc))rns, regions re
where   rns.rn = 1
and     rns.region_id = re.region_id;

/*
문제10.
평균 급여(salary)가 가장 높은 업무는? 
*/
select  rns.job_id 업무아이디, rns.avg 평균급여, jo.job_title 업무명
from    (select rownum rn, avg, job_id
        from    (select     avg(salary) avg, job_id
                from        employees
                group by    job_id
                order by    avg(salary) desc))rns, jobs jo
where   rns.rn = 1
and     rns.job_id = jo.job_id;
