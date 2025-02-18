2025-0109-02) DML(Data Manupulation Language : ������ ���۾�)
 - INSERT, UPDATE, DELETE, SELECT, MERGE
 
1. INSERT ��ɾ�
 - ������ �Է¸��
 - �ش��ڷᰡ �������̺� �����ؼ��� �ȵ�
 
�������)
 INSERT INTO ���̺��[( �÷���, ... )] VALUES (��, ...);
 . '���̺��[( �÷���, ... )]' : '(�÷���, ...)'�� �����Ǹ� ���̺��� ��� �÷��� 
   ����� �����͸� VALUES ���� ����ؾ��Ѵ�.(���� �� ������ ��ġ�ؾ���)
 . '���̺��[( �÷���, ... )]' : '�÷���'�� ��������� ���̺��� ���������� ��������
   �ʾƵ� �Ǹ� VALUES���� ����Ǵ� �����ʹ� '�÷���'�� ��������� ��ġ�ؾ���
 . '���̺��[( �÷���, ... )]' : ���̺� ������ �÷��� NOT NULL���������� ����� ���
   ������ �� ����.
   
��뿹)�����ڷḦ �� ���̺� �����Ͻÿ�
1. ��ǰ���̺�
-------------------------------------
  ��ǰ�ڵ�        ��ǰ��         �ܰ�
-------------------------------------
  P101          �Ŷ����        1500
  P102          ������          700
  P201          �����ҽ�1      120000
  P202          ���콺         50000

-------------------------------------------------
  �ֹ���ȣ       ȸ����ȣ    ��ǰ��ȣ     �ֹ�����
-------------------------------------------------
 202501090001   a002       P101         3
 202501090001   a002       P102         10
 202501090002   a001       P101         1
 202501090002   a001       P201         1
 202501090002   a001       P202         2
 
INSERT INTO PRODUCTS(PROD_ID, PROD_NAME) VALUES('P101', '�Ŷ����');
INSERT INTO PRODUCTS VALUES('P102', '������', 700);
INSERT INTO PRODUCTS VALUES('P201', '�����ҽ�1', 120000);
INSERT INTO PRODUCTS VALUES('P202', '���콺', 0);

UPDATE PRODUCTS
SET PROD_PRICE = 1300
WHERE PROD_ID = 'P101';

UPDATE PRODUCTS
SET PROD_PRICE = 10000
WHERE PROD_ID = 'P202';

INSERT INTO CUST VALUES('a001', 'ȫ�浿', '������ �߱� ����846');
INSERT INTO CUST VALUES('a002', '�̹ο�', 'û�ֽ� ������ ���뵿 555');
INSERT INTO CUST(CUST_ID, CUST_NAME) VALUES('a003', '������');

INSERT INTO ORDERS VALUES('202501090001', 10900, 'a002');
INSERT INTO ORDERS VALUES('202501090002', 141300, 'a001');

INSERT INTO ORDER_PROD VALUES('P101', '202501090001', 3);
INSERT INTO ORDER_PROD VALUES('P102', '202501090001', 10);
INSERT INTO ORDER_PROD VALUES('P101', '202501090002', 1);
INSERT INTO ORDER_PROD VALUES('P201', '202501090002', 1);
INSERT INTO ORDER_PROD VALUES('P202', '202501090002', 2);

SELECT  O.ORDER_NUM AS �ֹ���ȣ,
        O.CUST_ID AS ȸ����ȣ,
        P.PROD_ID AS ��ǰ��ȣ,
        P.ORDER_QTY AS �ֹ�����
FROM ORDERS O
JOIN ORDER_PROD P
ON O.ORDER_NUM = P.ORDER_NUM;

UPDATE ORDERS SET ORDER_AMT = 11500
WHERE ORDER_NUM = '202501090001';

SELECT P.PROD_ID 
FROM ORDERS O
JOIN ORDER_PROD P
ON O.ORDER_NUM = O.ORDER_NUM 
WHERE O.CUST_ID = 'a002';

2. UPDATE ���
 - �÷��� ���� ������ �� ���
�������)
UPDATE ���̺��
    SET �÷���=��
        �÷���=��
           :
        �÷���=��
    [WHERE ����];

 UPDATE ���̺��
    SET (�÷���, �÷���, ...) = (��, ��, ...)
    [WHERE ����];
    
��뿹) ��ǰ���̺��� 'P101'��ǰ�� ������ 1300���� ����

 UPDATE PRODUCTS
    SET PROD_PRICE = 1300
  WHERE PROD_ID = 'P101';
  
  UPDATE PRODUCTS
  SET PROD_PRICE = 10000
  WHERE PROD_ID = 'P202';
  
  UPDATE ORDERS
  SET ORDER_AMT = 141500
  WHERE CUST_ID = 'a002';

SELECT * FROM PRODUCTS;

COMMIT;


��뿹) HR������ EMP_NAME�÷��� FIRST_NAME�� LAST_NAME�� ���� �����Ͽ� �����ϴ� ������ �ۼ��Ͻÿ�
        ���ڿ� ���� : '||'������(JAVA�� STRING CLASS�� '+'�����ڿ� ����)
        EMP_NAME = FIRST_NAME||' '||LAST_NAME;
        
 UPDATE HR.EMPLOYEES 
    SET EMP_NAME = FIRST_NAME||' '||LAST_NAME;        
    
SELECT FIRST_NAME, LAST_NAME, EMP_NAME
FROM HR.EMPLOYEES;

COMMIT;