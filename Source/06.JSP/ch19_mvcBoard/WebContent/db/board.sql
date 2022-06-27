--BOARD TABLE DROP AND CREATE

DROP SEQUENCE BOARD_SEQ;

CREATE SEQUENCE BOARD_SEQ 
    MAXVALUE 999999 
    NOCACHE
    NOCYCLE;
    

DROP TABLE BOARD;

CREATE TABLE BOARD(
    BID NUMBER(6) PRIMARY KEY,
    BNAME VARCHAR2(50) NOT NULL,
    BTITLE VARCHAR2(100) NOT NULL,
    BCONTENT VARCHAR2(1000),
    BDATE DATE DEFAULT SYSDATE NOT NULL,
    BHIT NUMBER(6) DEFAULT 0 NOT NULL,
    BGROUP NUMBER(6) NOT NULL,
    BSTEP NUMBER(6) NOT NULL,
    BINDENT NUMBER(6) NOT NULL,
    BIP VARCHAR2(20) NOT NULL);

--DUMMY DATA
        
    INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
        VALUES (BOARD_SEQ.NEXTVAL, 'È«±æµ¿', '±Û1', '-', BOARD_SEQ.CURRVAL, 0, 0, '102.168.10.30');

    INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
        VALUES (BOARD_SEQ.NEXTVAL, '±è±æµ¿', '±Û2', '-', BOARD_SEQ.CURRVAL, 0, 0, '102.168.10.31');
    
    COMMIT;

--1¹ø ±Û¿¡ ´äº¯ DUMMY DATA
    
    INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
        VALUES (BOARD_SEQ.NEXTVAL, '´ä³à', '±Û1-1', '´ä', 1, 1, 1, '192.1.1.1');
    


-- QUERY FOR DAO

--[1] post list (startRow ~ endRow)
        
    SELECT *
        FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOARD ORDER BY BGROUP DESC, BSTEP) a)
        WHERE RN BETWEEN 2 AND 3;
        
-- [2] Counting # of posts

    SELECT COUNT(*)
        FROM BOARD;

-- [3] Write new post (original)

    INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
        VALUES (BOARD_SEQ.NEXTVAL, 'ÃÖ±æµ¿', '±Û3', '-', BOARD_SEQ.CURRVAL, 0, 0, '102.168.10.32');
    
-- [4] Increase view count using BID

    UPDATE BOARD
        SET BHIT = BHIT+1
         WHERE BID = 1;

-- [5] Detailed view of post (Bring DTO using BID)

    SELECT *
        FROM BOARD
        WHERE BID = 1;

-- [6] Step A before writing reply post (reply post for post 1)

    UPDATE BOARD
        SET BSTEP = BSTEP + 1
        WHERE BGROUP = 1
        AND BSTEP > 0 ;
    
-- [7] Write reply post

    INSERT INTO BOARD (BID, BNAME, BTITLE, BCONTENT, BGROUP, BSTEP, BINDENT, BIP)
        VALUES(BOARD_SEQ.NEXTVAL, 'È«´ä', '±Û1-2', NULL, 1, 1, 1, '127.0.0.1');
        
-- [8] Update post

    UPDATE BOARD SET 
        BNAME = '±è±è±è',
        BTITLE = '¼öÁ¤±Û',
        BCONTENT = '¼öÁ¤º»¹®',
        BIP = '192.1.1.1'
        WHERE BID =2;
        
            
    SELECT *
        FROM BOARD;
        
-- [9] Delete post

    DELETE FROM BOARD 
        WHERE BID = '4';



