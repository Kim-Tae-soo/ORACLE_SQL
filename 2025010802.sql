2025-0108-02)

- ��Ƽ�̵�� �ڷ� ���忡 ���
- ����Ŭ�� �ؼ��ϰų� ��ȯ ����� �������� ����
- RAW, BFILE, BLOB�� ������

1) RAW
 - 2000BYTE ������ �ڷ�����
 - INDEXó�� ����
 - 16������ 2������ ����
 
    (�������)
    �÷��� RAW(ũ��)
    
    (��뿹)
    CREATE TABLE TEMP07 (
        COL1 RAW(1000),
        COL2 RAW(2000)
    );
    
    INSERT INTO TEMP07 VALUES('0111110000110001','7c31');
    INSERT INTO TEMP07 VALUES('0111110000110001',HEXTORAW('7c31'));
    
    
    SELECT * FROM TEMP07;

2) BFILE
 - 4GB ���� ����
 - �����ڷ�� �����ͺ��̽� ���� ������ ����(���丮)�� �����ϰ� ���̺��� �����θ� ����
 - ��� ��ü(DIRECTORY ��ü)�� �ʿ�
   
   CREATE OR REPLACE DIRECTORY ��ü�� AS '�����θ�';
    
 - ���� ����Ǵ� �ڷ� ���忡 ����
    �������)
    �ķ��� BFILE
        
    ��뿹) �׸� ����
        1) ���̺� ����
        2) �׸����� ����
        3) ��ΰ�ü ����
        4) ����
    
    1)
    CREATE TABLE TEMP08(
        COL1 BFILE
    );
    
    3)
    CREATE OR REPLACE DIRECTORY MY_DIR AS '"D:\A_TeachingMaterial\02_Oracle\work';
    
    4)
    INSERT INTO TEMP08 VALUES(BFILENAME('MY_DIR','sample.jpg'));
    
    select * from temp08;

3) BLOB (Binary Large object)
 - 4GB���� ������ ����
 - �����ڷḦ ���̺� �ȿ� ����
 - ������ ���� ���(���ν��� �Ǵ� ���)�� �ʿ�
 - ������ ���� �߻����� �ʴ� �ڷ�ó���� ����
 
    �������)
    �÷��� BLOB
    
    ��뿹)
    CREATE TABLE TEMP09(
        NO NUMBER,
        IMG_FILE BLOB
    );
    
    CREATE SEQUENCE SEQ_LOB START WITH 1;
        
CREATE OR REPLACE PROCEDURE BLOB_INSERT(
    V_FILENAME IN VARCHAR2)
  IS
    V_LOCATOR_BLOB  BLOB;
    V_SOURCE_DATA_FILE  BFILE:=BFILENAME('MY_DIR',V_FILENAME);
    V_DEST_OFFSET  NUMBER:=1;
    V_SRC_OFFSET  NUMBER:=1;
  BEGIN
    INSERT INTO TEMP09(NO,IMG_FILE) VALUES(SEQ_LOB.NEXTVAL, EMPTY_BLOB())
       RETURNING IMG_FILE  INTO  V_LOCATOR_BLOB;
       
    DBMS_LOB.OPEN(V_SOURCE_DATA_FILE,DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADBLOBFROMFILE(V_LOCATOR_BLOB,
                              V_SOURCE_DATA_FILE,
                              DBMS_LOB.GETLENGTH(V_SOURCE_DATA_FILE),
                              V_DEST_OFFSET,
                              V_SRC_OFFSET);
    DBMS_LOB.CLOSE(V_SOURCE_DATA_FILE);
    COMMIT;
  END;

����)

EXECUTE BLOB_INSERT('sample.jpg');



