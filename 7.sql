--ex.09.01
SELECT COUNT(*), COUNT(Email)
FROM Student;
--ex.09.02
SELECT COUNT(*) "취득과목수"
FROM SG_Scores
WHERE Student_ID = 'C1701';
--ex.09.03
SELECT MAX(Score), MIN(Score)
FROM SG_Scores
WHERE Course_ID = 'L1031';
--ex.09.04
SELECT SUM(Score), AVG(Score)
FROM SG_Scores
WHERE Course_ID = 'L1031';
--ex.09.05
SELECT STDDEV(Score), VARIANCE(Score)
FROM SG_Scores
WHERE Course_ID = 'L1031';
--ex.09.06
SELECT Dept_ID, COUNT(*)
FROM Professor
GROUP BY Dept_ID;
--ex.09.07
SELECT Dept_ID
FROM   Professor
GROUP BY Dept_ID
HAVING COUNT(*) = 1;

--ex.09.08
SELECT Student_ID, COUNT(1) "취득과목수",
    TO_CHAR(AVG(Score), '99.99')"평균"
FROM SG_Scores
GROUP BY Student_ID
HAVING COUNT(1) >= 8
ORDER BY 1;
--ex.09.09
SELECT Dept_ID, Year, COUNT(*) "인원수"
FROM   Student
GROUP BY Dept_ID, Year
ORDER BY 1, 2;
--ex.09.10
SELECT Dept_ID, Year, COUNT(*) "인원수"
FROM Student
GROUP BY ROLLUP(Dept_ID, Year);
--ex.09.11
SELECT Dept_ID, Year,COUNT(*)
FROM Student
GROUP BY CUBE(Dept_ID, Year)
ORDER BY 1, 2;
--ex.09.12
SELECT Dept_ID, Year, COUNT(*)
FROM Student
GROUP BY GROUPING SETS(Dept_ID, Year)
ORDER BY 1, 2;

--ex.09.13
SELECT Dept_ID, Year, COUNT(*)
FROM Student
GROUP BY GROUPING SETS((Dept_ID, Year), Dept_ID, Year);

--ex.09.14
SELECT CASE GROUPING_ID(Dept_ID, Year) WHEN 0 THEN Dept_ID
                                       WHEN 1 THEN NULL
                                       WHEN 2 THEN ' 학년계'
                                       WHEN 3 THEN NULL
                    END "학과코드",
       CASE GROUPING_ID(Dept_ID, Year) WHEN 0 THEN Year
                                       WHEN 1 THEN ' 소계'
                                       WHEN 2 THEN Year
                                       WHEN 3 THEN '전체합계'
                    END "학년", COUNT(*) "인원수",
        GROUPING_ID(Dept_ID, Year) "비트 벡터"
FROM Student
GROUP BY CUBE(Dept_ID, Year)
ORDER BY Dept_ID;

--ex09.15
SELECT UNIQUE Dept_ID, Year,
        COUNT(*) OVER( PARTITION BY Dept_ID, Year) "인원수"
FROM STUDENT
ORDER BY 1, 2;

--ex09.16
SELECT UNIQUE Course_ID,
              COUNT(*) OVER(PARTITION BY Course_ID) "학생수",
              AVG(Score) OVER(PARTITION BY Course_ID) "과목별 평균"
FROM SG_Scores
ORDER BY 1;

--ex09.17
SELECT RANK(86) WITHIN GROUP (ORDER BY Score DESC) "석차",
 DENSE_RANK(86) WITHIN GROUP (ORDER BY Score DESC) "성적순위"
FROM SG_SCORES
WHERE Student_ID = 'C1701';

--ex09.18
SELECT Course_ID, Student_ID, Score,
        RANK()       OVER (ORDER BY Score DESC) "석차",
        DENSE_RANK() OVER (ORDER BY Score DESC) "순위",
        ROW_NUMBER() OVER (ORDER BY Score DESC) "순서"
FROM SG_SCORES
WHERE Student_ID = 'C1701';

--ex09.19
SELECT Student_ID, SUM(Score),FLOOR(AVG(Score)) "평균",
       RANK() OVER (ORDER BY SUM(Score) DESC) "석차"
FROM SG_Scores
WHERE Score IS NOT NULL
GROUP BY Student_ID
ORDER BY 4;

--ex09.20
SELECT UNIQUE Student_ID,
    COUNT(*) OVER (PARTITION BY Student_ID) "과목수"
FROM SG_Scores
ORDER BY 1;

--ex09.21
SELECT Student_ID, Course_ID, Score,
        RANK()OVER (ORDER BY Score DESC) "전체석차",
RANK() OVER (PARTITION BY Course_ID ORDER BY Score DESC) "과목별 석차"
FROM SG_Scores
WHERE Score IS NOT NULL
ORDER BY 2, 5;

--ex09.22
SELECT Student_ID, Course_ID, Score,
 SUM(Score) OVER (PARTITION BY Student_ID ORDER BY Course_ID)
 "과목별 누계점수"
 FROM SG_Scores
 WHERE Student_ID IN ('C1601', 'C1602')
 ORDER BY 1;
 
 --ex09.23
 SELECT Course_ID, Student_ID, Score,
    RANK() OVER
    (PARTITION BY Course_ID ORDER BY Score DESC) "순위",
    CUME_DIST() OVER
    (PARTITION BY Course_ID ORDER BY Score DESC) "누적분포",
    PERCENT_RANK() OVER
    (PARTITION BY Course_ID ORDER BY Score DESC) "순위퍼센트"
FROM SG_SCORES
WHERE Course_ID = 'L1021';
--ex09.24
SELECT Course_ID, Student_ID, Score,
    NTILE (4) OVER
    (PARTITION BY Student_ID ORDER BY Score DESC) "그룹번호"
FROM SG_SCORES
WHERE Student_ID = 'C1701';

--ex09.25
SELECT Course_ID, Student_ID, Score,
    FIRST_VALUE(Score) OVER (ORDER BY Score DESC) "FIRST_VALUE",
    LAST_VALUE(Score) OVER (ORDER BY Score DESC) "LAST_VALUE"
FROM SG_SCORES
WHERE Course_ID = 'L2061';

--ex09.26
SELECT Course_ID, Student_ID, Score "현재행",
       LAG(Score, 1) OVER (ORDER BY Score DESC) "이전행",
       LEAD(Score, 1) OVER (ORDER BY Score DESC) "다음행"
FROM SG_SCORES
WHERE Course_ID = 'L1031';
    




