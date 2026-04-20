with high_salary as (
	select e.name,e.position
    from employees as e
    where e.salary > 30000)
select *
from high_salary hs;

with department_salary_avg as(
	select e.department_id,avg(e.salary) as salario_medio
    from employees as e
    group by e.department_id)
select d.name, dsa.salario_medio
from department_salary_avg as dsa join departments as d on (d.id = dsa.department_id);

with employee_high_avg_salary as (
	select department_id,avg(salary) as salario
    from employees 
    group by department_id)
select e.name,e.salary,d.name as department
from employee_high_avg_salary ehas join departments as d on (d.id = ehas.department_id)
join employees as e on (e.department_id = d.id)
where e.salary > ehas.salario;
    
with maximun_avg_department as (
	select department_id,avg(salary) as salario
    from employees
    group by department_id
    order by salario desc
    limit 1)
select d.name, mad.salario 
from maximun_avg_department as mad join departments as d on (d.id = mad.department_id);
    
    
    
    
    
