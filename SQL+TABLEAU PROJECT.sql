
/*
Task 1-Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990.
*/

/*solution*/

/*select year(d.from_date) as calendar_year, e.gender,
  count(e.emp_no) as num_of_employees
     from 
     t_employees e
join t_dept_emp d
 on d.emp_no=e.emp_no
   group by calendar_year,e.gender
having calendar_year>=1990;*/

/*  Task 2 - Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.
*/

/*Solution*/

/*Select d.dept_name,ee.gender,dm.emp_no,dm.from_date,dm.to_date,e.calendar_year,
  Case when year(dm.to_date)>=e.calendar_year and 
    year (dm.from_date)<=e.calendar_year THEN 1 ELSE 0
      End as active
        from 
	(select year(hire_date) as calendar_year
     from 
     t_employees
	group by calendar_year)e
    cross join
     t_dept_manager dm
      join
	t_departments d
      on dm.dept_no=d.dept_no
       join
	t_employees ee
     on dm.emp_no=ee.emp_no
	order by dm.emp_no,calendar_year;*/

/*Task 3 – Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department.
*/

/*solution*/

   /*Select e.gender,d.dept_name,round(avg(salary),2) as salary,
    year(s.from_date) as calendar_year
	from t_salaries s
     join
	t_employees e
on s.emp_no=e.emp_no
 join
t_dept_emp de 
 on de.emp_no=e.emp_no
   join
t_departments d
 on d.dept_no=de.dept_no
group by d.dept_no,e.gender,calendar_year
 having calendar_year<=2002
  order by d.dept_no;*/
     
/*Task 4 - Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. 
 Let this range be defined by two values the user can insert when calling the procedure. Finally visualize the obtained result-set in Tableau as a double bar chart.*/
 
 /*Solution*/
 
 /*Drop procedure if exists filter_salary;
 
 Delimiter $$
  create procedure filter_salary (in p_min_salary FLOAT,in p_max_salary FLOAT)
    Begin
select e.gender,d.dept_name,Avg(s.salary) as avg_salary
  from t_salaries s
    join
t_employees e on s.emp_no=e.emp_no
  join
t_dept_emp de on de.emp_no=e.emp_no
 join
 t_departments d on d.dept_no=de.dept_no
  where s.salary BETWEEN p_min_salary and P_max_salary
   group by d.dept_no,e.gender;
    end$$
     
	delimiter ;
 call filter_salary(50000,90000);*/  
 

 

	

