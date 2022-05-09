/*STUDENTS’ SCORES DATA*/
use zulmi;

CREATE TABLE STUDENT (
	SnO VARCHAR(10) PRIMARY KEY,
    sname VARCHAR(20),
    sage INT (2),
    ssex VARCHAR(6)
);

CREATE TABLE TEACHER (
	TNO VARCHAR(10) PRIMARY KEY,
    tname VARCHAR(20)
);

CREATE TABLE COURSE (
	CNO VARCHAR(10),
    CNAME VARCHAR(20),
    TNO VARCHAR(20),
    CONSTRAINT PK_Course PRIMARY KEY(CNO, TNO)
);

CREATE TABLE SC (
	SnO VARCHAR(20),
    CNO VARCHAR(20),
    score DECIMAL(4,2),
    CONSTRAINT PK_SC PRIMARY KEY(SnO, CNO)
);

INSERT INTO STUDENT (SnO, sname, sage, ssex)
VALUES ('s001', 'Zhang San', 23, 'male'),
		('s002', 'Li Si', 23, 'male'),
        ('s003', 'Wu Peng', 25, 'male'),
        ('s004', 'Qinqin', 20, 'female'),
        ('s005', 'Wang Li', 20, 'female'),
        ('s006', 'Li Bo', 21, 'male'),
        ('s007', 'Liu Yu', 21, 'male'),
        ('s008', 'Xiao Rong', 21, 'female'),
        ('s009', 'Chen Xiaoxiao', 23, 'female'),
        ('s010', 'Chen Mei', 22, 'female');

SELECT * FROM STUDENT;

INSERT INTO TEACHER (TNO, tname)
VALUES ('t001', 'Jiu Yang'),
       ('t002', 'Chen Yan'),
       ('t003', 'Hu Mingxing');
       
SELECT * FROM TEACHER;

INSERT INTO COURSE (CNO, CNAME, TNO)
VALUES ('c001', 'J2SE', 't002'),
       ('c002', 'Java Web', 't002'),
       ('c003', 'SSH', 't001'),
       ('c004', 'Oracle', 't001'),
       ('c005', 'SQL SERVER 2005', 't003'),
       ('c006', 'C#', 't003'),
       ('c007', 'JavaScript', 't002'),
       ('c008', 'DIV+CSS', 't001'),
       ('c009', 'PHP', 't003'),
       ('c010', 'EJB3.0', 't002');
       
SELECT * FROM COURSE;
DROP TABLE COURSE;

INSERT INTO SC (SnO, CNO, score)
VALUES ('S001', 'c001', 78.9),
       ('S002', 'c001', 80.9),
       ('S003', 'c001', 81.9),
       ('S004', 'c001', 60.9),
       ('S001', 'c002', 82.9),
       ('S002', 'c002', 72.9),
       ('S003', 'c002', 81.9),
       ('S001', 'c003', 59);
       
SELECT * FROM SC;
DROP TABLE SC;

CREATE TABLE EMP (
	empno INTEGER,
    ename VARCHAR(20),
    job VARCHAR(10),
    Mgr INTEGER,
    hire_date date,
    Sal INTEGER,
    comm INTEGER,
    deptno INTEGER(2),
    primary key (empno),
    foreign key (deptno) References DEPT(deptno)
);

SELECT * FROM EMP;
DROP TABLE EMP;

CREATE TABLE DEPT (
	deptno INTEGER(2) PRIMARY KEY,
    dName VARCHAR(20),
    LOC VARCHAR(30)
);

INSERT INTO DEPT (deptno, dName, LOC)
VALUES (10, 'ACCOUNTING', 'NEW YORK'),
       (20, 'RESEARCH', 'DALLAS'),
       (30, 'SALES', 'CHICAGO'),
       (40, 'OPERATIONS', 'BOSTON');
       
SELECT * FROM DEPT;
DROP TABLE EMP;

INSERT INTO EMP (empno, ename, job, Mgr, hire_date, Sal, comm, deptno)
VALUES (7369, 'SMITH','CLERK', 7902, str_to_date('17-12-1980', '%d-%m-%Y'), 800, null, 20),
       (7499, 'ALLEN','SALESMAN', 7698, str_to_date('20-02-1981', '%d-%m-%Y'), 1600, 300, 30),
       (7521, 'WARD','SALESMAN', 7698, str_to_date('22-02-1981', '%d-%m-%Y'), 1250, 500, 30),
       (7566, 'JONES','MANAGER', 7839, str_to_date('02-04-1981', '%d-%m-%Y'), 2975, null, 20),
       (7654, 'MARTIN','SALESMAN', 7698, str_to_date('28-09-1981', '%d-%m-%Y'), 1250, 1400, 30),
       (7698, 'BLACK','MANAGER', 7839, str_to_date('01-05-1981', '%d-%m-%Y'), 2850, null, 30),
       (7782, 'CLARK','MANAGER', 7839, str_to_date('09-06-1981', '%d-%m-%Y'), 2450, null, 10),
       (7788, 'SCOTT','ANALYST', 7566, str_to_date('19-04-1987', '%d-%m-%Y'), 3000, null, 20),
       (7839, 'KING','PRESIDENT', null, str_to_date('17-11-1981', '%d-%m-%Y'), 5000, null, 10),
       (7844, 'TURNER','SALESMAN', 7698, str_to_date('08-09-1981', '%d-%m-%Y'), 1500, 0, 30),
       (7876, 'ADAMS','CLERK', 7788, str_to_date('23-05-1987', '%d-%m-%Y'), 1100, null, 20),
       (7900, 'JAMES','CLERK', 7698, str_to_date('03-12-1981', '%d-%m-%Y'), 950, null, 30),
       (7902, 'FORD','ANALYST', 7566, str_to_date('03-12-1981', '%d-%m-%Y'), 3000, null, 20),
       (7934, 'MILLER','CLERK', 7782, str_to_date('23-01-1982', '%d-%m-%Y'), 1300, null, 10);

SELECT * FROM EMP;
SELECT * FROM COURSE;
SELECT * FROM SC;