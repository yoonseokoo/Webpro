
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
SELECT * FROM GROUPDETAIL;
--3.�ٷ� GROUP DETAIL TABLE �� ��� ������ ������Ʈ ���ش�

    UPDATE GROUPDETAIL 
        SET GDBALANCE = GDBALANCE + (SELECT EDSHARE FROM EVENTDETAIL WHERE MID='aaa' AND EID=1)
        WHERE MID='aaa';
    
   UPDATE GROUPDETAIL 
        SET GDBALANCE = GDBALANCE + ( SELECT EDSHARE FROM EVENTDETAIL WHERE MID='bbb' AND EID=1)
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
    


-- SPLITING THE COSTS --



-- when button 'split' is clicked to divide the costs, a new data point is inserted in the centralSystem
-- must check if the data point for this group already exists:

SELECT * FROM CENTRALSYSTEM WHERE GID = 1; --if rs.next = 0, do the following:

INSERT INTO CENTRALSYSTEM (CSID, GID)
 VALUES(CENTRALSYSTEM_SEQ.NEXTVAL, 1);
 
 --otherwise, do nothing
 

-- when button 'pay' of the people in debt is clicked.

UPDATE CENTRALSYSTEM
    SET CSAMOUNT = CSAMOUNT + (SELECT -GDBALANCE PAID FROM GROUPDETAIL WHERE  MID = 'bbb');
    
UPDATE CENTRALSYSTEM
    SET CSALLPAID = 1
    WHERE CSAMOUNT=(SELECT SUM(-GDBALANCE) FROM GROUPDETAIL WHERE GDBALANCE < 0 AND GID = 1);
    
-- when button 'get' of the people who have money to receive is clicked    
    
UPDATE CENTRALSYSTEM
    SET CSAMOUNT = CSAMOUNT - (SELECT GDBALANCE PAID FROM GROUPDETAIL WHERE  MID = 'aaa')
    WHERE CSALLPAID = 1;

-- if someone clicks get first, csamount is 0, and gid is 1 so it will delete the group's central system data even if the cost is not split
-- therefore must make a field that checks if everyone paid or not
DELETE FROM CENTRALSYSTEM 
    WHERE CSAMOUNT = 0
    AND GID = 1
    AND CSALLPAID =1;
