
-- ������ DUMMY MEMBER ������


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




-- ������ DUMMY FILEBOARD ������


INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FHIT,
                FGROUP, FSTEP, FINDENT, FIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'aaa', 'titile','','song.jpg', 10,
                FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.44');
                
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FHIT,
                FGROUP, FSTEP, FINDENT, FIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'bbb', 'titile2','','song2.jpg', 0,
                FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.41');
                
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FHIT,
                FGROUP, FSTEP, FINDENT, FIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'ccc', 'titile3','','s.jpg', 25,
                FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.42');
                
    commit;
                
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FHIT,
                FGROUP, FSTEP, FINDENT, FIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'song', 'titile4','','kang.jpg', 35,
                FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.43');
                
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FHIT,
                FGROUP, FSTEP, FINDENT, FIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'song', 'titile4','','kim.jpg', 35,
                FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.43');               
                
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FHIT,
                FGROUP, FSTEP, FINDENT, FIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'aaa', 'titile7','','jo.jpg', 1 ,
                FILEBOARD_SEQ.CURRVAL, 0,0, '192.168.20.40');
                
                                
INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FHIT,
                FGROUP, FSTEP, FINDENT, FIP)
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'aaa', '�亯��','����',null, 3,
                2, 1, 1, '192.168.20.44'); -- First response to the 2nd �Խù�
                
SELECT * FROM FILEBOARD ORDER BY FGROUP DESC, FSTEP;


-- ������ DUMMY ADMIN ������

INSERT INTO ADMIN (AID, APW, ANAME)
        VALUES ('un', '123','unie');
        
INSERT INTO ADMIN (AID, APW, ANAME)
        VALUES ('ch', '123','charlie');
