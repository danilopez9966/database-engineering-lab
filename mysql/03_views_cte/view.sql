CREATE VIEW employee_department_view AS
SELECT 
    e.id,
    e.name AS employee_name,
    e.position,
    e.salary,
    d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id;
