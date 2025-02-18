2025-0109-02) DML(Data Manupulation Language : 데이터 조작어)
 - INSERT, UPDATE, DELETE, SELECT, MERGE
 
1. INSERT 명령어
 - 데이터 입력명령
 - 해당자료가 원본테이블에 존재해서는 안됨
 
사용형식)
 INSERT INTO 테이블명[( 컬럼명, ... )] VALUES (값, ...);
 . '테이블명[( 컬럼명, ... )]' : '(컬럼명, ...)'이 생략되면 테이블의 모든 컬럼에 
   저장될 데이터를 VALUES 절에 기술해야한다.(갯수 및 순서가 일치해야함)
 . '테이블명[( 컬럼명, ... )]' : '컬럼명'의 기술순서는 테이블의 구성순서와 동일하지
   않아도 되며 VALUES절에 기술되는 데이터는 '컬럼명'의 기술순서와 일치해야함
 . '테이블명[( 컬럼명, ... )]' : 테이블 생성시 컬럼에 NOT NULL제약조건을 사용한 경우
   생략할 수 없다.
   
사용예)다음자료를 각 테이블에 저장하시오
1. 상품테이블
-------------------------------------
  상품코드        상품명         단가
-------------------------------------
  P101          신라면컵        1500
  P102          레쓰비          700
  P201          애플팬슬1      120000
  P202          마우스         50000

-------------------------------------------------
  주문번호       회원번호    상품번호     주문수량
-------------------------------------------------
 202501090001   a002       P101         3
 202501090001   a002       P102         10
 202501090002   a001       P101         1
 202501090002   a001       P201         1
 202501090002   a001       P202         2
 
INSERT INTO PRODUCTS(PROD_ID, PROD_NAME) VALUES('P101', '신라면컵');
INSERT INTO PRODUCTS VALUES('P102', '레스비', 700);
INSERT INTO PRODUCTS VALUES('P201', '애플팬슬1', 120000);
INSERT INTO PRODUCTS VALUES('P202', '마우스', 0);

UPDATE PRODUCTS
SET PROD_PRICE = 1300
WHERE PROD_ID = 'P101';

UPDATE PRODUCTS
SET PROD_PRICE = 10000
WHERE PROD_ID = 'P202';

INSERT INTO CUST VALUES('a001', '홍길동', '대전시 중구 계룡로846');
INSERT INTO CUST VALUES('a002', '이민우', '청주시 서원구 복대동 555');
INSERT INTO CUST(CUST_ID, CUST_NAME) VALUES('a003', '강감찬');

INSERT INTO ORDERS VALUES('202501090001', 10900, 'a002');
INSERT INTO ORDERS VALUES('202501090002', 141300, 'a001');

INSERT INTO ORDER_PROD VALUES('P101', '202501090001', 3);
INSERT INTO ORDER_PROD VALUES('P102', '202501090001', 10);
INSERT INTO ORDER_PROD VALUES('P101', '202501090002', 1);
INSERT INTO ORDER_PROD VALUES('P201', '202501090002', 1);
INSERT INTO ORDER_PROD VALUES('P202', '202501090002', 2);

SELECT  O.ORDER_NUM AS 주문번호,
        O.CUST_ID AS 회원번호,
        P.PROD_ID AS 상품번호,
        P.ORDER_QTY AS 주문수량
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

2. UPDATE 명령
 - 컬럼의 값을 변경할 때 사용
사용형식)
UPDATE 테이블명
    SET 컬럼명=값
        컬럼명=값
           :
        컬럼명=값
    [WHERE 조건];

 UPDATE 테이블명
    SET (컬럼명, 컬럼명, ...) = (값, 값, ...)
    [WHERE 조건];
    
사용예) 상품테이블에서 'P101'상품의 가격을 1300으로 저장

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


사용예) HR계정의 EMP_NAME컬럼에 FIRST_NAME과 LAST_NAME의 값을 결합하여 저장하는 쿼리를 작성하시오
        문자열 결합 : '||'연산자(JAVA의 STRING CLASS의 '+'연산자와 동일)
        EMP_NAME = FIRST_NAME||' '||LAST_NAME;
        
 UPDATE HR.EMPLOYEES 
    SET EMP_NAME = FIRST_NAME||' '||LAST_NAME;        
    
SELECT FIRST_NAME, LAST_NAME, EMP_NAME
FROM HR.EMPLOYEES;

COMMIT;