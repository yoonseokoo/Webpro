-- [III] JOIN - Connect and search information from two or more tables

SELECT * FROM EMP WHERE ENAME = 'SCOTT';
SELECT * FROM DEPT;

--CROSS JOIN (selecting twow or more tables in the 'from' command line
SELECT * 
FROM EMP, DEPT
WHERE ENAME = 'SCOTT';


--[1].EQUI JOIN (equal join: A condition that in the same field, DEPTNO value must be equal)
SELECT *
    FROM EMP, DEPT
    WHERE ENAME = 'SCOTT'
    AND EMP.DEPTNO=DEPT.DEPTNO;
    
SELECT  EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, EMP.DEPTNO, DNAME, LOC
    FROM EMP,DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO;
    
--If table has a nickname, it can be used to access the table 
SELECT  EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
    
-- 1.1:  Printing ENAME, JOB, SAL, DANME, LOC for employees with SAL=>2000
    
SELECT  ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND SAL >=2000;

-- 1.2:  Printing ENAME, JOB, SAL, DEPTNO,LOC for employees with LOC = 'CHICAGO'
    
SELECT  ENAME, JOB, SAL, D.DEPTNO, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND LOC = 'CHICAGO';

-- 1.3:  Printing ENAME, JOB, LOC, SAL for employees with DEPTNO 10 OR 20
    
SELECT  ENAME, JOB, LOC, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND E.DEPTNO IN (10,20)
    ORDER BY SAL;
    
-- 1.4:  Printing  ENAME, SAL, COMM, YEARLY SALARY, DNAME for employees with the JOB 'SALESMAN' or 'MANAGER'. Order by salary Descending
    
SELECT  ENAME, SAL, COMM, SAL*12+NVL(COMM,0) ANNUAL_SALARY, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND JOB IN ('SALESMAN', 'MANAGER')
    ORDER BY ANNUAL_SALARY DESC;
    
-- 1.5:  Printing  ENAME, SAL, HIREDATE, DEPTNO, DNAME for employees where COMM is NULL and SAL =>1200. Order by salary Descending 
    
SELECT  ENAME, SAL, HIREDATE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND COMM IS NULL
    AND SAL >=1200
    ORDER BY DNAME, SAL DESC;
    
-- 1.6:  Printing  ENAME and SAL for employees working in 'NEW YORK'
    
SELECT  ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND LOC = 'NEW YORK';
    
-- 1.7:  Printing  ENAME and HIREDATE for employees working in the ACCOUNTING department
    
SELECT  ENAME, HIREDATE
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND DNAME ='ACCOUNTING';
    
-- 1.8:  Printing  ENAME and DNAME for employees with the JOB 'MANAGER'
    
SELECT  ENAME, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND JOB = 'MANAGER';
    
-- 1.9:  Printing  ENAME, SAL, DEPTNO, LOC and DNAME for employees where COMM is not 'NULL'
    
SELECT  ENAME, SAL, E.DEPTNO, LOC, COMM
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND COMM IS NOT NULL
    AND COMM <> 0;
    
    
--[2].NONEQUI JOIN

SELECT *
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
SELECT * 
    FROM SALGRADE; --info on salary level

--CROSS JOIN =EMP's 1'st row * SALGRADE'S 5th row
    
SELECT *
    FROM EMP, SALGRADE
    WHERE ENAME = 'SCOTT'
    AND SAL BETWEEN LOSAL AND HISAL;
    
-- 2.1:  Printing EMPNO, ENAME, JOB, MGR, SAL, GRADE, for ALL employees

SELECT EMPNO, ENAME, JOB, MGR, SAL, 'grade'||GRADE GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
    

--[3].SELF JOIN: A table is joined with itself where each row of the table is combined with itself and with every other row of the table.

SELECT EMPNO, ENAME, MGR
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
SELECT EMPNO, ENAME
    FROM EMP
    WHERE empno = 7902;

SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR, MANAGER.EMPNO, MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.ENAME = 'SMITH'
    AND WORKER.MGR = MANAGER.EMPNO;

-- 3.1:  Printing EMPNO, ENAME, MGR, MANAGER NAME ALL employees (KING's MGR is NULL, hence, KIND does not print)

SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

-- 3.2:  print all employees with the format : 'SMITH's manager is FORD'
SELECT W.ENAME || 's manager is ' || M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;
    
-- 3.3:  print all employees that work in the same DEPTNO as 'SCOTT'

SELECT E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.ENAME = 'SCOTT'
    AND E2.DEPTNO = E1.DEPTNO
    AND E2.ENAME != 'SCOTT';
   
    
-- 3.4:  print all employees that work in the same LOC as 'SCOTT"

--making up another location "DALLAS"
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
SELECT * FROM DEPT;
SELECT * FROM EMP;
INSERT INTO EMP VALUES (9999, 'CHARLIE', NULL, NULL, NULL, 9000,900,50);
SELECT * FROM EMP;

--answer:

SELECT E2.ENAME
    FROM  EMP E1, DEPT D1,EMP E2, DEPT D2
    WHERE  E1.DEPTNO = D1.DEPTNO
    AND E2.DEPTNO = D2.DEPTNO
    AND D1.LOC=D2.LOC
    AND E1.ENAME = 'SCOTT'
    AND E2.ENAME != 'SCOTT';
    
    ROLLBACK; --DELETING CHARLIE

-- 3.5: print ENAME and JOB of employees if their MANAGER'S name 'KING'

SELECT W.ENAME, W.JOB
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO
    AND M.ENAME = 'KING';

--[4].OUTER JOIN: Returns all rows from both the participating tables which satisfy the join condition along with rows which do not satisfy the join condition. 
    
SELECT * FROM DEPT;
SELECT * FROM EMP;

SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;
    
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+); --also prints king, who does not have a manager
    
SELECT EMPNO, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO() = D.DEPTNO; --department 40 does not print because EMP does not a employer with DEPTNO 4
    
SELECT EMPNO, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO(+) = D.DEPTNO; --department 40 prints, but it prints as null
    

--PRACTICE

--1. Comm�� null�� �ƴ� ����� �̸�, �޿�, ���, �μ���ȣ, �μ��̸�, �ٹ����� ����Ͻÿ�.

SELECT  ENAME, SAL, GRADE, D.DEPTNO, DNAME, LOC
    FROM EMP E, SALGRADE, DEPT D
    WHERE SAL BETWEEN LOSAL AND HISAL
    AND E.DEPTNO=D.DEPTNO
    AND NOT COMM IS NULL;

--2. �̸�, �޿�, �Ի���, �޿����

SELECT  ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;

--3. �̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ���

SELECT  ENAME, SAL, HIREDATE, GRADE, DNAME, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL;
   

--4. �̸�, �޿�, ���, �μ��ڵ�, �ٹ���. �� comm �� null�ƴ� ���

SELECT  ENAME, SAL, GRADE, E.DEPTNO, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL
    AND NOT COMM IS NULL; 

--5. �̸�, �޿�, �޿����, ����, �μ���, �μ��� ���, �μ��� ������ ������. ����=(sal+comm)*12 comm�� null�̸� 0

SELECT  ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 ANNUAL_SALARY, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY DNAME, (SAL+NVL(COMM,0))*12;
    
--6. �̸�, ����, �޿�, ���, �μ��ڵ�, �μ��� ���. �޿��� 1000~3000����. �������� : �μ���, �μ������� ������, ���������� �޿� ū��

SELECT  ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL
    AND SAL BETWEEN 1000 AND 3000
    ORDER BY DNAME, JOB, SAL DESC;
    
--7. �̸�, �޿�, ���, �Ի���, �ٹ���. 81�⿡ �Ի��� ���. ��� ū��

SELECT  ENAME, SAL, GRADE, HIREDATE, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL
    AND HIREDATE BETWEEN '1981/01/01' AND '1981/12/31' 
    ORDER BY GRADE DESC;

    
-- PRACTICE (PART 1):

--1. �̸�, ���ӻ��

SELECT W.ENAME,  M.ENAME manager
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--2. �̸�, �޿�, ����, ���ӻ��

SELECT W.ENAME,  W.SAL, M.ENAME manager
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--3. �̸�, �޿�, ����, ���ӻ��. (��簡 ���� �������� ��ü ���� �� ���.
    --��簡 ���� �� '����'���� ���)
    
SELECT W.ENAME, W.JOB, W.SAL, M.ENAME manager
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--4. �̸�, �޿�, �μ���, ���ӻ���

SELECT W.ENAME, W.SAL, D.DNAME, M.ENAME manager
    FROM EMP W, DEPT D, EMP M
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO;

--5. �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ���, (��簡 ���� �������� ��ü ���� �� ���)

SELECT W.ENAME, W.SAL, D.DNAME, D.LOC, M.ENAME manager
    FROM EMP W, DEPT D, EMP M
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO(+);
    
--6. �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���

SELECT W.ENAME, W.SAL, GRADE, D.DNAME, M.ENAME manager
    FROM EMP W, DEPT D, EMP M,  SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO
    AND W.SAL BETWEEN LOSAL AND HISAL
    AND W.SAL >=2000;

--7. �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����)

SELECT W.ENAME, W.SAL, GRADE, D.DNAME, M.ENAME manager
    FROM EMP W, DEPT D, EMP M,  SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO(+)
     AND W.SAL BETWEEN LOSAL AND HISAL
    ORDER BY D.DNAME;
    
--8. �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12 �� comm�� null�̸� 0 **

SELECT W.ENAME, W.SAL, GRADE, D.DNAME, (W.SAL+NVL(W.COMM,0))*12 ANNUAL_SALARY,  M.ENAME manager
    FROM EMP W, DEPT D, EMP M, SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO
    AND W.SAL BETWEEN LOSAL AND HISAL;

--9. 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����

SELECT W.ENAME, W.SAL, GRADE, D.DNAME, (W.SAL+NVL(W.COMM,0))*12 ANNUAL_SALARY,  M.ENAME manager
    FROM EMP W, DEPT D, EMP M, SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO
    AND W.SAL BETWEEN LOSAL AND HISAL
    ORDER BY D.DNAME, SAL DESC;

    
    --  PART2
--1.EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT W.ENAME, W.DEPTNO, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO;

--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ���

SELECT W.ENAME, W.JOB, W.SAL, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND LOC = 'NEW YORK';

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ���

SELECT W.ENAME, D.DNAME, LOC
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND NOT COMM IS NULL;

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���

SELECT W.ENAME, W.JOB, D.DNAME, LOC
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND W.ENAME LIKE'%L%';
    

--5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������

SELECT W.EMPNO, W.ENAME, W.DEPTNO, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    ORDER BY W.ENAME;
    

    SELECT* FROM EMP;
    SELECT* FROM DEPT;
    
    
--6. ���, �����, �޿�, �μ����� �˻��϶�. 
    --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
    
    SELECT W.EMPNO, W.ENAME, W.SAL, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND W.SAL >=2000
    ORDER BY SAL DESC;
    

--7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
-- ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.

    SELECT W.EMPNO, W.ENAME, W.JOB, W.SAL, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND W.JOB = 'MANAGER'
    AND W.SAL >=2500
    ORDER BY W.EMPNO;

--8. ���, �����, ����, �޿�, ����� �˻��Ͻÿ�. ��, �޿����� ������������ �����Ͻÿ�

    SELECT W.EMPNO, W.ENAME, W.JOB, W.SAL, GRADE
    FROM EMP W, DEPT D, SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL
    ORDER BY W.SAL DESC;

--9. ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü)

SELECT W.ENAME, M.ENAME manager
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--10. �����, ����, ����� ������ �˻��Ͻÿ�

SELECT W.ENAME, M.ENAME manager, H.ENAME top_manager
    FROM EMP W, EMP M, EMP H
    WHERE W.MGR = M.EMPNO
    AND M.MGR = H.EMPNO;

--11. ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�

SELECT W.ENAME, M.ENAME manager, H.ENAME top_manager
    FROM EMP W, EMP M, EMP H
    WHERE W.MGR = M.EMPNO
    AND M.MGR = H.EMPNO(+);
    
    
    