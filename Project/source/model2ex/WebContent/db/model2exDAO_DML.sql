-- ������ MEMBER TABLE DAO ������

-- [1.1] ���̵� �ߺ� �׽�Ʈ

SELECT * 
    FROM MEMBER ;
    WHERE MID ='aaa';

-- [1.2] ȸ������

INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO,  MBIRTH, MADDRESS, MRDATE)
    VALUES ('aaa', '111', ' ȫ�浿', 'hong@h.com', 'NOIMG.JPG', '1995-12-12', '����', SYSDATE);
    
-- [1.3] �α���

SELECT MID, MPW
    FROM MEMBER
    WHERE MID='aaa'
    AND MPW = '111';

-- [1.4] MID �� DTO ��������

SELECT *
    FROM MEMBER
    WHERE MID='aaa';

-- [1.6] SQL TO UPDATE USER INFORMATION

UPDATE MEMBER
    SET MPW = '111',
    MNAME = '�ֱ浿',
    MEMAIL = 'a@A.COM',
    MPHOTO = 'NOIMG.JPG',
    MBIRTH = '1990-12-01',
    MADDRESS = '�Ⱦ�'
    WHERE MID= 'aaa';
    
-- [1.7] MEMBER LIST

SELECT * 
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM MEMBER ORDER BY MRDATE DESC) A)
    WHERE RN BETWEEN 2 AND 3;
    

-- [1.8] COUNTING MEMBERS:

SELECT COUNT(*) 
    FROM MEMBER;
    
    
commit;
    
-- ������ FILEBOARD TABLE DAO ������

-- [1] LIST POSTS (startRow - endRow)
SELECT * FROM FILEBOARD;

SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
                        FROM (SELECT F.*
                                          FROM FILEBOARD F, MEMBER M 
                                          WHERE F.MID = M.MID 
                                          ORDER BY FGROUP DESC, FSTEP) A)
        WHERE RN BETWEEN 2 AND 3;
            
            
-- [2] COUNT NUMBER OF POSTS

SELECT COUNT(*)
    FROM FILEBOARD;

-- [3] WRITE MAIN POST

INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FHIT, FGROUP, FSTEP, FINDENT, FIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'rain', 'titile4','',null, 21, FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.47');            

-- [4] PRE-STEP BEFORE WRITING REPLY POST (step A)
    
    UPDATE FILEBOARD 
        SET FSTEP = FSTEP+1 
        WHERE FGROUP=5 
        AND FSTEP>0;
    
-- [5] WRITE REPLY POST

INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FGROUP, FSTEP, FINDENT, FIP)
    VALUES (FILEBOARD_SEQ.NEXTVAL, 'ccc', '��1-1', '��', null, 6, 1,1, '192.168.10.10');

SELECT *
    FROM FILEBOARD;
    
COMMIT;
    
-- [7] INCREASE VIEW

UPDATE FILEBOARD 
    SET FHIT = FHIT+1 
    WHERE FNUM = 5;
    
-- [8] UPDATE POST

UPDATE FILEBOARD 
    SET FTITLE = '������ ����',
            FCONTENT = '������ ����',
            FFILENAME = NULL,
            FIP = '192.168.10.30'
        WHERE FID=1;
    
-- [9] DELETE POST

DELETE FROM FILEBOARD
    WHERE FID=1;
    
COMMIT;

--[10] DETAIL VIEW OF POST

SELECT * 
    FROM FILEBOARD 
    WHERE FID = 1;

-- ������ ADMIN TABLE DAO ������  
    
    SELECT AID, APW
        FROM ADMIN
        WHERE AID='un'
        AND APW = '123';
        
