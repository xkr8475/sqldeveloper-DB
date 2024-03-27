--ex11.01
SELECT Student_ID, COURSE_ID, Score
FROM   SG_Scores
WHERE  Course_ID = 'L1031';

SELECT AVG(Score)
FROM   SG_Scores
WHERE  Course_ID = 'L1031';

SELECT Student_ID, Course_ID, Score
FROM   SG_Scores
WHERE  Course_ID = 'L1031' AND Score >= (86.6666667);

--ex11.02
SELECT Student_ID, Course_ID, Score
FROM  SG_Scores
WHERE Course_ID = 'L1031'
  AND Score >= ( SELECT AVG(Score)
                 FROM  SG_Scores
                 WHERE Course_ID = 'L1031');
                 
--ex11.03
SELECT Student_ID, Course_ID, Score, Score_Assigned
FROM   SG_Scores
WHERE  Course_ID = 'L1031'
  AND  Score     = ( SELECT MAX(Score)
                     FROM   SG_Scores
                     WHERE  Course_ID = 'L1031');
                     
                     
--ex11.04
SELECT Student_ID, Course_ID, Score, TO_CHAR(Score_Assigned,'YY/MM') "취득년일"
FROM   SG_Scores
WHERE  (TO_CHAR(Score_Assigned, 'YY/MM'), Score) IN
        (SELECT TO_CHAR(Score_Assigned, 'YY/MM'), MAX(Score)
        FROM SG_Scores
        GROUP BY TO_CHAR(Score_Assigned, 'YY/MM'))
ORDER BY 4;

--ex11.05
SELECT Student_ID, Course_ID, Score, Score_Assigned
FROM   SG_Scores
WHERE  Course_ID = 'L1031'
  AND  Score > ANY (SELECT Score
                    FROM   SG_Scores
                    WHERE  Course_ID = 'L1031');
                    
--ex11.06
SELECT Student_ID, Course_ID, Score, Score_Assigned
FROM  SG_Scores
WHERE Course_ID = 'L1031'
  AND Score >= ALL ( SELECT Score
                     FROM  SG_Scores
                     WHERE Course_ID = 'L1031');
                     
--ex11.07
SELECT Name, Position, Dept_ID
FROM   Professor P
WHERE  EXISTS( SELECT *
               FROM Course C
               WHERE  P.Professor_ID = C.Professor_ID);

--ex11.08
SELECT  Professor_ID, Name, Position, Dept_ID
FROM    Professor P
WHERE   NOT EXISTS(SELECT *
                   FROM Course C
                   WHERE  P.Professor_ID = C.Professor_ID);
                   
--ex11.09
SELECT Name, Dept_ID, (SELECT COUNT(Dept_ID)
                       FROM Professor A
                       WHERE A.Dept_ID = B.Dept_ID
                       GROUP BY Dept_ID) "학과교수수"
FROM Professor B
WHERE Professor_ID = 'P12';

--ex11.10
SELECT M.Student_ID, Name, Count(*) "취목과목수",
       (SELECT SUM(C_Number)
        FROM  SG_Scores INNER JOIN Course USING (Course_ID)
        WHERE Student_ID = M.Student_ID
        GROUP BY Student_ID ) "취득학점수"
FROM SG_Scores M INNER JOIN Student S ON M.Student_ID = S.Student_ID
GROUP  BY M.Student_ID, Name
HAVING COUNT(*) > 1
ORDER BY 4 DESC;

--ex11.11

SELECT Student_ID, SUM(C_Number)
FROM SG_Scores INNER JOIN Course USING (Course_ID)
GROUP BY Student_ID
HAVING SUM(C_Number) >
       ( SELECT SUM(C_Number)
         FROM   SG_Scores INNER JOIN Coures USING (Course_ID)
         WHERE Student_ID = 'C1602');
         
--ex11.12
SELECT Student_ID, Name, Title, C_Number, Score, Grade
FROM   SG_Scores INNER JOIN Course  USING (Course_ID)
                 INNER JOIN Student USING (Student_ID)
WHERE Score IS NOT NULL
ORDER BY 5 DESC, 4 DESC;

--ex11.13
SELECT *
FROM (SELECT ROWNUM num, a.*
        FROM(SELECT Student_ID, Name, Title, C_Number, Score
              FROM SG_Scores INNER JOIN Course USING (Course_ID)
                             INNER JOIN Student USING (Student_ID)
                    WHERE Score IS NOT NULL
                    ORDER BY 5 DESC, 4 DESC) a
                    )
WHERE num BETWEEN 11 AND 15;

--ex11.14
SELECT *
FROM (SELECT Dept_ID, Position
      FROM Professor)
PIVOT (
        COUNT(*)
        FOR Position IN ('총장', '교수', '부교수', '조교수', '초빙교수')
        )
        ORDER BY Dept_ID;
        
        
--ex11.16
CREATE TABLE Course_Temp
AS
    SELECT *
    FROM Course
    WHERE 1 = 2;
    
--ex11.17
CREATE GLOBAL TEMPORARY TABLE T_Computer
ON COMMIT PRESERVE ROWS
   AS
    SELECT *
    FROM Student
    WHERE Dept_ID = '컴공';
    
SELECT Dept_ID, Year, Student_ID, Name, ID_Number
FROM   T_Computer;

--ex11.18
SELECT TABLE_NAME, TEMPORARY, DURATION
FROM   USER_TABLES
WHERE  TEMPORARY = 'Y';

--ex11.19
SELECT * FROM T_COMPUTER;

--ex11.20
INSERT INTO Course_Temp
SELECT *
FROM  Course
WHERE Professor_ID = 'P12';

--ex11.21
CREATE TABLE Score_Table
AS
 SELECT Student_ID, course_ID, Score, Score_Assigned
 FROM  SG_Scores WHERE 1=2;

CREATE TABLE Grade_Table
AS
    SELECT Student_ID, course_ID, Grade, C_Date
    FROM SG_Scores WHERE 1 = 2;

--ex11.24
INSERT ALL
        INTO Department VALUES('학사', '학사운영처', '765-5000')
        INTO Department VALUES('간호','간호학과', '765-4600')
        INTO Department VALUES('전자','전자학과',  '7657000')
SELECT * FROM DUAL;

--ex.11.25
UPDATE Course
SET    Course_Fees = Course_Fees - 5000
WHERE  Course_Fees > (SELECT AVG(Course_Fees)
                      FROM Course);

--ex11.26
ALTER TABLE Student
ADD (Course_Cnt number(2));