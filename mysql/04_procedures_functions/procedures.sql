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
