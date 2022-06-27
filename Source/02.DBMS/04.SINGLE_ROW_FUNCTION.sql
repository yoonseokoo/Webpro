-- [IV] SINGLE ROW FUNCTION - BUILT-IN FUNCTIONS, SQL important FUNCTIONS

 --SINGLE ROW FUNCTIPN TYPES: [1].NUMERIC, [2].CHARACTER, [3].DATE, [4].CONVERSION, [5].NVL(), [6]. OTHERS..

--[1].NUMERIC functions

DESC DUAL; --describe 'DUAL'

SELECT * 
    FROM DUAL; --DUAL: a dummy offered by oracle
    
SELECT * 
    FROM DUMMY;
    
DESC DUMMY; --describe 'DUMMY'

SELECT -9,
    ABS (-9) 
    FROM DUAL; -- 9 (absolute value)
    
SELECT FLOOR (34.5678)  
    FROM DUAL; -- 34 (Round down to nearest integer)
    
SELECT FLOOR (34.5678*100)/100 
    FROM DUAL; -- 34.57 (Round down to 2.d.p)
    
SELECT TRUNC (34.5678, 2)   
    FROM DUAL; -- 34.57 (Round down to 2.d.p)
    
SELECT TRUNC (34.5678, 0)   
    FROM DUAL; -- 34 (Round down to 0.d.p)
    
SELECT TRUNC (34.5678, -1)   
    FROM DUAL; -- 30 (Round down to tenths position)

SELECT CEIL(34.5678)  
    FROM DUAL; -- 35 (Round up to nearest integer)

SELECT CEIL(34.5678*100)/100  
    FROM DUAL; -- 34.57 (Round up to 2.d.p)

SELECT ROUND (34.5678) 
    FROM DUAL; -- 35 (Round to nearest integer)

SELECT ROUND (34.5678, 2) 
    FROM DUAL; -- 34.57 (Roundto 2.d.p)

SELECT ROUND (34.5678, -1) 
    FROM DUAL; -- 30 (Round to tenths position)

SELECT MOD (9,2) 
    FROM DUAL; -- 1 prints remainder

--1.1: print all employees with an odd employee number

SELECT * 
    FROM EMP 
    WHERE MOD (EMPNO , 2) !=0;
    
 --1.2: print all employees that was hired in a odd month

SELECT * 
    FROM EMP 
    WHERE MOD (TO_CHAR (HIREDATE, 'MM'),2)=1;


--[2].CHARACTER functions

--[2.1].CAPITALIZED/LOWERCASE

SELECT UPPER ('abcABC') 
    FROM DUAL; --ABCABC

SELECT LOWER ('abcABC') 
    FROM DUAL; --abcabc

SELECT INITCAP ('WELCOME TO ORACLE') 
    FROM DUAL; --Welcome To Oracle


 --2.1.1: print all employees whos job is 'manager'
 
 SELECT *
    FROM EMP
    WHERE UPPER(JOB) = 'MANAGER'; --when you dont know if what case the letters, you can change all to capital letters or lowercase

 SELECT *
    FROM EMP
    WHERE LOWER(JOB) = 'manager'; 

--[2.2].LINKING LETTERS (CONCAT, ||)

SELECT 'AB'||'CD'||'EF'||'GH' 
    FROM DUAL; --ABCDEFGH (can link with no limits)

SELECT CONCAT ('AB', 'CD', 'EF', 'GH')  
    FROM DUAL; --NOT POSSIBLE (only two variables at a time)

SELECT CONCAT (CONCAT('AB', 'CD'), CONCAT('EF', 'GH'))  
        FROM DUAL; -- ABCDEFGH

 --2.2.1: print with format xxxx(ENMAE) is xxxxx(JOB)
 
SELECT CONCAT (CONCAT(ENAME, ' is a '), JOB) 
    FROM EMP;

SELECT ENAME || ' is a ' || JOB 
    FROM EMP;


--[2.3].SUBSTR (STR, startingPoint, numberOfLetters) - first position is 1, startingPoint can also be negative
--          SUBSTRB (STR, startingBytePoint, numberOfBytes)

SELECT SUBSTR ('ORACLE',3,2) 
    FROM DUAL; --AC (printing 2 letters from the third letter)

SELECT SUBSTRB ('ORACLE', 3,2) 
    FROM DUAL; -- AC (printing 2 bytes from the third byte) - each letter in the alphabet is 1 byte

SELECT SUBSTR ('데이타베이스',4,3) 
    FROM DUAL; -- 베이스 (printing 3 letters from the 4th letter)

SELECT SUBSTRB ('데이타베이스',4,3) 
    FROM DUAL; -- 이 (printing 3 bytes from the 4th byte) - 한글 한글자는 3 byte (in oracle license, 2 byte)

SELECT SUBSTRB ('구윤서',3,3) 
    FROM DUAL; --ERROR

SELECT SUBSTR ('ABCDXD', -1, 1) 
    FROM DUAL;  -- adding a '-' counts from the back

SELECT SUBSTR (123, 2, 1) 
    FROM DUAL;  -- 2

 --2.3.1: print all info for employees that was hired in September ( date must be formar 'RR/MM/DD')
 
 SELECT *
    FROM EMP
    WHERE SUBSTR (HIREDATE,4,2)='09'; 

 --2.3.2: print all info for employees that was hired on the 9th day on any month ( date must be formar 'RR/MM/DD')
 
 SELECT *
    FROM EMP
    WHERE SUBSTR (HIREDATE,7,2)='09'; 
    
SELECT *
    FROM EMP
    WHERE SUBSTR (HIREDATE,-2,2)='09'; 


--[2.4].LENGTH &  LENGTHB

SELECT LENGTH ('ABC') 
    FROM DUAL; -- 3

SELECT LENGTHB ('ABC') 
    FROM DUAL; -- 3

SELECT LENGTH ('오라클') 
    FROM DUAL; -- 3

SELECT LENGTHB ('오라클') 
    FROM DUAL; -- 9

--[2.5].INSTR (STR, letterToFind) : It finds it's position (first letter is 1, and if there isnt that letter, it returns 0)
--          INSTR (STR, letterToFind, startingPoint) : starts looking for the letter from the startingPoint. letter can be negative

SELECT INSTR('ABCABC', 'B')
    FROM DUAL; -- 2 (looks from the beginning and returns the position of the first 'B' found)

SELECT INSTR ('ABCABC', 'B', 3) 
    FROM DUAL; -- 5 (looks from the third letter and returns the position of 'B')

SELECT INSTR ('ABCABC', 'B', -3) 
    FROM DUAL; -- 2 (counts 3 from the back, and returns position of the first 'B' found from the back)

--2.5.1: print all info of employees that were hired in September

SELECT *
    FROM EMP
    WHERE INSTR(HIREDATE, '09', 3) = 4;

--2.5.2: print all info of employees that were hired in on the 9th

SELECT *
    FROM EMP
    WHERE INSTR(HIREDATE, '09', 7) = 7;

--2.5.2: print all info of employees that were NOT hired in on the 9th

SELECT *
    FROM EMP
    WHERE NOT INSTR(HIREDATE, '09', 7) = 7;


--[2.6]. LPAD (STR, position, StringToFill): It obtians length according to the STR, it fills up to its left
--          RPAD (STR, position, StringToFill) :  It obtians length according to the STR, it fills up to its right

SELECT LPAD ('ORACLE', 10, '#') 
    FROM DUAL;
    
 SELECT RPAD ('ORACLE', 10, '#') 
    FROM DUAL;
    
SELECT ENAME, SAL, LPAD (SAL, 6, '*') 
    FROM EMP;

--2.6.1: print EMPNO and ENAME (but name should only print first letter and rest as stars)

SELECT EMPNO, RPAD (SUBSTR (ENAME,1,1), LENGTH(ENAME), '*') NAME
FROM EMP;

--2.6.2: print EMPNO, ENAME and HIREDATE (fix name with the length of 10, print only the last letter, rest of the name as '*', and blank spaces as '_')
            -- print HIREDATE with the DD as '**'

SELECT EMPNO, ENAME, LPAD(LPAD(SUBSTR(ENAME, -1, 1), LENGTH(ENAME), '*'), 10, ' ') "NAME",
    TO_CHAR(HIREDATE, 'RR/MM/')||'**' "HIREDATE" FROM EMP;
    
    
 SELECT EMPNO, ENAME, LPAD(LPAD(SUBSTR(ENAME, -1, 1), LENGTH(ENAME), '*'), 10, ' ') "NAME",
    RPAD(SUBSTR(HIREDATE, 1, 6), LENGTH(HIREDATE), '*') "HIREDATE" FROM EMP;   

--2.6.3: print all fields for employees that has a 'R' as their 3rd letter in the same

SELECT * 
    FROM EMP 
    WHERE ENAME LIKE '__R%';
    
SELECT * 
    FROM EMP 
    WHERE INSTR(ENAME , 'R', 3) = 3;

SELECT * 
    FROM EMP 
    WHERE SUBSTR(ENAME , 3, 1) = 'R';

--[2.7].Deleting blanks

SELECT TRIM ('        ORACLE   CLASS        ') 
    FROM DUAL;

SELECT RTRIM  ('        ORACLE   CLASS        ') 
    FROM DUAL;
    
 SELECT LTRIM ('        ORACLE   CLASS        ') 
    FROM DUAL;

--[2.8].Replace

SELECT REPLACE (ENAME, 'A', 'XX') 
    FROM EMP;
    
SELECT REPLACE (HIREDATE, '0', ' ')
    FROM EMP;

--[3].DATE functions

--[3.1]. SYSDATE : now

SELECT SYSDATE 
    FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD DY HH24:MI:SS'; --setting a new format

SELECT SYSDATE 
    FROM DUAL;

SELECT ENAME, HIREDATE
    FROM EMP;
    
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD'; --return to normal format

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD DY HH24:MI:SS') 
    FROM DUAL;

SELECT SYSDATE-1 "This time, yesterday", SYSDATE "CURRENT", SYSDATE+1 "This time, tomorrow" 
    FROM DUAL;

--[3.2]. CALCULATIONS WITH DATE

SELECT SYSDATE +14 "RETURN DATE"
    FROM DUAL;
    
--3.2.1: print ENAME, HIREDATE, # of days worked

SELECT ENAME, HIREDATE, FLOOR(SYSDATE-HIREDATE) DAYS_WORKED
    FROM EMP;

--3.2.2: print ENAME, HIREDATE,#of months worked, # of years worked

SELECT ENAME, HIREDATE, FLOOR((SYSDATE-HIREDATE)/7) "WEEKS WORKED", FLOOR((SYSDATE-HIREDATE)/365) "YEARS WORKED"
    FROM EMP;

--[3.3]. MONTHS_BETWEEN (date, date) : finding number of months between the two dates

--3.3.1: print ENAME, HIREDATE,#of months worked

SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "MONTHS WORKED" 
    FROM EMP;
    
--3.3.2: print ENAME, sum of salary and commission (salary is received monthly, commission if received 2 times a year)

SELECT ENAME, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))*SAL +TRUNC((SYSDATE-HIREDATE)/365)*2*NVL(COMM,0) "TOTAL SALARY"
    FROM EMP;

--[3.4]. ADD MONTHS (date, number of months) : How many months have passed since the speicfic date

--3.4.1: print ENAME, HIREDATE, contract period (6 months)

SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) "CONTRACT END DATE"
    FROM EMP;

--[3.5]. LAST DAY (date) : last day of a specific month

--3.5.1: print  ENAME, HIREDAT, First payday (last day of the month)

SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE)
    FROM EMP;

--[3.6]. ROUND (date, xx) - Rounding a date / TRUNC (day,xx) : deleting days

SELECT ROUND (SYSDATE, 'YEAR')
    FROM DUAL; -- 22//01/01 (prints closest 1'st Jan)

SELECT ROUND (SYSDATE, 'MONTH')
    FROM DUAL; -- 22/04/01 (prints 1'st of closest  month (1~15th -> prints current month's 1st. 16~31st -> prints next month's 1st))

SELECT ROUND (SYSDATE, 'DAY')
    FROM DUAL; --22/04/10 (prints closest Sunday)

SELECT ROUND (SYSDATE)
    FROM DUAL; --22/04/13 (prints closest 12:00am)  

SELECT TO_CHAR (ROUND(SYSDATE), 'RR/MM/DD HH24:MI') 
    FROM DUAL; --22/04/13 00:00

SELECT TRUNC (SYSDATE, 'YEAR')
    FROM DUAL; -- 22/01/01 (this year's 1st Jan)

SELECT TRUNC (SYSDATE, 'MONTH')
    FROM DUAL; -- 22/04/01 (this month's 1st)

SELECT TRUNC (SYSDATE, 'DAY')
    FROM DUAL; --22/04/10 (prints last Sundayy)

SELECT TRUNC (SYSDATE)
    FROM DUAL; --22/04/13 (prints today's 12:00am)  

--3.6.1: prints ENAME, HIREDATE, PAYDAY (5th of every month)

SELECT ENAME, HIREDATE, TRUNC(HIREDATE, 'MONTH') +4 "PAYDAY"
    FROM EMP;

--3.6.2: prints ENAME, HIREDATE, PAYDAY (16th of every month)

SELECT ENAME, HIREDATE, ROUND(HIREDATE, 'MONTH') +15 "PAYDAY"
    FROM EMP;

--3.6.3: prints ENAME, HIREDATE, PAYDAY (15th of every month)

SELECT ENAME, HIREDATE, ROUND(HIREDATE+1, 'MONTH') +14 "PAYDAY"
    FROM EMP;

--3.6.4: prints ENAME, HIREDATE, PAYDAY (5th of every month)

SELECT ENAME, HIREDATE, ROUND(HIREDATE+11, 'MONTH') +14 "PAYDAY"
    FROM EMP;

--3.6.5: prints ENAME, HIREDATE, PAYDAY (20th of every month)

 SELECT ENAME, HIREDATE, ROUND(HIREDATE-4, 'MONTH')+19 "PAYDAY"
    FROM EMP;

--[3.7]. NEXT_DAY (date, ' num') : The first wednesday from a specific date


SELECT SYSDATE, NEXT_DAY (SYSDATE, 'SAT') 
    FROM DUAL;


--[4].CONVERSION (STRING, NUMBER, DATE)

--[4.1]. TO_CHAR (date type data, print format) 

-- YYYY (year 4 letters), YY (year 2 letters), RR (year 2 letters),  MM (month),  DD (day),  DY (day of the week)
-- AM/PM (am/pm) HH12 (12 hours format), HH24 (24hours format), MI (min), SS (sec)

SELECT TO_CHAR (SYSDATE, 'YY/MM/DD DY "day" HH24:MI:SS')
    FROM DUAL;

SELECT TO_CHAR (SYSDATE, 'YY/MM/DD DY "day" HH12:MI:SS')
    FROM DUAL;

--[4.2]. TO_CHAR (nummber type data, print format) 
-- 0: fill character room even if there are not enough characters
-- 9: fill character room with only if there are enough characters
-- ,: possible every 3 places
-- .: decimal point
-- $: Currency
-- L: Local currency units may be prefixed


SELECT TO_CHAR (123456, '9,999,999.99') 
    FROM DUAL; --123,456.00

SELECT TO_CHAR (123456, '0,000,000.00') 
    FROM DUAL; --0,123,456.00

SELECT TO_CHAR (10000, 'L999,999') 
    FROM DUAL; --￦10,000

SELECT ENAME, TO_CHAR (SAL, '$99,999') 
    FROM EMP; --e.g $800
    
SELECT ENAME, TO_CHAR (SAL, '$00,999') 
    FROM EMP; --e.g $00,800
    
--[4.3]. TO_DATE (nummber type data, pattern) 
SELECT TO_DATE ('20220412', 'YYYY-MMDD')
    FROM DUAL;


    
--4.3.1: prints all fields for the employees who were hired between 81/5/1 ~ 83/5/1

SELECT * FROM EMP 
    WHERE HIREDATE BETWEEN TO_DATE('810501','RRMMDD') AND TO_DATE('83/05/01','RR/MM/DD');
    
--[4.4]. TO_NUMBER

SELECT '1234'+1 
    FROM DUAL;
    
SELECT TO_NUMBER ('1,234','9,999')+1
    FROM DUAL;
    
--[5].NVL (Data that can be NULL, substitue if NULL)

SELECT ENAME, NVL (COMM, 0) 
    FROM EMP;
    
--5.1.1: prints ename, mgr, BUT IF mgr IS null, change to 'CEO'
SELECT ENAME, NVL(TO_CHAR(MGR), 'CEO')
    FROM EMP;

--[6].OTHERS

--[6.1]. EXTRACT: when you want to convert a year, month or date to a number

SELECT EXTRACT (YEAR FROM SYSDATE) 
    FROM DUAL;

SELECT TO_CHAR (SYSDATE, 'YYYY')
    FROM DUAL;

SELECT EXTRACT (MONTH  FROM HIREDATE) 
    FROM EMP;

--6.1.1:printing all fields for employees hired in February

SELECT *
    FROM EMP
    WHERE HIREDATE LIKE '__/02/__';

SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'MM') = '02';
    
SELECT *
    FROM EMP
    WHERE EXTRACT (MONTH FROM HIREDATE) =2;
    
 --6.1.3:printing all fields for employees hired in 1981

SELECT *
    FROM EMP
    WHERE HIREDATE LIKE '81/__/__';

SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'YY') = '81';
    
SELECT *
    FROM EMP
    WHERE EXTRACT (YEAR FROM HIREDATE) =81;

--[6.1]. printing level by level: LEVEL, START IWTH condition (MGR IS NULL), CONNECT BY PRIOR condition (EMPNO=MGR)
    
SELECT LEVEL, LPAD(' ', LEVEL*2)||ENAME
    FROM EMP
    START WITH MGR IS NULL
    CONNECT BY PRIOR EMPNO=MGR;
    


-- <총 연습문제>
-- 1. 현재 날짜를 출력하고 TITLE에 “Current Date”로 출력하는 SELECT 문장을 기술하시오.

SELECT SYSDATE "Current Date"
    FROM DUAL;

-- 2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 계산하여,
-- 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장

SELECT EMPNO, ENAME, JOB, SAL, (SAL*1.1) "New Salary", (SAL*0.1) "Increase"
    FROM EMP;

--3. 이름, 입사일, 입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.

SELECT ENAME, HIREDATE, TO_CHAR((TRUNC(ADD_MONTHS(HIREDATE, 6), 'DAY')+8 ), 'DY') "CONTRACT END DATE"
    FROM EMP;

--4. 이름, 입사일, 입사일로부터 현재까지의 개월수, 급여, 입사일부터 현재까지의 받은 급여의 총계를 출력

SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "MONTHS WORKED" , SAL, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))*SAL "TOTAL SALARY"
    FROM EMP;

--5. 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈 곳은 “*”로 대치)를 출력

SELECT ENAME, RPAD (SUBSTR(SAL,1,LENGTH(SAL)) , 10, '*') SAL
    FROM EMP;

--6. 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.

SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE,'DY')
FROM EMP;

--7. 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력

SELECT ENAME, LENGTH(ENAME) LENGTH, JOB
    FROM EMP
    WHERE LENGTH(ENAME) >=6;

--8. 모든 사원의 정보를 이름, 업무, 급여, 보너스, 급여+보너스를 출력

SELECT ENAME, JOB, SAL,  NVL (COMM, 0) "COMMISSION" , SAL+ NVL (COMM, 0)  "TOTAL SALARY"
    FROM EMP;

-- 9.사원 테이블의 사원명에서 2번째 문자부터 3개의 문자를 추출하시오. 

SELECT SUBSTR (ENAME ,3,2) 
    FROM EMP;

SELECT* FROM EMP;

--10. 사원 테이블에서 입사일이 12월인 사원의 사번, 사원명, 입사일을 검색하시오. 
--  시스템에 따라 DATEFORMAT 다를 수 있으므로 아래의 방법도 알아보자

SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'MM') = '12';

--11. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
--EMPNO		        ENAME		급여
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		    ******1250
--……. 
SELECT EMPNO, ENAME, LPAD (SUBSTR(SAL,1,LENGTH(SAL)) , 10, '*') SAL
    FROM EMP;
    
-- 12. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
-- EMPNO	 ENAME 	입사일
-- 7369	  	SMITH		1980-12-17

SELECT EMPNO, ENAME, TO_CHAR (HIREDATE, 'YYYY-MM-DD')
    FROM EMP;

--13. 사원 테이블에서 부서 번호가 20인 사원의 사번, 이름, 직무, 급여를 출력하시오.
    --(급여는 앞에 $를 삽입하고3자리마다 ,를 출력한다)

DESC EMP; --checking info ( SAL: NUMBER(7,2) -> length 7, max 2.dp, hence,$99,999)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$99,999')
    FROM EMP
    WHERE DEPTNO =20;








