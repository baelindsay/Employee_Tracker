-- DEPARTMENT SEEDS -----
INSERT INTO department (dept_name)
VALUES  ('Engineering'),
        ('Finance'),
        ('Sales'),
        ('Human Resources');

-- ROLE SEEDS -------
INSERT INTO roles (title, salary, dept_id)
VALUES  ('Software Engineer', 58584, 1),
        ('Manager of Engineering', 33463, 1),
        ('Account Manager', 42017, 2),
        ('Accountant', 69442, 2),
        ('Salesperson', 31139,3),
        ('Sales Lead', 57012, 3),
        ('HR Manager', 77774, 4),
        ('HR Person', 63874, 4);

-- EMPLOYEE SEEDS -------
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES  ('Cindy', 'Miller',     1,  null),
        ('Xaviar', 'Sanders',   2,  null),
        ('Tom', 'Holland',      3,  null),
        ('Stephanie', 'Soo',    4,  null),
        ('Lawrance', 'Crawford', 5,  4),
        ('Pluto', 'Starlight',  6,  5),
        ('Celine', 'Takahashi', 7,  2),
        ('Rebekah', 'Kim',      8,  3);

UPDATE `employee_db`.`employee` SET `manager_id` = '1' WHERE (`id` > '1');