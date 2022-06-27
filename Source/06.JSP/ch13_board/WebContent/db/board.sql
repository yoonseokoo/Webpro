-- [1]  SETTING DB:

-- [1.1] TABLE DROP 

DROP TABLE BAORD;

-- [1.2] TABLE CREATE
CREATE TABLE BOARD (
    NUM NUMBER(5,0) PRIMARY KEY,                   -- 글번호
    WRITER VARCHAR2(30) NOT NULL,                   -- 글쓴이
    SUBJECT VARCHAR2(100) NOT NULL,               -- 글제목
    CONTENT VARCHAR2 (4000) NOT NULL,         -- 본문
    EMAIL VARCHAR2(30),                                       -- 작성자 이메일
    READCOUNT NUMBER(5) DEFAULT 0,               -- 조회수
    PW VARCHAR2(30) NOT NULL,                         -- 글 삭제시 쓸 비밀번호
    REF NUMBER(5,0) NOT NULL,                          -- 글그룹
    RE_STEP NUMBER(5) NOT NULL,                      -- 그룹내 출력 순서 (월글 0)
    RE_INDENT NUMBER(5) NOT NULL,                   -- 글 LIST  출력시 제목 들여쓰기 정도 (원글0)
    IP VARCHAR2(20) NOT NULL,                            -- 글작성시 컴터 IP 주소
    RDATE DATE DEFAULT SYSDATE);                     -- 글쓴 시점 (날짜 + 시간)
    
    SELECT * FROM BOARD;

-- [1.3] 조회수 조작

    UPDATE BOARD
        SET READCOUNT = 12
        WHERE NUM IN (10 ,14,15);

-- [2] METHODS:

-- [2.1] COUNTING NUMBER OF POSTS

        SELECT COUNT(*) 
            FROM BOARD;
            
-- [2.2] CALLING LIST OF POSTS (MOST RECENT ON TOP)

        SELECT *
            FROM BOARD
            ORDER BY NUM DESC;

-- [2.3] UPLOADING NEW POST
    
        INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
            VALUES ((SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), '홍길동' , '글제목1', '본문입니다\n금요일방가', NULL, '1', 
            (SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), 0, 0, '192.168.10.30');
        
         INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
            VALUES ((SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), '홍길동' , '글제목2', '본문입니다\n금요일방가', NULL, '1', 
            (SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), 0, 0, '192.168.10.30');

        INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
            VALUES ((SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), '홍길동' , '글제목3', '본문입니다\n금요일방가', NULL, '1', 
            (SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), 0, 0, '192.168.10.30');

-- [2.4] FINDING POST USING POST NUMBER

        SELECT *  FROM BOARD
            WHERE NUM = 1;

-- [2.5] INCRESING READCOUNT WHEN POST IS CLICKED

        UPDATE BOARD
            SET READCOUNT = READCOUNT+1
            WHERE NUM = 1;
            
-- [2.6] EDIT POST

        UPDATE BOARD
            SET SUBJECT = '수정된 제목1',
                    CONTENT = '수정된 존문입니다\n 와우',
                    EMAIL = 'hong@hong.com',
                    PW = '1',
                    IP = '127.0.0.1'
                    WHERE NUM=1;
                    
        COMMIT;
        
-- [2.7] DELETE POST (WITH PW)
        
        DELETE 
            FROM BOARD
            WHERE NUM=1
            AND PW ='1';
        
        ROLLBACK;