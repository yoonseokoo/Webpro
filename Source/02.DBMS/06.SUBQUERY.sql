-- [VI] SUB QUERY: WHEN THERE IS A QUERY INSIDE A QUERY

--[1]. INTRO TO SUB QUERY (Why is it needed?)

SELECT MAX(SAL)
    FROM EMP; --sub query

SELECT EMPNO, ENAME, JOB, SAL
    FROM EMP
    WHERE SAL = (SELECT MAX(SAL) FROM EMP); -- Main query

--[2] SQ TYPE 1 - Single row (When the result is a single row) : =    >   >=   <   <=   !=

--2.1. print DNAME that 'SCOTT' works in

SELECT DEPTNO 
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
SELECT DNAME 
    FROM DEPT
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'); --using a main and subquery
        
SELECT DNAME   
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO 
    AND ENAME = 'SCOTT'; --using join

--[3] SQ TYPE(1) - Multiple row : IN   ANY    ALL     EXISTS

--3.1 print ENAME and SAL of employees in the same DEPTNO as 'SCOTT'

SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
FROM EMP
WHERE ENAME='SCOTT')
AND ENAME != 'SCOTT';

--3.2 print ENAME and SAL of employees in the same LOC

SELECT ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO =  D.DEPTNO
    AND LOC = (SELECT LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'SCOTT')
    AND ENAME != 'SCOTT';

--3.3 ENAME and HIREDATE of emploee who was most recently hired
SELECT MAX(HIREDATE) FROM EMP; -- ��������
    SELECT HIREDATE "LAST", ENAME "LASTMAN" FROM EMP 
        WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP); -- ��������

--3.4 ENAME and HIREDATE of emploee who was hired the first
SELECT E1.HIREDATE, E1.ENAME, E2.HIREDATE, E2.ENAME 
    FROM EMP E1, EMP E2
    WHERE E1.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP) 
    AND E2.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
            
-- 3.5 ENAME and HIREDATE of emploee who was hired the first AND who was most recently hired

SELECT E1.HIREDATE, E1.ENAME, E2.HIREDATE, E2.ENAME 
    FROM EMP E1, EMP E2
    WHERE E1.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP) 
    AND E2.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
            
            
SELECT 
    (SELECT MAX(HIREDATE) FROM EMP) LAST,
    (SELECT ENAME FROM EMP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP)) LASTMAN,
    (SELECT MIN(HIREDATE) FROM EMP) FIRST,
    (SELECT ENAME "FIRSTMAN" FROM EMP WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP)) FIRSTMAN
    FROM DUAL;
    
-- 3.6  Employees who work in the same DEPTNO as SCOTT

SELECT SUM(SAL) 
    FROM EMP 
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');
    
-- 3.7  Employees who have the same JOB as SCOTT

SELECT *
    FROM EMP 
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME='SCOTT');
    
-- 3.8 ENAME and DEPTNO for employees working in DALLAS

SELECT ENAME, DEPTNO 
    FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');

-- 3.9. 'KING'�� ���ӻ���� ����� �̸��� �޿�

SELECT ENAME, SAL 
    FROM EMP 
    WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME='KING');
    
SELECT W.ENAME, W.SAL
        FROM EMP W, EMP M
        WHERE W.MGR=M.EMPNO AND M.ENAME='KING'; -- using SELF JOIN
    
--3.10 ENAME and SAL for employees who receive below the AVG(SAL)

SELECT ENAME, SAL 
    FROM EMP 
    WHERE SAL <= (SELECT AVG(SAL) FROM EMP);
    
--3.11 ENAME, SAL. AVG(SAL) for employees who receive below the AVG(SAL)

    SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)) AVG
        FROM EMP
        WHERE SAL <= (SELECT AVG(SAL) FROM EMP);
        
--3.12 ENAME, SAL. AVG(SAL), difference for employees who receive below the AVG(SAL)
    SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)-SAL, 1) DIFF
        FROM EMP
        WHERE SAL <= (SELECT AVG(SAL) FROM EMP);
        
--3.13 employees who have the same JOB & DEPTNO as SCOTT

SELECT * FROM EMP
    WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT') AND ENAME<>'SCOTT';


--[4]. SQ TYPE 2 : Multiple row:  IN, ALL, ANY=SOME, EXISTS

--[4.1] IN: If atleast one condition in the subquery is satisfied, true

-- 4.1.1 ENAME, HIREDATE and DEPTNO for the employee who joined the team latest, by DEPTNO
  
SELECT ENAME, HIREDATE, DEPTNO
    FROM EMP
    WHERE (DEPTNO, HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);

-- 4.1.2 All info for the enmployee who's department has a person earning more than 3000

 SELECT *
    FROM EMP 
    WHERE DEPTNO 
    IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000);


--[4.2] ALL: All conditions in the subquery has to be satisfied to be true

--4.2.1 All info of employees where SAL > (highest SAL in DEPT 30) 

SELECT * 
    FROM EMP 
    WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); 

--[4.3] ANY=SOME: If atleast one result in the subquery is satisfied, true

-- 4.3.1. All info for employees whos SAL > (atleast one employee's SAL in DEPT 30)

 SELECT * 
    FROM EMP 
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30); 

--[4.4] EXISTS: If atleast one result in the subquery is satisfied, true

-- 4.3.1. EMPNO, ENAME, SAL  of employees who have someone working under them

 SELECT EMPNO, ENAME, SAL
    FROM EMP MANAGER 
    WHERE EXISTS (SELECT * FROM EMP WHERE EXISTS (SELECT * FROM EMP WHERE EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR)));

--DISTINCT (DELETE REPETITION)
SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
FROM EMP W, EMP M , EMP T
WHERE W.MGR = M.EMPNO;

-- 4.3.2. All info of employees who doesn't have anyone working for them

--Using sub query:
SELECT *
    FROM EMP MANAGER
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);

--Using self-join
SELECT W.ENAME, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+) = M.EMPNO
    AND W.ENAME IS NULL;
    
    
-- 4.3.3 EMPNO, ENAME, HIREDATE, SAL, SALGRADE, for employees whos sal>3000, picking those who have the highest salary

SELECT EMPNO, ENAME, HIREDATE, SAL, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL
        AND (GRADE, SAL) IN (SELECT GRADE, MAX(SAL) 
                                                FROM EMP, SALGRADE
                                                WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000
                                                GROUP BY GRADE);

--4.3.4 Group HIREDATE quarterly, and print the highest SAL. Print QUARTER, EMPNO, ENAME, JOB,  MGR, HIREDATE, SAL, COMM

SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) "QUARTER", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM
    FROM EMP
    WHERE (CEIL(EXTRACT(MONTH FROM HIREDATE)/3), SAL) IN
            (SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3), MAX(SAL) 
                FROM EMP 
                GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3))
    ORDER BY QUARTER;

--4.3.5 print ENAME, SAL and JOB of employees whos SAL > any SAL of SALESMAN (do not print 'SALESMAN'), 


SELECT ENAME, SAL, JOB
    FROM EMP
    WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB='SALESMAN') AND JOB != 'SALESMAN'; -- ��������
SELECT ENAME, SAL, JOB
    FROM EMP
    WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN') AND JOB != 'SALESMAN';
    
--4.3.6	print ENAME, SAL and JOB of employees whos SAL > any SAL of SALESMAN (print also 'SALESMAN'), 

SELECT ENAME, SAL, JOB
    FROM EMP
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB='SALESMAN') AND JOB != 'SALESMAN'; -- ��������
SELECT ENAME, SAL, JOB
    FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN') AND JOB != 'SALESMAN';
    
--4.3.7	print EMPNO, ENAME, SAL, HIREDATE for employees that have a SAL < 3000 and has been hired most recently

SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000;
SELECT EMPNO, ENAME, SAL, HIREDATE
    FROM EMP
    WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP WHERE SAL<3000); -- ��������
    
--4.3.8	print ENAME, SAL, JOB, DEPTNO of employees whos SAL > any SAL of SALESMAN (do not print people in DEPTNO = 20), 

SELECT ENAME, SAL, JOB, DEPTNO
    FROM EMP
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN') AND DEPTNO ^= 20;







-- PRACTICE

--1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���

SELECT ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);

-- 2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�

SELECT ENAME, SAL
    FROM EMP
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);

-- 3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�

SELECT ENAME, SAL, DEPTNO
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);

--4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���

SELECT ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL < (SELECT AVG(SAL) FROM EMP);

--5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���

SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP E, SALGRADE
    WHERE  SAL BETWEEN LOSAL AND HISAL
    AND HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT');

--6. 5��(SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���)�� �μ��� �߰��ϰ� �޿��� ū �� ����

SELECT ENAME, SAL, HIREDATE, GRADE, DNAME
    FROM EMP E, SALGRADE, DEPT D
    WHERE  SAL BETWEEN LOSAL AND HISAL
    AND E.DEPTNO = D.DEPTNO
    AND HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT')
    ORDER BY SAL DESC;

--7. BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿�

SELECT DEPTNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='BLAKE');

--8. MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի���

SELECT DEPTNO, ENAME, HIREDATE
    FROM EMP
    WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');

--9. �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿�

SELECT DEPTNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);

--10. CLARK�� ���� �μ���ȣ�̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� ���, �̸�, �޿�

SELECT DEPTNO, ENAME, SAL
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='CLARK')
    AND SAL > (SELECT SAL FROM EMP WHERE EMPNO = '7698');

--11.  �����ȭ. CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ����� ���, �̸�, �޿�

SELECT E.DEPTNO, ENAME, SAL
    FROM EMP E, DEPT D
    WHERE DNAME = (SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.ENAME='CLARK')
    AND E.DEPTNO = D.DEPTNO
    AND E.SAL > (SELECT SAL FROM EMP WHERE EMPNO = '7698');
    

--12. BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����

SELECT ENAME, HIREDATE
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');

--13. ��� �޿� �̻��� �޴� ��� �������� ���ؼ� �����ȣ�� �̸� �� �޿��� ���� ������ ���)

SELECT DEPTNO, ENAME
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP)
    ORDER BY SAL;



-- ���⼭���ʹ� �����༭�������� �����༭������, ������ �����༭������

-- 14.  �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ������ ��� ��ȣ,�̸�,�޿�(�� ��� �� ���)

SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE DEPTNO  IN(SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%')
    ORDER BY EMPNO;

-- 15. �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿�

SELECT ENAME, JOB, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND LOC = 'DALLAS';

-- 16. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿�

SELECT ENAME, SAL
FROM EMP
WHERE ENAME IN(SELECT W.ENAME
    FROM EMP W, EMP M, EMP H
    WHERE W.MGR = M.EMPNO
    AND M.MGR = H.EMPNO(+)
    AND M.ENAME = 'KING');
    
    SELECT ENAME, SAL FROM EMP 
    WHERE MGR=(SELECT EMPNO FROM EMP WHERE INITCAP(ENAME)='King'); 

  
-- 17. SALES�μ� ����� �̸�, ����

SELECT ENAME, JOB
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO IN(SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

SELECT ENAME, JOB 
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');

-- 18. ������ �μ� 30�� ���� ���޺��� ���� ����� ��� �ʵ�

SELECT *
    FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);

-- 19. �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ���� 

SELECT ENAME, JOB
    FROM EMP
    WHERE JOB IN (SELECT JOB FROM EMP WHERE DEPTNO =30)
    AND DEPTNO =10;
            
-- 20.  FORD�� ������ ���޵� ���� ����� ��� �ʵ�

SELECT*
    FROM EMP
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'FORD')
    AND SAL =  (SELECT SAL FROM EMP WHERE ENAME = 'FORD')
    AND ENAME !='FORD';
    
SELECT * FROM EMP 
    WHERE (JOB, SAL) = (SELECT JOB, SAL FROM EMP  WHERE ENAME='FORD') 
    AND ENAME != 'FORD';

-- 21. �̸��� JONES�� ������ JOB�� ���ų� FORD�� SAL �̻��� �޴� ����� ������ �̸�, ����, �μ���ȣ, �޿�
    -- ��, ������ ���ĺ� ��, ������ ���� ������ ���

SELECT ENAME, JOB, DEPTNO, SAL
    FROM EMP
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'JONES')
    OR SAL >=  (SELECT SAL FROM EMP WHERE ENAME = 'FORD')
    AND ENAME !='FORD'
    ORDER BY JOB, SAL DESC;


-- 22. SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿�

SELECT ENAME, JOB, DEPTNO, SAL
    FROM EMP
    WHERE (ENAME !='FORD' AND ENAME !='WARD')
    AND (SAL = (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT')
    OR SAL = (SELECT SAL FROM EMP WHERE ENAME = 'WARD'));

SELECT ENAME, JOB, SAL 
    FROM EMP 
    WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN ('SCOTT','WARD')) 
    AND ENAME NOT IN ('SCOTT','WARD');
        
-- 23. CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ������� �̸�,����

SELECT ENAME, JOB
    FROM EMP E, DEPT D
    WHERE JOB IN (SELECT JOB FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO'))
    AND E.DEPTNO = D.DEPTNO;

SELECT ENAME, JOB 
    FROM EMP 
    WHERE JOB IN (SELECT JOB FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO');
    
-- 24. �μ����� ������ ��� ���޺��� ���� ����� ���, �̸�, �޿�, �μ���ȣ

SELECT E.ENAME, E.SAL, E.DEPTNO
    FROM EMP E, (SELECT DEPTNO , ROUND(AVG(SAL),2) AVG FROM EMP GROUP BY DEPTNO) A
    WHERE E.DEPTNO = A.DEPTNO
    AND E.SAL > A.AVG
    ORDER BY E.DEPTNO;

SELECT ENAME, JOB 
    FROM EMP 
    WHERE JOB IN (SELECT JOB FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO');


-- 25. �������� ��� ���޺��� ���� ������ �޴� ����� �μ���ȣ, �̸�, �޿�

SELECT E.DEPTNO, E.ENAME, E.SAL
    FROM EMP E, (SELECT JOB , ROUND(AVG(SAL),2) AVG FROM EMP GROUP BY JOB) A
    WHERE E.JOB = A.JOB
    AND E.SAL < A.AVG;

SELECT DEPTNO, ENAME, SAL, JOB
    FROM EMP E
    WHERE SAL < (SELECT AVG(SAL) FROM EMP WHERE JOB=E.JOB);
    
-- 26. ��� �� �� �̻����κ��� ���� ���� �� �ִ� ����� ����, �̸�, ���, �μ���ȣ�� ���(��, �μ���ȣ ������ �������� ����)

SELECT DISTINCT M.JOB, M.ENAME, M.EMPNO, M.DEPTNO
  FROM EMP W, EMP M
  WHERE W.MGR=M.EMPNO;
  
  SELECT JOB, ENAME, EMPNO, DEPTNO
  FROM EMP
  WHERE EMPNO IN (SELECT MGR FROM EMP);
  
  SELECT JOB, ENAME, EMPNO, DEPTNO
  FROM EMP M
  WHERE EXISTS (SELECT * FROM EMP WHERE MGR=M.EMPNO);

-- 27.  ���� ����� ���, �̸�, ����, �μ���ȣ

SELECT EMPNO, ENAME, JOB, DEPTNO
    FROM EMP MANAGER
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);

