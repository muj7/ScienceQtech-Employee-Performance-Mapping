-- Q1 

CREATE DATABASE employee 

-- Q3 

SELECT emp_id, GENDER, concat(first_name,, last_name, Department: ', dept) as detalis FROM employee.emp_record_table

-- Q4 

SELECT emp_id, GENDER, concat(first_name,' ', last_name,' Department: ', dept) 
CASE 
    when emp_rating < 2 then 'Less than two' 
    when EMP_RATING > 4 then 'Greater than 4'
    when emp_rating between 2 and 4 then 'Betweem two and four'
    end as EmployeeRating 
FROM employee.emp_record_table 

-- Q5 

SELECT concat(first_name,' ', Last_name) as Name, dept
FROM employee.emp_record_table
where DEPT = 'FINANCE'

-- Q6

SELECT E.EMP_ID,CONCAT(E,FIRST_NAME,' ',E.LAST_NAME) AS EmployeeName,
 M.MANAGER_ID, concat(M.FIRST_NAME,' ', M.LAST_NAME) AS ManagerName,
 M.ROLE AS ROLE
FROM emp_record_table E JOIN emp_reocrd_table M 
ON E.MANAGER_ID = M.EMP_ID;

-- Q7 

SELECT * FROM emp_record_table
WHERE DEPT = 'FINANCE'
UNION
SELECT * FROM emp_record_table
WHERE DEPT = 'HEALTHCARE'

-- Q8 

SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING, MAX(EMP_RATING) OVER (PARTITION BY DEPT)
FROM EMP_RECORD_TABLE 
ORDER BY DEPT;

-- Q9 

SELECT MIN(SALARY), MAX(SALARY), ROLE FROM emp_recored_table
GROUP BY role; 

-- Q10 

SELECT emp_id, first_name, last_name, dept, rank() over(order by exp desc) as YearsExp
from emp_record_table

-- Q11

create view emp_sal as select EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, SALARY 
from emp_record_table
where SALARY > 6000;
SELECT * FROM employee.emp_sal;

-- Q12 

SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP
from emp_record_table
WHERE EXP > 10;

-- Q13

BEGIN 
    SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP
    FORM emp_record_table
    WHERE EXP > 3;
END
DELTMITER;
CALL GEE();

-- Q14 
SELECT emp_id, first_name, last_name, role as currentRole, 
	case
		when EXP <= 2 then 'JUNIOR DATA SCIENTIST'
        when EXP > 2 and EXP <= 5 then 'ASSOCIATE DATA SCIENTIST'
        when EXP > 5 and EXP <= 10 then 'SENIOR DATA SCIENTIST'
        when EXP > 10 and EXP <= 12 then 'LEAD DATA SCIENTIST'
        when EXP > 12 and EXP <= 16 then 'MANAGER'
	end as standard 
FROM data_science_team

-- Q15

create index idx_first_name on employee.emp_record_table(FIRST_NAME(255));
EXPLAIN SELECT EMP_ID, FIRST_NAME, LAST_NAME
FROM employee.emp_record_table 
WHERE FIRST_NAME = 'ERIC';

-- Q16 

SELECT EMP_ID, FIRST_NAME, LAST_NAME, 
ROLE, DEPT, EXP, SALARY, EMP_RATING, (0.05 * SALARY)*EMP_RRATING AS BOUNS
FROM employee.emp_record_table; 

-- Q17 

select EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, CONTINENT, AVG(SALARY)
FROM employee.emp_record_table
group by CONTINENT, COUNTRY; 
