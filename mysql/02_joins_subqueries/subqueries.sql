select e.name 
from employees as e 
where e.salary > (select avg(salary)
				   from employees);
                   
select d.name
from departments as d
where d.id =(select department_id
			   from employees
			   group by department_id
			   order by count(*) desc
			   limit 1);
               
select *
from employees
where department_id = (select department_id
					   from employees
                       group by department_id
                       order by avg(salary) desc
                       limit 1);

select *
from employees as e
where e.salary >= (select avg(salary)
				   from employees 
                   where department_id = e.department_id)

