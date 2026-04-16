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
