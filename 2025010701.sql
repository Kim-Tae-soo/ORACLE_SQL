2025-0107-01)���ڵ����� Ÿ��
    - �������� : char
    - �������� : VARCHAR, VARCHAR2, LONG, CLOB
    
1. CHAR
- �������� 2000BYTE ���� ����
- �������)
    �÷��� CHAR(ũ��[byte, char])
- ��뿹)
    CREATE TABLE TEMP01(
        COL1 CHAR(20),
        COL2 CHAR(20 BYTE),
        COL3 CHAR(20 CHAR)
    );
    
    INSERT INTO TEMP01(COL1,COL2,COL3) VALUES('������','�߱�','��ε�');
    
    SELECT * FROM TEMP01;
    
    SELECT  LENGTHB(COL1),
            LENGTHB(COL2),
            LENGTHB(COL3)
    FROM TEMP01;        
    
2. VARCHAR2
- �������� 4000BYTE ���� ����
�������)
    �÷��� VARCHAR2(ũ��[BYTE, CHAR]);
    
CREATE TABLE TEMP02(
    COL1 VARCHAR2 (20),
    COL2 VARCHAR2 (4000BYTE),
    COL3 VARCHAR2 (200 CHAR)
);    
    
ALTER TABLE TEMP02 MODIFY (COL3 VARCHAR2(200 CHAR));   

INSERT INTO TEMP02 VALUES ('ȫ�浿', '������ �߱� ���� 846', '(��)������簳�߿�');
INSERT INTO TEMP02 VALUES ('Ʈ���̽�', 'IL POSTINO', '����Ŭ ��������');

SELECT  *
FROM    TEMP02;    

3. LONG
- �������� 2GB ���� ����
�������)
    �÷��� LONG
    �����̺� �ϳ��� LONG �÷��� ��밡��
    �����̳� �������� ��ȯ�ϴ� �Լ��� ����� �� ����
    ��ɰ����� ����Ǿ��� => CLOB�� ��ġ
    
��뿹)
CREATE TABLE TEMP03(
    COL1 VARCHAR2(4000),
    COL2 LONG
);    

INSERT INTO TEMP03 VALUES('������ �߱� ����846', '������ �߱� ����846');

SELECT * FROM TEMP03;

SELECT  LENGTHB(COL1),
        SUBSTR(COL1, 1, 5)
FROM TEMP03;

4. CLOB
- �������� 4GB ���� ����

- LONG Ÿ���� ������ ������ Ÿ��
- �����̺� �������� CLOB �÷��� ���� �� ����
- �Ϻ� ����� DBMS_LOB API���� �����ϴ� �Լ��� ���

CREATE TABLE TEMP04(
    COL1 VARCHAR2(4000),
    COL2 LONG,
    COL3 CLOB,
    COL4 CLOB);

INSERT INTO TEMP04(COL3, COL4) VALUES ('������ �߱� ����846', '������ �߱� ����846');

SELECT * FROM TEMP04;

SELECT SUBSTR(COL3, 1, 5) FROM TEMP04;

SELECT 
    LENGTH(COL3) as COL1,
    DBMS_LOB.GETLENGTH(COL3) as COL2,
    SUBSTR(COL3, 1, 5) as COL3,
    DBMS_LOB.SUBSTR(COL3, 5, 1) as COL4
FROM TEMP04;










