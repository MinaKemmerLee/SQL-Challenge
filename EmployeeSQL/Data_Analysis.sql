--1.List the employee number, last name, first name, sex, and salary of each employee

SELECT employees.emp_no, 
  employees.last_name, 
  employees.first_name, 
  employees.sex, 
  salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;


--2.List the first name, last name, and hire date for the employees who were hired in 1986. 

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--3.List the manager of each department along with their department number, 
--department name, employee number, last name, first name.  

SELECT department_managers.dept_no, 
  departments.dept_name, 
  employees.emp_no, 
  employees.last_name, 
  employees.first_name
FROM employees
INNER JOIN department_managers ON
employees.emp_no = department_managers.emp_no
INNER JOIN departments ON
department_managers.dept_no = departments.dept_no;

--4.List the department number for each employee along with that employee’s 
--employee number, last name, first name and department name. 

SELECT department_employees.dept_no, 
  department_employees.emp_no, 
  employees.last_name, 
  employees.first_name,
  departments.dept_name
FROM employees
INNER JOIN department_employees ON
employees.emp_no = department_employees.emp_no
INNER JOIN departments ON
department_employees.dept_no = departments.dept_no;


--5.List the first name, last name, and the sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B. 

SELECT first_name, last_name, sex
FROM employees
WHERE first_name= 'Hercules' AND last_name LIKE 'B%';


--6.List each employee in the Sales Department, including their employee number,
--last name, and first name. 

SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
JOIN department_employees ON 
employees.emp_no = department_employees.emp_no
JOIN departments ON 
department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


--7.List each employee in the sales and development departments,including 
--their employee number, last name, first name, and department number. 

SELECT employees.emp_no, employees.last_name, employees.first_name, department_employees.dept_no
FROM employees
JOIN department_employees ON 
employees.emp_no = department_employees.emp_no
JOIN departments ON 
department_employees.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');


--8.List the frequency counts, in descending order, of all the employee 
--last names (that , how many employees share each last name) 

SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;