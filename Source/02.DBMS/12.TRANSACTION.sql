-- [XII] TRANSACTION command: [1] COMMMIT, [2] ROLLBACK, [3] SAVEPOINT 

DROP TABLE DEPT01; --DCL commands (does not pile up in transaction)

CREATE TABLE DEPT01 --Does not pile up in transaction
    AS SELECT * FROM DEPT; 

SELECT * FROM DEPT01; --Does not pile up in transaction

DELETE FROM DEPT01; --Piles up on transaction

SELECT * FROM DEPT01;

ROLLBACK; --STARTING NEW TRANSACTION (rollback on the delete command as it is piled up in the transaction)

SELECT * FROM DEPT01;

DELETE FROM DEPT01
    WHERE DEPTNO = 40;
    
COMMIT;

--STARTING NEW TRANSATION

SELECT* FROM DEPT01;

DELETE FROM DEPT01
    WHERE DEPTNO = 30;

SELECT* FROM DEPT01;

SAVEPOINT C1; -- Point C1 is constructed

DELETE FROM DEPT01
    WHERE DEPTNO = 20;

SELECT* FROM DEPT01;

SAVEPOINT C2; -- Point C2 is constructed

DELETE FROM DEPT01
    WHERE DEPTNO = 10;

SELECT* FROM DEPT01;

SAVEPOINT C3; -- Point C3 is constructed

ROLLBACK TO C2;

SELECT* FROM DEPT01;

ROLLBACK TO C1;

SELECT* FROM DEPT01;







