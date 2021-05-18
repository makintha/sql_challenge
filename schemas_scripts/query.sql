-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	distinct emp_no,
	last_name,
	first_name,
	sex,
	salary
FROM employees_db
ORDER BY (emp_no) ASC

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	distinct (first_name),
	last_name,
	hire_date
FROM employees_db
WHERE
	hire_date between '1986-01-01' and '1986-12-31'

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT * FROM managers;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT 
	emp_no,
	last_name,
	first_name,
	dept_name
FROM employees_db
ORDER BY emp_no ASC;

-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name,
	last_name,
	sex
FROM employees_db
WHERE
	first_name LIKE 'Hercules' and  last_name LIKE 'B%';


-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT 
	emp_no,
	last_name,
	first_name,
	dept_name
FROM employees_db
WHERE 
	dept_name='Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name
-- Query the employee that working in Sales and Develepment Departments
SELECT *
FROM sales_dev
WHERE emp_no IN (
    SELECT emp_no
    FROM sales_dev
    GROUP BY emp_no
    HAVING COUNT(distinct dept_name) > 1 );

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 	

-- 8. In descending order, list the frequency count of employee last names, i.e.,
-- how many employees share each last name.
SELECT last_name, count(last_name)
FROM employees_db
GROUP BY (last_name)
ORDER BY count(last_name) DESC