사용예) HR계정에 모든 사원들의 입사일을 5년 뒤로 갱신하시오

CREATE OR REPLACE VIEW V_EMP AS
    SELECT EMPLOYEE_ID, EMP_NAME, HIRE_DATE
      FROM HR.EMPLOYEES
      WITH READ ONLY;
      
UPDATE EMPLOYEES
   SET HIRE_DATE = ADD_MONTHS(HIRE_DATE, 24);

COMMIT;

SELECT A.EMPLOYEE_ID, A.EMP_NAME, A.HIRE_DATE, B.HIRE_DATE
  FROM EMPLOYEES A, V_EMP B
 WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID;
 
 SELECT * FROM EMPLOYEES
 AS OF TIMESTAMP TO_TIMESTAMP('2025/01/15 15:30:00 ', 'YYYY/MM/DD HH24:MI:SS');
 
 SELECT NEXT_DAY(SYSDATE, '목요일') FROM DUAL;
 
 사용예) 장바구니테이블에서 2020년 2월 제품별 매입정보를 조회하시오
        Alias는 상품번호, 상품명, 매입수량, 매입단가, 매입금액
        
SELECT A.PROD_ID AS 상품번호, 
       B.PROD_NAME AS 상품명, 
       SUM(A.BUY_QTY) AS 매입수량, 
       SUM(B.PROD_COST * A.BUY_QTY) AS 매입금액
  FROM LYS00.BUYPROD A, LYS00.PROD B
 WHERE A.PROD_ID = B.PROD_ID
   AND A.BUY_DATE BETWEEN TO_DATE('20200201') AND LAST_DAY(TO_DATE('20200201'))
 GROUP BY A.PROD_ID, B.PROD_NAME;
 
 사용예) 장바구니 테이블에서 2020년 5월과 7월에 판매된 정보를 출력하시오
    (일자, 상품번호, 수량이며 날짜순으로 출력할 것)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 