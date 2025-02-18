2025-0107-01)문자데이터 타입
    - 고정길이 : char
    - 가변길이 : VARCHAR, VARCHAR2, LONG, CLOB
    
1. CHAR
- 고정길이 2000BYTE 까지 저장
- 사용형식)
    컬럼명 CHAR(크기[byte, char])
- 사용예)
    CREATE TABLE TEMP01(
        COL1 CHAR(20),
        COL2 CHAR(20 BYTE),
        COL3 CHAR(20 CHAR)
    );
    
    INSERT INTO TEMP01(COL1,COL2,COL3) VALUES('대전시','중구','용두동');
    
    SELECT * FROM TEMP01;
    
    SELECT  LENGTHB(COL1),
            LENGTHB(COL2),
            LENGTHB(COL3)
    FROM TEMP01;        
    
2. VARCHAR2
- 가변길이 4000BYTE 까지 저장
사용형식)
    컬럼명 VARCHAR2(크기[BYTE, CHAR]);
    
CREATE TABLE TEMP02(
    COL1 VARCHAR2 (20),
    COL2 VARCHAR2 (4000BYTE),
    COL3 VARCHAR2 (200 CHAR)
);    
    
ALTER TABLE TEMP02 MODIFY (COL3 VARCHAR2(200 CHAR));   

INSERT INTO TEMP02 VALUES ('홍길동', '대전시 중구 계룡로 846', '(재)대덕인재개발원');
INSERT INTO TEMP02 VALUES ('트로이시', 'IL POSTINO', '마이클 래드포드');

SELECT  *
FROM    TEMP02;    

3. LONG
- 가변길이 2GB 까지 저장
사용형식)
    컬럼명 LONG
    한테이블에 하나의 LONG 컬럼만 사용가능
    순번이나 갯수등을 반환하는 함수를 사용할 수 없다
    기능개선이 종료되었다 => CLOB로 대치
    
사용예)
CREATE TABLE TEMP03(
    COL1 VARCHAR2(4000),
    COL2 LONG
);    

INSERT INTO TEMP03 VALUES('대전시 중구 계룡로846', '대전시 중구 계룡로846');

SELECT * FROM TEMP03;

SELECT  LENGTHB(COL1),
        SUBSTR(COL1, 1, 5)
FROM TEMP03;

4. CLOB
- 가변길이 4GB 까지 저장

- LONG 타입을 개선한 데이터 타입
- 한테이블에 복수개의 CLOB 컬럼이 사용될 수 있음
- 일부 기능은 DBMS_LOB API에서 제공하는 함수를 사용

CREATE TABLE TEMP04(
    COL1 VARCHAR2(4000),
    COL2 LONG,
    COL3 CLOB,
    COL4 CLOB);

INSERT INTO TEMP04(COL3, COL4) VALUES ('대전시 중구 계룡로846', '대전시 중구 계룡로846');

SELECT * FROM TEMP04;

SELECT SUBSTR(COL3, 1, 5) FROM TEMP04;

SELECT 
    LENGTH(COL3) as COL1,
    DBMS_LOB.GETLENGTH(COL3) as COL2,
    SUBSTR(COL3, 1, 5) as COL3,
    DBMS_LOB.SUBSTR(COL3, 5, 1) as COL4
FROM TEMP04;










