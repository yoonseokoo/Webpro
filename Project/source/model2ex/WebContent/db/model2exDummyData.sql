
-- ■■■■■ DUMMY MEMBER ■■■■■


INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO,  MBIRTH, MADDRESS, MRDATE)
    VALUES ('aaa', '111', ' 홍길동', 'hong@h.com', 'NOIMG.JPG', '1995-12-12', '서울', SYSDATE);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO,  MBIRTH, MADDRESS, MRDATE)
    VALUES ('bbb', '111', ' 김길동', 'kim@k.com', 'NOIMG.JPG', '1995-12-13', '부산', SYSDATE);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO,  MBIRTH, MADDRESS, MRDATE)
    VALUES ('ccc', '111', ' 박길동', 'park@p.com', 'NOIMG.JPG', '1995-12-14', '대구', SYSDATE);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO,  MBIRTH, MADDRESS, MRDATE)
    VALUES ('ddd', '111', ' 구길동', 'koo@k.com', 'NOIMG.JPG', '1995-12-15', '제주', SYSDATE);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('gayun', '1', '김가연', 'gayun@naver.com', 'gayun.jpg', '1972-09-09','광주광역시');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('gico','1','지코','gico@naver.com','gico.jpg','1992/09/14','서울시');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('go','1','고소영','go@naver.com','go.jpg','1972/10/06','서울시');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('ham','1','함소원','ham@naver.com','ham.jpg','1976/06/16','서울시');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('han','1','한지민','han@naver.com','han.jpg','1982/11/05','서울시');
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('jang','1','장동건',null,'jang.jpg',null,null);
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('jo','1','조현우',null,'jo.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('kang','1','강동원',null,'kang.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('kim','1','김태희',null,'kim.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('lee','1','이선빈',null,'lee.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('lim','1','임요한',null,'lim.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('park','1','박보검',null,'park.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('rain','1','비',null,'rain.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('s','1','송가연',null,'s.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('son','1','손흥민',null,'son.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('song','1','송중기',null,'song.jpg',null,null);
    
    
INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('song2','1','송혜교',null,'song2.jpg',null,null);




-- ■■■■■ DUMMY FILEBOARD ■■■■■


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
        VALUES (FILEBOARD_SEQ.NEXTVAL, 'aaa', '답변글','내용',null, 3,
                2, 1, 1, '192.168.20.44'); -- First response to the 2nd 게시물
                
SELECT * FROM FILEBOARD ORDER BY FGROUP DESC, FSTEP;


-- ■■■■■ DUMMY ADMIN ■■■■■

INSERT INTO ADMIN (AID, APW, ANAME)
        VALUES ('un', '123','unie');
        
INSERT INTO ADMIN (AID, APW, ANAME)
        VALUES ('ch', '123','charlie');
