const mysql = require('mysql2');
const inquirer = require('inquirer');

const db = mysql.createConnection(
    {
        host: 'localhost',
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: 'employees_db'
    },
    console.log(`\nNow connected to employees_db database.\n`)
);

const mainMenu = () => {
    inquirer.prompt (
        {
            type: 'list',
            name: 'menu',
            message: 'What would you like to do?',
            choices: ['View All Employees', 'Add Employee', 'Update Employee Role', 
            'View All Roles', 'Add Role', 'View All Departments', 'Add Department', 'Quit']
        }
    )
    .then((data) => {
        menuSelection = data.menu;
            if (data.menu === 'View All Departments') {
                viewDepartments();
            } else if(data.menu === 'View All Roles') {
                viewRoles();
            } else if (data.menu === 'View All Employees') {
                viewEmployees();
            } else if (data.menu === 'Add Employee') {
                rolesQuery();
            } else if (data.menu === 'Update Employee Role') {
                rolesQuery();
            } else if (data.menu === 'Add Department') {
                addDept();
            } else if (data.menu === 'Add Role') {
                deptQuery();
            } else if (data.menu === 'Quit') {
                console.log('\nBye now\n');
                db.end();
            }
        }
    )
}

const viewDepartments = () => {
    db.query('SELECT * FROM departments', function (err, results) {
        console.table('\n',results);
        mainMenu()
    });
}

const viewRoles = () => {
    db.query ( `SELECT emp_role.id, emp_role.title, departments.dept_name, emp_role.salary
                FROM departments
                JOIN emp_role ON emp_role.department_id = departments.id`, function (err, results) {
                    console.table('\n',results);
        mainMenu()
    });
}

const viewEmployees = () => {
    db.query ( `SELECT employees.id, employees.first_name, employees.last_name, employee_role.title, departments.dept_name AS department, employee_role.salary, employees.manager_id AS manager
                FROM employees
                JOIN employee_role ON employee_role.id=employees.role_id
                JOIN departments ON departments.id=employee_role.department_id`, function(err, results) {
                    for (let i = 0; i < results.length; i++) {
                        if(results[i].manager != null) {
                    for( let j = 0; j < results.length; j++) {
                        if (results[i].manager == results[j].id) {
                            results[i].manager = results[j].first_name + ' ' + results[j].last_name
                        }
                    }
                }
            }
        console.table('\n',results);
        mainMenu()
    });
}

const addEmployee = () => {
    inquirer.prompt ([
        {
            type: 'input',
            name: 'firstName',
            message: 'Enter employee first name'
        },
        {
            type: 'input',
            name: 'lastName',
            message: 'Enter employee last name'
        },
        {
            type: 'list',
            name: 'role',
            message: 'Select employee role',
            choices: allRoles
        },
        {
            type: 'list',
            name: 'fullName',
            message: 'Select manager name',
            choices: employeeNames
        }
    ])
    .then((data) => {
        let newFirstName = data.firstName;
        let newLastName = data.lastName;
        let newManager;
        if (data.fullName === 'NONE') {
            newManager = null;
        } else {
            newManager = idMatcher(data);
        }
        db.query(`SELECT id FROM employees`, (err, results) => {
            let newId = results.length;
            newId++;
            db.query(`SELECT id FROM employee_role WHERE title = ?`, data.role, function(err, results) {
                let values = `${newId}, '${newFirstName}', '${newLastName}', ${results[0].id}, ${newManager}`;
                db.query(`INSERT INTO employees (id, first_name, last_name, role_id, manager_id) VALUES (${values})`, function(err, result) {
                    console.log('\nNew Employee Added!\n')
                    mainMenu();
                })
            })
        })
    })
}