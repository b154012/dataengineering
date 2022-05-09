SELECT * FROM EMP;
SELECT * FROM DEPT;

/*1. List of all departments with at least one employee.*/
SELECT d.dname as 'Department', COUNT(*) AS 'No. of Employees' FROM EMP as e, DEPT as d
WHERE e.deptno = d.deptno
GROUP BY d.dName
Having count(*) >= 1;

/*2. List of all employees who are paid more than Smith.*/
SELECT DISTINCT * FROM EMP
WHERE Sal > 800
ORDER BY Sal ASC;

/*3. Names of all employees and their managers.*/
SELECT E.ename AS 'Employee name',
M.ename As 'Manager'
FROM EMP E
JOIN EMP M
ON E.Mgr = M.empno;

/*4. List of all employees who joined the company before their managers started employment.*/
SELECT E.ename AS 'Employee',
E.hire_date as 'Employee Hired first',
M.ename As 'Manager',
M.hire_date as 'Manager Hired'
FROM EMP E
JOIN EMP M ON E.Mgr = M.empno
WHERE E.hire_date < M.hire_date;

/*5. Types of jobs with a salary of more than $1500.*/
SELECT job, Sal FROM EMP
WHERE Sal >= 1500
GROUP BY job, Sal;

/*6. List of all employees who joined the company after their managers started employment.*/
SELECT M.ename As 'Manager',
M.hire_date as 'Hired first',
E.ename AS 'Employee',
E.hire_date as 'Employee hired'
FROM EMP E
JOIN EMP M ON E.Mgr = M.empno
WHERE E.hire_date > M.hire_date;

/*7. List the Department name and the employee information of these departments, as well as those departments without employees.*/
SELECT E.*, D.dName, D.LOC
FROM EMP E
JOIN DEPT D ON E.deptno = D.deptno
WHERE D.deptno = any(SELECT deptno FROM EMP);

/*8. List the names of all clerks and their departments.*/
SELECT E.ename,
E.job,
D.dname
FROM EMP E
JOIN DEPT D ON E.deptno = D.deptno
WHERE E.job = 'CLERK';

/*9. List the names of employees who are working in the Sales Department.
Do not specify the department number when running the query (to mimic the real-world scenario of not always remembering the department number). */
SELECT E.empno,
E.ename AS 'Employee',
E.Mgr AS 'Manager',
E.hire_date,
E.Sal,
E.comm,
D.dname,
D.LOC
FROM EMP E
JOIN DEPT D ON E.deptno = D.deptno
WHERE E.job = 'Salesman';

/*10. List of all employees whose salary is higher than the average salary.*/
/*average salary*/
SELECT ROUND(AVG(Sal),2) As AVG_SAL
FROM EMP;

SELECT ename as 'Employee Name',
ROUND(AVG(Sal),2) as 'Salary Average'
FROM EMP
GROUP BY ename
HAVING ROUND(AVG(Sal),2) > (SELECT ROUND(AVG(Sal),2) AS AVERAGE FROM EMP)
ORDER BY ename;
