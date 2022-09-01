

-- ■■■■■ GRADE TABLE ■■■■■ --

-- CUSTOMERS ARE CATEGORIZED IN TO 4 GROUPS : NORMAL, GOLD, VIP, VVIP
-- ACCORDING TO GRADE, DISCOUNT RATES DIFFER


INSERT INTO GRADE (MGRADE, GNAME, LOWGRADE, HIGHGRADE)
VALUES (1,'NORMAL',0,1000000);

INSERT INTO GRADE (MGRADE, GNAME, LOWGRADE, HIGHGRADE)
VALUES (2,'GOLD',1000001, 3000000);

INSERT INTO GRADE (MGRADE, GNAME, LOWGRADE, HIGHGRADE)
VALUES (3,'VIP',3000001, 6000000);

INSERT INTO GRADE (MGRADE, GNAME, LOWGRADE, HIGHGRADE)
VALUES (4,'VVIP',6000001,999999999);


-- ■■■■■ MEMBER TABLE ■■■■■ --

INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MADDRESSDETAIL,MBIRTH ,MEMAIL,MGENDER) 
    VALUES ('id1','111','이름1','010-1111-2222','주소1','주소2','2017-08-21','one@one/com','남' ); 

INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MADDRESSDETAIL,MBIRTH ,MEMAIL,MGENDER, MCUMPURCHASE, MGRADE) 
    VALUES ('id2','111','이름2','010-1111-2223','주소11','주소22','2000-09-14','two@two.com','여', 0 ,1 ); 
    
INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MADDRESSDETAIL,MBIRTH ,MEMAIL,MGENDER, MCUMPURCHASE, MGRADE) 
    VALUES ('id3','111','이름3','010-1111-2224','주소111','주소222','2001-09-08','three@three.com','남', 1100000 ,2 ); 
    
INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MADDRESSDETAIL,MBIRTH ,MEMAIL,MGENDER, MCUMPURCHASE, MGRADE) 
    VALUES ('id4','111','이름4','010-1111-2225','주소22','주소33','1995-02-17','four@four.com','남', 4300000 ,3 ); 
    
-- ■■■■■ BOARD TABLE ■■■■■ --

INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO) 
    VALUES (BOARD_SEQ.NEXTVAL,'id1','이름1','본문1', NULL, 0, BOARD_SEQ.CURRVAL,0, 0 , 2); 
    
INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO) 
    VALUES (BOARD_SEQ.NEXTVAL,'id2','이름2','본문2', 'gico.jpg', 23, BOARD_SEQ.CURRVAL,0, 0 , 2); 

INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO) 
    VALUES (BOARD_SEQ.NEXTVAL,'id2','이름2','본문5', 'gico.jpg', 12, BOARD_SEQ.CURRVAL,0, 0 , 2); 
    
INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO) 
    VALUES (BOARD_SEQ.NEXTVAL,'id4','이름4','본문1', 'gico.jpg', 32, BOARD_SEQ.CURRVAL,0, 0 , 2); 
 

-- ■■■■■ ORDER TABLE ■■■■■ --

INSERT INTO ORDERS (ONO, ONAME, OPHONE, OADDRESS, MID)
    VALUES (ORDERNUM_SEQ.NEXTVAL, '이름1', NULL, NULL, 'id1');



-- ■■■■■ ORDER_DETAIL TABLE ■■■■■ --

INSERT INTO ORDER_DETAIL (ONO, PID, PQUANTITY, PPRICE, TOTCOST, DISCOUNT, PAYAMOUNT)
    VALUES(1, 1 , 2, 20000, 40000, 10,  36000);
    

-- ■■■■■ PRODUCT_GROUP TABLE ■■■■■ --

    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (1 , '클래식 메달 컬렉션', '주스티의 가장 대표적인 컬렉션. 다양한 레시피와 숙성 과정을 거쳐 얻은 모데나 발사믹 식초 5종을 메달 수에 따라 분류된다.', '01medal.jpg');
    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (2 , '화이트 발사믹 컬렉션', '포도 머스트와 와인 식초로 만든 달콤한 과일 향과 함께 신선하고 섬세한 발사믹 식초.','02white.jpg');
    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (3 , '유기동 컬렉션', '유기농 및 지속 가능한 농업을 통해 만들진 발사믹 식초.','03organic.jpg');
    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (4 , '프리미엄 컬렉션', '디캔터 및 리필 의 전통적인 시스템에 따라 최소 25년 숙성된 발사믹 식초.','04premium.jpg');
    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (5 , '세트', 'Giusti 생산의 다양한 품질을 점진적으로 맛보기 위해 만들어진 박스형 컬렉션입니다.', '05sets.jpg');
        
        
-- ■■■■■ PRODUCT TABLE ■■■■■ --
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '실버메달 프로 퓨마토 100ml' , 1 , 19000 , '1.1_silver100.jpg' , '100', 'A delicate Balsamic Vinegar of Modena adaptable for any dish.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '실버메달 6년산 프로 퓨마토 250ml' , 1 , 38000 , '1.2_silver250.jpg' , '100', 'A delicate Balsamic Vinegar of Modena adaptable for any dish.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '실버메달 6년산 프로 퓨마토 Cubic 250ml' , 1 , 38000 , '1.3_silverCubic.jpg' , '100', 'A delicate Balsamic Vinegar of Modena adaptable for any dish.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '2골드메달 클라시코 100ml' , 1 , 26000 , '2.1_twoMedal100.jpg' , '100', 'A 100% organic Balsamic Vinegar of Modena, both balanced and perfumed.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '2골드메달 8년산 클라시코 250ml' , 1 , 52000 , '2.2_twoMedal250.jpg' , '100', 'A 100% organic Balsamic Vinegar of Modena, both balanced and perfumed.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '2골드메달 8년산 클라시코 Cubic 250ml' , 1 , 52000 , '2.3_twoMedalCubic.jpg' , '100', 'A 100% organic Balsamic Vinegar of Modena, both balanced and perfumed.');
    
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '3골드메달 리카르도 100ml' , 1 , 39500 , '3.1_threeMedal100.jpg' , '100', 'A dense, sweet and versatile Balsamic Vinegar of Modena obtained from sundried grapes.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '3골드메달 12년산 리카르도 250ml' , 1 , 79000 , '3.2_threeMedal250.jpg' , '100', 'A dense, sweet and versatile Balsamic Vinegar of Modena obtained from sundried grapes.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '3골드메달 12년산 리카르도 주스티 Cubic 250ml ' , 1 , 79000 , '3.3_threeMedalCubic.jpg' , '100', 'A dense, sweet and versatile Balsamic Vinegar of Modena obtained from sundried grapes.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '4골드메달 콰르토 첸테나리오 100ml' , 1 , 59500 , '4.1_fourMedal100.jpg' , '100', 'An intense, full bodied and extremely thick Balsamic Vinegar of Modena with spicy notes.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '4골드메달 15년산 콰르토 첸테나리오 250ml' , 1 , 119000 , '4.2_fourMedal250.jpg' , '100', 'An intense, full bodied and extremely thick Balsamic Vinegar of Modena with spicy notes.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '4골드메달 15년산 콰르토 첸테나리오 Cubic 250ml' , 1 , 119000 , '4.3_fourMedalCubic.jpg' , '100', 'An intense, full bodied and extremely thick Balsamic Vinegar of Modena with spicy notes.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '5골드메달 반다로사 100ml' , 1 , 76500 , '5.1_fiveMedal100.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '5골드메달 20년산 반다로사 250ml' , 1 , 147000 , '5.2_fiveMedal250.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '5골드메달 20년산 반다로사 Cubic 250ml' , 1 , 147000 , '5.3_fiveMedalCubic.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '화이트 발사믹식초 250ml' , 2 , 33000 , '01_white250.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '화이트 발사믹식초 Cubic 250ml' , 2 , 33000 , '02_whiteCubic.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '유기농 6년산 1메달 250ml' , 3 , 43000 , '1.1_Organic1.jpg' , '100', 'Fresh and delicate, obtained with 100% organic raw materials.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '유기농 8년산 2메달 250ml' , 3 , 58000 , '1.2_Organic2.jpg' , '100', 'Made with organic ingredients; balanced, aromatic and of favorable density.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '유기농 12년산 3메달 250ml' , 3 , 89000 , '1.3_Organic3.jpg' , '100', '100% Organic, a pleasantly thick and sweet full-bodied balsamic vinegar.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '유기농 석류 발사믹 식초 250ml' , 3 , 43000 , '2.1_OrganicPomegranate.jpg' , '100', 'Made exclusively with organic raw materials, a delicate and well-balanced acidic condiment.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '유기농 라즈베리 발사믹 식초 250ml' , 3 , 48000 , '2.2_OrganicRaspberry.jpg' , '100', 'Pleasantly fresh, sweet and fruity, made exclusively with 100% organic raw materials.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '엑스트라베키오 25년산 DOP 전통 발사믹식초 100ml' , 4 , 224000 , '01_premium25.jpg' , '100', 'Aged at least 25 years, according to the traditional system of “decanter and refill” through a series of wooden casks.');
    
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET] 화이트 5년산  250ml + 메달 프로퓨마토 6년산 Cubic' , 5 , 74700 , 'noimage.jpg' , '100', 'Please insert description');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]화이트 5년산 250ml + 2메달 클라시코 8년산 Cubic 250ml' , 5 , 76500 , 'noimage.jpg' , '100', 'Please insert description');
        
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]12년산 리카르도 주스티 Cubic 250ml x 3구' , 5 , 237000 , 'noimage.jpg' , '100', 'Please insert description');
        
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]15년산 콰르트첸테나리오 Cubic 250ml x 3구' , 5 , 357000 , 'noimage.jpg' , '100', 'Please insert description');

    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]20년산 반다로사 Cubic Cubic 250ml x 3구' , 5 , 441000 , 'noimage.jpg' , '100', 'Please insert description');

    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]8년 숙성 클라시코 Cubic 250ml + 화이트 소스 Cubic 250ml' , 5 , 74000 , 'noimagepng' , '100', 'Please insert description');

    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]2골드메달 8년산 클라시코 + 3골드메달 12년산 리카르도 250mlX2' , 5 , 143000, 'setA.jpg' , '100', 'Please insert description');

    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE, PDISCOUNT, PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, 'DUMMY TO TEST' , 1 , 10000, '20', 'noimage.jpg' , '100', 'Please insert description');


-- ■■■■■ ADMIN TABLE ■■■■■ --

INSERT INTO ADMIN (AID, APW, ANAME)
    VALUES('aaa', '111', 'unie');

-- ■■■■■ LOCATION TABLE ■■■■■ --

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'본점' ,'서울 강남구 압구정로 165');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'목동점' ,'서울 양천구 목동동로 257');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'판교점' ,'경기 성남시 분당구 판교역로146번길 20');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '무역센터점','서울 강남구 테헤란로 517');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '더현대서울(여의도)','서울 영등포구 여의대로 108');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'미아점' ,'서울 성북구 동소문로 315');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'천호점' ,'서울 강동구 천호대로 1005');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '킨텍스점','경기 고양시 일산서구 호수로 817');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '신촌점','서울 서대문구 신촌로 83');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'중동점' ,'경기 부천시 길주로 180');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'충청점','충북 청주시 흥덕구 직지대로 308');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'대구점' ,'대구 중구 달구벌대로 2077');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '울산점','울산 남구 삼산로 261');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '부산점','부산 동구 범일로 125');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '본점','서울 중구 남대문로 81');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '잠실점','서울 송파구 올림픽로 240');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'강남점', '서울 강남구 도곡로 401 롯데백화점');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '동탄점','경기 화성시 동탄역로 160');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '부산본점','부산 부산진구 가야대로 772');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '광복점','부산 중구 중앙대로 2');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'울산점', '울산 남구 삼산로 288');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '광주점','광주 동구 독립로 268');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '건대스타시티점','서울 광진구 능동로 92');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '관악점','서울 관악구 봉천로 209');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'김포공항점', '서울 강서구 하늘길 77');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '노원점','서울 노원구 동일로 1414');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'미아점', '서울 강북구 도봉로 62');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'영등포점', '서울 영등포구 경인로 846');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '청량리점','서울 동대문구 왕산로 214');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'구리점', '경기 구리시 경춘로 261');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '분당점','경기 성남시 분당구 황새울로200번길 45');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '수원점','경기 수원시 권선구 세화로 134');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '안산점','경기 안산시 단원구 고잔1길 12');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '일산점','경기 고양시 일산동구 중앙로 1283');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '중동점','경기 부천시 길주로 300');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '평촌점','경기 안양시 동안구 시민대로 180');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '대구점','대구 북구 태평로 161');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'대전점', '대전 서구 계룡로 598');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '동래점','부산 동래구 중앙대로 1393');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '마산점','경남 창원시 마산합포구 동서동로 18');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '상인점','대구 달서구 월배로 232');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'센텀시티점', '부산 해운대구 센텀남대로 59');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '울산점','울산 남구 삼산로 288');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '전주점','전북 전주시 완산구 온고을로 2');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '창원점','경남 창원시 성산구 중앙대로 124');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '포항점','경북 포항시 북구 학산로 62');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '본점','서울 중구 소공로 63');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '강남점','서울 서초구 신반포로 176');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'광주점', '광주 서구 무진대로 932');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '대구점','대구 동구 동부로 149');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '센텀시티(부산)','부산 해운대구 센텀남대로 35');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '청담','서울 강남구 도산대로 442 피엔폴루스');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'도곡', '서울 강남구 언주로30길 57 타워팰리스');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '본점(명품관)','서울 강남구 압구정로 343');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '한남점(고메이494)','서울 용산구 한남대로 91');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '대전 타임월드점','대전 서구 대덕대로 211');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '분당점','경기 성남시 분당구 황새울로360번길 42');


COMMIT;
