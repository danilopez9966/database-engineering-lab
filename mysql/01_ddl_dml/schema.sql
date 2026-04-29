create database if not exists company_db;
use company_db;

create table if not exists departments(
id int auto_increment,
name varchar(50),
constraint pk_departments primary key (id)
);

create table if not exists employees(
id int auto_increment,
name varchar(100),
position varchar(50),
salary decimal(10,2),
department_id int not null,
constraint pk_employees primary key (id),
constraint fk_employees foreign key (department_id) references departments (id) on update cascade on delete cascade
);

CREATE TABLE salary_history (
id INT AUTO_INCREMENT PRIMARY KEY,
employee_id INT NOT NULL,
old_salary DECIMAL(10,2),
new_salary DECIMAL(10,2),
change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (employee_id) REFERENCES employees(id)
);

create table deleted_employees(
id int auto_increment,
employee_id int,
name varchar(50),
position varchar(50),
salary decimal(10,2),
department_id int,
deleted_at datetime default CURRENT_TIMESTAMP,
constraint pk_deleted_at primary key (id),
constraint fk_deleted_at foreign key (employee_id) references employees (id) on update cascade on delete cascade,
constraint fk_deletat_at_d foreign key (department_id) references departments (id) on update cascade on delete cascade
)
