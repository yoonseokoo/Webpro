-- ���̺� & ������ DROP �� CREATE
DROP TABLE CUSTOMER;

CREATE TABLE CUSTOMER(
    CID    VARCHAR2(50) PRIMARY KEY,
    CPW    VARCHAR2(50) NOT NULL,
    CNAME  VARCHAR2(50) NOT NULL,
    CTEL   VARCHAR2(50) NOT NULL,
    CEMAIL VARCHAR2(50),
    CADDRESS VARCHAR2(250),
    CGENDER  VARCHAR2(10) NOT NULL,
    CBIRTH   DATE NOT NULL,
    CRDATE   DATE DEFAULT SYSDATE);
    
DROP SEQUENCE BOOK_SEQ;
DROP TABLE BOOK;
CREATE SEQUENCE BOOK_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE BOOK(
    bID NUMBER(5) PRIMARY KEY,    -- å��ȣ
    bTITLE VARCHAR2(100) NOT NULL, -- å����
    bPRICE NUMBER(7)     NOT NULL, -- å����
    bIMAGE1 VARCHAR2(30) NOT NULL, -- å ��ǥ �̹���(÷�ξ� �� ��� : noImg.png)
    bIMAGE2 VARCHAR2(30) NOT NULL, -- å �ΰ� �̹���(÷�ξ� �� ��� : NOTHING.JPG)
    bCONTENT VARCHAR2(4000),       -- å ����(�ѱ� 1,333���� �̳�)
    bDISCOUNT NUMBER(3) NOT NULL,  -- ������(0~100% �̳�)
    bRDATE DATE DEFAULT SYSDATE    -- å �����    
);
DROP SEQUENCE FILEBOARD_SEQ;
DROP TABLE FILEBOARD;
CREATE SEQUENCE FILEBOARD_SEQ MAXVALUE 9999999 NOCACHE NOCYCLE;
CREATE TABLE FILEBOARD(
    FNUM     NUMBER(7) PRIMARY KEY,   -- �۹�ȣ
    CID      VARCHAR2(50) REFERENCES CUSTOMER(CID), -- �ۼ��� CID
    FSUBJECT VARCHAR2(250) NOT NULL, -- �� ����
    FCONTENT VARCHAR2(4000),         -- ����
    FFILENAME VARCHAR2(50),          -- ÷�����ϸ�
    FPW       VARCHAR2(50) NOT NULL, -- ���
    FHIT      NUMBER(7) DEFAULT 0 NOT NULL,    -- ��ȸ��
    FREF      NUMBER(7) NOT NULL,    -- �� �׷�
    FRE_STEP  NUMBER(7) NOT NULL,    -- �׷쳻 ��¼���
    FRE_LEVEL NUMBER(7) NOT NULL,    -- �鿩���� ����
    FIP       VARCHAR2(50) NOT NULL, -- �۾� ��ǻ�� IP
    FRDATE    DATE DEFAULT SYSDATE NOT NULL);  -- �� ��� ����
    
    SELECT * FROM FILEBOARD;
    SELECT * FROM CUSTOMER;