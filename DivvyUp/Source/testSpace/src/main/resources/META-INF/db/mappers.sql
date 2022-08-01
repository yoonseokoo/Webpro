-- ★ Member.xml(회원가입, id중복체크, id로 memberDto로 가져오기, 정보수정) ★

-- Member.xml id=idConfirm (해당id가 몇개인지)

SELECT COUNT(*) FROM MEMBER WHERE MID='bbb';

-- Member.xml id = joinMember (회원가입)

INSERT INTO MEMBER VALUES
    ('bbb','1','신길동','shin@gmail.com', '01234', '서울시 어떤구 xx동');

-- Member.xml id = getDetailMember (mid로 dto가져오기)

SELECT * FROM MEMBER WHERE MID='bbb';

-- Member.xml id = modifyMember (회원정보수정)

UPDATE MEMBER SET MPW='1',
                MNAME='선길동',
                MMAIL = 'shin@gmail.com',
                MADDR='서울시 용산구',
                MPOST = '01234'
    WHERE MID='bbb';



-- ★ Book.xml (페이징없이신규순list, 페이지징포함된도서list(책이름순), 책갯수, 상세보기, 도서등록, 도서수정) ★

-- Book.xml id = mainList(신규도서순으로 list가져오기)

SELECT * FROM BOOK ORDER BY BRDATE DESC;

-- Book.xml id = bookList (paging처리해서 책이름 순으로 list가져오기)

SELECT * FROM BOOK ORDER BY BTITLE;-- 출력 기준

SELECT * FROM BOOK WHERE BTITLE LIKE '%'||UPPER('JSP')||'%' ORDER BY BTITLE; 

SELECT * FROM BOOK WHERE BWRITER LIKE '%'||UPPER('작')||'%' ORDER BY BTITLE;


SELECT * FROM BOOK WHERE BTITLE LIKE '%'||UPPER('JSP')||'%' OR BWRITER LIKE '%'||'작'||'%' ORDER BY BTITLE;

    
    
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY BTITLE) A)
    WHERE RN BETWEEN 1 AND 3;
    
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK WHERE BTITLE LIKE '%'||UPPER('JSP')||'%' ORDER BY BTITLE) A)
    WHERE RN BETWEEN 1 AND 3;
    
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK WHERE BWRITER LIKE '%'||UPPER('작')||'%' ORDER BY BTITLE) A)
    WHERE RN BETWEEN 1 AND 3;
    
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK WHERE BTITLE LIKE '%'||UPPER('JSP')||'%' OR BWRITER LIKE '%'||'작'||'%' ORDER BY BTITLE) A)
    WHERE RN BETWEEN 1 AND 3;

-- Book.xml id = totCntBook (등록된 책 갯수가져오기)

SELECT COUNT(*) FROM BOOK;

-- Book.xml id = getDetailBook (책번호bnum으로 dto가져오기)

SELECT * FROM BOOK WHERE BNUM=1;

-- Book.xml id = registerBook(책등록하기)

INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG1, bIMG2, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'Spring frame','김작가',SYSDATE, 'noImg.png','noImg.png','스프링 프레임');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG1, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'web programing','박제이',SYSDATE, 'noImg.png','웹프로그래밍');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG2, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'web','윤길동',SYSDATE, 'noImg.png','정적 웹');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, '이것이 JAVA다','박자바',SYSDATE, 'OOP');
    
-- Book.xml id = modifyBook(책정보수정하기)

UPDATE BOOK SET
    btitle='jsp servlet',
    bwriter='최작자',
    brdate=sysdate,
    bimg1='noImg.png',
    bimg2='noImg.png',
    binfo='좋은 책'
    WHERE BNUM=2;

COMMIT;