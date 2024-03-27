@C:\Users\최웅탁\droptable.sql

--테이블 생성
@C:\Users\최웅탁\haksa.sql
@C:\Users\최웅탁\haksa_data.sql

SELECT * FROM TAB;

PURGE RECYCLEBIN;

DROP TABLE Album;

--ex06.01
SELECT Dept_ID, Dept_Name, Dept_Tel
FROM   Department;

--ex06.02  DISTINCT = 중복되지 않는 것만 출력.
SELECT DISTINCT Dept_ID
FROM   Professor;

--ex06.03
SELECT UNIQUE Dept_ID "소속학과"
FROM Professor;

--ex06.04
SELECT Course_ID "과목코드", Title "과목명", C_Number "학점수"
FROM Course;

--ex06.05
SELECT Course_ID "과목코드", Title "과목명", C_Number "학점수"
FROM Course
ORDER BY Title;

--ex06.06
SELECT Course_ID "과목코드", Title "과목명", C_Number "학점수",
        C_Number * 30000 + NVL(Course_fees, 0) "과목별 수강료"
FROM   Course
ORDER BY 4 ASC;

--ex06.07
SELECT Professor_ID, Name, Position, Dept_ID
FROM   Professor
WHERE  Dept_ID = '컴공';

--ex06.08
SELECT Course_ID, Title, C_Number, Course_Fees
FROM   Course
WHERE  Course_Fees >= 30000
ORDER BY 4 DESC;

--ex06.09
SELECT  Dept_ID, Year, Name
FROM    Student
WHERE   Dept_ID = '컴공' AND Year = 2;

--ex06.10
SELECT  Dept_ID, Year, Name
FROM    Student
WHERE   (Dept_ID, Year) = (('컴공',2));

--ex06.11
SELECT  Dept_ID || '학과' || Name || ' ' || Position ||
        '의 전화번호는 ' || Telephone || '이다.'
FROM    Professor
ORDER BY Dept_ID;

--ex06.12
SELECT  Dept_ID, Year, Student_ID, Name
FROM    Student
WHERE   Name LIKE '이%';

--ex06.13
SELECT Dept_ID, Year, Student_ID, Name
FROM   Student
WHERE  Name LIKE '_정_';

--ex06.14
SELECT Dept_ID, Year, Student_ID, Name
FROM   Student
WHERE  Name NOT LIKE '이%' AND Name NOT LIKE '김%';

--ex06.15
SELECT Dept_ID, Professor_ID, Name, Position
FROM   Professor
WHERE  Dept_ID IN ('컴공', '정통')
ORDER BY 1;

--ex06.16
SELECT Dept_ID, Professor_ID, Name, Position
FROM   Professor
WHERE  Dept_ID NOT IN('컴공', '정통')
ORDER BY 1;

-- IN 사용 안하기
SELECT Dept_ID, Professor_ID, Name, Position
FROM   Professor
WHERE  Dept_ID LIKE '컴공' OR Dept_ID LIKE '정통'
ORDER BY 1;

--ex06.17
SELECT  Student_ID, Course_ID,  Score
FROM    SG_Scores
WHERE   Score BETWEEN 90 AND 94
ORDER BY 3 DESC;

--ex06.18
SELECT Student_ID, Course_ID, Score
FROM   SG_Scores
WHERE  Score NOT BETWEEN 60 AND 100
ORDER BY 3 DESC;

--ex06.19
SELECT *
FROM   Course
WHERE  Course_Fees IS NULL
ORDER BY Title;

--ex06.20
SELECT *
FROM    Course
WHERE   Course_Fees IS NOT NULL
ORDER BY Title;

--ex06.21
SELECT ROWNUM, Dept_ID, Dept_Name, Dept_Tel
FROM    Department;

--ex06.22
SELECT ROWNUM, Dept_ID, Dept_Name, Dept_Tel
FROM    Department
WHERE   ROWNUM <= 3;

