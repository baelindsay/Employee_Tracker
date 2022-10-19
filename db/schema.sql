-- CREATING OUR DATABASE ----
DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;

USE employee_db;

-- DEPARTMENT TABLE ----
CREATE TABLE department (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(30) 
);

-- ROLE TABLE ----
CREATE TABLE role (
    id INT PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT,
    -- FOREIGN KEY (department_id) REFERENCES department(id)
);

-- EMPLOYEE ROLE TABLE ----
CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INT,
    manager_id INT,
    -- FOREIGN KEY (role_id) REFERENCES roles(id),
    -- FOREIGN KEY (manager_id) REFERENCES employeesSELECT * FROM department_id)
);
