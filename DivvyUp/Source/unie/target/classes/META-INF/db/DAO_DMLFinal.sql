--[1] member

--idConfirm:
    SELECT COUNT(*) FROM MEMBER WHERE MID = 'aaa';
--joinMember
    INSERT INTO MEMBER(mid, mpw, mname, memail)
    	VALUES('eee', '555', 'name5', '555@gmail.com');

--getMemberDetail
    SELECT * FROM MEMBER WHERE MID = 'aaa';
--modifyMember
    UPDATE MEMBER SET
        MPW = '222',
        MNAME = 'name5',
        MEMAIL = 'name5@gmail.com'
    WHERE MID = 'eee';

--[2] groups

--groupList

	SELECT * FROM GROUPS order by GRDATE DESC;

--isnert new group
--★★★★★ steps of making a new group ★★★★★

--1.새로운 그룹 생성:

INSERT INTO GROUPS (GID, GNAME, GIMG, GCONTENT, MID)
    VALUES (GROUPS_SEQ.NEXTVAL, 'Trip to Namhae', 'namhae.jpg' , 'Lets have a lit time', 'aaa');
    
--2. 바로 그룹에 멤버들 추가: Using checkbox

INSERT INTO GROUPDETAIL (GDID, GID, MID)
    VALUES (GROUPDETAIL_SEQ.NEXTVAL, 1 , 'aaa');


-- ★★★★★ steps of the payment ★★★★★

--1. 한사람이 돈을 낸다 (돈 낸 사람의 아이디를 session에서 받아온다)

INSERT INTO EVENT (EID, ENAME, ECONTENT, EIMAGE, EAMOUNT, EADDRESS, ECOUNT, MID, GID)
    VALUES (EVENT_SEQ.NEXTVAL, 'Lunch', 'Pizza near the station', '', 55000, '����',  2, 'aaa', 1);
    
SELECT * FROM EVENT;
    
--2. 바로 GROUP DETAIL 테이블에, 관련된 사람들의 정보도 넣어준다 (체크박스로 관련된 사람의 이름들을 ARRAYLIST에 받아온다)

    --<c:if test="member.mid eq pay.mid">
INSERT INTO EVENTDETAIL (EDID, EID, MID, EDSHARE)
    VALUES (EVENTDETAIL_SEQ.NEXTVAL, 1, 'aaa', ((SELECT EAMOUNT FROM EVENT WHERE EID=1)/(SELECT ECOUNT FROM EVENT WHERE EID=1)));
    
    --<c:if test="member.mid != pay.mid">  
INSERT INTO EVENTDETAIL  (EDID, EID, MID, EDSHARE)
    VALUES (EVENTDETAIL_SEQ.NEXTVAL, 1, 'bbb', -1*((SELECT EAMOUNT FROM EVENT WHERE EID=1)/(SELECT ECOUNT FROM EVENT WHERE EID=1)));

SELECT * FROM EVENT;
SELECT * FROM EVENTDETAIL;
SELECT * FROM GROUPDETAIL;

--3.바로 GROUP DETAIL TABLE 에 멤버 정보를 업데이트 해준다

    UPDATE GROUPDETAIL 
        SET GDBALANCE = GDBALANCE + (SELECT EDSHARE FROM EVENTDETAIL WHERE MID='aaa' AND EID=1)
        WHERE MID='aaa';
    
   UPDATE GROUPDETAIL 
        SET GDBALANCE = GDBALANCE + ( SELECT EDSHARE FROM EVENTDETAIL WHERE MID='bbb' AND EID=1)
        WHERE MID='bbb';

SELECT * FROM GROUPDETAIL; 

COMMIT;

-- 4. EVENT HISTORY TABLE에, EVENT DETAIL TABLE 정보를 옮겨준다

INSERT INTO EVENTHISTORY
    ( SELECT  EVENTHISTORY_SEQ.NEXTVAL, E.EID, ED.MID, ED.EDSHARE, E.ERDATE, E.ENAME
    FROM EVENTDETAIL ED, EVENT E
    WHERE E.EID=ED.EID
    AND E.EID=1);
        
SELECT * FROM  EVENTHISTORY;

-- 5. DELETE FROM EVENT DETAIL
    
    DELETE FROM EVENTDETAIL WHERE EID=1;
    ROLLBACK;
    



-- SPLITING THE COSTS --

SELECT * FROM CENTRALSYSTEM;

-- when button 'split' is clicked to divide the costs, a new data point is inserted in the centralSystem
-- must check if the data point for this group already exists:

SELECT * FROM CENTRALSYSTEM WHERE GID = 1; --if rs.next = 0, do the following:

INSERT INTO CENTRALSYSTEM (CSID, GID)
 VALUES(CENTRALSYSTEM_SEQ.NEXTVAL, 1);
 
 --otherwise, do nothing
 
select * from groupdetail;
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
