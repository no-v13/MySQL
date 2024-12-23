use hr_db;
-- mySQl 과제 PRAC.1

-- #3
select first_name, manager_id, commission_pct, salary
from employees
where manager_id is not null and commission_pct is null
and salary>=3000
order by salary desc; 

-- 4번
select job_title, max_salary
from jobs
where max_salary >=10000
order by max_salary desc;

-- 5번
select 	first_name, 
		salary, 
        ifnull(commission_pct,0)
from employees
where salary between 10000 and 14000
order by salary desc;

-- 6번
select 	first_name,
		salary, 
		date_format(hire_date, '%Y-%M') as hire_date, 
        department_id
from employees
where department_id in (10,90,100);

-- #7
select first_name, salary
from employees
where first_name like '%s%';

-- #8
select * from departments
order by char_length(department_name) desc;

-- 9 
select * from departments; -- locatoin_id
select * from locations; -- locatoin_id, city, state_province, country_id
select * from countries; -- country_id, country_name, region_id

select upper(country_name)
from countries
order by country_name;

-- #10
select 	concat(first_name, ' ', last_name),
		salary,
        replace(phone_number,'.','-') phone_number,
        hire_date
from employees
where hire_date <= '03/12/31';
