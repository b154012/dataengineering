/*1. Insert some records into the course scores table for:  
students who have not taken “C002” course 
students who are taking the “C002” course and score the average score for “C002” course. */
INSERT INTO SC (SnO, CNO, SCORE)
SELECT DISTINCT  student.SnO,
SC.SnO,
(SELECT avg(SCORE) FROM SC WHERE CNO ='c002')
FROM STUDENT student, SC
WHERE NOT EXISTS
(SELECT * FROM SC WHERE CNO = 'c002' AND SC.SnO = student.SnO) AND SC.CNO = 'c002';

/*students who are taking the “C002” course and score the average score for “C002” course.*/
INSERT INTO SC (SnO, CNO, SCORE)
SELECT DISTINCT  student.SnO,
SC.SnO,
(SELECT avg(SCORE) FROM SC WHERE CNO ='c002')
FROM STUDENT student, SC
WHERE EXISTS
(SELECT * FROM SC WHERE CNO ='c002' AND SC.SnO = student.SnO) AND SC.CNO ='c002';

SELECT * FROM SC;

/*2. Extract the highest and lowest scores of each course, and output as follows: course number, highest score, lowest score. */
SELECT CNO as 'Course No.', MAX(SCORE) as 'Highest Score', MIN(SCORE) as 'Lowest Score' FROM SC
GROUP BY CNO;

/*3. Sort the average score of each course from low to high and the percentage of passing rate from high to low.*/
SELECT CNO as 'Course No.', AVG(SCORE) as 'Average Score', SUM(CASE WHEN SCORE>=60 THEN 1 ELSE 0 END)/COUNT(*) AS 'PASS RATE'
FROM SC
GROUP BY CNO
ORDER BY avg(SCORE);

/*4. Extract the average score of different courses taught by different teachers in descending order.*/
SELECT t.TNO as 'Teacher No.', t.tname as 'Teacher Name', c.CNO as 'Course No.', c.CNAME as 'Course Name', ROUND(AVG(s.SCORE),2) as 'Average Score'
FROM STUDENT st, COURSE c, SC s, TEACHER t
WHERE c.TNO = t.TNO AND c.CNO = s.CNO
GROUP BY t.TNO, t.tname, c.CNO, c.CNAME
ORDER BY avg(s.SCORE) DESC;

/*5. Count the number of students in each score groups: course number, 
course name, [100-85], [85-70], [70-60], [< 60] and the percentage. */
SELECT c.CNO as 'Course No.', c.CNAME AS 'Course',
sum(CASE WHEN s.SCORE BETWEEN 85 AND 100 THEN 1 ELSE 0 END) AS '[100-85]',
sum(CASE WHEN s.SCORE BETWEEN 70 AND 85 THEN 1 ELSE 0 END) AS '[85-70]',
sum(CASE WHEN s.SCORE BETWEEN 60 AND 70 THEN 1 ELSE 0 END) AS '[70-60]',
sum(CASE WHEN s.SCORE < 60 THEN 1 ELSE 0 END) AS '[< 60]'
FROM COURSE c, SC s
WHERE s.CNO = c.CNO
GROUP BY 1,2;

/*6. Extract the records of the top three scores in each subject. */
SELECT distinct st.SnO as 'Student No.', st.sname as 'Name', sc.SCORE as 'Score'
FROM STUDENT st
JOIN SC AS sc ON sc.SnO = st.SnO
GROUP BY 1,2,3
ORDER BY sc.SCORE DESC
LIMIT 3;

/*7. Extract the number of students for each course.*/
SELECT distinct c.CNAME as 'Course Name', count(c.CNO) as 'No. of each course'
FROM SC sc
JOIN COURSE c ON c.CNO = sc.CNO
GROUP BY 1;

/*8. Find out the student numbers and names of students who have taken one course only. */
SELECT distinct st.SnO as 'Student No.', st.sname as 'Student Name'
FROM STUDENT st
JOIN (COURSE c, SC sc) ON c.CNO = sc.CNO AND st.SnO = sc.SnO
GROUP BY 1,2
HAVING Count(c.CNO) = 1;

/*9. Find the number of male and female students. */
SELECT distinct SUM(CASE WHEN st.ssex = 'male' THEN 1 ELSE 0 END) AS 'Male',
SUM(CASE WHEN st.ssex = 'female' THEN 1 ELSE 0 END) AS 'Female'
FROM STUDENT st;

/*10. Extract the list of students with surname "Zhang". */
SELECT distinct st.SnO as 'Student No.', st.sname as 'Student Name'
FROM STUDENT st
WHERE st.sname LIKE 'Zhang%';

/*11. Query the list of same-sex students shares the same surname or given name, and count the number of students with the same name. */
SELECT distinct
sum(st.ssex = 'female' AND st.sname LIKE '%Chen%') AS 'No of students who share the same surname'
FROM STUDENT st;

/*12. List of students born in 1981 (Note: in the sage column, the data type is number). */
SELECT distinct *
FROM STUDENT st
WHERE (YEAR(CURRENT_DATE) - 1981) - sage = sage;

/*13. Query the average score of each course. The results are arranged in ascending order according to the average score.
If multiple courses have the same average scores, these courses are arranged in descending order 
according to the course number. For example: 

course number        average score 
C003                              50 
C002                              50 
C001                              50 
C005                              70 */

SELECT c.CNO as 'Course Number', ROUND(AVG(sc.SCORE),2) as 'Average Score'
FROM STUDENT st
JOIN (COURSE c, SC sc) ON  c.CNO = sc.CNO
GROUP BY c.CNO
ORDER BY AVG(sc.SCORE) ASC;

/*14. Query the student number, name and average score of all students whose average score is greater than 85. */
SELECT st.SnO as 'Student No.', st.sname as 'Student Name', AVG(sc.SCORE) AS 'Average Score'
FROM STUDENT st
JOIN(SC sc, COURSE c) ON c.CNO = sc.CNO AND st.SnO = sc.SnO
GROUP BY 1,2
HAVING  AVG(sc.SCORE) > 85;

/*15. Query the name and score of students whose course name is “database” and whose score are lower than 60. */
SELECT distinct st.sname as 'Student Name', sc.SCORE as 'Score'
FROM STUDENT st
JOIN (COURSE c, SC sc) on c.CNO = sc.CNO AND st.SnO = sc.SnO
WHERE c.CNAME = 'database' AND sc.score < 60
GROUP BY 1,2;

/*16. Query the students’ names, course names and scores of any course with scores above 70. */
SELECT distinct st.SnO as 'Student Name', c.CNAME as 'Course Name', sc.SCORE as 'Score'
FROM STUDENT st
JOIN (COURSE c, SC sc) on c.CNO = sc.CNO AND st.SnO = sc.SnO
WHERE sc.score > 70
GROUP BY 1,2,3;

/*17. Check the failed score courses and arrange them according to the course number in either ascending or descending order. */
SELECT distinct c.CNO as 'Course No.', sc.SCORE AS 'Failed score courses'
FROM STUDENT st
JOIN(COURSE c, SC sc) on c.CNO = sc.CNO AND st.SnO = sc.SnO
WHERE sc.score < 60
GROUP BY 1,2
ORDER BY c.CNO ASC;

/*Query the student number and name of the student whose course number is C001 and whose course score is above 80. */
SELECT st.SnO as 'Student No.', st.sname as 'Student Name'
FROM STUDENT st
JOIN (COURSE c, SC sc) on c.CNO = sc.CNO AND st.SnO = sc.SnO
WHERE sc.score > 80 AND c.CNO= 'c001'
GROUP BY 1,2;
