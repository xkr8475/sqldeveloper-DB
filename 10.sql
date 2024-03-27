--ex12.01
CREATE SEQUENCE Dept_Seq
INCREMENT BY 1
NOCACHE
NOCYCLE;

--ex12.02
SELECT Dept_Seq.NEXTVAL, Dept_ID, Dept_Name, Dept_Tel
FROM   Department;

--ex12.03
CREATE SEQUENCE St_Seq
START WITH 1501
INCREMENT BY 1
MAXVALUE 1700
NOCACHE
NOCYCLE;

--ex12.04
INSERT INTO Computer_Student
(Student_ID, Dept_ID, Year, Name, ID_Number)
VALUES
(CONCAT('C',LTRIM(TO_CHAR(ST_SEQ.NEXTVAL,'9999'))),
 '&학과','&학년','&성명','&주민번호');
 
 --ex12.05
 ALTER SEQUENCE dept_seq
 INCREMENT BY 5;
 
 --ex12.06
 SELECT Dept_Seq.NEXTVAL, Dept_ID, Dept_Name
 FROM   Department;
 --ex12.07
 DROP SEQUENCE ST_Seq;
 
 --ex12.08
 SELECT Student_ID, Course_ID, Title, Score, Grade
 FROM   SG_Scores INNER JOIN Course USING (Course_ID)
 WHERE  Student_ID = 'C1701'
 ORDER  BY 1, 2;
 
 --ex12.09
 CREATE OR REPLACE VIEW Score_List
 AS
    SELECT Student_ID, Course_ID, Title, Score, Grade
    FROM   SG_Scores INNER JOIN Course USING (Course_ID);
Describe Score_List

--ex12.10
SELECT *
FROM Score_List
WHERE Student_ID = 'C1701';

--ex12.11
CREATE OR REPLACE VIEW Pro_Course_Cnt
AS
    SELECT Professor_ID, Name, COUNT(*) AS Course_Cnt
    FROM   Professor JOIN Course USING (Professor_ID)
    GROUP BY Professor_ID, Name;
SELECT *
FROM Pro_Course_Cnt
ORDER BY 1;

--ex12.12
CREATE VIEW Student_Computer_View
AS
    SELECT Dept_ID, Year, Student_ID, Name, ID_Number, Telephone
    FROM Student
    WHERE Dept_ID = '컴공';
    
SELECT *
FROM   Student_Computer_View
ORDER BY Student_ID;


--ex12.13
INSERT INTO Student_Computer_View
VALUES
('컴공',2,'C1705','성유리','990909-2******','011-1999-8888');

--ex12.14
CREATE VIEW Course_nvl_view
AS
    SELECT *
    FROM   Course
    WHERE  Course_Fees IS NOT NULL
           WITH READ ONLY;
           
INSERT INTO Course_nvl_view
VALUES
('L2062', '스프링프로젝트', 3, 'P14', 50000);
--INSERT INTO Course_nvl_view

--ex12.15
CREATE VIEW Student_Business_View
AS
    SELECT Dept_ID, Year, Student_ID,Name, ID_Number, Telephone
    FROM   Student
    WHERE  Dept_ID = '경영' WITH CHECK OPTION;
    
--ex12.16
UPDATE Student_Business_View
SET   Dept_ID = '행정'
WHERE Student_ID = 'B1801';

--UPDATE Student_Business_View

--ex12.17
DROP VIEW Student_Computer_View;