-- CREATING OUR DATABASE ----
DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;

USE employees_db;

-- DEPARTMENT TABLE ----
CREATE TABLE departments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(30)
);

-- ROLE TABLE ----
CREATE TABLE emp_role (
    id INT NOT NULL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    salary DECIMAL(8,2) NOT NULL,
    department_id INT,
    FOREIGN KEY(dept_id) REFERENCES departments(id)
);

-- EMPLOYEE ROLE TABLE ----
CREATE TABLE employees (
    id INT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT,
    manager_id INT,
    FOREIGN KEY(role_id) REFERENCES employee_role(id),
    -- FOREIGN KEY(manager_id) REFERENCES employee(id)
);
