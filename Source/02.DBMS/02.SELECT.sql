--[II] 'SELECT' COMMAND - THE MOST USED DML(Data manipulation Lanuge); search tool


--[1].HOW TO USE THE SQL 'SELECT' COMMAND 
SHOW USER;
SELECT * 
    FROM TAB; -- Print the table that the current account(SC0TT) has.

SELECT * 
    FROM EMP; --Print entire table of EMP
SELECT * 
    FROM DEPT; --All column and rows from the DEPT table

--EMP table's structure
DESC EMP;
DESC DEPT;


--[2]. SQL command (print certain column)
SELECT EMPNO, ENAME, SAL, JOB 
    FROM EMP;

SELECT EMPNO AS "���", ENAME AS "�̸�", SAL AS "�޿�", JOB 
    FROM EMP; -- giving nickname

SELECT EMPNO AS ���, ENAME AS �̸�, SAL AS �޿�, JOB 
    FROM EMP; -- giving nickname

SELECT EMPNO  ���, ENAME  "�� ��", SAL  �޿�, JOB 
    FROM EMP; -- must use "" when the nickanme has a space

SELECT EMPNO  NO, ENAME  NAME, SAL  SALARY, JOB 
    FROM EMP; -- TITLE: NO, NAME, SALARY


--[3]. SQL command (print certain rows)  - Comparison operators (can be in any form (number, letter, date))

SELECT EMPNO "���", ENAME "�̸�", SAL "�޿�" 
    FROM EMP 
    WHERE SAL = 3000; -- ����

SELECT EMPNO "���", ENAME "�̸�", SAL "�޿�" 
    FROM EMP 
    WHERE SAL != 3000; -- �ٸ���
    
SELECT EMPNO "���", ENAME "�̸�", SAL "�޿�"
    FROM EMP 
    WHERE SAL ^= 3000; -- �ٸ���
    
SELECT EMPNO "���", ENAME "�̸�", SAL "�޿�" 
    FROM EMP 
    WHERE SAL <> 3000; -- �ٸ���

-- 3.1:  Printing all employees with the name (ENAME) starting with 'A', 'B', 'C'
SELECT * FROM EMP 
    WHERE ENAME < 'D'; --in oracle, "" is ony used for nicknames

-- 3.2: Printing all employees which got hired before 1981
SELECT*FROM EMP 
    WHERE HIREDATE < '81/01/01';

-- 3.3: Printing all employees under the deptno 10
SELECT*FROM EMP 
    WHERE DEPTNO = 10;

-- 3.4: Print EMPNO, ENAME, MGR for the employer FORD
SELECT EMPNO, ENAME, MGR
    FROM EMP 
    WHERE ENAME='FORD';


-- [4]. Logical operators: AND(1), OR(2), NOT(3)

--(1)AND
-- 4.1.1:  Printing all employees if,  2000< salary <3000
SELECT *
    FROM EMP 
    WHERE 2000<=SAL 
    AND SAL<=3000;

-- 4.1.2:  Printing all employees that was hired in the year 1982
SELECT * 
    FROM EMP 
    WHERE HIREDATE >= '82/01/01' 
    AND HIREDATE<= '82/12/31';

-- 4.1.3: Setting date format (Current: YY/MM/DD OR RR/MM/DD)
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-YY';
ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD';

SELECT ENAME, HIREDATE 
    FROM EMP;

-- 4.1.4: Printing ENAME, SAL for employee's that have a yearly salary over 2400
SELECT ENAME, SAL, SAL*12 "YEARLY INCOME" 
    FROM EMP 
    WHERE SAL*12 >2400;
    
SELECT ENAME, SAL, SAL*12 "YEARLY INCOME" 
    FROM EMP 
    WHERE "YEARLY INCOME"*12 >2400; -- FOR 'WHERE', NICKNAME CANNOT BE USED
    
SELECT ENAME, SAL, SAL*12 "YEARLY INCOME" 
    FROM EMP 
    WHERE SAL*12 >2400 
    ORDER BY "YEARLY INCOME"; --FOR 'ORDER BY', NICKNAME CAN BE USED

--(2)OR
-- 4.2.1: Printing all fields for people in department 10 or their job is manager
SELECT*
    FROM EMP 
    WHERE DEPTNO=10 
    OR JOB='MANAGER';

--(3)NOT
-- 4.3.1: Printing all fields for people not in department 10 
SELECT* 
    FROM EMP 
    WHERE DEPTNO != 10;

SELECT* 
    FROM EMP 
    WHERE NOT DEPTNO = 10;

-- [5]. Arithmetic expressions (even if one field has NULL, the whole result becomes NULL)
SELECT ENAME, SAL "CURRENT SALARY", SAL+100 "INCREASED SALARY" 
    FROM EMP 
    WHERE DEPTNO=10;

--5.1: print ENAME, SAL, COMM, and SAL*12+COMM, for all the employees
--NVL (give a substitute value to a field that can have NULL)
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) 
    FROM EMP;

--5.2: print ENAME, MGR  for all the employees. If an employee does not have a manager, 0
SELECT ENAME, NVL(MGR, 0) 
    FROM EMP; 


-- [6].Concatenation Operators (���� ������)
SELECT ENAME || ' is a ' || JOB "EMPLOYEES"
    FROM EMP;

--6.1: print : "SMITH : yearly salary = XXX"
SELECT ENAME || ' : YEARLY SALARY = ' || (SAL*12+NVL(COMM,0)) 
    FROM EMP;


-- [7].Deduplication (�ߺ� ����)
SELECT JOB 
    FROM EMP;
    
SELECT DISTINCT JOB 
    FROM EMP;
    
SELECT DISTINCT DEPTNO 
    FROM EMP;


--PRACTICE QUESTIONS 1--


--1. emp ���̺��� ���� ���

DESC EMP;

--2. emp ���̺��� ��� ������ ��� 

SELECT * 
    FROM EMP;

--3. �� scott �������� ��밡���� ���̺� ���

SELECT * 
    FROM USER_TABLES;  -- SELECT  * FROM TAB;

--4. emp ���̺��� ���, �̸�, �޿�, ����, �Ի��� ���

SELECT EMPNO, ENAME, SAL, JOB, HIREDATE
    FROM EMP;

--5. emp ���̺��� �޿��� 2000�̸��� ����� ���, �̸�, �޿� ���

SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE SAL<2000;

--6. �Ի����� 81/02���Ŀ� �Ի��� ����� ���, �̸�, ����, �Ի��� ���


SELECT EMPNO, ENAME, JOB, HIREDATE 
    FROM EMP 
    WHERE HIREDATE< '81/02/01';

SELECT EMPNO, ENAME, JOB, HIREDATE 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'RR/MM/DD')  >= '81/02/01';

SELECT EMPNO, ENAME, JOB, HIREDATE 
    FROM EMP 
    WHERE HIREDATE  >= TO_DATE ('81/02/01', 'RR/MM/DD');


--#SETTING DATE (YYYY (4-letter year) , RR (2-letter year), M month, D daay

ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-RR';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

--#CHANGING DATE TYPE TO STRING TYPE: TO_CHAR(date type data, pattern)
--#CHANGING STRING TYPE TO DATE TYPE: TO_DATE(string type data, pattern)

--7. ������ SALESMAN�� ����� ��� �ڷ� ���

SELECT * 
    FROM EMP 
    WHERE JOB = 'SALESMAN';

--8. ������ CLERK�� �ƴ� ����� ��� �ڷ� ���

SELECT * 
    FROM EMP 
    WHERE JOB != 'CLERK';
    
SELECT *   
    FROM EMP 
    WHERE JOB <> 'CLERK';

--9. �޿��� 1500�̻��̰� 3000������ ����� ���, �̸�, �޿� ���

SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE SAL >= 1500 AND SAL<=3000;

--10. �μ��ڵ尡 10���̰ų� 30�� ����� ���, �̸�, ����, �μ��ڵ� ���

SELECT EMPNO, ENAME, JOB , DEPTNO 
    FROM EMP 
    WHERE DEPTNO= 10 OR DEPTNO= 30;

--11. ������ SALESMAN�̰ų� �޿��� 3000�̻��� ����� ���, �̸�, ����, �μ��ڵ� ���

SELECT EMPNO, ENAME, JOB , DEPTNO 
    FROM EMP 
    WHERE JOB= 'SALESMAN' OR SAL >=3000;

--12. �޿��� 2500�̻��̰� ������ MANAGER�� ����� ���, �̸�, ����, �޿� ���

SELECT EMPNO, ENAME, JOB , SAL 
    FROM EMP 
    WHERE SAL>=2500 AND JOB = 'MANAGER';

--13.��ename�� XXX �����̰� ������ XX�١� ��Ÿ�Ϸ� ��� ���(������ SAL*12+COMM)

SELECT ENAME || ' : ������ ' || JOB || ' �̰� ������ ' || (SAL*12+NVL(COMM,0)) 
    FROM EMP;



-- [8].SQL Operator (BETWEEN (1), IN (2) , LIKE (3) , IS NULL(4))

--(1)BETWEEN
--8.1.1:Printing EMPNO, ENAME, SAL, if 1500<SAL<1500
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE SAL>=1500 AND SAL <=3000;
    
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE SAL 
    BETWEEN 1500 AND 3000; --min number MUST come first (BETWEEN 3000 AND 1500 - not possible)

--8.1.2:Printing all info, if 1500<=SAL and SAL>3000
SELECT *
    FROM EMP 
    WHERE SAL 
    NOT BETWEEN 1500 AND 3000;

--8.1.3:Printing all info, if they were hired in 1982;
SELECT * 
    FROM EMP WHERE HIREDATE 
    BETWEEN '82/01/01' AND '82/12/31';

SELECT *   
    FROM EMP 
    WHERE TO_CHAR (HIREDATE, 'RR/MM/DD') 
    BETWEEN  '82/01/01' AND '82/12/31';

--8.1.4:Printing all info, if name starts with A or B;
SELECT * 
    FROM EMP 
    WHERE ENAME 
    BETWEEN 'A' AND 'C' AND ENAME !='C';

SELECT * 
    FROM EMP 
    WHERE TO_CHAR (HIREDATE, 'RR/MM/DD')
    BETWEEN  '82/01/01' AND '82/12/31';

--8.1.5:Printing all info, if name starts with B or C;
SELECT * 
    FROM EMP 
    WHERE ENAME 
    BETWEEN 'B' AND 'D' AND ENAME <>'D';

--(2)IN
--8.2.1:Printing all info, if DEPTNO is 10,20 or 40
SELECT * 
    FROM EMP 
    WHERE DEPTNO=10 
    OR DEPTNO=20 
    OR DEPTNO=40 ;
    
SELECT * 
    FROM EMP 
    WHERE DEPTNO 
    IN (10,20,40);

--8.2.1:Printing all info, if DEPTNO is NOT 10,20 or 40
SELECT * 
    FROM EMP 
    WHERE DEPTNO 
    NOT IN (10,20,40);
    
SELECT * 
    FROM EMP 
    WHERE DEPTNO !=10 
    AND  DEPTNO <>20 
    AND  DEPTNO ^=40;

--8.2.1:Printing all info, if EMPNO is 7902, 7788, 7566
SELECT * 
    FROM EMP 
    WHERE EMPNO 
    IN (7902, 7788, 7566);

--(3)LIKE: _ : one letter, % :longer than 1 letter
--8.3.1:Printing all info, for everyone whos names INCLUDES with M
SELECT * 
    FROM EMP 
    WHERE ENAME 
    LIKE'%M%';

--8.3.2:Printing all info, for everyone whos names STARTS with M
SELECT * 
    FROM EMP 
    WHERE ENAME 
    LIKE 'M%';

--8.3.3:Printing all info, for everyone whos names END with S
SELECT * 
    FROM EMP 
    WHERE ENAME 
    LIKE '%S';

--8.3.4:Printing all info, for everyone whos SAL ends with 5
SELECT * 
    FROM EMP 
    WHERE SAL 
    LIKE '%5';

--8.3.5:Printing all info, for everyone was hired in the year 1982
SELECT * 
    FROM EMP 
    WHERE HIREDATE
    LIKE '%82%';
    
SELECT * 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') 
    LIKE '82/%';

SELECT * 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'RR') = '82';

SELECT *   
    FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'RR') = 82;

--8.3.6:Printing all info, for everyone was hired in the Janurary
SELECT *
    FROM EMP 
    WHERE HIREDATE 
    LIKE '%/01/%';
    
SELECT * 
    FROM EMP 
    WHERE HIREDATE 
    LIKE '__/01/__';
    
SELECT * 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') 
    LIKE '__/01/__';

SELECT * 
    FROM EMP 
    WHERE TO_CHAR(HIREDATE, 'MM') = '01';

--8.3.6: Printing all info, for everyone was NOT hired in the year 1982 

SELECT * 
    FROM EMP 
    WHERE HIREDATE 
    NOT LIKE '%82%';

--8.3.7: Printing all info, for everyone that includes the letter %, in their name

SELECT * 
    FROM EMP 
    WHERE ENAME
    LIKE '%%%'; --all fields
    
SELECT * 
    FROM EMP 
    WHERE ENAME
    LIKE '%\%%' 
    ESCAPE '\';
    
INSERT INTO EMP 
    VALUES (9999, 'ȫ%', NULL, NULL,NULL, 9000,900,40);
ROLLBACK;


--(4)IS NULL
--8.3.1:Printing all info, for everyone whos COMM is NULL
SELECT * 
    FROM EMP 
    WHERE COMM IS NULL;

SELECT * 
    FROM EMP 
    WHERE COMM = NULL; --ERROR

--8.3.1:Printing all info, for everyone whos COMM is NULL or 0
SELECT * 
    FROM EMP 
    WHERE COMM IS NULL 
    OR COMM=0;

--8.3.1:Printing all info, for everyone who has COMM ( COMM is neither NULL nor 0)
SELECT * 
    FROM EMP 
    WHERE COMM IS NOT NULL 
    AND COMM<>0;
    
SELECT *
    FROM EMP 
    WHERE NOT COMM IS NULL 
    AND COMM<>0;


-- [9].SORTING (Ascending (1), Descending (2))

SELECT ENAME, SAL 
    FROM EMP 
    ORDER BY SAL;  -- ASCENDING ORDER SALARY
    
SELECT ENAME, SAL 
    FROM EMP 
    ORDER BY SAL ASC;  -- ASCENDING ORDER SALARY
    
SELECT ENAME, SAL
    FROM EMP 
    ORDER BY SAL DESC;  -- DESCENDING ORDER SALARY

SELECT ENAME, SAL 
    FROM EMP 
    ORDER BY ENAME; -- ASCENDING ORDER ALPHABET

SELECT ENAME, SAL
    FROM EMP 
    ORDER BY ENAME DESC; -- DESCENDING ORDER ALPHABET

SELECT ENAME, HIREDATE 
    FROM EMP 
    ORDER BY HIREDATE; -- ASCENDING ORDER DATE

SELECT ENAME, HIREDATE 
    FROM EMP 
    ORDER BY HIREDATE DESC;-- DESCENDING ORDER DATE


--9.1:Printing ENAME, (SAL*12+COMM), IN ASC ORDER FOR YEARLY SALARY, IF YEARLY SALARY IS THE SAME, IN ASC ORDER TO NAME
SELECT ENAME, SAL*12+NVL(COMM,0) ANNUAL_SALARY 
    FROM EMP
    ORDER BY SAL*12+NVL(COMM,0) DESC, ENAME;

SELECT ENAME, SAL*12+NVL(COMM,0) ANNUAL_SALARY
    FROM EMP
    ORDER BY ANNUAL_SALARY DESC, ENAME;


--PRACTICE QUESTIONS 2--

--1.	EMP ���̺��� sal�� 3000�̻��� ����� empno, ename, job, sal�� ���

SELECT EMPNO, ENAME, JOB, SAL 
    FROM EMP 
    WHERE SAL>=3000;
 
--2.	EMP ���̺��� empno�� 7788�� ����� ename�� deptno�� ���

SELECT ENAME, DEPTNO 
    FROM EMP 
    WHERE EMPNO=7788;

--3.	������ 24000�̻��� ���, �̸�, �޿� ��� (�޿�������)

SELECT ENAME, DEPTNO,
    FROM EMP 
    WHERE (SAL*12+NVL(COMM,0))>24000
    ORDER BY SAL;

--4.	DLQ������ 1981�� 2�� 20�� 1981�� 5�� 1�� ���̿� �Ի��� ����� �����, ��å, �Ի����� ��� (�� hiredate ������ ���)

SELECT ENAME, JOB, HIREDATE 
    FROM EMP 
    WHERE HIREDATE 
    BETWEEN '81/02/20' AND '81/05/01'
    ORDER BY HIREDATE;

--5.	deptno�� 10,20�� ����� ��� ������ ��� (�� ename������ ����)

SELECT* 
    FROM EMP 
    WHERE DEPTNO 
    IN  (10,20)
    ORDER BY ENAME;

--6.	sal�� 1500�̻��̰� deptno�� 10,30�� ����� ename�� sal�� ���
-- (�� HEADING�� employee�� Monthly Salary�� ���)

SELECT ENAME employee, SAL "Monthly Salary"
    FROM EMP 
    WHERE SAL<=1500
    AND DEPTNO  
    IN (10,30);


--7.	hiredate�� 1982���� ����� ��� ������ ���

SELECT *
    FROM EMP 
    WHERE HIREDATE 
    BETWEEN '82/01/01' AND '82/12/31';

--8.	�̸��� ù�ڰ� C����  P�� �����ϴ� ����� �̸�, �޿� �̸��� ����

SELECT *
    FROM EMP
    WHERE ENAME 
    BETWEEN 'C' AND 'Q'
    AND ENAME <>'Q';
    
    SELECT* FROM EMP;
--9.	comm�� sal���� 10%�� ���� ��� ����� ���Ͽ� �̸�, �޿�, �󿩱��� 
--����ϴ� SELECT ���� �ۼ�

SELECT ENAME, SAL, COMM
    FROM EMP 
    WHERE COMM = SAL*1.1;

--10.	job�� CLERK�̰ų� ANALYST�̰� sal�� 1000,3000,5000�� �ƴ� ��� ����� ������ ���

SELECT * 
    FROM EMP 
    WHERE SAL NOT IN (1000,3000,5000)
    AND JOB IN ('CLERK', 'ANALYST');

--11.	ename�� L�� �� �ڰ� �ְ� deptno�� 30�̰ų� �Ǵ� mgr�� 7782�� ����� 
--��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.

SELECT *
    FROM EMP 
    WHERE (ENAME 
    LIKE '%L%L%'
    AND DEPTNO =30)
    OR MGR = 7782;

--12.	�Ի����� 81�⵵�� ������ ���,�����, �Ի���, ����, �޿��� ���

SELECT EMPNO, ENAME, HIREDATE, JOB, SAL
    FROM EMP 
    WHERE HIREDATE 
    BETWEEN '81/01/01' AND '81/12/31';

--13.	�Ի�����81���̰� ������ 'SALESMAN'�� �ƴ� ������ ���, �����, �Ի���, 
-- ����, �޿��� �˻��Ͻÿ�.

SELECT EMPNO, ENAME, HIREDATE, JOB, SAL
    FROM EMP 
    WHERE HIREDATE 
    BETWEEN '81/01/01' AND '81/12/31'
    AND JOB <> 'SALESMAN';

--14.	���, �����, �Ի���, ����, �޿��� �޿��� ���� ������ �����ϰ�, 
-- �޿��� ������ �Ի����� ���� ������� �����Ͻÿ�.

SELECT EMPNO, ENAME, HIREDATE, JOB, SAL
    FROM EMP 
    ORDER BY SAL DESC , HIREDATE;

--15.	������� �� ��° ���ĺ��� 'N'�� ����� ���, ������� �˻��Ͻÿ�

SELECT EMPNO, ENAME
    FROM EMP 
    WHERE ENAME LIKE '__N%';

--16.	����� 'A'�� �� ����� ���, ������� ���

SELECT EMPNO, ENAME
    FROM EMP 
    WHERE ENAME LIKE UPPER('%al%');

--17.	����(SAL*12)�� 35000 �̻��� ���, �����, ������ �˻� �Ͻÿ�.

SELECT EMPNO, ENAME, DEPTNO, SAL*12+NVL(COMM,0) ANNUAL_SALARY
    FROM EMP 
    WHERE (SAL*12+NVL(COMM,0))>35000;








