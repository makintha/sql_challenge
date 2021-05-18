-- 1. Import all 3NF table
-- 1a. DEPARTMENTS
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);
-- Check the database
SELECT * FROM departments;

-- 1b. TITLES
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
);
-- Check Database
SELECT * FROM titles;

-- 1c. EMPLOYEES
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
-- Alter the date format
ALTER DATABASE "Employee_db" SET datestyle TO "ISO, MDY"
-- Check the database
SELECT * FROM employees
ORDER BY emp_no ASC;

SELECT COUNT(emp_no) FROM employees 

-- 1d. SALARIES
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
-- Check the database
SELECT * FROM salaries

-- 2. Import all junction tables
-- 2a. DEPT_MANAGERS_JUNC
CREATE TABLE dept_managers_junc (
	dept_no VARCHAR,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
-- Check the database
SELECT * FROM dept_managers_junc

-- 2c. DEPT_MANAGERS_JUNC
CREATE TABLE dept_emp_junc (
	emp_no INT NOT NULL,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
-- Check the database
SELECT * FROM dept_emp_junc



-- JOINING ALL THE JUNCTION TABLES with 3NF TABLES
-- 3a. SALARIES
CREATE TABLE employees_temp AS
	SELECT 
			e.emp_no, 
			e.emp_title_id,
			d.dept_no,
			e.first_name,
			e.last_name,
			e.birth_date,
			e.sex,
			e.hire_date,
			s.salary
	FROM employees AS e
	JOIN dept_emp_junc AS d
  		ON e.emp_no = d.emp_no
	JOIN salaries AS s
  		ON e.emp_no = s.emp_no;
-- );
-- Check the database
SELECT * FROM employees_temp
ORDER BY emp_no ASC;

-- Join The remaining junction table i.e. emp title, dept
CREATE TABLE employees_db AS
	SELECT
			e.emp_no, 
			ti.title,
			d.dept_name,
			e.first_name,
			e.last_name,
			e.birth_date,
			e.sex,
			e.hire_date,
			e.salary
	FROM employees_temp AS e
	JOIN departments AS d
  		ON e.dept_no = d.dept_no
	JOIN titles AS ti
  		ON e.emp_title_id = ti.title_id;
-- );
-- Check the database
SELECT * FROM employees_db
ORDER BY emp_no ASC;

-- Creating Dept Manager Table
CREATE TABLE managers AS
	SELECT
			d.dept_no,
			d.dept_name,
			e.emp_no,
			e.first_name, 
			e.last_name
-- 			e.salary
	FROM dept_managers_junc AS dj
	LEFT JOIN departments AS d
  		ON dj.dept_no = d.dept_no
	LEFT JOIN employees_db AS e
  		ON dj.emp_no = e.emp_no;
		
SELECT * FROM managers;

-- Create Dummy Table Sales_Development Department
CREATE TABLE sales_dev AS
select emp_no, last_name, first_name, dept_name from employees_db
where dept_name = 'Sales' OR dept_name='Development';
select * FROM sales_dev;

-- DATA ANALYSIS


-- DROP TABLE employees_db
-- DROP TABLE employees_temp;
-- DROP TABLE dept_managers_junc;
-- DROP TABLE dept_emp_junc;
-- DROP TABLE departments;
-- DROP TABLE salaries;
-- DROP TABLE employees;
-- DROP TABLE titles;




