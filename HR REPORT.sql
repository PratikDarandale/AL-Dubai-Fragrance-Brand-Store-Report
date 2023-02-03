use hr;

select * from department_data ;
select * from employees_data ;
select * from locations_data ;

# Q-1 Find the number of employees working in the 'Sales' department

#SELECT count(DEPARTMENT_NAME) from department_data WHERE DEPARTMENT_NAME="Sales"

#select count(*) as number_of_employees working_in_the_Sales_department from department data where DEPARTMENT NAME="Sales")

select count(*) as Number_OF_EMP_from_Sales from (select DEPARTMENT_NAME from department_data where DEPARTMENT_NAME="Sales") as count;

# Q.2.	Join the 3 tables and find the country-id wise count of employees and the avg salary.
# Which country has the maximum number of employees and which country has the maximum average salary?

select lc.COUNTRY_ID, avg(ep.SALARY),count(*)as Number_of_EMP
from employees_data as ep
join department_data as dp on ep.DEPARTMENT_ID=dp.DEPARTMENT_ID
join locations_data as lc
on(dp.DEPARTMENT_ID=ep.DEPARTMENT_ID and dp.LOCATION_ID=lc.LOCATION_ID)
group by COUNTRY_ID
HAVING MAX(ep.SALARY)=(SELECT MAX(AVG(ep.SALARY)) from employees_data group by COUNTRY_ID);


#Q.4.	Find the top 5 managers according to their salary.

select MANAGER_ID,SALARY from employees_data group by MANAGER_ID order by SALARY desc limit 5;

#Q.55.	Find the department name-wise percentage of employees working under each department.
# Which department is having the maximum percentage of employees?

select dp.DEPARTMENT_NAME , count(ep.EMPLOYEE_ID)/107*100 as EMP_Percentage 
from employees_data ep
join department_data dp on
ep.DEPARTMENT_ID=dp.DEPARTMENT_ID
group by DEPARTMENT_NAME
order by EMP_Percentage desc;

select count(*) from  employees_data ;

#Q.6. Find which employee gets higher salary and from which department 

select EMPLOYEE_ID ,DEPARTMENT_NAME, max(SALARY) from employees_data ep
join department_data dp on 
ep.DEPARTMENT_ID=dp.DEPARTMENT_ID
group by DEPARTMENT_NAME
order by SALARY desc limit 1;