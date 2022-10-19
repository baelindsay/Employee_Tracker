INSERT INTO department (division)
VALUES  ('Management'),
        ('The Fashion Design Department'),
        ('Product Development'),
        ('Styling');

INSERT INTO role (title, salary, department_id)
VALUES  ('Account manager', 58584, 1),
        ('Stylist', 33463, 4),
        ('Fashion designer', 42017, 2)
        ('Quality assurance manager', 69442, 3),
        ('Sales associate', 31139,4),
        ('Inventory planner', 57012, 1),
        ('Creative director', 77774, 2),
        ('Technical designer', 63874, 3);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES  ('Cindy', 'Miller', 1, null),
        ('Xaviar', 'Sanders', 2, 1),
        ('Tom', 'Holland', 3, null),
        ('Stephanie', 'Soo', 4, 3),
        ('Lawrance', 'Crawford', 5, null),
        ('Pluto', 'Starlight', 6, 5),
        ('Celine', 'Takahashi', 7, null),
        ('Rebekah', 'Kim', 8, 7);