SELECT SUBSTR(CART_NO, 5, 2) AS 월,
       MEM_ID AS 회원번호,
       PROD_ID AS 상품번호, 
       SUM(CART_QTY) AS 판매수량합계
  FROM LYS00.CART
 WHERE CART_NO LIKE '2020%'
 GROUP BY ROLLUP(SUBSTR(CART_NO, 5, 2), MEM_ID, PROD_ID)
 ORDER BY 1,2,3;
 
(CUBE) 
SELECT SUBSTR(CART_NO, 5, 2) AS 월,
       MEM_ID AS 회원번호,
       PROD_ID AS 상품번호, 
       SUM(CART_QTY) AS 판매수량합계
  FROM LYS00.CART
 WHERE CART_NO LIKE '2020%'
 GROUP BY CUBE(SUBSTR(CART_NO, 5, 2), MEM_ID, PROD_ID)
 ORDER BY 1,2,3;

(부분 CUBE)
SELECT SUBSTR(CART_NO, 5, 2) AS 월,
       MEM_ID AS 회원번호,
       PROD_ID AS 상품번호, 
       SUM(CART_QTY) AS 판매수량합계
  FROM LYS00.CART
 WHERE CART_NO LIKE '2020%'
 GROUP BY CUBE(SUBSTR(CART_NO, 5, 2), MEM_ID),PROD_ID
 ORDER BY 1,2,3;


















