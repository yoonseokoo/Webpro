-- �� Member.xml(ȸ������, id�ߺ�üũ, id�� memberDto�� ��������, ��������) ��

-- Member.xml id=idConfirm (�ش�id�� �����)

SELECT COUNT(*) FROM MEMBER WHERE MID='bbb';

-- Member.xml id = joinMember (ȸ������)

INSERT INTO MEMBER VALUES
    ('bbb','1','�ű浿','shin@gmail.com', '01234', '����� ��� xx��');

-- Member.xml id = getDetailMember (mid�� dto��������)

SELECT * FROM MEMBER WHERE MID='bbb';

-- Member.xml id = modifyMember (ȸ����������)

UPDATE MEMBER SET MPW='1',
                MNAME='���浿',
                MMAIL = 'shin@gmail.com',
                MADDR='����� ��걸',
                MPOST = '01234'
    WHERE MID='bbb';



-- �� Book.xml (����¡���̽űԼ�list, ������¡���Եȵ���list(å�̸���), å����, �󼼺���, �������, ��������) ��

-- Book.xml id = mainList(�űԵ��������� list��������)

SELECT * FROM BOOK ORDER BY BRDATE DESC;

-- Book.xml id = bookList (pagingó���ؼ� å�̸� ������ list��������)

SELECT * FROM BOOK ORDER BY BTITLE; -- ��� ����
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM BOOK ORDER BY BTITLE) A)
    WHERE RN BETWEEN 1 AND 3;

-- Book.xml id = totCntBook (��ϵ� å ������������)

SELECT COUNT(*) FROM BOOK;

-- Book.xml id = getDetailBook (å��ȣbnum���� dto��������)

SELECT * FROM BOOK WHERE BNUM=1;

-- Book.xml id = registerBook(å����ϱ�)

INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG1, bIMG2, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'Spring frame','���۰�',SYSDATE, 'noImg.png','noImg.png','������ ������');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG1, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'web programing','������',SYSDATE, 'noImg.png','�����α׷���');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bIMG2, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, 'web','���浿',SYSDATE, 'noImg.png','���� ��');
INSERT INTO BOOK (bNUM, bTITLE, bWRITER, bRDATE, bINFO)
    VALUES (BOOK_SQ.NEXTVAL, '�̰��� JAVA��','���ڹ�',SYSDATE, 'OOP');
    
-- Book.xml id = modifyBook(å���������ϱ�)

UPDATE BOOK SET
    btitle='jsp servlet',
    bwriter='������',
    brdate=sysdate,
    bimg1='noImg.png',
    bimg2='noImg.png',
    binfo='���� å'
    WHERE BNUM=2;

COMMIT;