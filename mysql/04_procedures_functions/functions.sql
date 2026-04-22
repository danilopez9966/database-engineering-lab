drop function if exists salary_employee;
delimiter //
create function salary_employee(p_id int)
returns decimal(10,2)
deterministic
begin
	declare empleado int;
    declare salario decimal(10,2);
    
    select count(*) into empleado
    from employees
    where id = p_id;
    
    if empleado > 0 then
		select salary into salario
        from employees
        where id = p_id;
	else 
		signal sqlstate '45000'
		set message_text = 'no existe el empleado';
	end if;
    return salario;
end//
delimiter ;
select salary_employee(3);

drop function if exists num_employees;
delimiter //
create function num_employees(p_id int)
returns int
deterministic
begin
	declare departamento int;
    declare num_empleados int;
    
	select count(*) into departamento
    from departments
    where id = p_id;
    
    if departamento > 0 then
		select count(*) into num_empleados
        from employees
        where department_id = p_id;
	else
		signal sqlstate '45000'
		set message_text = 'no existe el departamento';
	end if;
    return num_empleados;
end//
delimiter ;
select num_employees(3);

drop function if exists name_department_employee;
delimiter //
create function name_department_employee(p_id int)
returns varchar(100)
deterministic
begin
	declare empleado int;
	declare nombre_dep varchar(100);
	
    select count(*) into empleado
    from employees
    where id = p_id;
    
    if empleado > 0 then
		select d.name into nombre_dep
        from employees as e join departments as d on (d.id = e.department_id)
        where e.id = p_id;
	else
		signal sqlstate '45000'
		set message_text = 'no existe el empelado';
	end if;
    return nombre_dep;
end//
delimiter ;
select name_department_employee(2);
