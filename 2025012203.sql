SELECT SUBSTR(CART_NO, 5, 2) AS ��,
       MEM_ID AS ȸ����ȣ,
       PROD_ID AS ��ǰ��ȣ, 
       SUM(CART_QTY) AS �Ǹż����հ�
  FROM LYS00.CART
 WHERE CART_NO LIKE '2020%'
 GROUP BY ROLLUP(SUBSTR(CART_NO, 5, 2), MEM_ID, PROD_ID)
 ORDER BY 1,2,3;
 
(CUBE) 
SELECT SUBSTR(CART_NO, 5, 2) AS ��,
       MEM_ID AS ȸ����ȣ,
       PROD_ID AS ��ǰ��ȣ, 
       SUM(CART_QTY) AS �Ǹż����հ�
  FROM LYS00.CART
 WHERE CART_NO LIKE '2020%'
 GROUP BY CUBE(SUBSTR(CART_NO, 5, 2), MEM_ID, PROD_ID)
 ORDER BY 1,2,3;

(�κ� CUBE)
SELECT SUBSTR(CART_NO, 5, 2) AS ��,
       MEM_ID AS ȸ����ȣ,
       PROD_ID AS ��ǰ��ȣ, 
       SUM(CART_QTY) AS �Ǹż����հ�
  FROM LYS00.CART
 WHERE CART_NO LIKE '2020%'
 GROUP BY CUBE(SUBSTR(CART_NO, 5, 2), MEM_ID),PROD_ID
 ORDER BY 1,2,3;


















