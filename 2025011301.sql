SELECT EMPLOYEE_ID AS 사원번호,
       EMP_NAME AS 사원명,
       DEPARTMENT_ID AS 부서코드,
       SALARY AS 기본급,
       NVL(ROUND(SALARY * COMMISSION_PCT), 0) AS 보너스,
       SALARY + NVL(ROUND(SALARY * COMMISSION_PCT), 0) AS 지급액
  FROM HR.EMPLOYEES
 ORDER BY 3;
 
 
 SELECT BUY_DATE AS 매입날짜,
       PROD_ID AS 상품번호,
       BUY_QTY AS 매입수량
  FROM LYS00.BUYPROD
 WHERE BUY_DATE >= TO_DATE('20200601') AND BUY_DATE <= TO_DATE('20200630')
 ORDER BY 1;
 
 SELECT * FROM LYS00.MEMBER
  WHERE MEM_ID NOT IN 
    (SELECT DISTINCT MEM_ID
       FROM LYS00.CART);
       
SELECT DISTINCT (TRUNC((EXTRACT (YEAR FROM SYSDATE) - EXTRACT(YEAR FROM MEM_BIR))/10))
FROM LYS00.MEMBER;

SELECT MEM_ID AS 회원번호,
			 MEM_NAME AS 회원명,
			 MEM_ADD1 || ' ' || MEM_ADD2 AS 주소
	FROM LYS00.MEMBER
 WHERE MEM_ADD1 LIKE '대전%';

--SELECT PROD_ID AS 상품번호,
--       PROD_NAME AS 상품명,
--       PROD_PRICE AS 판매가격
--  FROM LYS00.PROD
-- WHERE PROD_PRICE >= 1000000
-- ORDER BY 3 DESC;
-- 
-- 
--SELECT MEM_ID AS 회원번호,
--       MEM_NAME AS 회원명,
--       MEM_JOB AS 직업,
--       MEM_MILEAGE AS 마일리지
--  FROM LYS00.MEMBER
-- WHERE MEM_MILEAGE < 2000
-- ORDER BY 4;
-- 
--SELECT MEM_ID AS 주소,
--       MEM_NAME AS 회원명,
--       MEM_ADD1 || ' ' || MEM_ADD2 AS 주소
--  FROM LYS00.MEMBER
-- WHERE MEM_ADD1 LIKE '서울%';

ACCEPT P_YEAR PROMPT '년도 입력(YYYY) : '
DECLARE
    L_YEAR NUMBER := &P_YEAR;
    L_RES VARCHAR2(100);
BEGIN
    IF(MOD(L_YEAR,4)=0 AND MOD(L_YEAR,100)!=0) OR (MOD(L_YEAR,400)=0) THEN
        L_RES:=L_YEAR||'년은 윤년입니다.';
    ELSE
        L_RES:=L_YEAR||'년은 평년입니다.';
    END IF;
    DBMS_OUTPUT.PUT_LINE(L_RES);
END;


SELECT EMPLOYEE_ID AS 사원번호,
       EMP_NAME AS 사원명, 
       DEPARTMENT_ID AS 부서번호, 
       HIRE_DATE AS 입사일
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID BETWEEN 10 AND 40
 ORDER BY 3, 4;

SELECT EMPLOYEE_ID, EMP_NAME
  FROM HR.EMPLOYEES
 WHERE EMP_NAME LIKE '_l%';

SELECT SUBSTR(CART_NO,1, 8) AS 날짜,
       PROD_ID AS 상품코드,
       MEM_ID AS 구매회원번호, 
       CART_QTY AS 수량
  FROM LYS00.CART
 WHERE CART_NO LIKE '202006%';
 
SELECT BUY_DATE AS 매입날짜,
       PROD_ID AS 상품번호,
       BUY_QTY AS 매입수량
  FROM LYS00.BUYPROD
 WHERE BUY_DATE BETWEEN TO_DATE('2020/06/01') AND TO_DATE('2020/06/30');

SELECT EMPLOYEE_ID AS 사원번호, 
       EMP_NAME AS 사원명, 
       JOB_ID AS 직무코드, 
       DEPARTMENT_ID AS 부서코드,
       SALARY AS 급여
  FROM HR.EMPLOYEES
 WHERE DEPARTMENT_ID IN (20, 70, 90);
 
SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원명,
       MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
       CASE WHEN SUBSTR(MEM_REGNO2,1,1)='2' 
              OR SUBSTR(MEM_REGNO2,1,1)='4' THEN
	          '여성'
       ELSE '남성' END AS 성별
  FROM LYS00.MEMBER
  
SELECT MEM_ID AS 회원번호,
   MEM_NAME AS 회원명,
   MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
   CASE WHEN SUBSTR(MEM_REGNO2,1,1) IN (2,4) THEN
          '여성'
   ELSE '남성' END AS 성별
FROM LYS00.MEMBER

SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원명,
       MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
       CASE SUBSTR(MEM_REGNO2,1,1)
           WHEN '2' THEN '여성'
           WHEN '4' THEN '여성'
       ELSE '남성' END AS 성별
  FROM LYS00.MEMBER
  
  SELECT MEM_ID AS 회원번호,
         MEM_NAME AS 회원명,
         MEM_REGNO1||'-'||MEM_REGNO2 AS 주민번호,
         DECODE(SUBSTR(MEM_REGNO2,1, 1), '2', '여성', '4', '여성', '남성') 
         AS 성별
  FROM LYS00.MEMBER