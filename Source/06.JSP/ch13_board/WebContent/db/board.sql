-- [1]  SETTING DB:

-- [1.1] TABLE DROP 

DROP TABLE BAORD;

-- [1.2] TABLE CREATE
CREATE TABLE BOARD (
    NUM NUMBER(5,0) PRIMARY KEY,                   -- �۹�ȣ
    WRITER VARCHAR2(30) NOT NULL,                   -- �۾���
    SUBJECT VARCHAR2(100) NOT NULL,               -- ������
    CONTENT VARCHAR2 (4000) NOT NULL,         -- ����
    EMAIL VARCHAR2(30),                                       -- �ۼ��� �̸���
    READCOUNT NUMBER(5) DEFAULT 0,               -- ��ȸ��
    PW VARCHAR2(30) NOT NULL,                         -- �� ������ �� ��й�ȣ
    REF NUMBER(5,0) NOT NULL,                          -- �۱׷�
    RE_STEP NUMBER(5) NOT NULL,                      -- �׷쳻 ��� ���� (���� 0)
    RE_INDENT NUMBER(5) NOT NULL,                   -- �� LIST  ��½� ���� �鿩���� ���� (����0)
    IP VARCHAR2(20) NOT NULL,                            -- ���ۼ��� ���� IP �ּ�
    RDATE DATE DEFAULT SYSDATE);                     -- �۾� ���� (��¥ + �ð�)
    
    SELECT * FROM BOARD;

-- [1.3] ��ȸ�� ����

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
            VALUES ((SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), 'ȫ�浿' , '������1', '�����Դϴ�\n�ݿ��Ϲ氡', NULL, '1', 
            (SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), 0, 0, '192.168.10.30');
        
         INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
            VALUES ((SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), 'ȫ�浿' , '������2', '�����Դϴ�\n�ݿ��Ϲ氡', NULL, '1', 
            (SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), 0, 0, '192.168.10.30');

        INSERT INTO BOARD (NUM, WRITER, SUBJECT, CONTENT, EMAIL, PW, REF, RE_STEP, RE_INDENT, IP)
            VALUES ((SELECT NVL(MAX(NUM), 0) + 1  FROM BOARD), 'ȫ�浿' , '������3', '�����Դϴ�\n�ݿ��Ϲ氡', NULL, '1', 
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
            SET SUBJECT = '������ ����1',
                    CONTENT = '������ �����Դϴ�\n �Ϳ�',
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