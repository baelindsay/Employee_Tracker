const mysql = require('mysql2');
const inquirer = require('inquirer');

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
    })
}


