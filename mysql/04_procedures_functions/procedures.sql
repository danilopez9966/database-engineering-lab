drop procedure if exists insert_employee;
Delimiter //
create procedure insert_employee(in p_name varchar(100),in p_position varchar(50),in p_salary decimal(10,2),in p_department_id int)
begin
	insert into employees(name,position,salary,department_id) values (p_name,p_position,p_salary,p_department_id);
end;
Delimiter;
call insert_employee('Blas Lopez','Jefe de ventas',36000,3);

drop procedure if exists update_employe_salary;
delimiter //
create procedure update_employe_salary(in p_id int, p_new_salary decimal(10,2))
begin
	update employees
    set salary = p_new_salary
    where id = p_id;
end;
delimiter;
call update_employe_salary(1,23000);


drop procedure if exists get_employees_by_id;
delimiter //
create procedure get_employees_by_id(in p_id int)
begin
	select id,name,position,salary
    from employees
    where p_id = department_id;
end;
delimiter;
call get_employees_by_id(2)

drop procedure if exists get_employees_by_id;
delimiter //
create procedure get_employees_by_id(in p_id int)
begin
	select id,name,position,salary
    from employees
    where p_id = department_id;
end;
delimiter;
call get_employees_by_id(2)

drop procedure if exists update_if_employee
delimiter //
create procedure update_if_employee (in p_id int, in p_new_salary decimal(10,2))
begin
	declare id_exists int;
    
    select count(*) into id_exists
    from employees
    where id = p_id;
    
	if p_new_salary <= 0 then
		signal sqlstate '45000'
		set message_text = 'no se puede insertar un salario menor o igual a 0';
	end if;
    
    if id_exists = 0 then
		signal sqlstate '45000'
		set message_text = 'no existe el empleado';
    end if;
    
    update employees
    set salary = p_new_salary
    where id = p_id;
end;
delimiter;
call update_if_employee(3,26000);

drop procedure if exists employees_in_department
delimiter //
create procedure employees_in_department(in p_id int)
begin
	declare department int;
    
    select count(*) into department
    from departments
    where id = p_id;
    
    if department = 0 then
		signal sqlstate '45000'
		set message_text = 'no existe el departamento';
	else
		select *
        from employees
        where department_id = p_id;
	end if;
end   
delimiter //
call employees_in_department(3);  
