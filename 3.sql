@C:\Users\�ֿ�Ź\droptable.sql

--���̺� ����
@C:\Users\�ֿ�Ź\haksa.sql
@C:\Users\�ֿ�Ź\haksa_data.sql

SELECT * FROM TAB;

PURGE RECYCLEBIN;

DROP TABLE Album;

--ex06.01
SELECT Dept_ID, Dept_Name, Dept_Tel
FROM   Department;

--ex06.02  DISTINCT = �ߺ����� �ʴ� �͸� ���.
SELECT DISTINCT Dept_ID
FROM   Professor;

--ex06.03
SELECT UNIQUE Dept_ID "�Ҽ��а�"
FROM Professor;

--ex06.04
SELECT Course_ID "�����ڵ�", Title "�����", C_Number "������"
FROM Course;

--ex06.05
SELECT Course_ID "�����ڵ�", Title "�����", C_Number "������"
FROM Course
ORDER BY Title;

--ex06.06
SELECT Course_ID "�����ڵ�", Title "�����", C_Number "������",
        C_Number * 30000 + NVL(Course_fees, 0) "���� ������"
FROM   Course
ORDER BY 4 ASC;

--ex06.07
SELECT Professor_ID, Name, Position, Dept_ID
FROM   Professor
WHERE  Dept_ID = '�İ�';

--ex06.08
SELECT Course_ID, Title, C_Number, Course_Fees
FROM   Course
WHERE  Course_Fees >= 30000
ORDER BY 4 DESC;

--ex06.09
SELECT  Dept_ID, Year, Name
FROM    Student
WHERE   Dept_ID = '�İ�' AND Year = 2;

--ex06.10
SELECT  Dept_ID, Year, Name
FROM    Student
WHERE   (Dept_ID, Year) = (('�İ�',2));

--ex06.11
SELECT  Dept_ID || '�а�' || Name || ' ' || Position ||
        '�� ��ȭ��ȣ�� ' || Telephone || '�̴�.'
FROM    Professor
ORDER BY Dept_ID;

--ex06.12
SELECT  Dept_ID, Year, Student_ID, Name
FROM    Student
WHERE   Name LIKE '��%';

--ex06.13
SELECT Dept_ID, Year, Student_ID, Name
FROM   Student
WHERE  Name LIKE '_��_';

--ex06.14
SELECT Dept_ID, Year, Student_ID, Name
FROM   Student
WHERE  Name NOT LIKE '��%' AND Name NOT LIKE '��%';

--ex06.15
SELECT Dept_ID, Professor_ID, Name, Position
FROM   Professor
WHERE  Dept_ID IN ('�İ�', '����')
ORDER BY 1;

--ex06.16
SELECT Dept_ID, Professor_ID, Name, Position
FROM   Professor
WHERE  Dept_ID NOT IN('�İ�', '����')
ORDER BY 1;

-- IN ��� ���ϱ�
SELECT Dept_ID, Professor_ID, Name, Position
FROM   Professor
WHERE  Dept_ID LIKE '�İ�' OR Dept_ID LIKE '����'
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

