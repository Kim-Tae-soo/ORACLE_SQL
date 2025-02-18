SELECT E.EMPLOYEE_ID AS 사원번호,
       E.EMP_NAME AS 사원명,
       E.DEPARTMENT_ID AS 부서번호,
       D.DEPARTMENT_NAME AS 부서명,
       L.STREET_ADDRESS||' '||L.CITY||' '||L.STATE_PROVINCE||' '||C.COUNTRY_NAME AS 주소
  FROM HR.EMPLOYEES E
  JOIN HR.DEPARTMENTS D ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
  JOIN HR.LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
  JOIN HR.COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID AND C.COUNTRY_ID != 'US')
 ORDER BY 3;
 
 2025-0121-01)      
 SELECT COUNT(*)
   FROM HR.DEPARTMENTS;
SELECT COUNT(*)
  FROM HR.EMPLOYEES;
  
사용예) 모든 분류별 상품의 수를 조회하시오
        분류코드, 분류명, 상품의 수
        
SELECT B.LPROD_GU AS 분류코드,
       B.LPROD_NAME AS 분류명,
       COUNT(A.PROD_ID) AS "상품의 수"
  FROM LYS00.PROD A, LYS00.LPROD B
 WHERE A.LPROD_GU(+) = B.LPROD_GU
 GROUP BY B.LPROD_GU, B.LPROD_NAME
 ORDER BY 1;
 
 SELECT B.LPROD_GU AS 분류코드,
       B.LPROD_NAME AS 분류명,
       COUNT(A.PROD_ID) AS "상품의 수"
  FROM LYS00.PROD A 
 RIGHT JOIN LYS00.LPROD B ON A.LPROD_GU = B.LPROD_GU
 GROUP BY B.LPROD_GU, B.LPROD_NAME
 ORDER BY 1;
  
사용예)
    2020년 모든 회원별 구매금액 합계를 구하시오
    Alias 회원번호, 회원명, 구매금액합계
    
SELECT A.MEM_ID AS 회원번호,
       A.MEM_NAME AS 회원명, 
       SUM(C.PROD_PRICE * B.CART_QTY) AS 구매금액합계
  FROM LYS00.MEMBER A
  LEFT JOIN LYS00.CART B ON (A.MEM_ID = B.MEM_ID)
  LEFT JOIN LYS00.PROD C ON (B.PROD_ID = C.PROD_ID AND SUBSTR(B.CART_NO,1, 4) = '2020')
 GROUP BY A.MEM_ID, A.MEM_NAME
 ORDER BY 1;
 
 
SELECT A.MEM_ID AS AMID,
       SUM(A.CART_QTY * PROD_PRICE) AS 구매금액합계
  FROM LYS00.CART A, LYS00.PROD B
 WHERE A.CART_NO LIKE '2020%'
   AND A.PROD_ID = B.PROD_ID
 GROUP BY A.MEM_ID;
 
SELECT M.MEM_ID AS 회원번호,
       M.MEM_NAME AS 회원명,
       NVL(C.ASUM, 0) AS 구매금액합계
  FROM LYS00.MEMBER M, 
        (SELECT A.MEM_ID AS AMID,
                SUM(A.CART_QTY * PROD_PRICE) AS ASUM
                FROM LYS00.CART A, LYS00.PROD B
          WHERE A.CART_NO LIKE '2020%'
            AND A.PROD_ID=B.PROD_ID
          GROUP BY A.MEM_ID) C
 WHERE C.AMID(+) = M.MEM_ID;

[[재고수불테이블]]
테이블명 : REMAIN
-----------------------------------------------------------------------
컬럼명         타입                N.N      DEFAULT             PK/FK
-----------------------------------------------------------------------
REMAIN_YEAR   CHAR(4)                                           PK
PROD_ID       VARCHAR2(10)                                     PK&FK
REMAIN_J_00   NUMBER(5)
REMAIN_I      NUMBER(5)                       0
REMAIN_O      NUMBER(5)                       0
REMAIN_J_99   NUMBER(5)                       0
REMAIN_DATE   DATE                         SYSDATE
-----------------------------------------------------------------------
** REMAIN테이블에 다음자료를 입력하시오
    년도 : 2020
 상품코드 : PROD테이블의 상품코드
 기초재고 : PROD테이블의 PROD_PROOERSTOCK 컬럼값
 매입/매출 수량은 0
 현재고량 : PROD테이블의 PROD_PROOERSTOCK 컬럼값
    날짜 : 2020년 1월 1일

사용예)
2020년 모든 상품별 매입수량합계와 매출수량합계를 조회하시오
INSERT INTO REMAIN (REMAIN_YEAR, PROD_ID, REMAIN_J_00, REMAIN_J_99,REMAIN_DATE)
SELECT '2020' , PROD_ID, PROD_PROPERSTOCK, PROD_PROPERSTOCK, TO_DATE('20200101')
FROM LYS00.PROD;

SELECT * FROM REMAIN;

COMMIT;
  
사용예) 2020년 1월-6월까지 모든 상품별 매입수량합계와 매출수량 합계를 조회하시오

INSERT INTO REMAIN(REMAIN_J_99, REMAIN_DATE)
SELECT PROD_PROPERSTOCK, TO_DATE('20200101')
FROM LYS00.PROD;

UPDATE REMAIN SET REMAIN_J_99 = SELECT REMAIN_J_00 FROM REMAIN;

DELETE FROM REMAIN;
  
2020년 6월 - 7월 매출
SELECT A.PROD_ID AS 상품번호,
       SUM(C.CART_QTY) AS 매출수량합계
  FROM LYS00.PROD A, LYS00.CART C
 WHERE A.PROD_ID = C.PROD_ID
   AND SUBSTR(C.CART_NO,1, 6) BETWEEN '202006' AND '202007'
 GROUP BY A.PROD_ID
 ORDER BY 1;
 
 사용예) 2020년 6월-7월까지 모든 상품별 매입수량합계와 매출수량 합계를 조회하시오
 SELECT A.PROD_ID AS 상품번호,
        NVL(SUM(B.BUY_QTY), 0) AS 매입매출합계,
        NVL(SUM(C.CART_QTY), 0) AS 매출수량합계
  FROM LYS00.PROD A
  LEFT JOIN LYS00.BUYPROD B ON (A.PROD_ID = B.PROD_ID AND
       B.BUY_DATE BETWEEN TO_DATE('20200601') AND TO_DATE('20200731'))
  LEFT JOIN LYS00.CART C ON (A.PROD_ID = C.PROD_ID AND
       SUBSTR(C.CART_NO,1, 6) BETWEEN '202006' AND '202007')
 GROUP BY A.PROD_ID
 ORDER BY 1;
  
(SUBQUERY)
SELECT 상품번호, 매입수량합계, 매출수량합계
  FROM LYS00.PROD A,
       (2020년 6월~7월까지 상품별 매입수량 합계 : 내부조인) B
       (2020년 6월~7월까지 상품별 매출수량합계 : 내부조인) C
 WHERE A.PROD_ID = B.PROD_ID(+)
   AND A.PROD_ID = C.PROD_ID(+)
 ORDER BY 1;
 
2020년 6월~7월까지 상품별 매입수량 합계 : 내부조인
 SELECT PROD_ID, 
        SUM(BUY_QTY) AS BSUM
   FROM LYS00.BUYPROD
  WHERE BUY_DATE BETWEEN TO_DATE('20200601') AND TO_DATE('20200731')
  GROUP BY PROD_ID;
  
2020년 6월~7월까지 상품별 매출수량합계 : 내부조인
 SELECT PROD_ID, 
        SUM(CART_QTY) AS CSUM
   FROM LYS00.CART
  WHERE SUBSTR(CART_NO,1, 6) BETWEEN '202006' AND '202007'
  GROUP BY PROD_ID;
  
  
SELECT A.PROD_ID AS 상품번호,
       NVL(B.BSUM, 0) AS 매입수량합계,
       NVL(C.CSUM, 0) AS 매출수량합계
  FROM LYS00.PROD A,
       (SELECT PROD_ID, 
               SUM(BUY_QTY) AS BSUM
          FROM LYS00.BUYPROD
         WHERE BUY_DATE BETWEEN TO_DATE('20200601') AND TO_DATE('20200731')
         GROUP BY PROD_ID) B,
       (SELECT PROD_ID, 
               SUM(CART_QTY) AS CSUM
          FROM LYS00.CART
         WHERE SUBSTR(CART_NO,1, 6) BETWEEN '202006' AND '202007'
         GROUP BY PROD_ID) C
 WHERE A.PROD_ID = B.PROD_ID(+)
   AND A.PROD_ID = C.PROD_ID(+)
 ORDER BY 1;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  