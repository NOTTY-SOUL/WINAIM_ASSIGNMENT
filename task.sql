CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);


CREATE TABLE salaries (
    employee_id INT,
    salary DECIMAL(10, 2),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO departments (department_id,department_name) values
(1,Software),(2,Sales),(3,Marketing),(4,Hardware);

INSERT INTO employees (employee_id,first_name,last_name,department_id,,hire_date) values
(101,'Balaji','Govind',1,'2023-06-15'),(102,'Deepak','Raj',2,'2023-01-10'),(103,'Keerthi','R',3,'2022-10-11'),
(104,'Azar','Khan',1,'2023-02-11'),(105,'Stanly','paul',4,'2022-09-14');

Insert INTO salaries (employee_id,salary,from_date,to_date) values
(101,45000,'2023-07-01','2024-07-01'),(102,60000,'2023-03-01','2024-03-01'),(103,50000,'2022-12-01','2023-12-01'),
(104,70000,'2023-04-01','2025-04-01'),(105,55000,'2022-11-01','2024-11-01');

--QUERY 1
SELECT *
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

--QUERY 2
SELECT d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
LEFT JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_name;

--QUERY 3
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, s.salary
FROM employees e
INNER JOIN salaries s ON e.employee_id = s.employee_id
INNER JOIN departments d ON e.department_id = d.department_id
ORDER BY s.salary DESC
LIMIT 5;


