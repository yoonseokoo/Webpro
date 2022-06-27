-- ■■■■■ GRADE TABLE ■■■■■ --

SELECT * FROM GRADE;
SELECT * FROM MEMBER;
SELECT * FROM BOARD;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAIL;
SELECT * FROM PRODUCT;
SELECT * FROM REVIEW;
SELECT * FROM CART;
SELECT * FROM ADMIN;

SELECT * 
    FROM MEMBER M, GRADE G 
    WHERE MCUMPURCAHSE 
    BETWEEN G.LOWGRADE AND G.HIGHGRADE 
    AND MID='id1';

SELECT GF.GNAME 
    FROM GRADE GF 
    WHERE MGRADE = (SELECT G.MGRADE+1 
                    FROM MEMBER M, GRADE G 
                    WHERE MCUMPURCAHSE 
                    BETWEEN G.LOWGRADE AND G.HIGHGRADE 
                    AND M.MID='id1');
                    
-- ■■■■■ MEMBER TABLE ■■■■■ --

-- [1] MEMBER LOGIN

SELECT MID, MPW
    FROM MEMBER
    WHERE MID='id1'
    AND MPW = '111';

-- [2] BRING DTO USING MID

SELECT *
    FROM MEMBER
    WHERE MID='id1';

-- [3] UPDATE MEMBER INFORMATION

UPDATE MEMBER
    SET MPW = '111',
    MNAME = '이름11',
    MPHONE = '010-2222-3333',
    MADDRESS = '변경 주소1',
    MADDRESSDETAIL = '변경 주소1',
    MBIRTH = '1990-12-12',
    MEMAIL = 'a@A.COM'
    WHERE MID= 'id1';

-- [4] PRINT MEMBER LIST

SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM MEMBER ORDER BY MRDATE DESC) A)
    WHERE RN BETWEEN 2 AND 3;
    
-- [5] COUNT NUMBER OF MEMBERS

SELECT COUNT(*) 
    FROM MEMBER;
    
-- ■■■■■ BOARD TABLE ■■■■■ --
 
 -- [1] LIST POSTS (startRow - endRow)

    SELECT * 
        FROM (SELECT ROWNUM RN, A.* 
                        FROM (SELECT B.*
                                 FROM BOARD B, MEMBER M 
                                 WHERE B.MID = M.MID 
                                 ORDER BY BGROUP DESC, BSTEP) A)
        WHERE RN BETWEEN 2 AND 3;
            
-- [2] COUNT NUMBER OF POSTS

    SELECT COUNT(*)
        FROM BOARD;

-- [3] WRITE MAIN POST

    INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO)
        VALUES (BOARD_SEQ.NEXTVAL, 'id4', 'titile2','',null, 21, BOARD_SEQ.CURRVAL, 0,0, 2);            

-- [4] PRE-STEP BEFORE WRITING REPLY POST (step A)
    
    UPDATE BOARD 
        SET BSTEP = BSTEP+1 
        WHERE BGROUP=2 
        AND BSTEP>0;
    
-- [5] WRITE REPLY POST

    INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO)
        VALUES (BOARD_SEQ.NEXTVAL, 'id4', '글1-1', '답글1', null,0, 2, 1,1, 2);

SELECT *
    FROM BOARD;
    
COMMIT;
    
-- [7] INCREASE VIEW

UPDATE BOARD 
    SET BHIT = BHIT+1 
    WHERE BID = 5;
    
-- [8] UPDATE POST

UPDATE BOARD 
    SET BTITLE = '수정된 제목',
        BCONTENT = '수정된 본문',
        BIMAGE = NULL
        WHERE BID=1;
    
-- [9] DELETE POST

DELETE FROM BOARD
    WHERE BID=1;


--[10] DETAIL VIEW OF POST

SELECT * 
    FROM BOARD 
    WHERE BID = 2;
    
    
 
-- ■■■■■ ORDERS TABLE ■■■■■ --


-- ■■■■■ ORDER_DETAIL TABLE ■■■■■ --
    
    
-- ■■■■■ PRODUCT TABLE ■■■■■ --


-- ■■■■■ PRODUCT REVIEW TABLE ■■■■■ --


-- ■■■■■ CART TABLE ■■■■■ --


-- ■■■■■ ADMIN TABLE ■■■■■ --

