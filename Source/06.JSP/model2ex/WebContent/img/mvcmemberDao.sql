-- dao에 들어갈 query
-- (1) 로그인
SELECT * FROM MVC_MEMBER WHERE mID='aaa' and mPW='1';
-- (2) mid로 dto가져오기(로그인 성공시 session에 넣기 위함)
SELECT * FROM MVC_MEMBER WHERE MID='aaa';
-- (3) 회원id 중복체크
SELECT * FROM MVC_MEMBER WHERE MID='aaa';
-- (4) 회원가입
INSERT INTO MVC_MEMBER (MID, MPW, MNAME, MEMAIL, MPHOTO, MBIRTH, MADDRESS)
    VALUES ('aaa','1','홍길동','hong@naver.com','NOIMG.JPG','1998/12/12','강남');
-- (5) 회원정보 수정
UPDATE MVC_MEMBER SET MPW = '1',
                    MNAME = 'HONG',
                    MEMAIL = 'yi@naver.com',
                    MPHOTO = 'NOIMG.JPG',
                    MBIRTH = '1991/12/12',
                    MADDRESS = '서울'
        WHERE mId='aaa';
-- (6) 회원리스트(top-N구문)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
                        (SELECT * FROM MVC_MEMBER ORDER BY mRDATE DESC) A)
        WHERE RN BETWEEN 3 AND 5;
-- (7) 회원수
SELECT COUNT(*) CNT FROM MVC_MEMBER;
COMMIT;










