2025-0108-02)

- 멀티미디어 자료 저장에 사용
- 오라클은 해석하거나 변환 출력을 제공하지 않음
- RAW, BFILE, BLOB가 제공됨

1) RAW
 - 2000BYTE 까지의 자료저장
 - INDEX처리 가능
 - 16진수나 2진수로 저장
 
    (사용형식)
    컬럼명 RAW(크기)
    
    (사용예)
    CREATE TABLE TEMP07 (
        COL1 RAW(1000),
        COL2 RAW(2000)
    );
    
    INSERT INTO TEMP07 VALUES('0111110000110001','7c31');
    INSERT INTO TEMP07 VALUES('0111110000110001',HEXTORAW('7c31'));
    
    
    SELECT * FROM TEMP07;

2) BFILE
 - 4GB 까지 저장
 - 원본자료는 데이터베이스 밖의 별도의 폴더(디렉토리)에 저장하고 테이블에는 절대경로만 저장
 - 경로 객체(DIRECTORY 객체)가 필요
   
   CREATE OR REPLACE DIRECTORY 객체명 AS '절대경로명';
    
 - 자주 변경되는 자료 저장에 유리
    사용형식)
    컴럼명 BFILE
        
    사용예) 그림 저장
        1) 테이블 생성
        2) 그림파일 저장
        3) 경로객체 생성
        4) 저장
    
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
 - 4GB까지 데이터 저장
 - 원본자료를 테이블 안에 저장
 - 저장을 위한 모듈(프로시져 또는 블록)이 필요
 - 변경이 많이 발생되지 않는 자료처리에 적합
 
    사용형식)
    컬럼명 BLOB
    
    사용예)
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

실행)

EXECUTE BLOB_INSERT('sample.jpg');



