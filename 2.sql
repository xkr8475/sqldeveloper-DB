--6주차 

--04/06
--ex05.34
RENAME Course TO T_Course;

--ex05.35
SELECT * FROM USER_CATALOG;

--ex05.36
DROP TABLE Professor PURGE;
CREATE TABLE Professor (
Professor_ID    VARCHAR2(3)  PRIMARY KEY,
Name            VARCHAR2(20) NOT NULL,
Position        VARCHAR2(10) NOT NULL CONSTRAINT Professor_ck
    CHECK (Position in ('교수', '부교수', '조교수', '초빙교수')),
Telephone       VARCHAR2(12) CONSTRAINT Professor_uk UNIQUE);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM    USER_CONSTRAINTS
WHERE   TABLE_NAME = 'PROFESSOR';

--ex05.37
COLUMN POSITION FORMAT 999
SELECT CONSTRAINT_NAME, COLUMN_NAME, POSITION
FROM   USER_CONS_COLUMNS
WHERE  TABLE_NAME = 'PROFESSOR';

--퀴즈
DROP TABLE Album;

CREATE TABLE Album (
Abum_NO         NUMBER(2)  PRIMARY KEY,
Title           VARCHAR2(30) NOT NULL,
Artist          VARCHAR2(30),
Price           NUMBER(7),
Dday            DATE,
Distribute      VARCHAR2(30),
Score           NUMBER(1));

DESCRIBE Album;




