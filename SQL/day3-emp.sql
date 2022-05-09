SELECT * FROM EMP;
SELECT * FROM DEPT;

/*1. List of all employees engaged in the same work as “Scott”. */
SELECT distinct E.*
FROM EMP E
JOIN EMP O on E.job = O.job
WHERE O.job = 'Analyst';

/*2. List the names and salaries of all employees whose salaries are equal to those of employees in department 30. */
SELECT E.ename AS 'Employee Name', E.Sal AS 'Salary'
FROM EMP E
WHERE E.sal = any(SELECT Sal FROM EMP WHERE deptno = 30);

/*3. List the names and salaries of employees whose salaries are higher than those of all employees working in department 30.*/
SELECT E.ename AS 'Employee Name', E.Sal AS 'Salary'
FROM EMP E
WHERE E.sal > ALL(SELECT Sal FROM EMP WHERE deptno = 30);

/*4. List the number of employees working in each department, average salary and average duration of service. 
FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(E.hire_date))) */
SELECT D.dName as 'Department', Count(D.dName) as 'No. of Employees', round(avg(E.Sal),2) as 'Avg Salary', FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(E.hire_date))) as 'Average Duration of Service'
FROM EMP E
JOIN DEPT D on E.deptno = D.deptno
GROUP BY 1;

/*5. List the name, department name and salary of all employees. */
SELECT E.ename as 'Employee Name', D.dName as 'Department', E.Sal as 'Salary'
FROM EMP E
JOIN DEPT D ON E.deptno = D.deptno;

/*6. List all department details and department numbers. */
SELECT distinct  D.dName as 'Department', D.LOC as 'Location',
D.deptno as 'Department Number',
E.empno as 'Employee No.',
E.ename as 'Name',
E.job as 'Job',
E.Mgr as 'Manager',
E.hire_date as 'Hire Date',
E.Sal as 'Salary',
E.comm as 'Commission'
FROM DEPT D
JOIN (EMP E) ON D.deptno = E.deptno;

/*7. List the minimum wage for various jobs. */
SELECT E.job as 'Job', Min(E.Sal) as 'Minimum Wage per Job'
FROM EMP E
GROUP BY E.Job
ORDER BY Min(E.Sal) Desc;

/*8. List the minimum salary of manager in each department. */
SELECT distinct D.dName AS 'Department',
Min(M.Sal) as 'Minimum Salary Of Manager'
FROM EMP E
JOIN (EMP M, DEPT D) ON E.Mgr = M.empno AND M.deptno = D.deptno
GROUP BY 1
ORDER BY D.dName ASC;

/*9. List the annual salary of all employees, sorted from low to high. */
SELECT E.*, (E.Sal *12) AS 'Annual Salary'
FROM EMP E
ORDER BY (E.Sal*12) DESC;

/*10. List the name of managers. */
SELECT distinct M.ename As 'Manager'
FROM EMP E
JOIN EMP M ON E.Mgr = M.empno;

/*11. Extract the maximum salary (Note: Do not use group function to get the maximum salary). */
SELECT E.*
FROM EMP E
ORDER BY E.Sal DESC
Limit 1