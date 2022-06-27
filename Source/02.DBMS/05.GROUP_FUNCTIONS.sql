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
    FROM EMP; -- 모든 그룹함수는 NULL값을 제외 All group functions ommits NULL values

SELECT AVG(SAL), SUM(SAL), MIN(SAL), MAX(SAL), VARIANCE(SAL), STDDEV(SAL) 
    FROM EMP;
    
SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL) 
    FROM EMP;
    
-- Group functions MIN, MAX, COUNT can be type number, String or Date 
SELECT MIN(ENAME), MAX(ENAME), COUNT(ENAME) "# of people", COUNT(COMM)  "# of commissions" 
    FROM EMP;

-- 1.1 HIREDATE of the employee who was hired most recently and longest ago:
SELECT MIN(HIREDATE) 최소입사일, MAX(HIREDATE) 최근입사일, COUNT(HIREDATE) 
    FROM EMP;

-- 1.2 HIREDATE and numbers of days worked for the employee who was hired most recently and longest ago:

SELECT MAX(HIREDATE) || ' 최근입사일 : ' ||
    TO_CHAR(SYSDATE-MAX(HIREDATE), '99,999') || 'days worked' ||
    MIN(HIREDATE) || ' 최초입사일 : ' ||
    TO_CHAR(SYSDATE-MIN(HIREDATE), '99,999') ||  'days worked, '
    FROM EMP;
    
SELECT MAX (HIREDATE) || ' 최근입사일 : ' ||
    TO_CHAR(MIN(SYSDATE-HIREDATE), '99,999') || 'days worked, ' ||
    MIN(HIREDATE) ||'최초입사일 : ' ||
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

-- 1. 인원수,최대 급여,최소 급여,급여의 합을 출력

SELECT COUNT(*) 인원수, MAX(SAL) 최대급여, MIN(SAL) 최소급여,SUM(SAL) 금여의합
    FROM EMP;
    
-- 2. 업무별 인원수를 구하여 출력

SELECT JOB, COUNT(*) 인원수
    FROM EMP E
    GROUP BY JOB;


--- 3. 최고 급여와 최소 급여의 차이는 얼마인가 출력

SELECT MAX(SAL) 최대급여, MIN(SAL) 최소급여, (MAX(SAL) - MIN(SAL)) 차이
    FROM EMP;

-- 4. 각 부서별로 인원수, 급여 평균, 최저 급여, 최고 급여, 급여의 합을 출력(급여의 합이 많은 순으로)

SELECT COUNT(*), ROUND(AVG(SAL),2) 급여평균, MIN(SAL) 최소급여,MAX(SAL) 최대급여, SUM(SAL) 금여의합
    FROM EMP
    GROUP BY DEPTNO
    ORDER BY SUM(SAL);

-- 5. 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 출력(부서번호, 업무순으로 오름차순 정렬)

SELECT DEPTNO, JOB, COUNT(*),  ROUND(AVG(SAL),2) 급여평균,  SUM(SAL) 금여의합
    FROM EMP
    GROUP BY ROLLUP(DEPTNO,JOB)
    ORDER BY DEPTNO, JOB;

-- 6. 업무별, 부서별 그룹하여 결과를  업무, 부서번호, 인원수, 급여의 평균, 급여의 합을 출력(출력결과는 업무순, 부서번호 순 오름차순 정렬)

SELECT JOB, DEPTNO, COUNT(*), ROUND(AVG(SAL),2) 급여평균,  SUM(SAL) 금여의합
    FROM EMP
    GROUP BY ROLLUP(JOB, DEPTNO)
    ORDER BY JOB,DEPTNO;

--7. 사원수가 5명이상 넘는 부서번호와 사원수를 출력

SELECT DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY DEPTNO
    HAVING COUNT(*) >=5;

-- 8. 사원수가 5명이상 넘는 부서명과 사원수를 출력

SELECT DNAME, COUNT(*)
    FROM EMP E , DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY DNAME
    HAVING COUNT(*) >=5;
    
--9. 업무별 급여의 평균이 3000이상인 업무에 대해서 업무명, 평균 급여, 급여의 합을 출력

SELECT JOB, ROUND(AVG(SAL),2) 급여평균,  SUM(SAL) 금여의합
    FROM EMP
    GROUP BY JOB
    HAVING AVG(SAL) >=3000;

--10. 급여 합이 5000을 초과하는 각 업무에 대해서 업무와 급여합을 출력(급여 합계순 내림차순 정렬)

SELECT JOB, SUM(SAL) 금여의합
    FROM EMP
    GROUP BY JOB
    HAVING SUM(SAL) >=5000
    ORDER BY SUM(SAL) DESC;

--11. 부서별 급여평균, 부서별 급여합계, 부서별 최소급여를 출력

SELECT ROUND(AVG(SAL),2) 급여평균,  SUM(SAL) 금여의합, MIN(SAL) 최소급여
    FROM EMP
    GROUP BY DEPTNO;

--12. 위의 11번을 수정하여, 부서별 급여평균 최대치, 부서별 급여합의 최대치, 부서별 최소급여의 최대치를 출력 ***


SELECT MAX(ROUND(AVG(SAL),2)) 급여평균,  MAX(SUM(SAL)) 금여의합, MAX(MIN(SAL)) 최소급여
    FROM EMP
    GROUP BY DEPTNO;

    
--13. 사원 테이블에서 아래의 결과를 출력
--   H_YEAR	COUNT(*)	MIN(SAL)	MAX(SAL)	AVG(SAL)	SUM(SAL)
--     80	  1		    800		    800		    800		    800
--	81	 10		    950		    5000	    2282.5	  22825
--	82	  2		    1300	    3000	   2150		   4300
--	83	  1		    1100	    1100	    1100	   1100

SELECT TO_CHAR(HIREDATE, 'YY') H_YEAR, COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YY') 
    ORDER BY TO_CHAR(HIREDATE, 'YY'), COUNT(8), MIN(SAL),MAX(SAL),AVG(SAL),SUM(SAL);

-- 14.  아래의 결과를 출력(입사년도별 사원수)
--  1980     1	
--  1981     10
--  1982     2
--  1983     1
--  total    14	

SELECT TO_CHAR(HIREDATE, 'YYYY') HIREDATE, COUNT(*)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY')
    ORDER BY HIREDATE;

--15. 최대급여, 최소급여, 전체급여합, 평균을 출력

SELECT MAX(SAL), MIN(SAL), SUM(SAL), ROUND(AVG(SAL),2)
    FROM EMP;
    
--16. 부서별 인원수 출력

SELECT DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY DEPTNO;

--17. 부서별 인원수가 6명이상인 부서번호 출력


SELECT DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY DEPTNO
    HAVING COUNT(*) >=6;

--18. 급여가 높은 순서대로 등수를 부여하여 다음과 같은 결과가 나오게 하시오. 
-- (힌트 self join, group by, count사용)
--ENAME	    등수
--________________________
--KING		1
--SCOTT		2
--……

SELECT E.ENAME, COUNT(O.ENAME)+1 RANK
FROM EMP E, EMP O
WHERE E.SAL<O.SAL(+)
GROUP BY E.ENAME
ORDER BY RANK;

SELECT ENAME, RANK () OVER(ORDER BY SAL DESC) 
    FROM EMP;













    
    
    
    
    