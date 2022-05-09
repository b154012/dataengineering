/*1. Query the name and grade of the student who has the highest score in the course taught by Chen Yan. */
SELECT distinct st.sname as 'Student Name', MAX(sc.score) as 'Highest Score'
FROM STUDENT st
JOIN SC sc on st.SnO = sc.SnO
WHERE sc.SnO IN (
SELECT distinct sc.SnO from SC sc
JOIN COURSE c on c.CNO = sc.CNO
JOIN TEACHER t on c.TNO = t.TNO
WHERE t.tname = 'Chen Yan'
)
GROUP BY 1
ORDER BY MAX(sc.score) DESC
LIMIT 2;

/*2. Query each course and the corresponding number of electives. */
SELECT c.CNO as 'Course No.', c.CNAME as 'Course Name', COUNT(*) AS 'Number of Electives'
FROM SC sc, STUDENT st, COURSE c, TEACHER t
WHERE sc.CNO = c.CNO AND st.SnO = sc.SnO AND c.TNO = t.TNO
GROUP BY 1,2;

/*3. Query the student number, course number and student score for students who share the same scores regardless of course. */
SELECT distinct sc1.SnO as 'Student No.', sc1.CNO as 'Course No.', sc1.SCORE as 'Student Score'
FROM SC sc1, SC sc2
WHERE sc1.SCORE = sc2.SCORE AND sc1.CNO <> sc2.CNO
ORDER BY sc1.CNO
LIMIT 2;

/*4. Check the top two students in each course. */
SELECT DISTINCT st.sname as 'Student Name',
sc1.SnO as 'Student No.',
sc1.CNO as 'Course No', 
sc1.score as 'Score' from SC sc1
JOIN STUDENT st on st.SnO = sc1.SnO
WHERE (
	SELECT distinct COUNT(*)
	FROM SC sc2
	WHERE sc2.CNO = sc1.CNO AND sc2.score >= sc1.score
) <= 2
ORDER BY sc1.CNO ASC;

/*another method, not working*/
SELECT *
FROM (
    select s.*,
        rank() over(partition by s.Sno order by s.score desc) rn
    from SC s
) s
where rn <= 2
order by SnO, score desc;

/*5. Extract the highest score, lowest score and average score of each subject in the following form: 
course number, course name, highest score, lowest score, average score, pass rate, good rate, medium rate, 
excellent rate (pass rate >= 50, passing score: 50-70, good score: 80-90, excellent score >= 90).
Output the course number and the number of elective students. 
The query results are arranged in descending order according to the number of elective students. 
If the number of electives is the same, they are arranged in ascending order according to the course number. */
SELECT distinct sc.CNO as 'Course No.', COUNT(*) as 'No. of electives', Max(sc.Score) as 'Highest Score', MIN(sc.Score) as 'Lowest Score', ROUND(AVG(sc.Score),2) as 'Average Score',
CASE WHEN MAX(sc.Score) >= 90 THEN 'Excellent' ELSE 0 END AS 'Rate [100-85]',
CASE WHEN MAX(sc.Score) BETWEEN 80 AND 89 THEN 'Good' ELSE 0 END AS 'Rate [85-89]',
CASE WHEN MAX(sc.Score) BETWEEN 50 AND 69 THEN 'Passed' ELSE 0 END AS 'Rate [50-69]',
SUM(CASE WHEN sc.Score >= 50 THEN 1 ELSE 0 END)/COUNT(*) AS 'Pass Rate'
FROM SC sc
JOIN STUDENT st on st.SnO = sc.SnO
JOIN COURSE c on c.CNO = sc.CNO
GROUP BY sc.CNO
ORDER BY count(*) DESC;

/*6. Search the number of students taking two courses*/
SELECT c.CNAME as 'Course Name', COUNT(c.cno) as 'Number of Students taking two courses'
FROM COURSE c
JOIN (STUDENT st, SC sc, TEACHER t) on sc.CNO = c.CNO AND st.SnO = sc.SnO AND c.TNO = t.TNO
GROUP BY 1
HAVING count(c.CNO) >= 2;

/*7. Query the course number and course name of the course selected by all students.*/
SELECT c.CNO as 'Course No.', c.CNAME as 'Course Name'
FROM SC sc, COURSE c, STUDENT st, TEACHER t
WHERE sc.CNO = c.CNO AND st.SnO = sc.SnO AND c.TNO = t.TNO
GROUP BY 1,2
ORDER BY c.CNO DESC;

/*8.Query the names of students who have never studied any course taught by Liu Yang.*/
SELECT distinct stu.SnO as 'Student No.', stu.sname as 'Student Name'
FROM STUDENT stu
WHERE NOT stu.SnO IN
(SELECT distinct sc.SnO FROM SC sc
JOIN (COURSE c) on c.CNO = sc.CNO
JOIN (TEACHER t) on t.TNO = c.TNO
WHERE t.tname = 'Jiu Yang'
);

/*9.Inquire the student number and average score of students who fail two or more courses.*/
SELECT distinct SnO, AVG(score)
FROM SC
WHERE SnO in (SELECT SnO FROM SC
				WHERE (score)<60
                GROUP BY SnO
                HAVING count(SnO) > 1)
GROUP BY SnO;

/*10.Retrieve the student numbers of students whose “C004” course score is less than 60 in descending order*/
SELECT distinct sc.SnO as 'Student No.', sc.CNO as 'Course No.'
FROM SC sc
JOIN (COURSE c, TEACHER t, STUDENT st) on c.CNO = sc.CNO AND sc.SnO = st.SnO
WHERE sc.score < 60 AND sc.CNO = 'c002'
ORDER BY sc.SnO DESC;

/*11. 11.	Delete the score of the “C001” course for student number “S002”.*/
DELETE FROM SC WHERE sc.SnO = 'S002';
