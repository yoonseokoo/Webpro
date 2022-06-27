-- Dictionary view check after logging in as Scott2

SHOW USER;

SELECT * 
    FROM USER_TABLES; --printing tables account Scott2 has

SELECT * 
    FROM ALL_TABLES; --printing ALL tables account Scott2 has access to
    
SELECT *  
    FROM ALL_TABLES 
    WHERE TABLE_NAME IN ('DEPT', 'EMP'); -- "Are EMP and DEPT tables Scott2 has access to?"

SELECT *
    FROM SCOTT.EMP;
    
SELECT *
    FROM SCOTT.EMP E, SCOTT.DEPT D WHERE E.DEPTNO = D.DEPTNO;
    
EXIT;

-- Accounts in use cannot be deleted

DROP USER Scott2 CASCADE;
    
    
    
    
    
    
    
    
    
    