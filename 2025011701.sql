2025-0117-01)

SELECT PROD_ID, PROD_NAME, PROD_COLOR
  FROM LYS00.PROD
 WHERE PROD_COLOR IS NOT NULL;
 
 SELECT EMPLOYEE_ID AS 회원번호,
        EMP_NAME AS 회원명,
        SALARY AS 기본급,
        NVL(COMMISSION_PCT, 0) AS 영업실적,
        SALARY * NVL(COMMISSION_PCT, 0) * 0.3 AS 보너스,
        SALARY + (SALARY * NVL(COMMISSION_PCT, 0) * 0.3) AS지급액
   FROM HR.EMPLOYEES;
 
사용예) 상품테이블에서 크기가 NULL이 아닌 상품은 크기를 출력하고 NULL인 상품은 0을 출력하시오
       Alias는 상품코드, 상품명, 크기
       
       SELECT PROD_ID AS 상품코드,
              PROD_NAME AS 상품명, 
              NVL(PROD_SIZE, 0) AS 크기
         FROM LYS00.PROD;
 
 **PROD테이블에서 매입일자(PROD_INSDATE)가 2020년 2월 08일인 자료를 찾아
   매입일자를 NULL처리하시오
 
UPDATE LYS00.PROD 
   SET PROD_INSDATE = NULL
 WHERE PROD_INSDATE = TO_DATE('20200208');
 
 COMMIT;
 
사용예) PROD테이블에서 매입일자를 알수 없는
       상품은 매입일자컬럼에 '매입일 불분명'이란 메시지를 출력하시오.
       Alias 는 상품코드, 상품명, 매입일
SELECT PROD_ID AS 상품코드,
       PROD_NAME AS 상품명,
       NVL(TO_CHAR(PROD_INSDATE), '매입일 불분명') AS 매입일
  FROM LYS00.PROD;
 WHERE PROD_INSDATE BETWEEN TO_DATE(20200201) AND LAST_DAY(TO_DATE(20200201));
 
 SELECT NVL(TO_CHAR(COMMISSION_PCT), '없음')
   FROM HR.EMPLOYEES;

사용예) 상품테이블에서 색상정보를 조회하여 색상이 있으면 비고 컬럼에 '색상이 있는 상품'
        색상정보가 없으면 비고 컬럼에 '색상이 없는 상품'을 출력하시오
        Alias는 상품코드, 상품명, 색상 
        
SELECT PROD_ID AS 상품코드,
       PROD_NAME AS 상품명,
       NVL2(PROD_COLOR, '색상이 있는 상품', '색상이 없는 상품') AS 비고
  FROM LYS00.PROD ;
 
 
**상품테이블에서 분류코드 'P301'인 상품의 매출단가를 매입단가로 변경하시오

SELECT PROD_ID, PROD_COST, PROD_PRICE
  FROM LYS00.PROD
 WHERE LPROD_GU = 'P301';
 
UPDATE LYS00.PROD SET PROD_PRICE = PROD_COST
 WHERE LPROD_GU = 'P301';
 
COMMIT;

사용예) 상품테이블에서 매입단가와 매출단가가 같은 상품을 찾아서 비고 난에 '단종예정 상품'을
       출력하시오. 두 단가가 서로 같지 않으면 매입단가를 비고에 출력하시오.
       Alias는 상품코드, 상품명, 매입단가, 매출단가, 비고(매입단가)
       
SELECT PROD_ID AS 상품코드,
       PROD_NAME AS 상품명,
       PROD_COST AS 매입단가,
       PROD_PRICE AS 매출단가, 
       NVL(TO_CHAR(NULLIF(PROD_COST, PROD_PRICE),'99,999,999'),'단종예정 상품') 
       AS "비고(매입단가)"
  FROM LYS00.PROD;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 