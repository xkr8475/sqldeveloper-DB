@C:\Users\√÷øı≈π\droptable.sql

CREATE TABLE Department (
Dept_ID     VARCHAR2(10) PRIMARY KEY,
Dept_Name   VARCHAR2(25),
Dept_Tel    VARCHAR2(12));

DESCRIBE Department;

CREATE TABLE time_table (
start_time      TIMESTAMP,
duration        INTERVAL DAY(6) TO SECOND (5),
duration2       INTERVAL YEAR TO MONTH);

DESCRIBE time_table;

SELECT * FROM TAB;

DROP TABLE Department;
DROP TABLE TIME_TABLE;

CREATE TABLE Departmet(
Dept_ID     VARCHAR2(10) NOT NULL,
Dept_Name   VARCHAR2(25) NULL,
Dept_Tel    VARCHAR2(12) NULL);

DESCRIBE Departmet;

SELECT * FROM TAB;
SELECT * FROM USER_CATALOG;

DROP TABLE Department;

CREATE TABLE Department (
Dept_ID     VARCHAR2(10),
Dept_Name   VARCHAR2(25),
Dept_Tel    VARCHAR2(12),
CONSTRAINT Department_pk PRIMARY KEY (Dept_ID));

DESCRIBE Department;

CREATE TABLE SG_Scores (
Student_ID      VARCHAR2(7),
Course_ID       VARCHAR2(5),
Score           NUMBER(3),
Grade           VARCHAR2(2),
Score_Asigned   DATE,
CONSTRAINT SG_Scores_pk PRIMARY KEY(Student_ID, Course_ID));

DESCRIBE SG_Scores;

CREATE TABLE Student (
Dept_ID     VARCHAR2(10),
Year        VARCHAR2(1),
Student_ID  VARCHAR2(7),
Name        VARCHAR2(20)   NOT NULL,
ID_Number   VARCHAR2(14)   NOT NULL,
Address     VARCHAR2(40),
CONSTRAINT Student_pk PRIMARY KEY (Student_ID),
CONSTRAINT Student_DeptID_fk FOREIGN KEY(Dept_ID)
           REFERENCES Department(dept_ID));

DESCRIBE Student;