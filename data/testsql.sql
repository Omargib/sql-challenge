CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * FROM titles;

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);
UPDATE employees SET birth_date = TO_DATE (birth_date,'dd/mm/yyyy')
UPDATE employees SET hire_date = TO_DATE (hire_date,'mm/dd/yyyy')

SELECT * FROM employees;

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM salaries;

SELECT * FROM dept_manager

SELECT * FROM departments
-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees AS e
	LEFT JOIN salaries AS s 
	ON (e.emp_no = s.emp_no)
	
-- 2. List first name, last name, 
-- and hire date for employees who were hired in 1986.	
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
	  AND hire_date < '1987-01-01'

-- 3. List the manager of each department with the following information:
-- department number, department name, 
-- the manager's employee number, last name, first name.

SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	m.dept_no,
    d.dept_name
FROM
 employees e

INNER JOIN 
 dept_manager m
	ON m.emp_no = e.emp_no
INNER JOIN 
 departments d
	ON d.dept_no = m.dept_no
ORDER BY emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
    d.dept_name
FROM
 employees e
INNER JOIN 
 dept_emp m
	ON m.emp_no = e.emp_no
INNER JOIN 
 departments d
	ON d.dept_no = m.dept_no
ORDER BY emp_no;

-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

SELECT 
	first_name,
	last_name,
	sex
FROM
	employees
WHERE 
	first_name = 'Hercules';

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name,
-- and department name.
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
    d.dept_name
FROM
 employees e
INNER JOIN 
 dept_emp m
	ON m.emp_no = e.emp_no
INNER JOIN 
 departments d
	ON d.dept_no = m.dept_no
WHERE 
	dept_name = 'Sales'
ORDER BY emp_no;

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, 
-- and department name.

SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
    d.dept_name
FROM
 employees e
INNER JOIN 
 dept_emp m
	ON m.emp_no = e.emp_no
INNER JOIN 
 departments d
	ON d.dept_no = m.dept_no
WHERE 
	dept_name = 'Sales' OR dept_name = 'Development' 
ORDER BY emp_no;

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT
	last_name,
	COUNT (last_name)
FROM
	employees
GROUP BY	
	last_name
ORDER BY count;

	
