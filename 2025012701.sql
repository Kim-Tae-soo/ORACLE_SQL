2025-0127-01)

SELECT * FROM LYS00.REMAIN;

��뿹) ȸ�����̺��� ���ϸ����� 4000�̻��� ȸ������ ȸ����ȣ, ȸ����, ���ϸ����� �並 �����Ͻÿ�
CREATE OR REPLACE VIEW VIEW_VIP AS
    SELECT MEM_ID AS ȸ����ȣ, 
           MEM_NAME AS ȸ����,
           MEM_MILEAGE AS ���ϸ���
      FROM LYS00.MEMBER
     WHERE MEM_MILEAGE >= 4000; 
     
SELECT * FROM VIEW_VIP;

UPDATE VIEW_VIP 
   SET MILEAGE = 3000
 WHERE MID = 'v001';
 
��뿹) MEMBER���̺��� 'v001'ȸ���� ���ϸ����� 6300���� �����Ͻÿ�
UPDATE LYS00.MEMBER 
   SET MEM_MILEAGE = 6300
 WHERE MEM_ID = 'v001';
 
 ��뿹) MEMBER���̺��� 'a002'ȸ������ 'ȫ�浿'ȸ���� �Է��Ͻÿ�
        ȸ����ȣ : 'a002'
        ȸ���� : 'ȫ�浿'
        ��й�ȣ : '12345'
        ���ϸ��� : 9500
        
INSERT INTO LYS00.MEMBER (MEM_ID, MEM_NAME, MEM_PASSWORD, MEM_MILEAGE)
VALUES ('a002', 'ȫ�浿', '12345', 9500);
 
 ��뿹) MEMBER���̺��� 'n001'ȸ���� �����Ͻÿ�
 DELETE FROM MEMBER
  WHERE MEM_ID = 'n001';
 
 ROLLBACK;
 
CREATE OR REPLACE VIEW VIEW_VIP AS
   SELECT MEM_ID, MEM_NAME, MEM_MILEAGE, MEM_PASSWORD
     FROM LYS00.MEMBER
    WHERE MEM_MILEAGE >= 4000
    WITH CHECK OPTION
    WITH READ ONLY;
     -- �б� �������� DML��ɾ ����� �� ����
      
SELECT * FROM VIEW_VIP; 

INSERT INTO VIEW_VIP VALUES ('a004', '�̼���', 4000, '8888');

DELETE FROM MEMBER
 WHERE MEM_ID = 'a003';
 
 
CREATE OR REPLACE VIEW VIEW_VIP AS
   SELECT MEM_ID, MEM_NAME, MEM_MILEAGE, MEM_PASSWORD
     FROM LYS00.MEMBER
    WHERE MEM_MILEAGE >= 4000
    WITH CHECK OPTION;
    
��뿹)��(VIEW_VIP)���� ȫ�浿ȸ��(a002)�� ���ϸ����� 1500���� �����Ͻÿ�

UPDATE VIEW_VIP SET MEM_MILEAGE = 1500
 WHERE MEM_ID = 'a002';
 
��뿹)��(VIEW_VIP)���� Ź����ȸ��(n001)�� ���ϸ����� 5700���� 6000�������� �����Ͻÿ�
UPDATE VIEW_VIP SET MEM_MILEAGE = 6000
 WHERE MEM_ID = 'n001';



DROP VIEW VIEW_VIP;







