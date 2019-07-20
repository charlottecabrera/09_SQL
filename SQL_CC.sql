Create table departments(
	dept_no varchar not null,
	depat_name varchar not null
); 


Create table dept_emp(	
	emp_no varchar not null,
	dept_no varchar not null,
	from_date varchar not null,
	to_date varchar not null
); 

select * from dept_emp

drop table dept_manager
Create table dept_manager(	
	dept_no varchar not null,
	emp_no varchar not null,
	from_date varchar not null,
	to_date varchar not null
); 

select * from dept_manager

Create table employees(	
	emp_no varchar not null,
	birth_date varchar not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date varchar not null
); 
select * from employees

Create table salaries(	
	emp_no varchar not null,
	salary varchar not null,
	from_date varchar not null,
	to_date varchar not null	
); 

select * from salaries

Create table titles(	
	emp_no varchar not null,
	title varchar not null,
	from_date varchar not null,
	to_date varchar not null	
); 

select * from titles

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
Select e.emp_no,e.last_name, e.first_name,e.gender,s.salary
From salaries As s
INNER JOIN employees AS e ON
e.emp_no = s.emp_no;

--2. List employees who were hired in 1986.
Select * FROM employees WHERE hire_date LIKE '1986%';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.depat_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date

FROM departments AS d

INNER JOIN dept_manager AS m ON

m.dept_no = d.dept_no

JOIN employees AS e ON

e.emp_no = m.emp_no;


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.depat_name

FROM employees AS e

INNER JOIN dept_emp AS d ON

e.emp_no = d.emp_no

INNER JOIN departments AS dp ON

dp.dept_no = d.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees

WHERE first_name LIKE 'Hercules'

AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.depat_name

FROM employees AS e

INNER JOIN dept_emp AS d ON

e.emp_no = d.emp_no

INNER JOIN departments AS dp ON

dp.dept_no = d.dept_no

WHERE dp.depat_name LIKE 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.depat_name

FROM employees AS e

INNER JOIN dept_emp AS d ON

e.emp_no = d.emp_no

INNER JOIN departments AS dp ON

dp.dept_no = d.dept_no

WHERE dp.depat_name LIKE 'Development'

OR dp.depat_name LIKE 'Sales';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.Summary Employ
SELECT last_name, COUNT(*) AS frequency

FROM employees

GROUP BY last_name

ORDER BY frequency DESC;

--My employee ID
SELECT * FROM employees

WHERE emp_no LIKE '499942%';

--my salary 
SELECT * FROM salaries

WHERE emp_no LIKE '499942%';
