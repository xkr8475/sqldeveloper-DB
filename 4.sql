--ex07.01
INSERT INTO T_Course
    (Course_ID, Title, C_Number, Professor_ID, Course_Fees)
VALUES
    ('L1061', 'ERP실무', 3, 'P12', 50000);
    
SELECT * FROM T_Course
WHERE Course_ID = 'L1061';
--DELETE FROM T_Course WHERE Course_ID  = 'L1061';
--select * from tabs;

--ex07.02
INSERT INTO T_Course
VALUES
('L1062', '그룹웨어구축', 3, 'P13', 40000);

SELECT * FROM T_Course
WHERE Course_ID = 'L1062';

--ex07.03
INSERT INTO SG_Scores
(Student_ID, Course_id, Score, Score_Assigned)
VALUES
('B1701', 'L1051', 85, '18/06/28');

DESCRIBE SG_Scores;

SELECT * FROM SG_Scores
WHERE Student_ID = 'B1701' AND Course_ID = 'L1051';

--ex07.04
INSERT INTO Course
(Course_ID, Title, C_Number, Professor_ID, Course_Fees)
VALUES
('L3041', 'JQUERY', 3, 'P31', '30,000');

--ex07.05
INSERT INTO Course
(Course_ID, Title, C_number, Professor_ID, Course_fees)
VALUES
('L3041', 'JQUERY', 3, 'P31');

--ex07.06
INSERT INTO Course
(Course_ID, Title, C_number, Professor_ID, Course_fees)
VALUES
('L1031', 'SQL', 3, 'P12', 30000);

--ex07.07
INSERT INTO Course
(Course_ID, Title, C_number, Professor_ID, Course_fees)
VALUES
(NULL, '정보보안', 3, 'P22', 30000);

--ex07.08
INSERT INTO Professor
(Professor_ID, Name, Position, Dept_ID, Telephone, Email,Mgr)
VALUES
('P14', '조성우', '조교수', '컴퓨터', '765-4114', NULL, 'P11');

--ex07.09
INSERT INTO Student
(Dept_ID, Year, Student_ID, Name, ID_Number, Email)
VALUES
('컴공', '2', 'C1731', '박은혜', '011109-4******', 'c1731@cyber.ac.kr');

SELECT Student_ID, Name, ID_Number, Email
FROM   Student
WHERE  ID_Number = '011109-4******';

--ex07.10
INSERT INTO Student
(Dept_ID, Year, Student_ID, Name, ID_Number, Email)
VALUES
('컴공', '2', 'C1731', '박은헤', '011119-4******', 'c1731@cyber.ac.rk');

--ex07.11
INSERT INTO Professor
(Professor_ID, Name, Position, Dept_ID, Telephone)
VALUES
('P91', 'Bob Miner', '시간강사', '컴공', '765-4119');

ALTER TABLE Professor MODIFY(Position VARCHAR2(12));

--ex07.12
ALTER TABLE SG_Scores
ADD   (User_Name VARCHAR2(25) DEFAULT '오라클계정: ' || USER,
       C_Date    DATE         DEFAULT SYSDATE);
       
--ex07.13
INSERT INTO SG_Scores
(Student_ID, Course_ID, Score, Score_Assigned)
VALUES
('C1731', 'L1021', 97, '18/06/28');

SELECT *
FROM SG_Scores
WHERE Student_ID = 'C1731' AND Course_ID = 'L1021';

COMMIT;

--ex07.14
UPDATE Department
SET    Dept_Name = '컴퓨터정보계열';

SELECT * FROM Department;

ROLLBACK;

--ex07.15

UPDATE Course
SET    Title = '델파이'
WHERE  Course_ID = 'L1042';

SELECT * 
FROM Course
WHERE   Course_ID = 'L1042';

--ex07.16

SELECT Student_ID, Course_ID, Score
FROM   SG_Scores
WHERE  Student_ID = 'C1601' AND Course_ID = 'L1021';

UPDATE SG_Scores
SET    Score = 85
WHERE  Student_ID = 'C1601' AND Course_ID = 'L1021';

