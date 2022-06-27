-- [1]  SETTING DB:

-- [1.1] TABLE DROP 

DROP TABLE CUSTOMER;

-- [1.2] TABLE CREATE
CREATE TABLE CUSTOMER (
    CID VARCHAR2(50) PRIMARY KEY,                  
    CPW VARCHAR2(50)  NOT NULL,  
    CNAME VARCHAR2(50)  NOT NULL,
    CTEL VARCHAR2(50)  NOT NULL, 
    CEMAIL VARCHAR2(50),
    CADDRESS VARCHAR2(250),
    CGENDER VARCHAR2(10) NOT NULL,
    CBIRTH DATE NOT NULL,
    CRDATE DATE  DEFAULT SYSDATE);
    
    SELECT * FROM CUSTOMER;

-- [2] SQL TO CHECK IF 'CID' IS ALREADY IN USE: public int confirmId (String cid)

SELECT * 
    FROM CUSTOMER 
    WHERE CID ='aaa';

-- [3] SQL TO CREATE NEW ACCOUNT: public int jointCustomer (MemberDto dto)

INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH, CRDATE)
    VALUES ('aaa', '111', ' 홍길동', '02-1111-1111', 'hong@h.com', '서울', 'm', '1995-12-12', SYSDATE);

-- [4] SQL TO LOGIN: public int loginCheck(String cid, String cpw)

SELECT CID, CPW
    FROM CUSTOMER
    WHERE CID='aaa';

-- [5] SQL TO CALL 'ID' USING dto: public CustomerDto getCustomer(String cid)

SELECT *
    FROM CUSTOMER
    WHERE CID='aaa';
    
-- [6] SQL TO UPDATE USER INFORMATION: public int modifyMember(MemberDto dto)

UPDATE CUSTOMER 
    SET CPW = '111',
    CNAME = '신길동',
    CTEL = '010-9999-8888',
    CEMAIL = 'a@A.COM',
    CADDRESS = '안양',
    CGENDER = 'm',
    CBIRTH = '1990-12-01'
    WHERE CID= 'aaa';
    
COMMIT;

DELETE FROM MEMBER 
    WHERE ID != 'aaa';
    
    
SELECT * FROM MEMBER;
