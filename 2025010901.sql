2025-0109-01) ���̺� �������
 - DROP TABLE ��� ���
 (��� ����)
  DROP TABLE ���̺��
  . ���谡 ������ ��� �ڽ����̺���� ����
  . ���踦 ������ �� ���̺� ������ ������ ����
  
��뿹)
    DROP TABLE TEMP01;
    DROP TABLE TEMP02;
    DROP TABLE TEMP03;
    DROP TABLE TEMP04;
    DROP TABLE TEMP05;
    DROP TABLE TEMP06;
    DROP TABLE TEMP07;
    DROP TABLE TEMP08;
    DROP TABLE TEMP09;
    
    DROP TABLE ORDERS; 
    -- ��������
    ALTER TABLE ORDER_GOODS DROP CONSTRAINT FK_ORDER_ORDERS;
    ALTER TABLE ORDER_GOODS DROP CONSTRAINT FK_ORDER_GOODS;
    
    DROP TABLE GOODS;
    DROP TABLE ORDER_GOODS;
    DROP TABLE ORDERS;
    DROP TABLE CUST;