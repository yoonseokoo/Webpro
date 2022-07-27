-- ������ CUSTOMER TABLE DAO ������


-- [1] INSERT

INSERT INTO MEMBER (CUSNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY) 
    VALUES ('100'||MEMBER_SEQ.NEXTVAL, '���浿', '010-1111-6666', '����� ��걸', SYSDATE, 'B', '60');
    

-- [2] CALL DTO USING CUSTNO (�󼼺���)

SELECT *
    FROM MEMBER
    WHERE CUSNO= 1001;
    
SELECT MAX(CUSNO)+1 MAX FROM MEMBER;
    
-- [3] UPDATE (��������)
    
UPDATE MEMBER 
    SET CUSTNAME = '�ֱ浿',
    PHONE = '010-9999-8888',
    ADDRESS = '�λ�',
    GRADE = 'C',
    CITY = '60'
    WHERE CUSNO= 1001;

-- [4] PRINT MEMBER LIST (��ȸ)

SELECT * FROM MEMBER 
    ORDER BY CUSNO;

-- [5] ������ȸ

    SELECT DISTINCT MEM.CUSNO, MEM.CUSTNAME, GDESC, TOT
        FROM MEMBER MEM, MONEY M, GRADE G, (SELECT CUSNO, SUM(PRICE) TOT FROM MONEY GROUP BY CUSNO) T
        WHERE G.GRADE= MEM.GRADE
        AND MEM.CUSNO = M.CUSNO
        AND T.CUSNO = MEM.CUSNO
        ORDER BY CUSNO;


-- [2] ��ǰ ���� ��ȸ

    SELECT PCODE, SUM(PRICE) TOTSALES 
        FROM MONEY 
        GROUP BY PCODE;
        
        
COMMIT;