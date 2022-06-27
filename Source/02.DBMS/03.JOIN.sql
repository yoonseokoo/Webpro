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

--1. Comm이 null이 아닌 사원의 이름, 급여, 등급, 부서번호, 부서이름, 근무지를 출력하시오.

SELECT  ENAME, SAL, GRADE, D.DEPTNO, DNAME, LOC
    FROM EMP E, SALGRADE, DEPT D
    WHERE SAL BETWEEN LOSAL AND HISAL
    AND E.DEPTNO=D.DEPTNO
    AND NOT COMM IS NULL;

--2. 이름, 급여, 입사일, 급여등급

SELECT  ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;

--3. 이름, 급여, 입사일, 급여등급, 부서명, 근무지

SELECT  ENAME, SAL, HIREDATE, GRADE, DNAME, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL;
   

--4. 이름, 급여, 등급, 부서코드, 근무지. 단 comm 이 null아닌 경우

SELECT  ENAME, SAL, GRADE, E.DEPTNO, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL
    AND NOT COMM IS NULL; 

--5. 이름, 급여, 급여등급, 연봉, 부서명, 부서별 출력, 부서가 같으면 연봉순. 연봉=(sal+comm)*12 comm이 null이면 0

SELECT  ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 ANNUAL_SALARY, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY DNAME, (SAL+NVL(COMM,0))*12;
    
--6. 이름, 업무, 급여, 등급, 부서코드, 부서명 출력. 급여가 1000~3000사이. 정렬조건 : 부서별, 부서같으면 업무별, 업무같으면 급여 큰순

SELECT  ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL
    AND SAL BETWEEN 1000 AND 3000
    ORDER BY DNAME, JOB, SAL DESC;
    
--7. 이름, 급여, 등급, 입사일, 근무지. 81년에 입사한 사람. 등급 큰순

SELECT  ENAME, SAL, GRADE, HIREDATE, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN LOSAL AND HISAL
    AND HIREDATE BETWEEN '1981/01/01' AND '1981/12/31' 
    ORDER BY GRADE DESC;

    
-- PRACTICE (PART 1):

--1. 이름, 직속상사

SELECT W.ENAME,  M.ENAME manager
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--2. 이름, 급여, 업무, 직속상사

SELECT W.ENAME,  W.SAL, M.ENAME manager
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--3. 이름, 급여, 업무, 직속상사. (상사가 없는 직원까지 전체 직원 다 출력.
    --상사가 없을 시 '없음'으로 출력)
    
SELECT W.ENAME, W.JOB, W.SAL, M.ENAME manager
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--4. 이름, 급여, 부서명, 직속상사명

SELECT W.ENAME, W.SAL, D.DNAME, M.ENAME manager
    FROM EMP W, DEPT D, EMP M
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO;

--5. 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명, (상사가 없는 직원까지 전체 직원 다 출력)

SELECT W.ENAME, W.SAL, D.DNAME, D.LOC, M.ENAME manager
    FROM EMP W, DEPT D, EMP M
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO(+);
    
--6. 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람

SELECT W.ENAME, W.SAL, GRADE, D.DNAME, M.ENAME manager
    FROM EMP W, DEPT D, EMP M,  SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO
    AND W.SAL BETWEEN LOSAL AND HISAL
    AND W.SAL >=2000;

--7. 이름, 급여, 등급, 부서명, 직속상사명, (직속상사가 없는 직원까지 전체직원 부서명 순 정렬)

SELECT W.ENAME, W.SAL, GRADE, D.DNAME, M.ENAME manager
    FROM EMP W, DEPT D, EMP M,  SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO(+)
     AND W.SAL BETWEEN LOSAL AND HISAL
    ORDER BY D.DNAME;
    
--8. 이름, 급여, 등급, 부서명, 연봉, 직속상사명. 연봉=(급여+comm)*12 단 comm이 null이면 0 **

SELECT W.ENAME, W.SAL, GRADE, D.DNAME, (W.SAL+NVL(W.COMM,0))*12 ANNUAL_SALARY,  M.ENAME manager
    FROM EMP W, DEPT D, EMP M, SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO
    AND W.SAL BETWEEN LOSAL AND HISAL;

--9. 8번을 부서명 순 부서가 같으면 급여가 큰 순 정렬

SELECT W.ENAME, W.SAL, GRADE, D.DNAME, (W.SAL+NVL(W.COMM,0))*12 ANNUAL_SALARY,  M.ENAME manager
    FROM EMP W, DEPT D, EMP M, SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND  W.MGR = M.EMPNO
    AND W.SAL BETWEEN LOSAL AND HISAL
    ORDER BY D.DNAME, SAL DESC;

    
    --  PART2
--1.EMP 테이블에서 모든 사원에 대한 이름,부서번호,부서명을 출력하는 SELECT 문장을 작성하여라.

SELECT W.ENAME, W.DEPTNO, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO;

--2. EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름,업무,급여,부서명을 출력

SELECT W.ENAME, W.JOB, W.SAL, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND LOC = 'NEW YORK';

--3. EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력

SELECT W.ENAME, D.DNAME, LOC
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND NOT COMM IS NULL;

--4. EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력

SELECT W.ENAME, W.JOB, D.DNAME, LOC
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND W.ENAME LIKE'%L%';
    

--5. 사번, 사원명, 부서코드, 부서명을 검색하라. 사원명기준으로 오름차순정열

SELECT W.EMPNO, W.ENAME, W.DEPTNO, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    ORDER BY W.ENAME;
    

    SELECT* FROM EMP;
    SELECT* FROM DEPT;
    
    
--6. 사번, 사원명, 급여, 부서명을 검색하라. 
    --단 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순으로 정열하시오
    
    SELECT W.EMPNO, W.ENAME, W.SAL, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND W.SAL >=2000
    ORDER BY SAL DESC;
    

--7. 사번, 사원명, 업무, 급여, 부서명을 검색하시오. 단 업무가 MANAGER이며 급여가 2500이상인
-- 사원에 대하여 사번을 기준으로 오름차순으로 정열하시오.

    SELECT W.EMPNO, W.ENAME, W.JOB, W.SAL, D.DNAME
    FROM EMP W, DEPT D
    WHERE W.DEPTNO = D.DEPTNO
    AND W.JOB = 'MANAGER'
    AND W.SAL >=2500
    ORDER BY W.EMPNO;

--8. 사번, 사원명, 업무, 급여, 등급을 검색하시오. 단, 급여기준 내림차순으로 정렬하시오

    SELECT W.EMPNO, W.ENAME, W.JOB, W.SAL, GRADE
    FROM EMP W, DEPT D, SALGRADE
    WHERE W.DEPTNO = D.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL
    ORDER BY W.SAL DESC;

--9. 사원테이블에서 사원명, 사원의 상사를 검색하시오(상사가 없는 직원까지 전체)

SELECT W.ENAME, M.ENAME manager
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--10. 사원명, 상사명, 상사의 상사명을 검색하시오

SELECT W.ENAME, M.ENAME manager, H.ENAME top_manager
    FROM EMP W, EMP M, EMP H
    WHERE W.MGR = M.EMPNO
    AND M.MGR = H.EMPNO;

--11. 위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오

SELECT W.ENAME, M.ENAME manager, H.ENAME top_manager
    FROM EMP W, EMP M, EMP H
    WHERE W.MGR = M.EMPNO
    AND M.MGR = H.EMPNO(+);
    
    
    