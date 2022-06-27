-- [1]  SETTING DB:


-- [1.1] TABLE DROP 

DROP TABLE BOOK;

-- [1.2] TABLE CREATE
CREATE TABLE BOOK (
    BID NUMBER(5) PRIMARY KEY,                                          -- BOOK NUMBER
    BTITLE VARCHAR2(30) NOT NULL,                                    --  TITLE
    BPRICE NUMBER(7) NOT NULL,                                         -- PRICE
    BIMAGE1 VARCHAR2(30) NOT NULL,                                  -- MAIN BOOK IMAGE (IF NOTHING IS ATTACHED: noImg.png)
    BIMAGE2 VARCHAR2(30) NOT NULL,                                  -- ADDITIONAL BOOK IMGAGE (if nothing attached: nothing.JPG)
    BCONTENT VARCHAR2(4000),                                             -- EXPLAINATION
    BDISCOUNT NUMBER(3) NOT NULL,                                  -- DISCOUNT RATE (0~100%)
    BRDATE DATE DEFAULT SYSDATE);                                   --  REGISTERED DATE

    SELECT * FROM BOOK;

-- [1.3] SEQUENCE DROP & CREATE

    DROP SEQUENCE BOOK_SEQ;
    
    CREATE SEQUENCE BOOK_SEQ
        MAXVALUE 99999 
        NOCACHE
        NOCYCLE;

-- [2] METHODS:

-- [2.1] REGISTERING BOOK

        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, '1984' , 30000, 'noImg.png', 'NOTHING.JPG', 'Book explaination', 20);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'World Order' , 35000, 'noImg.png', 'NOTHING.JPG', 'Book explaination', 10);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'On Liberty' , 25000, 'noImg.png', 'NOTHING.JPG', 'Book explaination', 5);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'Lord of the Flies' , 18000, 'noImg.png', 'NOTHING.JPG', 'Book explaination', 20);
            
         COMMIT;
         
         
         INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'abc' , 16000, '117.jpg', '119.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry', 10);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'blabla' , 54000, '118.jpg', '104.jpg', 'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'apple' , 10000, '116.jpg', '115.jpg', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ', 15);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'fruits' , 7000, 'noImg.png', '113.jpg', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ', 40);
            
               INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'happy girl' , 5250, '119.jpg', '114.jpg', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there is not anything embarrassing hidden in the middle of text. ', 15);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'smile' , 6600, '113.jpg', '111.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', 35);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'sunny day' , 14100, '108.jpg', '107.jpg', 'Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.', 20);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'Astrophysics' , 12000, '110.jpg', '112.jpg', 'Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. ', 25);
        
         INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'Astirtotle' , 22000, '104.jpg', '106.jpg', 'This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 15);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'philosophers' , 80000, '105.jpg', '102.jpg', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which do not look even slightly believable.', 12);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'Dont cry' , 21000, '101.jpg', 'NOTHING.JPG', 'If you are going to use a passage of Lorem Ipsum, you need to be sure there is not anything embarrassing hidden in the middle of text.', 15);
            
        INSERT INTO BOOK (BID, BTITLE, BPRICE, BIMAGE1, BIMAGE2, BCONTENT, BDISCOUNT)
            VALUES (BOOK_SEQ.NEXTVAL, 'Korean language' , 11000, 'noImg.png', '109.jpg', 'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.', 5);
            
         
-- [2.2] PRINTING TOTAL BOOK LIST 

        SELECT *
            FROM BOOK
            ORDER BY BRDATE DESC;

-- [2.3] BOOK LIST USING TOP-N SYNTAX

    SELECT *
        FROM (SELECT ROWNUM RN, A.*
                        FROM (SELECT * FROM BOOK ORDER BY BRDATE DESC) A)
                        WHERE RN BETWEEN 2 AND 3;

-- [2.4]COUNTING NUMBER OF REGISTERED BOOKS

    SELECT COUNT (*) CNT
        FROM BOOK;

-- [2.5] BRING BOOK BID USING DTO

       SELECT * 
        FROM BOOK 
        WHERE BID=1;
            
