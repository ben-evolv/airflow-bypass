USE DATABASE <your database>;

CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  department VARCHAR(255) NOT NULL,
  salary FLOAT NOT NULL,
  hire_date TIMESTAMP NOT NULL
);

INSERT INTO employees (id, name, department, salary, hire_date)
VALUES (1, 'John Smith', 'IT', 40000, '2022-01-01');

INSERT INTO employees (id, name, department, salary, hire_date)
VALUES (2, 'Jane Doe', 'HR', 35000, '2022-02-01');

INSERT INTO employees (id, name, department, salary, hire_date)
VALUES (3, 'Bob Johnson', 'Marketing', 45000, '2022-03-01');
