--Data Analysis
--List the employee number, last name, first name, sex, and salary of each employee.
--List the first name, last name, and hire date for the employees who were hired in 1986.

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

--List each employee in the Sales department, including their employee number, last name, and first name.

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--1
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,salaries.salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;

--2
SELECT  first_name,last_name, hire_date FROM employees WHERE hire_date LIKE '%1986'

--3
SELECT  employees.first_name, employees.last_name,departments.dept_name,dept_manager.dept_no,dept_manager.emp_no
FROM dept_manager JOIN employees on dept_manager.emp_no = employees.emp_no
JOIN departments on dept_manager.dept_no = departments.dept_no

--4
SELECT  employees.first_name, employees.last_name,departments.dept_name,dept_emp.dept_no,employees.emp_no
FROM employees JOIN dept_emp ON dept_emp.emp_no = employees.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no

--5
SELECT * FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6
SELECT  departments.dept_name, employees.first_name, employees.last_name, employees.emp_no 
FROM employees JOIN dept_emp ON dept_emp.emp_no = employees.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' 

--7
SELECT  departments.dept_name, employees.first_name, employees.last_name, employees.emp_no 
FROM employees JOIN dept_emp ON dept_emp.emp_no = employees.emp_no JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--8
SELECT last_name, COUNT(last_name) AS Surnames_Frequency_Counts
FROM employees
GROUP BY last_name
ORDER BY Surnames_Frequency_Counts DESC;