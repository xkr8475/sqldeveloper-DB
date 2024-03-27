--EX10.01
SELECT Professor_ID, Name, Position, Title, C_Number
FROM   Professor P, Course C
WHERE  P.Professor_ID = C.Professor_ID
ORDER BY 1;

--EX10.02
SELECT P.Professor_ID, Name, Position, Title, C_Number
FROM Professor P, Course C
ORDER BY 1;

--EX10.03
SELECT P.Professor_ID, Name, Position, Title, C_Number
FROM Professor P CROSS JOIN Course C
ORDER BY 1;

--EX10.04
SELECT P.Professor_ID, Name, Position, Title, C_Number
FROM Professor P, Course C
WHERE P.Professor_ID = C.Professor_ID
ORDER BY 1;

--EX10.05
SELECT SG.Student_ID, Year, Name, C.Course_ID, Title,
        C_Number, Score, Grade
FROM   SG_Scores SG, Student S, Course C
WHERE  SG.Student_id = S.Student_ID
  AND  SG.Course_ID = C. Course_ID
  AND  SG.Student_ID = 'C1701'
ORDER BY 1, 4;

--EX10.06
Describe Score_Grade

SELECT * FROM Score_Grade;

SELECT SG.Student_ID, SG.Course_ID, SG.Score, G.Grade
FROM  SG_Scores SG, Score_Grade G
WHERE SG.Score BETWEEN G.Low AND G.High
  AND SG.Student_ID = 'C1602'
ORDER BY 2;
--EX10.07
SELECT Professor_ID, Name, Position, Title, C_Number
FROM Professor NATURAL INNER JOIN Course
ORDER BY 1;

--EX10.08
SELECT Student_ID, Year, Name, Course_ID, Title,
        C_Number, Score, Grade
FROM   SG_Scores NATURAL INNER JOIN Student
                NATURAL INNER JOIN Course
WHERE Student_ID = 'C1701';

--EX10.09
SELECT Professor_ID, Name, Position, Title, C_Number
FROM   Professor INNER JOIN Course USING (Professor_ID)
ORDER BY 1;

--EX10.10
SELECT Student_ID, Year, Name, Course_ID, TITLE, C_Number,
       Score, Grade
FROM   SG_Scores INNER JOIN Student USING (Student_ID)
                 INNER JOIN Course USING (Course_ID)
WHERE Student_ID = 'C1701';

--EX10.11
SELECT P.Professor_ID, Name, Position, Title, C_Number
FROM Professor P INNER JOIN Course C
        ON (P.Professor_ID = C.Professor_ID)
ORDER BY 1;

--EX10.12
SELECT SG.Student_ID, Year, Name, SG.Course_ID, TITLE,
        C_Number, Score, Grade
FROM   SG_Scores SG INNER JOIN Student S
            ON (SG.Student_ID = S.Student_Id)
            INNER JOIN Course C
            ON (SG.Course_ID = C.Course_ID)
WHERE SG.Student_ID = 'C1701';

--EX10.13
SELECT P.Professor_ID, Name, Position, Title, C_Number
FROM Professor P, Course C
WHERE P.Professor_ID = C.Professor_ID (+)
ORDER BY 4;

--EX10.14
SELECT P.Professor_ID, Name, Position, Title, C_Number
FROM  Professor P, Course C
WHERE P.Professor_ID (+) = C.Professor_ID
ORDER BY 1;

--EX10.15
SELECT P.Professor_ID, Name,  Position, Title, C_Number
FROM Professor P, Course C
WHERE P.Professor_ID = C.Professor_ID (+)
  AND Course_ID IS NULL
ORDER BY 1;


--EX10.16
INSERT INTO Professor
(Professor_ID, Name, Position, Dept_ID, Telephone, Email, Mgr)
VALUES
('P14','조성우','조교수','컴공','765-4114',NULL,'P11');

SELECT Professor_ID, Name, Position, Title, C_Number
FROM Professor NATURAL LEFT OUTER JOIN Course
ORDER BY 4;

--EX10.17
SELECT Professor_ID, Name, Position, Title, C_Number
FROM   Professor NATURAL RIGHT OUTER JOIN Course
ORDER BY 1;

--EX10.18
SELECT Professor_ID, Name, Position, Title, C_Number
FROM   Professor NATURAL FULL JOIN Course
ORDER BY 3,4;

--EX10.19
SELECT Professor_ID, Name, Position, Title, C_Number
FROM Professor LEFT OUTER JOIN Course USING (Professor_ID)
ORDER BY 4;

--EX10.20
SELECT P.Professor_ID, Name, Position, Title, C_Number
FROM   Professor P LEFT OUTER JOIN Course C
        ON (P.Professor_ID = C.Professor_ID)
ORDER BY 4;

--EX10.21
SELECT Professor_ID, Name, Position, Title, C_Number
FROM Professor RIGHT OUTER JOIN Course USING (Professor_ID)
ORDER BY 1;

--EX10.22
SELECT Professor_ID, Name, Position, Title, C_Number
FROM   Professor FULL OUTER JOIN Course USING (Professor_ID)
ORDER BY 3,4;

--EX10.23
COLUMN 직위 FORMAT A15
SELECT LEVEL, Dept_ID, LPAD(' ', 4 * (Level - 1)) ||
                NVL(Duty, Position) "직위", Name
FROM Professor
START  WITH mgr is NULL
CONNECT BY PRIOR Professor_id = Mgr;

--EX10.24
SELECT DEPT_ID, Name ||' '|| Position "교수명",
        CONNECT_BY_ISLEAF "노드", LEVEL "레벨",
        SYS_CONNECT_BY_PATH(NAME || POSITION, '/') "경로"
FROM Professor
WHERE LEVEL <= 3 AND MGR IS NOT NULL
START WITH MGR IS NULL
CONNECT BY PRIOR Professor_ID = MGR;

--EX10.25
SELECT T1.Professor_ID, T1.Dept_ID, T1.Duty,
        T1.Name || ' ' || T1.Position "교수명",
        T2.NAME || ' ' || T2.duty "관리자명"
FROM Professor T1, Professor T2
WHERE T1.Mgr = T2.Professor_ID
ORDER BY 2, 3;

--EX10.26
SELECT T1.Professor_ID, T1.Dept_ID, T1.Duty,
       T1.Name || ' ' || T1.Position "교수명",
       T2.Name || ' ' || T2.duty "관리자명"
FROM   Professor T1 INNER JOIN Professor T2
                ON T1.Mgr = T2.Professor_ID
ORDER BY 2, 3;

--EX10.27
SELECT Dept_ID, Name, Position
FROM   Professor P
WHERE  EXISTS (SELECT *
                FROM  Course C
                WHERE P.Professor_ID = C.Professor_ID
                 AND  Course_fees = 50000);
                 
--EX10.28
SELECT *
FROM COURSE C
WHERE Professor_ID NOT IN (SELECT Professor_ID
                            FROM Professor P
                            WHERE P.Professor_ID = C.Professor_ID)
ORDER BY Course_ID;

--EX10.29
SELECT * FROM COURSE
UNION ALL
SELECT * FROM T_COURSE
ORDER BY 1;

--EX10.30
SELECT Professor_ID, Name
FROM Professor
INTERSECT
SELECT Professor_ID, Name
FROM Course INNER JOIN Professor USING (Professor_ID)
ORDER BY 1;

--EX10.31
SELECT Student_ID, Name
FROM Student
MINUS
SELECT Student_ID, Name
FROM  SG_Scores INNER JOIN Student USING (Student_ID);

--EX10.32
SELECT Student_ID, Name
FROM Student S
WHERE NOT EXISTS (SELECT *
                  FROM SG_SCORES SG
                  WHERE SG.Student_ID = S.Student_ID);
