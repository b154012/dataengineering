SELECT * FROM EMP;
SELECT * FROM DEPT;

/*1.List all department numbers and names with at least one employee, and calculate the average wage, minimum wage and maximum wage of these departments.*/
SELECT D.deptno as 'Department No.', D.dName as 'Department Name', ROUND(AVG(E.Sal),2) as 'Average wage', Min(E.Sal) as 'Minimum wage', Max(E.Sal) as 'Maximum wage'
FROM EMP E
JOIN DEPT D on E.deptno = D.deptno
GROUP BY 1,2
HAVING COUNT(D.deptno) > 1
ORDER BY D.deptno;

/*2.List the number, name, department name and leader name of all employees whose salary is more than "Smith" or "Allen".*/
SELECT E.empno as 'Number', E.ename as 'Name', D.dName as 'Department Name', M.ename as 'Manager Name'
FROM EMP E
JOIN EMP M on E.Mgr = M.empno
JOIN DEPT D on D.deptno = E.deptno
WHERE E.Sal > any(SELECT Sal FROM EMP WHERE ename = 'Smith' OR ename = 'Allen') AND E.ename <> 'Smith' AND E.ename <> 'Allen' 
GROUP BY E.empno;

/*3.List the number and name of all employees and the number and name of their managers. The displayed results are arranged in descending order of annual salary of their leaders.*/
SELECT E.empno as 'Employee No.', E.ename as 'Employee Name', M.empno as 'Manager No.', M.ename as 'Manager Name'
FROM EMP E
JOIN EMP M on E.Mgr = M.empno
GROUP BY 1,2,3,4
ORDER BY (M.Sal*12) DESC;

/*4.  the number, name, department name, department location and number of all employees whose employment date is earlier than their managers.*/
SELECT E.empno as 'Employee No.', E.ename as 'Employee Name', D.dName as 'Department', D.LOC as 'Location', D.deptno as 'Department No.'
FROM EMP E
JOIN DEPT D on D.deptno = E.deptno
JOIN EMP M on E.Mgr = M.empno
WHERE E.hire_date > M.hire_date 
GROUP BY 1,2,3,4,5
ORDER BY E.ename;

/*5. List the department name and the employee information (number of employees and average salary) of these departments, as well as those departments without employees.*/
SELECT D.dName AS 'Department Name', Count(E.empno) as 'No. of employee', ROUND(AVG(E.Sal),2) as 'Average Salary'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
WHERE D.deptno >= any(select deptno FROM EMP)
GROUP BY D.dName;

/*6. CONT List the names of all clerks and their departments, the number of people in each department, and the salary scale.*/
SELECT E.ename as 'Employee Name', D.dName as 'Department Name', COUNT(D.deptno) as 'Number of Employees', CASE WHEN E.Sal BETWEEN 2000 AND 10000 THEN 1 ELSE 0 END AS 'Salary [Above 2000]',
CASE WHEN E.Sal BETWEEN 1000 AND 2000 THEN 1 ELSE 0 END AS 'Salary [1000-2000]',
CASE WHEN E.Sal < 1000 THEN 1 ELSE 0 END AS 'Salary [< 1000]'
FROM EMP E
JOIN DEPT D on D.deptno = E.deptno
WHERE E.job = 'Clerk'
GROUP BY E.ename, D.dName, E.Sal;

/*7.List all kinds of jobs with a salary of more than $1,500 and the number of employees engaged in this job, as well as the name, location and average salary of the department.*/
SELECT E.job as 'Job Title', COUNT(D.deptno) as 'Number of  Employees', D.dName as 'Department', D.LOC as 'Location', ROUND(AVG(E.Sal),2) as 'Average Salary'
FROM EMP E
JOIN DEPT D on D.deptno = E.deptno
WHERE E.Sal > 1500
GROUP BY E.job, D.dName, D.LOC
ORDER BY E.job ASC;

/*8.List the name, basic salary, date of employment and names of employees working in the sales department.  
Do not specify the department number when running the query (to mimic the real-world scenario of not always remembering the department number).*/
SELECT E.ename as 'Employee Name', E.Sal as 'Salary', E.hire_date as 'Date of Employment'
FROM EMP E
JOIN DEPT D on D.deptno = E.deptno
WHERE D.dName IN (
	SELECT distinct dName as Department FROM DEPT
    WHERE dName = 'Sales'
)
GROUP BY 1,2,3
ORDER BY hire_date ASC;

/*9. List all employees whose salary is higher than the average salary of the company. Display their department, their superiors and their salary grades.*/
SELECT E.deptno as 'Department No.', D.dName as 'Department Name', M.ename as 'Superior', CASE WHEN E.Sal BETWEEN 2000 AND 10000 THEN 1 ELSE 0 END AS 'Salary [Above 2000]',
CASE WHEN E.Sal BETWEEN 1000 AND 2000 THEN 1 ELSE 0 END AS 'Salary [1000-2000]',
CASE WHEN E.Sal < 1000 THEN 1 ELSE 0 END AS 'Salary [< 1000]'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
JOIN EMP M on E.Mgr = M.empno
WHERE E.Sal > all(SELECT AVG(Sal) FROM EMP)
ORDER BY D.deptno;

/*10. List the names of all employees and departments engaged in the same work as "Scott" and the department number.*/
SELECT E.ename as 'Employee Name', D.dName as 'Department', D.deptno as 'Department No.'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
JOIN EMP M on E.Mgr = M.empno
WHERE (E.job = 'Analyst' OR M.job = 'Analyst' OR D.dName = 'Research' OR M.ename = 'Scott') AND E.ename <> 'Scott';

/*11. List the number and average salary of employees in each salary grade in the company.*/
SELECT Count(E.Sal) AS 'No. of employee', ROUND(AVG(E.Sal),2) as 'Average Salary', sum(CASE WHEN E.Sal BETWEEN 5000 AND 10000 THEN 1 ELSE 0 END) AS 'Salary [Above/= 5000]',
sum(CASE WHEN E.Sal BETWEEN 4000 AND 4999 THEN 1 ELSE 0 END) AS 'Salary [4000-5000]',
sum(CASE WHEN E.Sal BETWEEN 3000 AND 3999 THEN 1 ELSE 0 END) AS 'Salary [Above 3000]',
sum(CASE WHEN E.Sal BETWEEN 2000 AND 2999 THEN 1 ELSE 0 END) AS 'Salary [2000-3000]',
sum(CASE WHEN E.Sal BETWEEN 999 AND 1999 THEN 1 ELSE 0 END) AS 'Salary [1000-2000]',
sum(CASE WHEN E.Sal <= 1000 THEN 1 ELSE 0 END) AS 'Salary [Less than 1000]'
FROM EMP E
JOIN DEPT D on D.deptno = E.deptno
GROUP BY E.Sal
ORDER BY AVG(E.Sal) ASC;

/*12. List the names of employees whose salaries are higher than all of the employees working in department 30. Display their salaries and department names also.*/
SELECT E.Sal as 'Salary', D.dName as 'Department'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
WHERE E.Sal > All(SELECT Sal FROM EMP WHERE deptno = 30)
ORDER BY Sal;

/*13.List the name, department name and salary of all employees.*/
SELECT E.ename as 'Employee Name', D.dName as 'Department', E.Sal as 'Salary'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
ORDER BY E.ename ASC;

/*14. List all department details and department numbers.*/
SELECT COUNT(*) as 'No. of Employees', ROUND(AVG(E.Sal),2) as 'Average Salary', D.dName as 'Department', D.LOC as 'Location', D.deptno as 'Department No.'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
WHERE D.deptno >= any(SELECT deptno FROM EMP)
GROUP BY D.dName, D.LOC, D.deptno;

/*15. List the minimum salary for each job and the name of the employee earning the minimum salary.*/
SELECT E.Sal as 'Minimum Salary', E.job 'Job', E.ename as 'Employee Name'
FROM EMP E
WHERE (E.job, E.Sal) IN (SELECT job, MIN(Sal) FROM EMP GROUP BY job)
ORDER BY E.Sal ASC;

/*Another method*/

SELECT E.Sal as 'Minimum Salary', E.job 'Job', E.ename as 'Employee Name'
FROM (SELECT *, RANK() OVER(PARTITION BY job ORDER BY Sal) AS r FROM EMP) E
WHERE r = 1
ORDER BY E.Sal ASC;

/*16. List the minimum salary, name, department name and number of managers in each department.*/
SELECT Min(M.Sal) as 'Minimum Salary', M.ename as 'Manager Name', D.dName as 'Department', count(D.dName) as 'Number of Managers'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
JOIN EMP M on E.Mgr = M.empno AND M.deptno = D.deptno
GROUP BY M.ename, D.dName;

/*17. List the annual salary of all employees, the name of their department, and sort them by annual salary from low to high.*/
SELECT E.Sal*12 as'Annual Salary', D.dName as 'Department'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
ORDER BY Sal ASC;

/*18.Query the names of managers whose salary exceeds $3,000, and their departments.*/
SELECT DISTINCT M.ename as 'Manager Name', D.deptno as 'Department No.', D.dName as 'Department'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
JOIN EMP M on E.Mgr = M.empno AND M.deptno = D.deptno
WHERE M.Sal > 3000;

/*19. Calculate the total salary and the number of employees who shares at least 1 character that appears in the Department name.*/
SELECT sum(E.Sal) as 'Total Salary', Count(E.ename) as 'No. of Employees that shares at least 1 character in Dept Name'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
WHERE E.ename LIKE '%a%' OR E.ename LIKE '%e%' OR E.ename LIKE '%i%' OR E.ename LIKE '%o%' OR E.ename LIKE '%u%';

/*20. For employees who have been in office for more than 30 years or have been employed in 1987, 
the principle of salary increase is: 10% for department no. 10, 20% for department no. 20, 30% for department no. 30, and so on.*/
SELECT E.Sal as 'Salary', (CASE WHEN D.deptno = 10 THEN ROUND((E.Sal*0.1)+E.Sal) ELSE 0 END) as 'Salary increments by 10%',
(CASE WHEN D.deptno = 20 THEN ROUND((E.Sal*0.2)+E.Sal) ELSE 0 END) as 'Salary increments by 20%',
(CASE WHEN D.deptno = 30 THEN ROUND((E.Sal*0.3)+E.Sal) ELSE 0 END) as 'Salary increments by 30%',
(CASE WHEN D.deptno = 40 THEN ROUND((E.Sal*0.4)+E.Sal) ELSE 0 END) as 'Salary increments by 40%'
FROM DEPT D
JOIN EMP E on E.deptno = D.deptno
WHERE YEAR(hire_date) >= 1987 OR ((YEAR(CURRENT_DATE) - YEAR(hire_date)) > 30);
