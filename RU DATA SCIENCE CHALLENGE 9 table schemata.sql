-- Create employees table
create table employees (
	emp_no INT   NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no)
);

-- Create departments table
create table dept_table (
	dept_no VARCHAR(8) primary key NOT NULL,
	dept_name VARCHAR(40) NOT NULL
	
);
-- Create titles table
create table titles (
	title_id VARCHAR(8) NOT NULL,
	title CA
)
-- Create department employee table

-- Create salaries table

-- Create department manager table

-- Change to_date years that hold year 9999 to current date for dept_manager,
-- dept emp, and titles (salaries table does not have 9999 year)


update dept_manager
set to_date = CURRENT_DATE
where extract(year from to_date) = 9999;

update dept_emp
set to_date = CURRENT_DATE
where extract(year from to_date) = 9999;

update titles
set to_date = CURRENT_DATE
where extract(year from to_date) = 9999;