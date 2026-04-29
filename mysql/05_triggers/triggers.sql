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
