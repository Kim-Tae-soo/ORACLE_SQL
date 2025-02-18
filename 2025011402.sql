2025-0114-02

사용예) 회원테이블에서 '충남'에 거주하는 회원정보를 조회하시오(회원번호, 회원명, 주소, 주민번호)
       단 주소는 기본주소와 상세주소를 결합하여 출력하되 한칸의 공백을 두 자료 사이에 
       추가하며 CONCAT함수를 사용하시오
    
SELECT MEM_ID AS 회원번호, 
       MEM_NAME AS 회원명,
       CONCAT(CONCAT(MEM_ADD1, ' '),MEM_ADD2) AS 주소,
       CONCAT(CONCAT(MEM_REGNO1, '-'),MEM_REGNO2) AS 주민번호
  FROM LYS00.MEMBER
 WHERE MEM_ADD1 LIKE '충남%';
       
사용예) 장바구니테이블에서 6월에 판매된 정보를 출력하시오 (일자, 상품번호, 수량) 
       날짜순으로 출력할것   

SELECT TO_DATE(SUBSTR(CART_NO, 1, 8)) AS 일자,
       PROD_ID AS 상품번호,
       CART_QTY AS 수량
  FROM LYS00.CART
 WHERE SUBSTR(CART_NO, 1, 6) = '202006'
 ORDER BY 1;
       
사용예) 회원테이블의 주민등록번호를 이용하여 나이를 계산하여 출력하시오
       (회원번호, 회원명, 주민등록번호, 나이)
SELECT MEM_ID AS 회원번호,
       MEM_NAME AS 회원명,
       MEM_REGNO1||'-'||MEM_REGNO2 AS 주민등록번호,
       CASE WHEN SUBSTR(MEM_REGNO2, 1, 1) IN (1, 2) THEN
            EXTRACT(YEAR FROM SYSDATE) - 
                TO_NUMBER('19'||SUBSTR(MEM_REGNO1, 1, 2))
       ELSE EXTRACT(YEAR FROM SYSDATE) - 
                TO_NUMBER('20'||SUBSTR(MEM_REGNO1, 1, 2)) END  AS 나이
  FROM LYS00.MEMBER
 ORDER BY 4;
  
SELECT EMP_NAME, LOWER(EMP_NAME), UPPER(EMP_NAME), INITCAP(EMP_NAME), INITCAP(LOWER(EMP_NAME))
  FROM HR.EMPLOYEES;
  
SELECT PROD_ID, PROD_NAME,
       NVL(PROD_COLOR, '색상정보 없음') AS 색상1,
       NVL(LPAD(PROD_COLOR, 7), '색상정보 없음') AS 색상2
  FROM LYS00.PROD;

SELECT PROD_ID, PROD_NAME, LPAD(PROD_PRICE, 10, '*'), RPAD(PROD_PRICE, 10, '*')
  FROM LYS00.PROD;

SELECT LTRIM('AABBAACCAA', 'AA'),
       LTRIM('AABBAACCAA', 'AB'),
       LTRIM('AABBAACCAA', 'ABC')
  FROM SYS.DUAL;

SELECT PROD_NAME,
       REPLACE(PROD_NAME, '대우', 'APPLE'),
       REPLACE(PROD_NAME, ' ')
  FROM LYS00.PROD;   
  
UPDATE HR.EMPLOYEES SET FIRST_NAME = TRIM(FIRST_NAME);
COMMIT;