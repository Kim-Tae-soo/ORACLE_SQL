SELECT SUM(MEM_MILEAGE) AS "���ϸ��� �հ�",
       ROUND(AVG(MEM_MILEAGE), 2) AS "��� ���ϸ���",
       COUNT(MEM_ID) AS �ο���,
       MAX(MEM_MILEAGE) AS �ִ븶�ϸ���,
       MIN(MEM_MILEAGE) AS �ּҸ��ϸ���
  FROM LYS00.MEMBER;
  
SELECT COUNT(PROD_ID) AS ��ǰ�Ǽ�,
       MAX(PROD_PRICE) AS �ִ��ǸŰ�,
       MIN(PROD_PRICE) AS �ּ��ǸŰ�
  FROM LYS00.PROD;
  
SELECT *
  FROM LYS00.LPROD
 WHERE ROWNUM <= 4; 
 
SELECT SUM(CART_QTY) AS �Ǹż����հ�
  FROM LYS00.CART
 WHERE CART_NO LIKE '202004%';
 
 ������̺��� �μ��� ��ձ޿��� �ο����� ��ȸ�Ͻÿ�
 SELECT DEPARTMENT_ID AS �μ��ڵ�,
        ROUND(AVG(SALARY)) AS ��ձ޿�,
        COUNT(EMPLOYEE_ID) AS �ο���
   FROM HR.EMPLOYEES
  GROUP BY DEPARTMENT_ID
  ORDER BY 1;
 
 ��ǰ���̺��� �з��� ��ǰ�� ��, ����ǸŰ��� ��ȸ�Ͻÿ�
 
 SELECT LPROD_GU AS �з��ڵ�,
        COUNT(*) AS "��ǰ�� ��",
        ROUND(AVG(PROD_PRICE)) AS ����ǸŰ�
   FROM LYS00.PROD
  GROUP BY LPROD_GU
 HAVING COUNT(*) >= 10;
 
 �������̺��� 2020�� ���� ���� ���� �հ踦 ��ȸ�Ͻÿ�
 
SELECT EXTRACT(MONTH FROM BUY_DATE) AS ��,
       SUM(BUY_QTY) AS "���� ���� �հ�"
  FROM LYS00.BUYPROD
 WHERE EXTRACT(YEAR FROM BUY_DATE) = 2020
 GROUP BY EXTRACT(MONTH FROM BUY_DATE)
 HAVING SUM(BUY_QTY) >= 1000
 ORDER BY 1;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 