-- ��(CUSTOMER)���̺� dummy data
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
    VALUES ('aaa','111','ȫ�浿','010-9999-9123', 'aaa@naver.com', '����� ������','m','1991-01-01');
    
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
    VALUES ('bbb','111','���浿','010-9999-9999', 'bbb@naver.com', '����� ��걸','m','1991-01-01');
    
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
    VALUES ('ccc','111','�ڱ浿','010-9999-9999', null, '����� ������','m','1991-01-01');
    
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
    VALUES ('ddd','111','���浿','010-9999-9999', 'ddd@naver.com', '��⵵ ������','m','1991-01-01');
    
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
    VALUES ('eee','111','�ű浿','010-9999-9999', 'eee@joeun.com', '��⵵ ���ֽ�','m','1991-01-01');
    
INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH) 
    VALUES ('fff','111','���浿','010-9999-9999', 'fff@naver.com', '��⵵ �����ֽ�','m','1991-01-01');
    

-- ����(BOOK)���̺� dummy data    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '������ ��',16000,'100.jpg','noImg.png','����',10);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '3�� ������� ��ȣ',20000,'101.jpg','noImg.png','�¿�ȣ ����',10);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '����� ���� ���� ���ڽ��ϴ�',14000,'102.jpg','noImg.png','����',5);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '��Ʈ�󷯴�',16000,'103.jpg','noImg.png','����',5);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '���� �Դ�',11500,'104.jpg','noImg.png','����',10);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '���� ���� ���ΰ� �ʿ��� ��⸦',13000,'105.jpg','noImg.png','����',30);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '���� �־��ٴ� ��',13500,'106.jpg','noImg.png','����',10);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '�ұ� ���� �꿭',33000,'107.jpg','noImg.png','����',10);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '�𷹹���¡',20000,'108.jpg','noImg.png','����',10);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '�ʿ� ���� ��ȣ��',18000,'109.jpg','noImg.png','����',5);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '���õ� ���, ���ϵ� ���',17000,'110.jpg','noImg.png','����',10);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '������ȭ�� ���� �а� ���� ����2',1600,'111.jpg','noImg.png','����',30);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, 'Ʈ�����ڸ��� 2020',2000,'112.jpg','noImg.png','2020 Ʈ���� Ű���� ',15);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '������ ����',1800,'113.jpg','noImg.png','�迵���� ���� ����',10);
    
INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT)
    VALUES (BOOK_SEQ.NEXTVAL, '���� �ƾ���',2000,'114.jpg','noImg.png','���� ',10);
    
-- �Խ���(FileBoard)���̺� dummy data
INSERT INTO FILEBOARD (fNUM, cID, fSUBJECT, fCONTENT, fFILENAME, fPW, 
                fREF, fRE_STEP, fRE_LEVEL, fIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'aaa', 'titile','',null,'111',
                FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.44');--1���� �߰�
                
INSERT INTO FILEBOARD (fNUM, cID, fSUBJECT, fCONTENT, fFILENAME, fPW, 
                fREF, fRE_STEP, fRE_LEVEL, fIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'bbb', 'titile','',null,'111',
                FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.44');--2���� �߰�
                
INSERT INTO FILEBOARD (fNUM, cID, fSUBJECT, fCONTENT, fFILENAME, fPW, 
                fREF, fRE_STEP, fRE_LEVEL, fIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'aaa', '����','����',null,'111',
                FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.44');--3���� �߰�
                
INSERT INTO FILEBOARD (fNUM, cID, fSUBJECT, fCONTENT, fFILENAME, fPW, 
                fREF, fRE_STEP, fRE_LEVEL, fIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'aaa', '����','����',null,'111',
                2, 1, 1, '192.168.20.44'); -- 2���ۿ� ���� ù��° �亯�� �߰�
                
SELECT * FROM FILEBOARD ORDER BY FREF DESC, FRE_STEP;
commit;