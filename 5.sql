--ex07.18
SET AUTOCOMMIT OFF
DELETE FROM T_Course;
SELECT * FROM T_Course;
ROLLBACK;

--ex07.19
DELETE FROM Course WHERE Course_ID = 'L0012';

SELECT *
FROM    Course
WHERE   Course_ID = 'L0012';

--ex07.20
CREATE TABLE Computer_student
AS
    SELECT Dept_ID, Year, Student_ID, Name, ID_Number
    FROM Student
    WHERE Dept_ID = '컴공';
    
 SELECT * FROM Computer_Student;
 
 TRUNCATE TABLE Computer_Student;
 
 --ex07.21
 SELECT Professor_ID, Name, Position, Dept_ID
 FROM   Professor
 WHERE  Dept_ID = '컴공';
 
 DELETE FROM Department
 WHERE  Dept_ID = '컴공';
 DELETE FROM Department;
 
 
 --ex07.22
 ALTER TABLE Course
 DROP CONSTRAINT Course_fk;
 
 ALTER TABLE Course
 MODIFY (CONSTRAINT Course_fk FOREIGN KEY (Professor_ID)
                    REFERENCES Professor
                    ON DELETE SET NULL);
                    
--ex07.23
SELECT *
FROM COURSE
WHERE Professor_ID = 'P23';

DELETE FROM Professor
WHERE Professor_ID = 'P23';

SELECT *
FROM Course
WHERE Course_ID = 'L2031';
 
 --ex07.24
 ALTER TABLE Course
 DROP  CONSTRAINT Course_fk;
 
 ALTER TABLE Course
 MODIFY (CONSTRAINT Course_fk FOREIGN KEY (Professor_ID)
                    REFERENCES Professor
                    ON DELETE  CASCADE);
 
 --ex07.25
SELECT *
FROM  Course
WHERE Professor_ID = 'P22';

DELETE FROM Professor
WHERE  Professor_ID = 'P22';

SELECT *
FROM Course
WHERE Professor_ID = 'P22';

--ex07.26
SELECT * FROM T_Course;

SELECT * FROM Course;

MERGE INTO Course C
      USING T_Course T
      ON        (C.Course_ID = T.Course_ID)
    WHEN MATCHED THEN
      UPDATE
      SET   C.Title = T.Title, C.Course_Fees = T.Course_Fees
    WHEN NOT MATCHED THEN
      INSERT
      (Course_ID, Title, C_Number, Professor_ID, Course_Fees)
      VALUES
      (T.Course_ID, T.Title, T.C_Number, T.Professor_ID,
      T.Course_Fees);

SELECT * FROM Course;

--ex07.27
INSERT INTO Computer_Student
    SELECT Dept_ID, Year, student_ID, Name, ID_Number
    FROM   Student
    WHERE  Dept_ID = '컴공';
    
    COMMIT;