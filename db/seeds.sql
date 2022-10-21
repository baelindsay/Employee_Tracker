-- DEPARTMENT SEEDS -----
INSERT INTO department (department_name)
VALUES  ('Management'),
        ('The Fashion Design Department'),
        ('Product Development'),
        ('Styling');

-- ROLE SEEDS -------
INSERT INTO role (title, salary, department_id)
VALUES  ('Account manager', 58584, 1),
        ('Stylist', 33463, 4),
        ('Fashion designer', 42017, 2),
        ('Quality assurance manager', 69442, 3),
        ('Sales associate', 31139,4),
        ('Inventory planner', 57012, 1),
        ('Creative director', 77774, 2),
        ('Technical designer', 63874, 3);

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