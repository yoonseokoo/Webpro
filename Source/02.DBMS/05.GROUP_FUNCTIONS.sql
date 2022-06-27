-- [V] GROUP FUNCTIONS: SUM, AVG, MIN, MAC, COUNT, STDDEV, VARIANCE

SELECT ENAME, 
    ROUND (SAL,-3) SAL 
    FROM EMP; 

SELECT MAX (SAL) 
    FROM EMP; --Finding value of the highest salary, per group

SELECT DEPTNO,
    MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO; --Finding value of the highest salary, per group
    
    
    
--[1]. GROUP FUNCTION PRACTICE

SELECT ROUND(AVG(SAL),2)  -- rounding average salary to 2.d.p
    FROM EMP;
    
SELECT COUNT(*) 
    FROM EMP; -- Number of rows
    
SELECT AVG(SAL),  SUM(SAL)/COUNT(SAL) 
        FROM EMP;

SELECT COMM 
    FROM EMP; 

SELECT SUM(COMM), AVG(COMM), COUNT(COMM), MIN(COMM), MAX(COMM) 
    FROM EMP; -- ��� �׷��Լ��� NULL���� ���� All group functions ommits NULL values

SELECT AVG(SAL), SUM(SAL), MIN(SAL), MAX(SAL), VARIANCE(SAL), STDDEV(SAL) 
    FROM EMP;
    
SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL) 
    FROM EMP;
    
-- Group functions MIN, MAX, COUNT can be type number, String or Date 
SELECT MIN(ENAME), MAX(ENAME), COUNT(ENAME) "# of people", COUNT(COMM)  "# of commissions" 
    FROM EMP;

-- 1.1 HIREDATE of the employee who was hired most recently and longest ago:
SELECT MIN(HIREDATE) �ּ��Ի���, MAX(HIREDATE) �ֱ��Ի���, COUNT(HIREDATE) 
    FROM EMP;

-- 1.2 HIREDATE and numbers of days worked for the employee who was hired most recently and longest ago:

SELECT MAX(HIREDATE) || ' �ֱ��Ի��� : ' ||
    TO_CHAR(SYSDATE-MAX(HIREDATE), '99,999') || 'days worked' ||
    MIN(HIREDATE) || ' �����Ի��� : ' ||
    TO_CHAR(SYSDATE-MIN(HIREDATE), '99,999') ||  'days worked, '
    FROM EMP;
    
SELECT MAX (HIREDATE) || ' �ֱ��Ի��� : ' ||
    TO_CHAR(MIN(SYSDATE-HIREDATE), '99,999') || 'days worked, ' ||
    MIN(HIREDATE) ||'�����Ի��� : ' ||
       TO_CHAR(MAX(SYSDATE-HIREDATE), '99,999') || 'days worked'
    FROM EMP;


-- 1.3. Average salary for employees in DEPTNO 10

SELECT ROUND(AVG(SAL),2)
    FROM EMP
    WHERE DEPTNO = 10;

--[2]. GROUP BY

--2.1 printing max, min , avg and sum of SAL, by DEPTNO
SELECT DEPTNO, MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2), SUM(SAL) 
    FROM EMP
    GROUP BY DEPTNO;
    
--2.2 printing number of employees, max, min and avg of SAL, by DEPTNO, for employee's whos SAL<5000. Ascending order by DEPTNO
SELECT DEPTNO Department, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2)
    FROM EMP
    WHERE SAL<5000 -- WHERE -Cannot use nickanmes
    GROUP BY DEPTNO -- GROUP BY -Cannot use nickanmes
    ORDER BY Department; -- ORDER BY - CAN use nickanmes
    
 --2.2 printing number of employees, max, min and avg of SAL, by DNAME. Ascending order by DNAME
SELECT DNAME Department, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2)
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY D.DNAME -- GROUP BY -Cannot use nickanmes
    ORDER BY Department; -- ORDER BY - CAN use nickanmes
    
--[3]. HAVING BY

--3.1 Only print departments which have an average salary >2000.  Ascending order of average salary

SELECT DEPTNO, ROUND(AVG(SAL),2)
    FROM EMP
    GROUP BY DEPTNO
    HAVING AVG(SAL) >=2000 --when group function itself has a condition, we use HAVING
    ORDER BY ROUND(AVG(SAL),2);
    
--3.1 print MIN(SAL), MAX(SAL) and AVG(SAL), by department name, or employees with SAL<5000
--however, for departments with AVG(SAL) >=2000, order by AVG(SAL)

SELECT DNAME, MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2)
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL <5000
    GROUP BY DNAME
    HAVING AVG(SAL) >=1800
    ORDER BY AVG(SAL);
    
--[4]. 

SELECT DEPTNO, SUM(SAL) 
FROM EMP
GROUP BY ROLLUP (DEPTNO);
    
--4.1 Group by DEPTNO and JOB

SELECT DEPTNO, JOB, SUM(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB 
    ORDER BY DPTNO;

--4.1 Group by DEPTNO and JOB

SELECT DEPTNO, JOB, SUM(SAL)
    FROM EMP
    GROUP BY ROLLUP(DEPTNO,JOB);






    
-- PRACTICE QUESTIONS

-- 1. �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ���

SELECT COUNT(*) �ο���, MAX(SAL) �ִ�޿�, MIN(SAL) �ּұ޿�,SUM(SAL) �ݿ�����
    FROM EMP;
    
-- 2. ������ �ο����� ���Ͽ� ���

SELECT JOB, COUNT(*) �ο���
    FROM EMP E
    GROUP BY JOB;


--- 3. �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ���

SELECT MAX(SAL) �ִ�޿�, MIN(SAL) �ּұ޿�, (MAX(SAL) - MIN(SAL)) ����
    FROM EMP;

-- 4. �� �μ����� �ο���, �޿� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ���(�޿��� ���� ���� ������)

SELECT COUNT(*), ROUND(AVG(SAL),2) �޿����, MIN(SAL) �ּұ޿�,MAX(SAL) �ִ�޿�, SUM(SAL) �ݿ�����
    FROM EMP
    GROUP BY DEPTNO
    ORDER BY SUM(SAL);

-- 5. �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���(�μ���ȣ, ���������� �������� ����)

SELECT DEPTNO, JOB, COUNT(*),  ROUND(AVG(SAL),2) �޿����,  SUM(SAL) �ݿ�����
    FROM EMP
    GROUP BY ROLLUP(DEPTNO,JOB)
    ORDER BY DEPTNO, JOB;

-- 6. ������, �μ��� �׷��Ͽ� �����  ����, �μ���ȣ, �ο���, �޿��� ���, �޿��� ���� ���(��°���� ������, �μ���ȣ �� �������� ����)

SELECT JOB, DEPTNO, COUNT(*), ROUND(AVG(SAL),2) �޿����,  SUM(SAL) �ݿ�����
    FROM EMP
    GROUP BY ROLLUP(JOB, DEPTNO)
    ORDER BY JOB,DEPTNO;

--7. ������� 5���̻� �Ѵ� �μ���ȣ�� ������� ���

SELECT DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY DEPTNO
    HAVING COUNT(*) >=5;

-- 8. ������� 5���̻� �Ѵ� �μ���� ������� ���

SELECT DNAME, COUNT(*)
    FROM EMP E , DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY DNAME
    HAVING COUNT(*) >=5;
    
--9. ������ �޿��� ����� 3000�̻��� ������ ���ؼ� ������, ��� �޿�, �޿��� ���� ���

SELECT JOB, ROUND(AVG(SAL),2) �޿����,  SUM(SAL) �ݿ�����
    FROM EMP
    GROUP BY JOB
    HAVING AVG(SAL) >=3000;

--10. �޿� ���� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿����� ���(�޿� �հ�� �������� ����)

SELECT JOB, SUM(SAL) �ݿ�����
    FROM EMP
    GROUP BY JOB
    HAVING SUM(SAL) >=5000
    ORDER BY SUM(SAL) DESC;

--11. �μ��� �޿����, �μ��� �޿��հ�, �μ��� �ּұ޿��� ���

SELECT ROUND(AVG(SAL),2) �޿����,  SUM(SAL) �ݿ�����, MIN(SAL) �ּұ޿�
    FROM EMP
    GROUP BY DEPTNO;

--12. ���� 11���� �����Ͽ�, �μ��� �޿���� �ִ�ġ, �μ��� �޿����� �ִ�ġ, �μ��� �ּұ޿��� �ִ�ġ�� ��� ***


SELECT MAX(ROUND(AVG(SAL),2)) �޿����,  MAX(SUM(SAL)) �ݿ�����, MAX(MIN(SAL)) �ּұ޿�
    FROM EMP
    GROUP BY DEPTNO;

    
--13. ��� ���̺��� �Ʒ��� ����� ���
--   H_YEAR	COUNT(*)	MIN(SAL)	MAX(SAL)	AVG(SAL)	SUM(SAL)
--     80	  1		    800		    800		    800		    800
--	81	 10		    950		    5000	    2282.5	  22825
--	82	  2		    1300	    3000	   2150		   4300
--	83	  1		    1100	    1100	    1100	   1100

SELECT TO_CHAR(HIREDATE, 'YY') H_YEAR, COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YY') 
    ORDER BY TO_CHAR(HIREDATE, 'YY'), COUNT(8), MIN(SAL),MAX(SAL),AVG(SAL),SUM(SAL);

-- 14.  �Ʒ��� ����� ���(�Ի�⵵�� �����)
--  1980     1	
--  1981     10
--  1982     2
--  1983     1
--  total    14	

SELECT TO_CHAR(HIREDATE, 'YYYY') HIREDATE, COUNT(*)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY')
    ORDER BY HIREDATE;

--15. �ִ�޿�, �ּұ޿�, ��ü�޿���, ����� ���

SELECT MAX(SAL), MIN(SAL), SUM(SAL), ROUND(AVG(SAL),2)
    FROM EMP;
    
--16. �μ��� �ο��� ���

SELECT DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY DEPTNO;

--17. �μ��� �ο����� 6���̻��� �μ���ȣ ���


SELECT DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY DEPTNO
    HAVING COUNT(*) >=6;

--18. �޿��� ���� ������� ����� �ο��Ͽ� ������ ���� ����� ������ �Ͻÿ�. 
-- (��Ʈ self join, group by, count���)
--ENAME	    ���
--________________________
--KING		1
--SCOTT		2
--����

SELECT E.ENAME, COUNT(O.ENAME)+1 RANK
FROM EMP E, EMP O
WHERE E.SAL<O.SAL(+)
GROUP BY E.ENAME
ORDER BY RANK;

SELECT ENAME, RANK () OVER(ORDER BY SAL DESC) 
    FROM EMP;













    
    
    
    
    