-- [XI] INDEX:Accelerating data finding process

SELECT *
    FROM USER_INDEXES;
    
SELECT *
    FROM EMP;
    
DROP TABLE EMP01; --##

CREATE TABLE EMP01
    AS SELECT * FROM  EMP; --##
    
SELECT* 
    FROM EMP01;
    
INSERT INTO EMP01
    SELECT * FROM EMP01; --## execute 11 times 
    
SELECT COUNT(*) 
    FROM EMP01;

INSERT INTO EMP01 (EMPNO, ENAME, DEPTNO)
    VALUES (1111, 'HONG',40);  --##
    
INSERT INTO EMP01
SELECT * FROM EMP01; --## execute 3 times 

SELECT TO_CHAR (COUNT(*), '9,999,999') 
    FROM EMP01;

-- Finding HONG without making index:
SELECT *
    FROM EMP01
    WHERE ENAME = 'HONG'; --0.015 secs

--CONSTRUCTING INDEX 
CREATE INDEX IDX_EMP01_ENAME
    ON EMP01 (ENAME); --0.38 secs to construct

-- Finding HONG with existence of a index:
SELECT * 
    FROM EMP01 
    WHERE ENAME = 'HONG'; --0.005 secs (fast)

SELECT * 
    FROM USER_INDEXES 
    WHERE INDEX_NAME = 'IDX_EMP01_ENAME';
    
COMMIT;

INSERT INTO EMP01
    SELECT * FROM EMP01; --21.735 secs

ROLLBACK; --8.473 secs
    
    
    
    
    
    
    
    
    
    