SELECT emp_role.id, emp_role.title, departments.dept_name, emp_role.salary
From departments
JOIN emp_role ON emp_role.dept_id;

SELECT emps.id, emps.first_name, emps.last_name, departments.dept_name, emp_role.salary
FROM employees
JOIN emp_role ON emp_role.id = employees.role_id
Join departments ON departments.id + emp_role.dept_id;

INSERT INTO employees (id, first_name, last_name, role_id, manager_id)
VALUES ()

SELECT title From emp_role WHERE id=001

SELECT A.first_name AS first_name, A.last_name AS last_name, CONCAT(B.first_name, ' ', B.last_name) AS manager
FROM employees A, employees B
WHERE A.manager_id = B.id
OR NULL;