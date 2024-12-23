-- prac.02
use hr_db;

-- #1
select count(manager_id) 'haveMngCnt'
from employees;

-- #2
select 	max(salary) '최고임금',
		min(salary) '최저임금',
        max(salary) - min(salary) '최고-최저'
from employees;

-- #3
select date_format(max(hire_date), '%Y년 %m월 %d일') 'hire_date' 
							-- 대문자 %M %D하니까 April 21st라고 영어로 나오네
from employees;

-- #4
select 	avg(salary),
		max(salary),
        min(salary),
        department_id
from employees
group by department_id
order by department_id;

 -- #5
 select	job_id,
		avg(salary), 
        max(salary), 
        min(salary)
from employees
group by job_id
order by min(salary)desc , round(avg(salary)) asc;

-- #6
select date_format(min(hire_date), '%Y-%m-%d %W') 'hire_date'
from employees;

-- #7
select 	department_id, avg(salary), min(salary),
		avg(salary)-min(salary)
from employees
group by department_id
having avg(salary)-min(salary)<2000
order by avg(salary) desc;

-- #8
select  job_id, 
        max(salary) - min(salary)
from employees
group by job_id
order by max(salary) - min(salary) desc;
-- 쌤 답안 -> 변수 설정한거 같음 
select  job_id, 
        max(salary) - min(salary) as diff_salary
from employees
group by job_id
order by diff_salary desc;

-- #9
select manager_id, avg(salary)'avg', min(salary)'min', max(salary)'max'
from employees
where hire_date>='2005.01.01'
group by manager_id
having  avg(salary)>=5000
order by avg(salary) desc;

-- chat GPT 보너스 문제1
select first_name,
	case
		when salary>=5000 then 'high'
        else 'low'
	end as salary_lev
from employees;

-- chat GPT 보너스 문제2
select department_id,
	case 
		when department_id = 10 then 'Sales'
        when department_id = 20 then 'HR'
        else 'Others'
    end as dep_id
from departments;

-- chat GPT 보너스 문제3
select first_name, salary,
	case 
		when salary>=5000 then salary*1.1
        else salary * 1.05
	end as sal_pct 
from employees;

-- #10
select 	concat(first_name,' ',last_name) 'Name',
		salary,
        hire_date,
        case 
			when hire_date <= '02/12/31' then '창립멤버'
            when hire_date between '03/01/01' and '03/12/31' then '03년 입사'
            when hire_date between '04/01/01' and '04/12/31' then '04년 입사'
			else '상장이후 입사'
		end as optDate
from employees
order by hire_date;

-- 11


