2025-0108-04) ALTER ���
 - ���̺��� ������� �̸�����(���̺�, �÷�), �÷�����, �߰�, ����, �������� ����, �߰�
   ���� �۾� ����
1) ���̺�� ����
    ALTER TABLE old_table_name RENAME TO new_table_name;
    
��뿹) customers���̺��� cust�� �����Ͻÿ�
    ALTER TABLE customers RENAME TO cust;
    
2) �÷��̸� ����
    ALTER TABLE ���̺�� RENAME COLUMN old_�÷��� TO new_�÷���;
    
��뿹) goods���̺��� gid�÷��� goods_id�� �����Ͻÿ�
    ALTER TABLE goods RENAME COLUMN gid TO goods_id;
    
3) �÷��� �߰�, ����, ����
    ALTER TABLE ���̺�� ADD|MODIFY (�÷��� ������Ÿ��[ũ��] [NOT NULL] [DEFAULT ��])
    ALTER TABLE ���̺�� DROP COLUMN �÷���;
    
��뿹) HR������ EMPLOYEES���̺� EMP_NAME �÷��� �߰��Ͻÿ�
ALTER TABLE HR.EMPLOYEES ADD EMP_NAME VARCHAR2(50);