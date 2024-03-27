
SELECT Lower('HELLO'), UPPER('welcome') FROM Dual;

SELECT Title, LENGTH(Title), LENGTHB(Title)
FROM Course
ORDER BY 2 DESC;

SELECT Name, SUBSTR(Name, 1, 1), Email, INSTR(Email,'@')
FROM Professor
ORDER BY 1;

SELECT LTRIM('xyxyxHello', 'xy') FROM Dual;

SELECT RTRIM('Oracle Serverkkkkk', 'k') FROM Dual;

SELECT Professor_ID, Name, Position, Telephone,
        LPAD(Telephone, 12, '053-')
        FROM Professor
        ORDER BY 1;
        

SELECT Professor_ID, Name, Position, CONCAT(Name, Position)
        FROM Professor
        ORDER BY 1;
        
UPDATE Professor
SET     Email = REPLACE(Email, 'cyber', 'dream');

SELECT Professor_ID, Name, Email
FROM Professor
ORDER BY 2;

SELECT ROUND(12.345,2), TRUNC(12.345,2) FROM DUAL;

SELECT CEIL(12.345), FLOOR(12.345) FROM DUAL;

SELECT FLOOR(100/3) "몫", MOD(100,3) "나머지" FROM DUAL;

SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP FROM DUAL;

SELECT DBTIMEZONE, SESSIONTIMEZONE, CURRENT_TIMESTAMP
FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';

SELECT SYSDATE, CURRENT_TIMESTAMP FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

SELECT UNIQUE CURRENT_DATE "현재일자", I_DATE "입학일자",
    EXTRACT(YEAR FROM I_DATE) "입학년도",
    EXTRACT(MONTH FROM I_DATE) "입학월",
    EXTRACT(DAY FROM I_DATE) "입학일"
FROM Student
WHERE I_DATE IS NOT NULL
ORDER BY 2;

SELECT CURRENT_TIMESTAMP, ROUND(CURRENT_DATE),
    TRUNC(CURRENT_DATE)
FROM DUAL;

SELECT CURRENT_DATE, ADD_MONTHS(CURRENT_DATE, 10)
FROM DUAL;

SELECT Dept_ID, Year, Name, I_Date, CURRENT_DATE "기준일",
    TRUNC(MONTHS_BETWEEN(CURRENT_DATE, I_DATE)) "재적월수"
FROM Student
WHERE Dept_ID = '컴공'
ORDER BY 4;

COLUMN 현재시간 FORMAT A32
SELECT CURRENT_TIMESTAMP "현재시간",
    CURRENT_TIMESTAMP + NUMTODSINTERVAL(4, 'HOUR') "4시간 후"
    FROM DUAL;
    
SELECT Dept_ID, Student_ID, NAME, '2018/07/15' "휴학일자",
    TO_DATE('180715', 'YYMMDD')+NUMTOYMINTERVAL(1,'YEAR')"복학예정일"
    FROM Student
    WHERE Student_ID = 'C1802';
    
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

SELECT Student_ID, Name, ID_Number,
        TO_DATE(SUBSTR(ID_Number, 1, 6), 'RRMMDD') "RRMMDD변환",
        TO_DATE(SUBSTR(ID_Number, 1, 6), 'YYMMDD') "YYMMDD변환"
FROM Student;

SELECT CURRENT_TIMESTAMP "현재시간",
    TO_CHAR(CURRENT_TIMESTAMP + TO_DSINTERVAL('P100DT05H'),
    'YYYY-MM-DD HH24:MI:SS') "100일 5시간후"
    FROM DUAL;
    
SELECT Dept_ID, YEAR, Student_ID, Name, I_Date "입학년도",
    I_Date + TO_YMINTERVAL('4-0') "졸업예정년도"
    FROM Student
    WHERE Dept_ID = '컴공' AND YEAR = 1;
    
    
    SELECT TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS FF3')
    FROM Dual;
    
    SELECT Student_ID, Name, I_Date,
        TO_CHAR(I_Date, 'RRRR/MM/DD (DAY)') "입학일자"
    FROM Student
    ORDER BY 3;
    
    SELECT Student_ID, Course_ID, Score, Score_Assigned,
            TO_CHAR(Score_Assigned, 'YYYY/MM/DD')
        FROM SG_Scores
        WHERE Score >= 98
        ORDER BY 3 DESC;
        
    SELECT Student_ID, Course_ID, Score, TO_CHAR(score)
    FROM SG_Scores
    WHERE Score >= 98
    ORDER BY 3 DESC;
    
    SELECT SCORE,TO_CHAR(Score, 'S999'),TO_CHAR(-Score, 'S999'),
            TO_CHAR(Score,'B999.9'), TO_CHAR(Score, '099.99')
        FROM SG_Scores
        WHERE Score >= 98
        ORDER BY 1 DESC;
        
    SELECT Course_Fees, To_CHAR(Course_Fees, 'L999,999')"국가별화폐",
        TO_CHAR(Course_Fees, 'C999G999') "ISO 화폐"
        FROM Course
        WHERE Course_Fees = 40000;
        
    SELECT Course_Fees,TO_CHAR(Course_Fees, '9.99EEEE')
    FROM Course
    WHERE Course_Fees = 40000;
    
    SELECT '$123.45', TO_NUMBER('$123.45','$999.99') FROM Dual;
    
    SELECT Course_ID, Title, NVL(Course_Fees, 0)
    FROM   Course;
    
    SELECT Course_ID, Title, Course_Fees
    FROM Course
    WHERE LNNVL(Course_Fees >= 40000)
    AND Course_fees IS NOT NULL;
    
    SELECT Course_ID, Title, NVL(Course_Fees, 0) "추가수강료",
        NVL2(course_fees, Course_fees*0.05, 0) "수강료 5%"
        FROM Course;
        
    SELECT Name, Telephone, Email,
        COALESCE(Telephone, Email, Address)"대표 연락처"
        FROM Student
        ORDER BY 2,3;
    
    SELECT Dept_ID, Name, ID_Number,
            DECODE(SUBSTR(ID_NUMBER, 8, 1), '1', '남', '2', '여',
            '3','남','4','여')
            FROM Student
            WHERE Dept_ID = '컴공'
            ORDER BY 3;
            
    SELECT Student_ID, Course_ID, Score,
        CASE WHEN Score BETWEEN 90 AND 100 THEN 'A'
             WHEN Score BETWEEN 80 AND 89 THEN 'B'
             WHEN Score BETWEEN 70 AND 79 THEN 'C'
             WHEN Score BETWEEN 60 AND 69 THEN 'D'
             ELSE 'F'
            END "등급"
            FROM SG_Scores
            WHERE Student_ID = 'C1601'
            ORDER BY 2;
            
    SELECT Dept_ID, Year, student_ID, Name, Address
    FROM Student
    WHERE REGEXP_LIKE (Address, '송파구|수성구');
    
    CREATE OR REPLACE FUNCTION Grade_Cal(Score Number)
    RETURN  CHAR IS
    v_Grade CHAR(2);
    BEGIN
        IF Score >= 95  THEN v_Grade := 'A+';
           ELSIF Score >= 90  THEN v_Grade := 'A';
           ELSIF Score >= 85  THEN v_Grade := 'B+';
           ELSIF Score >= 80  THEN v_Grade := 'B';
           ELSIF Score >= 75  THEN v_Grade := 'C+';
           ELSIF Score >= 70  THEN v_Grade := 'C';
           ELSIF Score >= 65  THEN v_Grade := 'D+';
           ELSIF Score >= 60  THEN v_Grade := 'D';
           ELSE v_Grade := 'F';
           
           END IF;
           RETURN v_Grade;
           END;
           /
    
UPDATE SG_Scores
    SET Grade = Grade_Cal(Score);
    
    SELECT Student_ID, Course_ID, Score, Grade
    FROM SG_Scores
    WHERE Student_ID = 'C1601';
    
    COMMIT;

SELECT * FROM SG_SCORES;