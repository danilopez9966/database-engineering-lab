Drop trigger if exists after_update_salary_emp;
delimiter //
create trigger after_update_salary_emp
after update on employees
for each row
begin
	if new.salary <> old.salary then
		insert into salary_history(employee_id,old_salary,new_salary) values(old.id,old.salary,new.salary);
	end if;
end //
delimiter ;

drop trigger if exists validate_new_emp;
delimiter //
create trigger validate_new_emp
before insert on employees
for each row
begin
	if new.salary is null or new.salary < 20000 then
		signal sqlstate '45000'
		set message_text = 'no se puede insertar un salario menor de 20000';
    end if;
end //

drop trigger if exists delete_emp;
delimiter //
create trigger delete_emp
after delete on employees
for each row
begin
	insert into deleted_employees(employee_id,name,position,salary,department_id) values(old.id,old.name,old.position,old.salary,old.department_id);
end //
delimiter ;

drop trigger if exists validate_delete_emp;
delimiter //
create trigger validate_delete_emp
before delete on employees
for each row
begin
	if old.salary > 40000 then
		signal sqlstate '45000'
		set message_text = 'no se puede borrar el empleado con un salario mayor de 40000';
    end if;
end //
delimiter ;
