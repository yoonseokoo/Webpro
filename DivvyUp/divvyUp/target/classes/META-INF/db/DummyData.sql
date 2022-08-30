
-- MEMBER TABLE --

SELECT * FROM  MEMBER;

    INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL)
        VALUES ('aaa', '111', 'unie', 'yoonseokoo@gmail.com');
    INSERT INTO MEMBER  (MID, MPW, MNAME, MEMAIL)
        VALUES ('bbb', '222', 'dk', 'dk@gmail.com');
    INSERT INTO MEMBER  (MID, MPW, MNAME, MEMAIL)
        VALUES ('ccc', '333', 'bin', 'bin@gmail.com');
    INSERT INTO MEMBER  (MID, MPW, MNAME, MEMAIL)
        VALUES ('ddd', '444', 'kim', 'kim@gmail.com');
    INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
        VALUES('QWE2735', '1', '박동규', 'qer2735@naver.com');
    INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
        VALUES('jeong123', '1', '정효원', 'jeong123@naver.com');
    INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
        VALUES('hwang123', '1', '황효진', 'hwang123@naver.com');
    INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
        VALUES('hayoon200', '1', '전하윤', 'hayoon200@naver.com');
    INSERT INTO MEMBER(MID, MPW, MNAME, MEMAIL)
        VALUES('gilsu100', '1', '이길수', 'gilsu100@naver.com');
            
COMMIT;

-- ADMIN --
    
    INSERT INTO ADMIN(AID, APW, ANAME) VALUES ('admin1', '1', 'admin1');
    INSERT INTO ADMIN(AID, APW, ANAME) VALUES ('admin2', '2', 'admin2');


-- FOLLOW --

    INSERT INTO FOLLOW(FID, FROM_MID, TO_MID) VALUES (FOLLOW_SEQ.NEXTVAL, 'aaa', 'bbb');
    INSERT INTO FOLLOW(FID, FROM_MID, TO_MID) VALUES (FOLLOW_SEQ.NEXTVAL, 'aaa', 'ccc');
    INSERT INTO FOLLOW(FID, FROM_MID, TO_MID) VALUES (FOLLOW_SEQ.NEXTVAL, 'aaa', 'ddd');
    INSERT INTO FOLLOW(FID, FROM_MID, TO_MID) VALUES (FOLLOW_SEQ.NEXTVAL, 'bbb', 'aaa');
    INSERT INTO FOLLOW(FID, FROM_MID, TO_MID) VALUES (FOLLOW_SEQ.NEXTVAL, 'ccc', 'aaa');

    