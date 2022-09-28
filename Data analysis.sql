CREATE VIEW emp1 AS
SELECT 
employees.emp_no,
employees.first_name,
employees.last_name,
employees.sex,
salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;
SELECT * FROM emp1;


CREATE VIEW emp2 AS
SELECT
employees.first_name,
employees.last_name,
employees.hire_date
FROM employees
WHERE date_part('year',hire_date) = 1986;
SELECT * FROM emp2;

CREATE VIEW emp3 AS
SELECT
employees.first_name,
employees.last_name,
employees.emp_no,
dept_manager.dept_no,
departments.dept_name
FROM dept_manager
	INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
		INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;
SELECT * FROM emp3;

CREATE VIEW emp4 AS
SELECT
employees.first_name,
employees.last_name,
employees.emp_no,
departments.dept_name
FROM dept_emp
	INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
		INNER JOIN employees ON employees.emp_no = dept_emp.emp_no;
SELECT * FROM emp4;

CREATE VIEW emp5 AS
SELECT
employees.first_name,
employees.last_name,
employees.sex
FROM employees
	WHERE first_name like 'Hercules' 
	AND last_name like 'B%';
SELECT * FROM emp5;

CREATE VIEW emp6 AS
SELECT
employees.first_name,
employees.last_name,
employees.emp_no,
departments.dept_name
FROM dept_emp

INNER JOIN departments
	ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees 
	ON employees.emp_no = dept_emp.emp_no
WHERE dept_name like '%Sales%'
;
SELECT * FROM emp6;


CREATE VIEW emp7 AS
SELECT
employees.first_name,
employees.last_name,
employees.emp_no,
departments.dept_name
FROM dept_emp

INNER JOIN departments
	ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees 
	ON employees.emp_no = dept_emp.emp_no
WHERE dept_name like '%Sales%' 
OR dept_name like '%Development%'
;
SELECT * FROM emp7;

CREATE VIEW emp8 AS
SELECT
employees.last_name,
COUNT(employees.last_name)
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT(employees.last_name) desc
;
SELECT * FROM emp8;
DROP VIEW emp8 CASCADE