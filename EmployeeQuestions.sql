--List the employee number, last name, first name, sex, and salary of each employee.
select "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
from "Employees"
join "Salaries"
on "Employees".emp_no = "Salaries".emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from "Employees"
where EXTRACT (year FROM hire_date) = '1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Departments".dept_name, "Departments".dept_no
from "Employees"
join "Dept_manager"
on "Employees".emp_no = "Dept_manager".emp_no
join "Departments"
on "Departments".dept_no = "Dept_manager".dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Departments".dept_name, "Departments".dept_no
from "Employees"
join "Dept_emp"
on "Employees".emp_no = "Dept_emp".emp_no
join "Departments"
on "Departments".dept_no = "Dept_emp".dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from "Employees"
where first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select "Employees".emp_no, "Employees".first_name, "Employees".last_name 
from "Employees"
join "Dept_emp"
on "Employees".emp_no = "Dept_emp".emp_no
join "Departments"
on "Departments".dept_no = "Dept_emp".dept_no
where "Departments".dept_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Departments".dept_name
from "Employees"
join "Dept_emp"
on "Employees".emp_no = "Dept_emp".emp_no
join "Departments"
on "Departments".dept_no = "Dept_emp".dept_no
where "Departments".dept_no = 'd007' or "Departments".dept_no = 'd005';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select (last_name), count(last_name) 
from "Employees"
group by last_name
order by count(last_name) desc;