/*ANALYSIS OF STUDENTS’ SCORES DATA*/

/*1. Extract the student numbers whose scores in “C001” course are higher than “C002” course.*/
SELECT *
FROM (SELECT * FROM SC AS C WHERE C.CNO = 'C001') AS C1,
(SELECT * FROM SC AS C WHERE C.CNO = 'C002') AS C2
WHERE C1.SnO = C2.SnO AND C1.score > C2.score;

/*2. Extract the student number and average score of students whose average score is greater than 60.*/
SELECT SnO as 'Student No.', AVG(score) as 'Average'
FROM SC
GROUP BY Sno
HAVING AVG(score) > 60;

/*3. Extract the entire students’ student number, name, total number of courses and total scores of all courses.  */
SELECT sc.SnO as 'Student No.', st.sname 'Name', count(sc.CNO) 'Total no. of courses', sum(sc.score) as 'Total Scores'
FROM SC sc
JOIN STUDENT st on st.SnO = sc.SnO
GROUP BY 1,2;

/*4. Extract the number of teachers with surname "Liu".*/
SELECT COUNT(*) as 'Number of teacher with surname Liu'
FROM TEACHER t
WHERE t.tname LIKE 'Liu%';

/*5. Extract the student number and name of the students who have not taken any course who are taught by Mr. Chen Yan. */
SELECT stu.SnO as 'Student No.', stu.sname as 'Name'
FROM STUDENT stu
WHERE NOT stu.SnO IN (SELECT distinct sc.SnO FROM SC sc
JOIN (COURSE c) on c.CNO = sc.CNO
JOIN (TEACHER t) on t.TNO = c.TNO
WHERE t.tname = 'Chen Yan'
);

/*6. Extract the student number and names of students who have taken “C001” and “C002” courses.*/
SELECT st.SnO as 'Student No.', st.sname as 'Student Name'
FROM STUDENT st
JOIN (SC p1, SC p2) on st.SnO = p1.SnO AND p1.SnO = p2.SnO
WHERE p1.CNO = 'c001' AND p2.CNO = 'c002' AND st.SnO = p2.SnO;

/*7. Extract the student numbers and names of students who have taken all of the courses taught by Chen Yan. */
SELECT distinct st.SnO as 'Student No.', st.sname as 'Student Name'
FROM STUDENT st
JOIN (COURSE c, TEACHER t, SC sc) on c.TNO= t.TNO AND sc.CNO = c.CNO AND st.SnO = sc.SnO
WHERE t.tname = 'Chen Yan';

/*8. Extract the student numbers and names of students whose scores in the “C002” course are lower than their “C001” course. */
SELECT st.SnO as 'Student No.', st.sname as 'Name'
FROM STUDENT st
JOIN (SELECT cno1.SnO, class1, class2 from
          (SELECT SnO, SCORE AS class1 from SC WHERE SC.CNO = 'c001') as cno1, 
          (SELECT SnO, SCORE AS class2 from SC WHERE SC.CNO = 'c002') as cno2
WHERE cno1.SnO = cno2.SnO AND cno1.class1 < cno2.class2
) r 
on st.SnO = r.SnO;

/*9. Extract the student number and names of students whose scores are less than 60. */
SELECT st.SnO as 'Student No.', st.sname as 'Name'
FROM STUDENT st
JOIN SC as sc on st.SnO = sc.SnO
WHERE sc.score < 60;

/*10. Extract the student number and names of students who did not take all the courses. */
SELECT stu.SnO as 'Student No.', stu.sname as 'Name'
FROM STUDENT stu
WHERE NOT stu.SnO IN
(SELECT distinct sc.SnO FROM SC sc
JOIN (COURSE c) on c.CNO = sc.CNO
JOIN (TEACHER t) on t.TNO = c.TNO
);

/*10. Extract the student number and names of students who shares at least one course with student number “S001”.*/
SELECT distinct st.SnO as 'Student No.', st.sname as 'Student Name'
FROM STUDENT st
JOIN (SC sc) on st.SnO = sc.SnO
WHERE sc.CNO IN (SELECT distinct sc.CNO FROM SC sc
				JOIN STUDENT s on s.SnO = sc.SnO
				WHERE sc.SnO = 's001') AND st.SnO <> 's001';

/*12. Change Zhang San’s scores in the score courses table to the average score of the course. */
UPDATE SC SET score = (SELECT AVG(SCORE) FROM SC
JOIN (COURSE AS course, STUDENT AS student, TEACHER AS teacher) ON course.TNO = teacher.TNO 
AND student.sname = 'Zhang San');

/*13. Extract the student number and names of students who take the same course as student number “S002”.*/ 
SELECT distinct st.SnO as 'Student No.', st.sname as 'Name'
FROM STUDENT st
JOIN (SC sc) on st.SnO = sc.SnO
WHERE sc.CNO IN(SELECT distinct sc.CNO FROM SC sc
				JOIN STUDENT s on s.SnO = sc.SnO
				JOIN COURSE c on c.CNO = sc.CNO
				WHERE sc.SnO = 's002') AND st.SnO <> 's002';

/*14. Delete all records of students who took Chen Yan’s class. */
DELETE FROM SC WHERE SC.CNO IN
(SELECT COURSE.CNO FROM COURSE
JOIN TEACHER AS teacher on COURSE.CNO = TEACHER.CNO
WHERE TEACHER.TNAME = 'Chen Yan');