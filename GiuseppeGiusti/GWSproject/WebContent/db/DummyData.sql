

-- ������ GRADE TABLE ������ --

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


-- ������ MEMBER TABLE ������ --

INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MADDRESSDETAIL,MBIRTH ,MEMAIL,MGENDER) 
    VALUES ('id1','111','�̸�1','010-1111-2222','�ּ�1','�ּ�2','2017-08-21','one@one/com','��' ); 

INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MADDRESSDETAIL,MBIRTH ,MEMAIL,MGENDER, MCUMPURCHASE, MGRADE) 
    VALUES ('id2','111','�̸�2','010-1111-2223','�ּ�11','�ּ�22','2000-09-14','two@two.com','��', 0 ,1 ); 
    
INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MADDRESSDETAIL,MBIRTH ,MEMAIL,MGENDER, MCUMPURCHASE, MGRADE) 
    VALUES ('id3','111','�̸�3','010-1111-2224','�ּ�111','�ּ�222','2001-09-08','three@three.com','��', 1100000 ,2 ); 
    
INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MADDRESSDETAIL,MBIRTH ,MEMAIL,MGENDER, MCUMPURCHASE, MGRADE) 
    VALUES ('id4','111','�̸�4','010-1111-2225','�ּ�22','�ּ�33','1995-02-17','four@four.com','��', 4300000 ,3 ); 
    
-- ������ BOARD TABLE ������ --

INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO) 
    VALUES (BOARD_SEQ.NEXTVAL,'id1','�̸�1','����1', NULL, 0, BOARD_SEQ.CURRVAL,0, 0 , 2); 
    
INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO) 
    VALUES (BOARD_SEQ.NEXTVAL,'id2','�̸�2','����2', 'gico.jpg', 23, BOARD_SEQ.CURRVAL,0, 0 , 2); 

INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO) 
    VALUES (BOARD_SEQ.NEXTVAL,'id2','�̸�2','����5', 'gico.jpg', 12, BOARD_SEQ.CURRVAL,0, 0 , 2); 
    
INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT, ONO) 
    VALUES (BOARD_SEQ.NEXTVAL,'id4','�̸�4','����1', 'gico.jpg', 32, BOARD_SEQ.CURRVAL,0, 0 , 2); 
 

-- ������ ORDER TABLE ������ --

INSERT INTO ORDERS (ONO, ONAME, OPHONE, OADDRESS, MID)
    VALUES (ORDERNUM_SEQ.NEXTVAL, '�̸�1', NULL, NULL, 'id1');



-- ������ ORDER_DETAIL TABLE ������ --

INSERT INTO ORDER_DETAIL (ONO, PID, PQUANTITY, PPRICE, TOTCOST, DISCOUNT, PAYAMOUNT)
    VALUES(1, 1 , 2, 20000, 40000, 10,  36000);
    

-- ������ PRODUCT_GROUP TABLE ������ --

    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (1 , 'Ŭ���� �޴� �÷���', '�ֽ�Ƽ�� ���� ��ǥ���� �÷���. �پ��� �����ǿ� ���� ������ ���� ���� �𵥳� �߻�� ���� 5���� �޴� ���� ���� �з��ȴ�.', '01medal.jpg');
    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (2 , 'ȭ��Ʈ �߻�� �÷���', '���� �ӽ�Ʈ�� ���� ���ʷ� ���� ������ ���� ��� �Բ� �ż��ϰ� ������ �߻�� ����.','02white.jpg');
    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (3 , '���⵿ �÷���', '����� �� ���� ������ ����� ���� ������ �߻�� ����.','03organic.jpg');
    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (4 , '�����̾� �÷���', '��ĵ�� �� ���� �� �������� �ý��ۿ� ���� �ּ� 25�� ������ �߻�� ����.','04premium.jpg');
    INSERT INTO PRODUCT_GROUP (PGROUP, PGROUPNAME,PGROUPDESC,PGROUPIMG)
        VALUES (5 , '��Ʈ', 'Giusti ������ �پ��� ǰ���� ���������� ������ ���� ������� �ڽ��� �÷����Դϴ�.', '05sets.jpg');
        
        
-- ������ PRODUCT TABLE ������ --
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '�ǹ��޴� ���� ǻ���� 100ml' , 1 , 19000 , '1.1_silver100.jpg' , '100', 'A delicate Balsamic Vinegar of Modena adaptable for any dish.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '�ǹ��޴� 6��� ���� ǻ���� 250ml' , 1 , 38000 , '1.2_silver250.jpg' , '100', 'A delicate Balsamic Vinegar of Modena adaptable for any dish.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '�ǹ��޴� 6��� ���� ǻ���� Cubic 250ml' , 1 , 38000 , '1.3_silverCubic.jpg' , '100', 'A delicate Balsamic Vinegar of Modena adaptable for any dish.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '2���޴� Ŭ����� 100ml' , 1 , 26000 , '2.1_twoMedal100.jpg' , '100', 'A 100% organic Balsamic Vinegar of Modena, both balanced and perfumed.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '2���޴� 8��� Ŭ����� 250ml' , 1 , 52000 , '2.2_twoMedal250.jpg' , '100', 'A 100% organic Balsamic Vinegar of Modena, both balanced and perfumed.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '2���޴� 8��� Ŭ����� Cubic 250ml' , 1 , 52000 , '2.3_twoMedalCubic.jpg' , '100', 'A 100% organic Balsamic Vinegar of Modena, both balanced and perfumed.');
    
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '3���޴� ��ī���� 100ml' , 1 , 39500 , '3.1_threeMedal100.jpg' , '100', 'A dense, sweet and versatile Balsamic Vinegar of Modena obtained from sundried grapes.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '3���޴� 12��� ��ī���� 250ml' , 1 , 79000 , '3.2_threeMedal250.jpg' , '100', 'A dense, sweet and versatile Balsamic Vinegar of Modena obtained from sundried grapes.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '3���޴� 12��� ��ī���� �ֽ�Ƽ Cubic 250ml ' , 1 , 79000 , '3.3_threeMedalCubic.jpg' , '100', 'A dense, sweet and versatile Balsamic Vinegar of Modena obtained from sundried grapes.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '4���޴� �⸣�� þ�׳����� 100ml' , 1 , 59500 , '4.1_fourMedal100.jpg' , '100', 'An intense, full bodied and extremely thick Balsamic Vinegar of Modena with spicy notes.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '4���޴� 15��� �⸣�� þ�׳����� 250ml' , 1 , 119000 , '4.2_fourMedal250.jpg' , '100', 'An intense, full bodied and extremely thick Balsamic Vinegar of Modena with spicy notes.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '4���޴� 15��� �⸣�� þ�׳����� Cubic 250ml' , 1 , 119000 , '4.3_fourMedalCubic.jpg' , '100', 'An intense, full bodied and extremely thick Balsamic Vinegar of Modena with spicy notes.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '5���޴� �ݴٷλ� 100ml' , 1 , 76500 , '5.1_fiveMedal100.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, '5���޴� 20��� �ݴٷλ� 250ml' , 1 , 147000 , '5.2_fiveMedal250.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '5���޴� 20��� �ݴٷλ� Cubic 250ml' , 1 , 147000 , '5.3_fiveMedalCubic.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, 'ȭ��Ʈ �߻�ͽ��� 250ml' , 2 , 33000 , '01_white250.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION) 
        VALUES (PRODUCT_SEQ.NEXTVAL, 'ȭ��Ʈ �߻�ͽ��� Cubic 250ml' , 2 , 33000 , '02_whiteCubic.jpg' , '100', 'A Condiment with Balsamic Vinegar of Modena of great depth and body, and an unmistakable rich bouquet of aromas.');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '����� 6��� 1�޴� 250ml' , 3 , 43000 , '1.1_Organic1.jpg' , '100', 'Fresh and delicate, obtained with 100% organic raw materials.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '����� 8��� 2�޴� 250ml' , 3 , 58000 , '1.2_Organic2.jpg' , '100', 'Made with organic ingredients; balanced, aromatic and of favorable density.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '����� 12��� 3�޴� 250ml' , 3 , 89000 , '1.3_Organic3.jpg' , '100', '100% Organic, a pleasantly thick and sweet full-bodied balsamic vinegar.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '����� ���� �߻�� ���� 250ml' , 3 , 43000 , '2.1_OrganicPomegranate.jpg' , '100', 'Made exclusively with organic raw materials, a delicate and well-balanced acidic condiment.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '����� ����� �߻�� ���� 250ml' , 3 , 48000 , '2.2_OrganicRaspberry.jpg' , '100', 'Pleasantly fresh, sweet and fruity, made exclusively with 100% organic raw materials.');
    
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '����Ʈ��Ű�� 25��� DOP ���� �߻�ͽ��� 100ml' , 4 , 224000 , '01_premium25.jpg' , '100', 'Aged at least 25 years, according to the traditional system of ��decanter and refill�� through a series of wooden casks.');
    
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET] ȭ��Ʈ 5���  250ml + �޴� ����ǻ���� 6��� Cubic' , 5 , 74700 , 'noimage.jpg' , '100', 'Please insert description');
        
     INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]ȭ��Ʈ 5��� 250ml + 2�޴� Ŭ����� 8��� Cubic 250ml' , 5 , 76500 , 'noimage.jpg' , '100', 'Please insert description');
        
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]12��� ��ī���� �ֽ�Ƽ Cubic 250ml x 3��' , 5 , 237000 , 'noimage.jpg' , '100', 'Please insert description');
        
    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]15��� �⸣Ʈþ�׳����� Cubic 250ml x 3��' , 5 , 357000 , 'noimage.jpg' , '100', 'Please insert description');

    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]20��� �ݴٷλ� Cubic Cubic 250ml x 3��' , 5 , 441000 , 'noimage.jpg' , '100', 'Please insert description');

    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]8�� ���� Ŭ����� Cubic 250ml + ȭ��Ʈ �ҽ� Cubic 250ml' , 5 , 74000 , 'noimagepng' , '100', 'Please insert description');

    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE,PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, '[SET]2���޴� 8��� Ŭ����� + 3���޴� 12��� ��ī���� 250mlX2' , 5 , 143000, 'setA.jpg' , '100', 'Please insert description');

    INSERT INTO PRODUCT (PID,PNAME,PGROUP, PPRICE, PDISCOUNT, PIMAGE, PSTOCK, PDESCRIPTION)
        VALUES (PRODUCT_SEQ.NEXTVAL, 'DUMMY TO TEST' , 1 , 10000, '20', 'noimage.jpg' , '100', 'Please insert description');


-- ������ ADMIN TABLE ������ --

INSERT INTO ADMIN (AID, APW, ANAME)
    VALUES('aaa', '111', 'unie');

-- ������ LOCATION TABLE ������ --

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'����' ,'���� ������ �б����� 165');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'����' ,'���� ��õ�� �񵿵��� 257');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'�Ǳ���' ,'��� ������ �д籸 �Ǳ�����146���� 20');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '����������','���� ������ ������� 517');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�����뼭��(���ǵ�)','���� �������� ���Ǵ�� 108');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'�̾���' ,'���� ���ϱ� ���ҹ��� 315');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'õȣ��' ,'���� ������ õȣ��� 1005');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, 'Ų�ؽ���','��� ���� �ϻ꼭�� ȣ���� 817');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','���� ���빮�� ���̷� 83');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'�ߵ���' ,'��� ��õ�� ���ַ� 180');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'��û��','��� û�ֽ� ����� ������� 308');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'�뱸��' ,'�뱸 �߱� �ޱ������ 2077');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�����','��� ���� ���� 261');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�λ���','�λ� ���� ���Ϸ� 125');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '����','���� �߱� ���빮�� 81');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�����','���� ���ı� �ø��ȷ� 240');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'������', '���� ������ ����� 401 �Ե���ȭ��');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '��ź��','��� ȭ���� ��ź���� 160');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�λ꺻��','�λ� �λ����� ���ߴ�� 772');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','�λ� �߱� �߾Ӵ�� 2');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'�����', '��� ���� ���� 288');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','���� ���� ������ 268');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�Ǵ뽺Ÿ��Ƽ��','���� ������ �ɵ��� 92');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','���� ���Ǳ� ��õ�� 209');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'����������', '���� ������ �ϴñ� 77');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�����','���� ����� ���Ϸ� 1414');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'�̾���', '���� ���ϱ� ������ 62');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'��������', '���� �������� ���η� 846');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, 'û������','���� ���빮�� �ջ�� 214');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'������', '��� ������ ����� 261');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�д���','��� ������ �д籸 Ȳ�����200���� 45');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','��� ������ �Ǽ��� ��ȭ�� 134');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�Ȼ���','��� �Ȼ�� �ܿ��� ����1�� 12');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�ϻ���','��� ���� �ϻ굿�� �߾ӷ� 1283');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�ߵ���','��� ��õ�� ���ַ� 300');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','��� �Ⱦ�� ���ȱ� �ùδ�� 180');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�뱸��','�뱸 �ϱ� ����� 161');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'������', '���� ���� ���� 598');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','�λ� ������ �߾Ӵ�� 1393');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','�泲 â���� ���������� �������� 18');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','�뱸 �޼��� ����� 232');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'���ҽ�Ƽ��', '�λ� �ؿ�뱸 ���ҳ���� 59');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�����','��� ���� ���� 288');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','���� ���ֽ� �ϻ걸 �°����� 2');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, 'â����','�泲 â���� ���걸 �߾Ӵ�� 124');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','��� ���׽� �ϱ� �л�� 62');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '����','���� �߱� �Ұ��� 63');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '������','���� ���ʱ� �Ź����� 176');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'������', '���� ���� ������� 932');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�뱸��','�뱸 ���� ���η� 149');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '���ҽ�Ƽ(�λ�)','�λ� �ؿ�뱸 ���ҳ���� 35');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, 'û��','���� ������ ������ 442 �ǿ����罺');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL,'����', '���� ������ ���ַ�30�� 57 Ÿ���Ӹ���');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '����(��ǰ��)','���� ������ �б����� 343');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�ѳ���(�����494)','���� ��걸 �ѳ���� 91');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '���� Ÿ�ӿ�����','���� ���� ������ 211');

INSERT INTO LOCATION 
VALUES (LOC_SEQ.NEXTVAL, '�д���','��� ������ �д籸 Ȳ�����360���� 42');


COMMIT;
