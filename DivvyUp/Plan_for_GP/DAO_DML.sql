
--�ڡڡڡڡ� steps of making a new group �ڡڡڡڡ�

--1.���ο� �׷� ����:

INSERT INTO GROUPS (GID, GNAME, GIMG, GCONTENT)
    VALUES (GROUPS_SEQ.NEXTVAL, 'Trip to Namhae', 'namhae.jpg' , 'Lets have a lit time', 'aaa');
    
--2. �ٷ� �׷쿡 ����� �߰�: Using checkbox

INSERT INTO GROUPDETAIL (GDID, GID, MID)
    VALUES (GROUPDETAIL_SEQ.NEXTVAL, 1 , 'aaa');


-- �ڡڡڡڡ� steps of the payment �ڡڡڡڡ�

--1. �ѻ���� ���� ���� (�� �� ����� ���̵� session���� �޾ƿ´�)

INSERT INTO EVENT (EID, ENAME, ECONTENT, EIMAGE, EAMOUNT, EADDRESS, ECOUNT, MID, GID)
    VALUES (EVENT_SEQ.NEXTVAL, 'Lunch', 'Pizza near the station', '', 55000, '����',  2, 'aaa', 1);
    
SELECT * FROM EVENT;
    
--2. �ٷ� PAY DETAIL ���̺�, ���õ� ������� ������ �־��ش� (üũ�ڽ��� ���õ� ����� �̸����� ARRAYLIST�� �޾ƿ´�)

    --<c:if test="member.mid eq pay.mid">
INSERT INTO EVENTDETAIL (EDID, EID, MID, EDSHARE)
    VALUES (EVENTDETAIL_SEQ.NEXTVAL, 1, 'aaa', ((SELECT EAMOUNT FROM EVENT WHERE EID=1)/(SELECT ECOUNT FROM EVENT WHERE EID=1)));
    
    --<c:if test="member.mid != pay.mid">  
INSERT INTO EVENTDETAIL  (EDID, EID, MID, EDSHARE)
    VALUES (EVENTDETAIL_SEQ.NEXTVAL, 1, 'bbb', -1*((SELECT EAMOUNT FROM EVENT WHERE EID=1)/(SELECT ECOUNT FROM EVENT WHERE EID=1)));

SELECT * FROM EVENT;
SELECT * FROM EVENTDETAIL;

--3.�ٷ� GROUP DETAIL TABLE �� ��� ������ ������Ʈ ���ش�

    UPDATE GROUPDETAIL 
        SET GMBALANCE = GMBALANCE + (SELECT EDSHARE FROM EVENTDETAIL WHERE MID='aaa' AND EID=1)
        WHERE MID='aaa';
    
   UPDATE GROUPDETAIL 
        SET GMBALANCE = GMBALANCE + ( SELECT EDSHARE FROM EVENTDETAIL WHERE MID='bbb' AND EID=1)
        WHERE MID='bbb';

SELECT * FROM GROUPDETAIL; 

COMMIT;

-- 4. EVENT HISTORY TABLE��, EVENT DETAIL TABLE ������ �Ű��ش�

INSERT INTO EVENTHISTORY
    ( SELECT  EVENTHISTORY_SEQ.NEXTVAL, E.EID, ED.MID, ED.EDSHARE, E.ERDATE, E.ENAME
    FROM EVENTDETAIL ED, EVENT E
    WHERE E.EID=ED.EID
    AND E.EID=1);
        
SELECT * FROM  EVENTHISTORY;

-- 5. DELETE FROM PAY DETAIL
    
    DELETE FROM EVENTDETAIL WHERE EID=1;
    ROLLBACK;