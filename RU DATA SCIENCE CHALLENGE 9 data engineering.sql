--
--Data Engineering SQL code
--


--List following: employee number, last name, first name, sex and salary of each employee
-- *WORKING*
select employees.emp_no, last_name, first_name, sex, salary
from employees
inner join salaries on employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date of employees who were hired in 1986
--WORKING*
select emp_no, last_name, first_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;

--List manager of each dept with dept number, dept name, employee number, last name, and first name
--WORKING--
select department_manager.dept_no, employees.emp_no, employees.last_name, employees.first_name, employees.emp_title
from department_manager, employees
where emp_title = 'm0001';


--List dept number of each employee along with that employee’s employee number, last name, first name, and department name
--Working--

--create a view to make the query easier
CREATE VIEW all_dept_emp AS -- Create view for the joined table
			(SELECT e.emp_no
			 		,e.emp_title
			 		,e.last_name
			 		,e.first_name
			 		
			 		,d.dept_name
			 		,d.dept_no
			FROM 	department_employees as de
					LEFT JOIN employees as e
								ON e.emp_no = de.emp_no
					LEFT JOIN departments as d
			 ON d.dept_no = de.dept_no);
SELECT
		emp_no
		,last_name
		,first_name
		,dept_name
FROM 	all_dept_emp; 




--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
--WORKING--
select last_name, first_name, sex 
from employees
where first_name = 'Hercules' and lower(last_name)  like 'b%'
order by last_name


--make another view bc similar info is needed in next two questions
select distinct on (emp_no) *
into current_dept_emp
from department_employees
order by emp_no;

--List each employee in the Sales department, including their employee number, last name, and first name.
--sales dept = d007
--*WORKING--
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN department_employees AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--sales dept = d007
--development dept = d005
--*WORKING*
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN department_employees AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE (lower(d.dept_name) = 'sales') or (lower(d.dept_name) = 'development')
ORDER BY e.emp_no;


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--WORKING--
select last_name, count(last_name) as Frequency
from employees
group by last_name
order by Frequency desc;
