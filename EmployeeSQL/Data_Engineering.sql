DROP TABLE Departments;

CREATE TABLE Departments (
	dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(20)
);

SELECT *
FROM Departments;

DROP TABLE Employees;

CREATE TABLE Employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(5),
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) UNIQUE,
	last_name VARCHAR(20) UNIQUE,
	sex VARCHAR(1),
	hire_date DATE NOT NULL,
	FOREIGN KEY(emp_title_id)  references  Titles(title_id),
);

SELECT *
FROM Employees;

DROP TABLE Department_Employees;

CREATE TABLE Department_Employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY(emp_no)  references  Employees(emp_no),
	FOREIGN KEY(dept_no)  references  Departments(dept_no)
);

SELECT *
FROM Department_Employees;

DROP TABLE Department_Managers

CREATE TABLE Department_Managers (
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY(emp_no)  references  Employees(emp_no),
	FOREIGN KEY(dept_no)  references  Departments(dept_no)
);

SELECT *
FROM Department_Managers;

DROP TABLE Salaries

CREATE TABLE Salaries (
	emp_no INT,
	salary INT,
	FOREIGN KEY(emp_no)  references  Employees(emp_no)
);

SELECT *
FROM Salaries

DROP TABLE Titles

CREATE TABLE Titles (
	title_id VARCHAR(5) PRIMARY KEY, 
	title VARCHAR(20)
);

SELECT *
FROM Titles