USE employee_db;

SELECT e.id, e.first_name AS "First Name", e.last_name AS "Last Name", r.title, r.salary FROM employee employee
JOIN roles r ON r.id;

SELECT e.id, e.first_name AS "First Name", e.last_name AS "Last Name", r.title, d.department_name AS "Department", r.salary AS "Salary" FROM employee employee
INNER JOIN roles r ON r.id = e.role_id INNER JOIN departments d ON d.did = r.department_id;

-- ALL EMPLOYEE QUERY ----
SELECT e.id, e.first_name AS "First Name", e.last_name AS "Last Name", IF NULL(r.title, "No Data") AS "Title", IF NULL (r.salary, 'No Data') AS "Salary", CONCAT(m.first_name, '',m.last_name) AS "Manager"
FROM employee e
LEFT JOIN roles r
ON r.id = e.role_id
LEFT JOIN department department
ON d.id = r.department_id
LEFT JOIN employee m ON m.id = e.manager_id
ORDER BY e.id;

-- EMPLOYEE BY DEPARTMENT QUERY ----
SELECT e.first_name AS "First Name", e.last_name AS "Last Name", r.title, d.department_name AS "Department" FROM employee e 
INNER JOIN roles r ON r.id = e.role_id INNER JOIN deparment d ON d.id = r.department_id WHERE department_name = "Management";

SELECT CONCAT(e.first_name, '', e.last_name) AS full_name, r.title, e.manager_id FROM employee e 
INNER JOIN roles r ON r.id = e.role_id WHERE e.manager_id = 1;

SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM roles;

DELETE FROM employee WHERE id = 11;

SELECT e.id, e.first_name AS "First Name", e.last_name AS "Last Name", r.title, d.department_name AS "Department", r.salary
FROM employee e
INNER JOIN roles r on r.id = e.role_id INNER JOIN deparment d ON d.id = r.department_id
WHERE department_name = 'The Fashion Design Department';

