DROP TABLE MEMBER;

DROP SEQUENCE MEMBER_SEQ;

CREATE SEQUENCE MEMBER_SEQ 
    MAXVALUE 999999 
    NOCACHE
    NOCYCLE;

CREATE TABLE MEMBER(
    MID VARCHAR2(30) PRIMARY KEY,
    MPW VARCHAR2(30) NOT NULL,
    MNAME VARCHAR2(30) NOT NULL,
    MEMAIL VARCHAR2(30),
    MPHOTO VARCHAR2(30) NOT NULL,
    MBIRTH DATE,
    MADDRESS VARCHAR2(300),
    MRDATE DATE DEFAULT SYSDATE);
    
SELECT * FROM MEMBER;
SELECT * FROM MEMBER WHERE mEmail='hong@h.com';


-- [1] ���̵� �ߺ� �׽�Ʈ

SELECT * 
    FROM MEMBER ;
    WHERE MID ='aaa';

-- [2] ȸ������

INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO,  MBIRTH, MADDRESS, MRDATE)
    VALUES ('aaa', '111', ' ȫ�浿', 'hong@h.com', 'NOIMG.JPG', '1995-12-12', '����', SYSDATE);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO,  MBIRTH, MADDRESS, MRDATE)
    VALUES ('bbb', '111', ' ��浿', 'kim@k.com', 'NOIMG.JPG', '1995-12-13', '�λ�', SYSDATE);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO,  MBIRTH, MADDRESS, MRDATE)
    VALUES ('ccc', '111', ' �ڱ浿', 'park@p.com', 'NOIMG.JPG', '1995-12-14', '�뱸', SYSDATE);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO,  MBIRTH, MADDRESS, MRDATE)
    VALUES ('ddd', '111', ' ���浿', 'koo@k.com', 'NOIMG.JPG', '1995-12-15', '����', SYSDATE);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('gayun', '1', '�谡��', 'gayun@naver.com', 'gayun.jpg', '1972-09-09','���ֱ�����');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('gico','1','����','gico@naver.com','gico.jpg','1992/09/14','�����');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('go','1','��ҿ�','go@naver.com','go.jpg','1972/10/06','�����');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('ham','1','�Լҿ�','ham@naver.com','ham.jpg','1976/06/16','�����');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('han','1','������','han@naver.com','han.jpg','1982/11/05','�����');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('jang','1','�嵿��',null,'jang.jpg',null,null);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('jo','1','������',null,'jo.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('kang','1','������',null,'kang.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('kim','1','������',null,'kim.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('lee','1','�̼���',null,'lee.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('lim','1','�ӿ���',null,'lim.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('park','1','�ں���',null,'park.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('rain','1','��',null,'rain.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('s','1','�۰���',null,'s.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('son','1','�����',null,'son.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('song','1','���߱�',null,'song.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('song2','1','������',null,'song2.jpg',null,null);
    

    
    
    
    commit;
    
    
    