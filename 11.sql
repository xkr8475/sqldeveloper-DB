--13.01
SELECT OBJECT_NAME, OBJECT_TYPE
FROM  USER_OBJECTS
WHERE OBJECT_TYPE = 'INDEX'
ORDER BY 1; 

--13.02
COLUMN INDEX_NAME FORMAT A28
COLUMN INDEX_TYPE FORMAT A22
SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'PROFESSOR';

--13.03
COLUMN INDEX_NAME FORMAT A30
SELECT INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'PROFESSOR';

--13.04
CREATE UNIQUE INDEX Student_Telephone_Inx
ON  Student (Telephone);

--13.05
CREATE INDEX Student_Name_Inx
ON  Student(Name);

--13.06
CREATE INDEX SG_Scores_CourseID_Grade_Inx
ON   SG_Scores(Course_ID, Grade);


--13.07
SELECT Student_ID, Name, Course_ID, Score
FROM SG_Scores INNER JOIN Student USING (Student_ID)
WHERE (Course_ID, Grade) = (('L1031', 'B+'));

--13.08
CREATE INDEX Student_Birth_Inx
ON Student(SUBSTR(ID_NUMBER,1,6));

SELECT Dept_ID, Year, Student_ID, Name, ID_Number, Telephone
FROM Student
WHERE SUBSTR(ID_Number, 1,6) = '990205';

--13.09
CREATE INDEX Student_Address_Inx
        ON Student(Address)
        INDEXTYPE IS CTXSYS.CONTEXT;
--13.10  
SELECT Dept_ID, Year, Student_ID, Name, Address
FROM Student
WHERE CONTAINS(Address, '��% OR ��%') > 0;

--13.11
ALTER INDEX Student_Name_Inx
REBUILD NOREVERSE;

--13.12
DROP INDEX SG_Scores_CourseID_Grade_Inx;

--13.13
SELECT COLUMN_NAME, NUM_DISTINCT, DENSITY, NUM_NULLS
FROM USER_TAB_COL_STATISTICS
WHERE TABLE_NAME= 'COURSE'
ORDER BY 1;

--13.14
SELECT INDEX_NAME, VISIBILITY
FROM USER_INDEXES
WHERE TABLE_NAME = 'STUDENT';

--13.15
ALTER INDEX STUDENT_BIRTH_INX INVISIBLE;