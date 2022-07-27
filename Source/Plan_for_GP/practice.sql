
-- [1] MEMBER TABLE --
DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
    MID VARCHAR2(100) PRIMARY KEY,
    MPW VARCHAR2(100) NOT NULL,
    MNAME VARCHAR2(100) NOT NULL,
    MMAIL VARCHAR2(100) NOT NULL,
    MPOST VARCHAR2(100),
    MADDR VARCHAR2(100),
    MTEL VARCHAR(30));

SELECT * FROM  MEMBER;

    INSERT INTO MEMBER 
        VALUES ('aaa', '111', 'unie', 'yoonseokoo@gmail.com', '01234', 'Milan', '010-1234-4321');
     INSERT INTO MEMBER 
        VALUES ('bbb', '222', 'dk', 'dk@gmail.com', '01235', 'Amsterdam', '010-2345-5432');
     INSERT INTO MEMBER 
        VALUES ('ccc', '333', 'bin', 'bin@gmail.com', '01236', 'Seoul', '010-3456-6543');
     INSERT INTO MEMBER 
        VALUES ('ddd', '444', 'kim', 'kim@gmail.com', '01237', 'London', '010-4567-7654');
        
COMMIT;

--[2] GROUP TABLE --

DROP SEQUENCE GROUP_SEQ;

CREATE SEQUENCE GROUP_SEQ MAXVALUE 99999999 NOCYCLE NOCACHE;

DROP TABLE GROUPS CASCADE CONSTRAINTS;

CREATE TABLE GROUPS(
    GID NUMBER(6) PRIMARY KEY,
    GNAME VARCHAR2(30),
    GRDATE DATE DEFAULT SYSDATE,
    GIMG VARCHAR2(50),
    GCONTENT VARCHAR2(4000));
  
SELECT * FROM  GROUPS;

-- Constructing new group
INSERT INTO GROUPS (GID, GNAME, GIMG, GCONTENT)
    VALUES (GROUP_SEQ.NEXTVAL, 'Trip to Namhae', 'namhae.jpg' , 'Lets have a lit time');

-- Bringing groupDto using GID

-- Updating group information

-- Deleting group (for admin)


COMMIT;       

-- [3] GROUP DETAIL -- 

DROP SEQUENCE GROUPDETAIL_SEQ;

CREATE SEQUENCE GROUPDETAIL_SEQ MAXVALUE 99999999 NOCYCLE NOCACHE;
    
DROP TABLE GROUPDETAIL;


CREATE TABLE GROUPDETAIL( -- info about the members in the group
    GDID NUMBER(6) PRIMARY KEY, -- The member's unique ID WITHIN THE GROUP
    GID NUMBER(6), -- group ID to distinguish the groups
    MID VARCHAR2(100), -- member ID to link member's information
    GDRDATE DATE DEFAULT SYSDATE, -- date member joined the group
    FOREIGN KEY (GID) REFERENCES GROUPS(GID),
    FOREIGN KEY (MID) REFERENCES MEMBER(MID));


SELECT * FROM  GROUPDETAIL;

-- Adding new member to group
INSERT INTO GROUPDETAIL (GDID, GID, MID)
    VALUES (GROUPDETAIL_SEQ.NEXTVAL, 1 , 'aaa');
        
INSERT INTO GROUPDETAIL (GDID, GID, MID)
    VALUES (GROUPDETAIL_SEQ.NEXTVAL, 1 , 'bbb');

-- Deleting member from group

-- printing memebrs in the group (member list)
    
-- Printing info of members in group 1
SELECT M.* , G.GID ,GDRDATE FROM GROUPS G, GROUPDETAIL GD, MEMBER M WHERE G.GID=GD.GID AND GD.MID = M.MID AND G.GID=1;

COMMIT;

-- [4] PAY -- 

DROP SEQUENCE PAY_SEQ;

CREATE SEQUENCE PAY_SEQ MAXVALUE 99999999 NOCYCLE NOCACHE;

DROP TABLE PAY CASCADE CONSTRAINTS;

CREATE TABLE PAY(
    PID NUMBER(6) PRIMARY KEY,
    PNAME VARCHAR2(30) NOT NULL, --title for payment
    PCONTENT VARCHAR(4000), -- description of payment: eg. taxi cost, dinner...
    PIMAGE VARCHAR2(30), -- image attached relating to payment : eg. receit
    PAMOUNT NUMBER(10) NOT NULL,--total amount paid
    PCOUNT NUMBER(5) NOT NULL,
    PRDATE DATE DEFAULT SYSDATE, --date of payment
    MID VARCHAR2(100) NOT NULL, --person who paid
    GID NUMBER(6) NOT NULL, -- the group in which the payment was made in
    FOREIGN KEY (GID) REFERENCES GROUPS(GID),
    FOREIGN KEY (MID) REFERENCES MEMBER(MID));

SELECT * FROM  PAY;

-- Addding new paid transaction detail
INSERT INTO PAY (PID, PNAME, PCONTENT, PIMAGE, PAMOUNT, PCOUNT, MID, GID)
    VALUES (PAY_SEQ.NEXTVAL, 'Lunch', 'Pizza near the station', '', 55000, 2, 'aaa', 1);
    
    


-- Updating transaction information

-- Deleting transaction
 
COMMIT;

-- [5] PAY DETAIL --

DROP SEQUENCE PAYDETAIL_SEQ; --EVENT 에 참여한 MEMBER 의 SHARE

CREATE SEQUENCE PAYDETAIL_SEQ MAXVALUE 99999999 NOCYCLE NOCACHE;

DROP TABLE PAYDETAIL CASCADE CONSTRAINTS; 

CREATE TABLE PAYDETAIL(
    PDID NUMBER(6) PRIMARY KEY, -- The member's unique ID WITHIN THE PAYMENT
    PID NUMBER(6) NOT NULL, -- which payment the member is involved in
    MID VARCHAR2(100)  NOT NULL, --member that was involved in this payment
    PDSHARE NUMBER(10) NOT NULL, -- (the share) amount the member has to pay (calculate using inner join)
    FOREIGN KEY (MID) REFERENCES MEMBER(MID),
    FOREIGN KEY (PID) REFERENCES PAY(PID));



SELECT * FROM  PAYDETAIL;

-- allocating the individual costs of the paid transaction (1/n)

INSERT INTO PAYDETAIL (PDID, PID, MID, PDSHARE)
    VALUES (PAYDETAIL_SEQ.NEXTVAL, 1, 'aaa', ((SELECT PAMOUNT FROM PAY WHERE PID=1)/(SELECT PCOUNT FROM PAY WHERE PID=1)));
    
INSERT INTO PAYDETAIL (PDID, PID, MID, PDSHARE)
    VALUES (PAYDETAIL_SEQ.NEXTVAL, 1, 'bbb', -1*((SELECT PAMOUNT FROM PAY WHERE PID=1)/(SELECT PCOUNT FROM PAY WHERE PID=1)));


-- allocating the individual costs of the paid transaction (allocating specific costs)

INSERT INTO PAYDETAIL (PDID, PID, MID, PDSHARE)
    VALUES (PAYDETAIL_SEQ.NEXTVAL, 1, 'aaa', '40000');
    
COMMIT;

-- printing member aaa's share for the payment '2' in group 1

SELECT * FROM  PAYDETAIL WHERE MID='aaa' AND PID=1;



-- [6] PAY HISTORY --

DROP SEQUENCE PAYHISTORY_SEQ;

CREATE SEQUENCE PAYHISTORY_SEQ MAXVALUE 99999999 NOCYCLE NOCACHE;

DROP TABLE PAYHISTORY;

CREATE TABLE PAYHISTORY(
    PHID NUMBER(6) PRIMARY KEY, -- Unique identification of payment history
    PDID NUMBER(6),
    PID NUMBER(6) NOT NULL, -- which payment the member is involved in
    MID VARCHAR2(100)  NOT NULL, --member that was involved in this payment
    PDSHARE NUMBER(10) NOT NULL, -- (the share) amount the member has to pay (calculate using inner join)
    FOREIGN KEY (MID) REFERENCES MEMBER(MID),
    FOREIGN KEY (PID) REFERENCES PAY(PID));
    
SELECT * FROM  PAYHISTORY;

INSERT INTO PAYHISTORY
    SELECT PAYHISTORY_SEQ.NEXTVAL, PAYDETAIL_SEQ.CURRVAL, PID, MID, PDSHARE
    FROM PAYDETAIL 
    WHERE PDID=2;


-- 5. PAY DETAIL TABLE, 에서, GROUP MEMBER DETAIL TABLE 에 이미 업데이트 해준 정보는 지워준다

DELETE FROM PAYDETAIL
    WHERE PDID= (SELECT  PDID FROM PAYHISTORY WHERE PHID = (SELECT MAX(PHID) MAX FROM PAYHISTORY));
    
    
    select * from paydetail;
    
    
-- [7] GROUP MEMBER DETAIL 

DROP SEQUENCE GROUPMEMBERDETAIL_SEQ;

CREATE SEQUENCE GROUPMEMBERDETAIL_SEQ MAXVALUE 99999999 NOCYCLE NOCACHE;

DROP TABLE GROUPMEMBERDETAIL;

CREATE TABLE GROUPMEMBERDETAIL( -- Contains details of each member in the group
    GMDID NUMBER(6) PRIMARY KEY, -- unique ID for each member in the group
    MID VARCHAR2(100)  NOT NULL, --member ID
    GMBALANCE NUMBER(10) DEFAULT 0, -- total balance (how much member owe's or needs to get back)
    GID NUMBER(6) NOT NULL, -- indication of which group we are talking about
    FOREIGN KEY (GID) REFERENCES GROUPS(GID),
    FOREIGN KEY (MID) REFERENCES MEMBER(MID));
    
SELECT * FROM  GROUPMEMBERDETAIL;


-- default value for member aaa and bbb in group 1
INSERT INTO GROUPMEMBERDETAIL (GMDID, MID, GID)
    VALUES (GROUPMEMBERDETAIL_SEQ.NEXTVAL, 'aaa', '1');
    
INSERT INTO GROUPMEMBERDETAIL (GMDID, MID, GID)
    VALUES (GROUPMEMBERDETAIL_SEQ.NEXTVAL, 'bbb', '1');

--updating member's balance when payment within the group is made

UPDATE GROUPMEMBERDETAIL 
    SET GMBALANCE = GMBALANCE + (SELECT PDSHARE FROM PAYDETAIL WHERE MID='aaa' AND PID=1),
        GMTOTALPAID = --join to see if the oriignal pereson paid in table pay is the same as mid
    WHERE MID='aaa';
    
UPDATE GROUPMEMBERDETAIL 
    SET GMBALANCE= GMBALANCE + (SELECT PDSHARE FROM PAYDETAIL WHERE MID='bbb' AND PID=1)
    WHERE MID='bbb';
 
COMMIT;   
    
    






--★★★★★steps of making a new group★★★★★

--1.새로운 그룹 생성:

INSERT INTO GROUPS (GID, GNAME, GIMG, GCONTENT)
    VALUES (GROUP_SEQ.NEXTVAL, 'Trip to Namhae', 'namhae.jpg' , 'Lets have a lit time');
    
--2. 바로 그룹에 멤버들 추가: Using checkbox

INSERT INTO GROUPDETAIL (GDID, GID, MID)
    VALUES (GROUPDETAIL_SEQ.NEXTVAL, 1 , 'aaa');
    
--3. 멤버 추가와 동시에, GROUPMEMBERDETAIL 테이블에, 각멤버의 default 값을 너어준다

INSERT INTO GROUPMEMBERDETAIL (GMDID, MID, GID)
    VALUES (GROUPMEMBERDETAIL_SEQ.NEXTVAL, 'aaa', '1');
    


-- ★★★★★steps of the payment★★★★★

--1. 한사람이 돈을 낸다 (돈 낸 사람의 아이디를 session에서 받아온다)

INSERT INTO PAY (PID, PNAME, PCONTENT, PIMAGE, PAMOUNT, PCOUNT, MID, GID)
    VALUES (PAY_SEQ.NEXTVAL, 'Lunch', 'Pizza near the station', '', 55000, 2, 'aaa', 1);
    
SELECT * FROM PAY;
    
--2. 바로 PAY DETAIL 테이블에, 관련된 사람들의 정보도 넣어준다 (체크박스로 관련된 사람의 이름들을 ARRAYLIST에 받아온다)

    --<c:if test="member.mid eq pay.mid">
    INSERT INTO PAYDETAIL (PDID, PID, MID, PDSHARE) --돈 낸 사람의 ID 는 SESSION에서 가지고 온다
        VALUES (PAYDETAIL_SEQ.NEXTVAL, 1, 'aaa', ((SELECT PAMOUNT FROM PAY WHERE PID=1)/(SELECT PCOUNT FROM PAY WHERE PID=1)));

    --<c:if test="member.mid != pay.mid">  
    INSERT INTO PAYDETAIL (PDID, PID, MID, PDSHARE)
        VALUES (PAYDETAIL_SEQ.NEXTVAL, 1, 'bbb', -1*((SELECT PAMOUNT FROM PAY WHERE PID=1)/(SELECT PCOUNT FROM PAY WHERE PID=1)));

SELECT * FROM PAYDETAIL;

--3.바로 GROUP MEMBER DETAIL TABLE 에 멤버 정보를 업데이트 해준다

    UPDATE GROUPMEMBERDETAIL 
        SET GMBALANCE = GMBALANCE + (SELECT PDSHARE FROM PAYDETAIL WHERE MID='aaa' AND PID=1)
        WHERE MID='aaa';
    
   UPDATE GROUPMEMBERDETAIL 
        SET GMBALANCE = GMBALANCE + ( SELECT PDSHARE FROM PAYDETAIL WHERE MID='bbb' AND PID=1)
        WHERE MID='bbb';

SELECT * FROM GROUPMEMBERDETAIL; 

-- 4. PAY HISTORY TABLE에, PAY DETAIL TABLE 정보를 옮겨준다

INSERT INTO PAYHISTORY
    SELECT PAYHISTORY_SEQ.NEXTVAL, PAYDETAIL_SEQ.CURRVAL, PID, MID, PDSHARE
        FROM PAYDETAIL 
        WHERE PDID=(SELECT MAX(PDID) MAX FROM PAYDETAIL);
        
-- 5. DELETE FROM PAY DETAIL
        
        
        
        SELECT *
FROM EMP MANAGER
WHERE EXISTS (SELECT *
FROM EMP WHERE
MANAGER.EMPNO =
MGR);


        SELECT ENAME, HIREDATE, 
        DEPTNO
        FROM EMP
        (DEPTNO, HIREDATE) 
        IN (SELECT DEPTNO,
        MAX(HIREDATE) FROM
        EMP);




SELECT * FROM PAYHISTORY;   


