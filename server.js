// ACQUIRE the client
const mysql = require('mysql2');
const inquirer = require('inquirer');
const cTable = require('console.table');
const startScreen = ['View all Departments', 'View all Roles', 'View all Employees', 'Add a Department', 'Add a Role', 'Add an Employee', 'Update an Employee Role']
const allEmployeeQuery = `SELECT e.id, e.first_name AS "First Name", e.last_name AS "Last Name", r.title, d.department_name AS "Department", IFNULL(r.salary, 'No Data') AS "Salary", CONCAT(m.first_name," ",m.last_name) AS "Manager"
FROM employees e
LEFT JOIN roles r 
ON r.id = e.role_id 
LEFT JOIN departments d 
ON d.id = r.department_id
LEFT JOIN employees m ON m.id = e.manager_id
ORDER BY e.id;`

const addQuestions = ['What is the first name?', 'What is the last name?', 'What is their role?', 'Who is their manager?']
const roleQuery = 'SELECT * from roles; SELECT CONCAT (e.first_name," ",e.last_name) AS full_name FROM employees e'
const managmntQuery = 'SELECT CONCAT (e.first_name," ",e.last_name) AS full_name, r.title, d.department_name FROM employees e INNER JOIN roles r ON r.id = e.role_id INNER JOIN departments d ON d.id = r.department_id WHERE department_name = "Management";'

// Start app 
const startApp = () => {
  inquirer.prompt({
      name: 'menu',
      type: 'list',
      message: 'Select an option',
      choices: startScreen

  }).then((answer) => {
      switch (answer.menu) {
        case 'View all Departments':
              viewDept();
              break;
        case 'View all Roles':
              viewRoles();
              break;
        case 'View all Employees':
              showAll();
              break;
        case 'Add a Department':
              addDept();
              break;
        case 'Add a Role':
              addRole();
              break;
        case 'Add an Employee':
              addEmployee();
              break;
        case 'Update Employee Role':
              updateRole();
              break;
        case 'Exit':
              connection.end();
              break;
        }
    })
}


