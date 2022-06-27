-- [VII] DDL, DML, DCL
--          [1] DDL(CONSTRUCTING TABLE, DELETING TABLE, CHANGING TABLE LAYOUT)
--          [2] DML(SEARCH=SELECT, ADDING=INSERT, EDITING=UPDATE, DELETE=DELETE)
--          [3] DCL(CONSTRUCTING USER ADDRESS, GIVING ACCESS RIGHTS, RETRIEVE ACCESS RIGHT, DELETE USER PROFILE, TRANSACTION COMMANDS=ROLLBACK,COMMIT)

--[1]. DDL (Data Definition Langauge)

--[1.1] CREATE TABLE

--1.1.1 Example of making a table

CREATE TABLE BOOK(
    BOOKID NUMBER(4),   -- Field type is a number of length 4
    BOOKNAME VARCHAR2(300), -- Field character is 300BYTE
    PUBLISHER VARCHAR2(300),--Field character is 300BYTE
    RDATE     DATE,         -- Date type
    PRICE     NUMBER(8),    -- Field type is a number of length 8
    PRIMARY KEY(BOOKID) );  --Setting PRIMARY KEY (provides unique ID for every row in a database table.)

SELECT * FROM BOOK;
DROP TABLE BOOK;

--1.1.2 Example 2 of making a table
CREATE TABLE book (
    bookid NUMBER(4) PRIMARY KEY,
    BOOKNAME VARCHAR2 (20),
    PUBLISHER  VARCHAR2 (20),
    RDATE DATE,
    PRICE NUMBER(8));
SELECT * FROM BOOK;
DESC EMP;
SELECT ROWNUM,EMPNO,ENAME FROM EMP ORDER BY SAL; --Made by default for every table

--1.1.3 Creating table EMP01 (similar to EMP table) <- EMPNO (NUMEBR(4), ENAME (20), SAL (7,2)

CREATE TABLE EMP01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2 (20),
    SAL NUMBER (7,2));
    
--1.1.4 Creating table DEPT01 (similar to DEPT table) <- DEPTNO (NUM 2, PK), DNAME (CHAR (14), LOC (CHAR13)
    
CREATE TABLE DEPT01(
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2 (14),
    LOC VARCHAR2 (13));

--1.1.5 Creating a new table, equal to that of EMP table

SELECT * FROM TAB; --checking all the tables under my username**

CREATE TABLE EMP02 
    AS
    SELECT * FROM EMP; --Constraints not included
    
--1.1.6 Creating a new table, getting EMPNO, ENAME and DEPTNO from the EMp table

CREATE TABLE EMP03
    AS 
    SELECT EMPNO, ENAME, DEPTNO  FROM EMP;

--1.1.7 Creating a new table, getting only info of the employees in DEPTNO = 10

CREATE TABLE EMP04
    AS 
    SELECT *  FROM EMP WHERE DEPTNO=10;
    
--1.1.8 Creating a new table, only getting the layout

CREATE TABLE EMP05
    AS 
    SELECT *  FROM EMP WHERE 1=0;
    

--[1.2]  CHANGING TABLE LAYOUT - ALTER, MODIFY, DROP

--1.2.1 ADDING FIELD (ADD)
    
SELECT * FROM EMP03; 

ALTER TABLE EMP03 
    ADD(JOB VARCHAR2 (20), 
    SAL NUMBER (7,2) );
    
SELECT * FROM EMP03;

ALTER TABLE EMP03 
    ADD (COMM NUMBER(7,2));

ALTER TABLE EMP03 
    ADD (MGR NUMBER(4));

--1.2.2 CHANGING FIELD (MODIFY)

SELECT * FROM EMP03;

ALTER TABLE EMP03 
    MODIFY (EMPNO VARCHAR2(4)); -- when the pre-existing data is in number format, it can only be modified to another form of number format
    
ALTER TABLE EMP03 
    MODIFY (EMPNO NUMBER(3)); --ERROR 

ALTER TABLE EMP03 
    MODIFY (EMPNO NUMBER(5)); --NO ERROR

SELECT MAX (LENGTH(ENAME)) 
    FROM EMP; -- Finding the length of a string variable (this case max length is 6)

ALTER TABLE EMP03 
    MODIFY (ENAME VARCHAR2(30));

ALTER TABLE EMP03 
    MODIFY (ENAME VARCHAR2 (6));
    
ALTER TABLE EMP03 
    MODIFY (ENAME VARCHAR2 (5)); --since there is an ename with length 6, a length less than 6 causes an ERROR.

DESC EMP03;
    
--1.2.3  DELETING FIELD IN A TABLE - DROP

ALTER TABLE EMP03 DROP COLUMN JOB; --deleting field job

SELECT * FROM EMP03;

--1.2.4  Logically limit access to certain fields

ALTER TABLE EMP03 
    DROP UNUSED COLUMNS;


--[1.3] DELETING TABLE

DROP TABLE EMP01;
DROP TABLE DEPT; -- If another table has reference data from this table, it cannot be deleted

--[1.4] TRUNCATE (Deleting row)

SELECT * FROM EMP03;
TRUNCATE TABLE EMP03;

--[1.5] Changing table name - RENAME

RENAME EMP02 TO TEST;

-- [1.6] Data Dictionary and Data dictionary view

-- USER_XXX : Objects (TABLE, INDEX, CONSTRAINTS, VIEW) that this account has 
    -- ex. USER_TABLES, USER_INDEXES, USER_CONSTRAINTS, USER_VIEWS
    
-- ALL_XXX : Objects (TABLE, INDEX, CONSTRAINTS, VIEW) that this account has CAN access
    -- ex. ALL TABLES, ALL INDEXES, ALL CONSTRAINTS, ALL VIEWS

--DBAL_XXX : ALL dbms objects for people who has access of DBA
    -- ex. ALL TABLES, ALL INDEXES, ALL CONSTRAINTS, ALL VIEWS
    
SELECT * FROM ALL_TABLES;

SELECT * FROM ALL_INDEXES;

SELECT * FROM ALL_CONSTRAINTS;

SELECT * FROM ALL_VIEWS;

SELECT * FROM DBA_TABLES;

SELECT * FROM DBA_INDEXES;

SELECT * FROM DBA_CONSTRAINTS;

SELECT * FROM DBA_VIEWS;    

SELECT * FROM USER_TABLES; --Table info that my account owns

SELECT * FROM USER_INDEXES; --Index info that my account owns

SELECT * FROM USER_CONSTRAINTS; -- Constraint conditions my account has

SELECT * FROM USER_VIEWS; -- View information my account has


--[2] DML(Data manipulation Language)

--[2.1] INSERT
        -- INSERT INTO tableName VALUES (value1, value2, value3...)
        -- INSERT INTO tableName (field1, field2....) VALUES (value1, value2, value3...)

SELECT *
    FROM DEPT01
    ORDER BY DEPTNO;
    
INSERT
    INTO DEPT01
    VALUES (50, 'ACCOUNTING', 'NEW YORK');

INSERT
    INTO DEPT01 (DEPTNO, LOC)
    VALUES (60, 'SEOUL'); --usually used when data is inserting only in partial fields
    
INSERT
    INTO DEPT01 (DEPTNO, DNAME)
    VALUES (70, 'OPERATION');
    
INSERT
    INTO DEPT01 (DEPTNO, DNAME, LOC)
    VALUES (80, 'HR', NULL);
    
INSERT
    INTO DEPT01
    VALUES (90, 'SALES', NULL);

INSERT
    INTO DEPT01
    SELECT * FROM DEPT; --using subquery
    
COMMIT; --actually input all this in the data base (cannot ROLLBACK anymore)

--[2.2]. UPDATE
        -- UPDATE  tableName SET fieldName1 = value1 ,  fieldName2 = value2 WHERE condition1;

DROP TABLE EMP01;

CREATE TABLE EMP01 
    AS SELECT * 
    FROM EMP;

--2.2.1 Change everyone's DEPTNO = 30

UPDATE EMP01 SET DEPTNO =30;
    SELECT * FROM EMP01;

ROLLBACK; --Can only be used for DML
    SELECT * FROM EMP01;

--2.2.2 Increase everyone's SAL by 10%

UPDATE EMP01 SET SAL = SAL*1.1;
    SELECT * FROM EMP01;

--2.2.3 Change HIREDATE to today for DEPTNO = 30 and change its DEPT =30

UPDATE EMP01
    SET HIREDATE = SYSDATE, 
    DEPTNO =30
    WHERE DEPTNO = 10;
    
--2.2.4 For employees with SAL >= 3000, increase SAL by 10*

UPDATE EMP01 SET SAL = SAL*1.1
    WHERE SAL >=3000;

--2.2.5 For employees working in DALLAS, increase SAL by 1000 (use subquery)

UPDATE EMP01
    SET SAL = SAL+1000
    WHERE DEPTNO = (SELECT DEPTNO
                                    FROM DEPT 
                                    WHERE LOC = 'DALLAS');

--2.2.6 Change SCOTT's DEPTNO =20 and JOB = MANAGER, increase SAL and COMM by 500 and MGR ='KING

UPDATE EMP01
    SET DEPTNO = 20,
    JOB = 'MANAGER',
    SAL = SAL+500,
    COMM = NVL(COMM,0) + 500,
    MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')
    WHERE ENAME = 'SCOTT';

--2.2.6 Change LOC of ALL DEPTNO >= 20, to 60, in the DEPT table

UPDATE DEPT01
    SET LOC = (SELECT LOC FROM DEPT WHERE DEPTNO=60)
    WHERE DEPTNO >=20;


-- 2.2.7 Change everyone's salary and hiredate equal to KING's 
COMMIT;
ROLLBACK;
SELECT * FROM EMP01;

UPDATE EMP01
    SET SAL = (SELECT SAL      FROM EMP WHERE ENAME='KING'),
        HIREDATE = (SELECT HIREDATE FROM EMP WHERE ENAME='KING');

UPDATE EMP01
    SET (SAL, HIREDATE) = (SELECT SAL, HIREDATE FROM EMP WHERE ENAME='KING');
    
    
-- 2.2.8 DEPT01 테이블의 20번 부서의 지역명과 부서명을 40번 부서의 지역명과 부서명으로 변경
UPDATE DEPT01
    SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT01 WHERE DEPTNO=40)
    WHERE DEPTNO = 20;
COMMIT;

--[2.3]. DELETE
        -- DELETE FROM tableName WHERE condition;

-- 2.3.1 Delete employee names 'FORD'

DELETE 
    FROM EMP01 
    WHERE ENAME='FORD';

--2.3.2 Delete employees in DEPTNO = 30

DELETE 
    FROM EMP01 
    WHERE DEPTNO=30;

--2.3.3 Delete employees in DNAME = RESEARCH

DELETE 
    FROM EMP01 
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='RESEARCH');
    
-- 2.3.4 Delete employees without a job, in table SAM01
SELECT * FROM SAM01;
DELETE FROM SAM01 WHERE JOB IS NULL;


--[3]. DCL (Data Control Langauge)

--Creating new account called 'Scott2'

CREATE USER Scott2 identified by 1234;

--Giving access rights 

GRANT CREATE SESSION TO Scott2;

GRANT ALL ON EMP TO Scott2; -

GRANT ALL ON DEPT TO Scott2;

SHOW USER;

--Taking away access rights (REVOKE)

REVOKE ALL ON EMP 
    FROM Scott2; --Scott2 loses ALL rights on EMP table

REVOKE ALL ON DEPT
    FROM Scott2;

SHOW USER;

DROP USER Scott2 CASCADE;



--[4] CONSTRAINTS (제약조건): To avoid invalid data to be edited or inputted in to the table


--[4.1] PRIMARY KEY: Uniquely identifies each row in the table (cannot be NULL) **

--[4.2] NOT NULL: Does not have a NULL value

--[4.3] UNIQUE: Uniquely identifies each row in the table except when the value is empty (NULL can be inserted in multiple rows)

--[4.4] FOREIGN KEY: Each row in the table is in reference to another row (ex. DEPTNO from EMP is in reference of DEPTNO of DEPT)**

    --NON-IDENTIFYING RELATIONSHIPS (비식별 관계): Red dotted arrow in exdERD 
    --IDENTIFYING RELATIONSHIPS (식별 관계): Green dotted arrow in exdERD

--[4.5] CHECK (condition): If a certain condition is satisfied, allow NULL value

--[4.6] DEFUALT: Sets a defualt value (If a specific value is not givien to a row, NULL is inputted) **


CREATE TABLE DEPT1(
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2 (14) UNIQUE,
    LOC VARCHAR2(13) NOT NULL);

CREATE TABLE EMP1(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2 (10) NOT NULL,
    JOB VARCHAR2 (9),
    MGR NUMBER (4),
    HIREDATE DATE DEFAULT SYSDATE,
    SAL NUMBER (7,2) CHECK (SAL>0),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT1(DEPTNO));

DROP TABLE DEPT1; -- ERROR: If there is a field which refers to another table, the parent table can only be deleted once all its child tables are deleted.

--4.6.1 deleting table when there are many reference tables within it

DROP TABLE EMP1; --DROP childTable first
DROP TABLE DEPT1; --Then DROP parentTable 
DROP TABLE DEPT1 CASCADE CONSTRAINT;--Deleting table regardless of the reference (not reccommended)


CREATE TABLE DEPT1(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2 (14),
    LOC VARCHAR2(13) NOT NULL,
    PRIMARY KEY (DEPTNO),
    UNIQUE (DNAME) );

CREATE TABLE EMP1(
    EMPNO NUMBER(4),
    ENAME VARCHAR2 (10) NOT NULL, -- not null must always written next to it
    JOB VARCHAR2 (9),
    MGR NUMBER (4),
    HIREDATE DATE DEFAULT SYSDATE, --default is always written next to it
    SAL NUMBER (7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2),
    PRIMARY KEY (EMPNO),
    CHECK (SAL>0),
    FOREIGN KEY (DEPTNO) REFERENCES DEPT1(DEPTNO) );
   
INSERT INTO DEPT1 
SELECT * FROM DEPT; --adding all values in DEPT into DEPT1

INSERT INTO DEPT1 
    VALUES (40, 'IT', 'SEOUL'); --ERROR (##VIOLATION of Primary key) - cannot repeat same DEPTNO

INSERT INTO DEPT1 
    VALUES (50, 'IT', NULL); --ERROR (##VIOLATION of NOT NULL condition)

INSERT INTO DEPT1 
    VALUES (50, 'SALES', 'SEOUL'); --ERROR (##VIOLATION of UNIQUE condition)

INSERT INTO EMP1 (EMPNO, ENAME, DEPTNO) 
    VALUES (1001, 'UNIE', 10); --NOTHING IS VIOLATED 
    
INSERT INTO EMP1 (EMPNO,ENAME, SAL)
    VALUES (1002, -1);--ERROR (##VIOLATION of NOT NULL condition)
    
INSERT INTO EMP1 (EMPNO,ENAME, SAL)
    VALUES (1002, 'CHARLIE', -1); --ERROR (##VIOLATION of CHECK condition)

INSERT INTO EMP1
    VALUES (1002, 
    'CHARLIE', 
    NULL, 
    NULL, 
    TO_DATE('95/01/01', 'YY/MM//DD'), 
    900, NULL, 
    99); --ERROR (##VIOLATION of Primary key)

DROP TABLE EMP1; --dropping child table first
DROP TABLE DEPT1; --then DROP parentTable 






--PRACTICE--

--[1]. QUESTION 1
    
CREATE TABLE SAM01
    AS 
    SELECT EMPNO, ENAME, JOB, SAL  
    FROM EMP 
    WHERE 1=0;
    
ALTER TABLE SAM01
    MODIFY (EMPNO NUMBER(4) PRIMARY KEY);
    
INSERT
    INTO SAM01
    SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10; --using subquery
    
INSERT
    INTO SAM01
    VALUES (1000, 'APPLE' , 'POLICE', 10000);
    
    INSERT
    INTO SAM01
    VALUES (1010, 'BANANA' , 'NURSE', 15000);
    
   INSERT
    INTO SAM01
    VALUES (1020, 'ORANGE' , 'DOCTOR', 25000);
    
    INSERT
    INTO SAM01
    VALUES(1030, 'VERY' , NULL, 25000);
    
    INSERT
    INTO SAM01
    VALUES(1040, 'CAT' , NULL, 2000);
    
COMMIT;


--[2]. QUESTION 2     

--[1]

CREATE TABLE MY_DATA (
    ID NUMBER(4) PRIMARY KEY,
    NAME VARCHAR2 (10),
    USERID VARCHAR2 (30),
    SALARY NUMBER(10, 2));

--[2]
INSERT
    INTO MY_DATA (ID, NAME, USERID, SALARY)
    VALUES (1, 'Scott' , 'sscott', 10000.00);

INSERT
    INTO MY_DATA (ID, NAME, USERID, SALARY)
    VALUES (2, 'Ford' , 'fford', 13000.00);
   
INSERT
    INTO MY_DATA
    VALUES (3, 'Patel' , 'ppatel', 33000.00);
   
 INSERT
    INTO MY_DATA
    VALUES (4, 'Report' , 'rreport', 23500.00);
   
  INSERT
    INTO MY_DATA
    VALUES (5, 'Good' , 'ggood', 44450.00);
   
--[3]  
SELECT ID, NAME, USERID, TO_CHAR(SALARY, '99,999.99')
    FROM MY_DATA;

--[4]  
COMMIT;

--[5]
UPDATE MY_DATA
    SET SALARY = 65000.00
    WHERE ID =3;

--[6]
DELETE FROM MY_DATA 
    WHERE NAME='Ford';

--[7]
UPDATE MY_DATA
    SET SALARY = 15000.00
    WHERE SALARY <= 15000.00;
    
--[8]
DROP TABLE MY_DATA;
    

-- [3].QUESTION 3

DROP TABLE BOOKCATEGORY;

CREATE TABLE BOOKCATEGORY(
    CATEGORY_CODE NUMBER(3) PRIMARY KEY,
    CATEGORY_NAME VARCHAR2 (15) UNIQUE,
    OFFICE_LOC VARCHAR2(15) NOT NULL);

INSERT INTO BOOKCATEGORY (CATEGORY_CODE, CATEGORY_NAME, OFFICE_LOC)
    VALUES (100, '철학', '3F 인문실');

INSERT INTO BOOKCATEGORY (CATEGORY_CODE, CATEGORY_NAME, OFFICE_LOC)
    VALUES (200, '인문', '3F 인문실');
    
INSERT INTO BOOKCATEGORY (CATEGORY_CODE, CATEGORY_NAME, OFFICE_LOC)
    VALUES (300, '자연과학 ', '4F 과학실');

INSERT INTO BOOKCATEGORY (CATEGORY_CODE, CATEGORY_NAME, OFFICE_LOC)
    VALUES (400, 'IT ', '4F 과학실');
    
SELECT * FROM BOOKCATEGORY;
DROP TABLE BOOK;
    
CREATE TABLE BOOK(
    CATEGORY_CODE NUMBER (3),
    BOOKNO VARCHAR(30) PRIMARY KEY,
    BOOKNAME VARCHAR2 (30),
    PUBLISHER VARCHAR2 (30),
    PUBYEAR  NUMBER (4) DEFAULT (EXTRACT (YEAR FROM SYSDATE)),
    FOREIGN KEY (CATEGORY_CODE) REFERENCES  BOOKCATEGORY(CATEGORY_CODE));

INSERT INTO BOOK (CATEGORY_CODE, BOOKNO, BOOKNAME, PUBLISHER)
    VALUES (100, '100A01', '철학자의삶', '더존출판');

INSERT INTO BOOK (CATEGORY_CODE, BOOKNO, BOOKNAME, PUBLISHER, PUBYEAR)
    VALUES (400, '400A01', '이것이 DB다', '더존출판', 2018);

-- [4].QUESTION 4
    
DROP TABLE MAJOR;

CREATE TABLE MAJOR(
    MAJOR_CODE NUMBER(1) PRIMARY KEY,
    MAJOR_NAME VARCHAR2 (30) UNIQUE,
    MAJOR_OFFICE_LOC VARCHAR2(30) NOT NULL);

INSERT INTO MAJOR (MAJOR_CODE, MAJOR_NAME, MAJOR_OFFICE_LOC)
    VALUES (1, '경영정보', '경영관 305호');

INSERT INTO MAJOR (MAJOR_CODE, MAJOR_NAME, MAJOR_OFFICE_LOC)
    VALUES (2, '소프트웨어공학', '정보관 808호');
    
INSERT INTO MAJOR (MAJOR_CODE, MAJOR_NAME, MAJOR_OFFICE_LOC)
    VALUES (3, '디자인', '예술관 606호');
    
 INSERT INTO MAJOR (MAJOR_CODE, MAJOR_NAME, MAJOR_OFFICE_LOC)
    VALUES (4, '경제', '경상관 202호');

    
SELECT * FROM MAJOR;

DROP TABLE STUDENT;
    
CREATE TABLE STUDENT(
    STUDENT_CODE VARCHAR2(3),
    STUDENT_NAME VARCHAR2(10) NOT NULL,
    SCORE NUMBER(3),
    MAJOR_CODE NUMBER(1),
    CHECK (0<=SCORE AND SCORE<=100),
    FOREIGN KEY (MAJOR_CODE) REFERENCES  MAJOR(MAJOR_CODE));

INSERT INTO STUDENT
    VALUES ('A01', '김길동', 100, 1);

INSERT INTO STUDENT
    VALUES ('A02', '문길동', 90, 2);

INSERT INTO STUDENT
    VALUES ('A03', '홍길동', 95, 1);

    
    
    
    