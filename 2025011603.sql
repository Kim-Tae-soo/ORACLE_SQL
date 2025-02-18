- �������̺��� 2020�� ��ǰ�� ���Լ����հ踦 ��ȸ�Ͻÿ�

SELECT PROD_ID AS ��ǰ�ڵ�,
       SUM(BUY_QTY) AS ���Լ����հ�
  FROM LYS00.BUYPROD
 WHERE BUY_DATE LIKE '2020%'
 GROUP BY PROD_ID;

- �������̺��� ����, ��ǰ�� �Ǹż����հ踦 ��ȸ�Ͻÿ�

SELECT EXTRACT(MONTH FROM TO_DATE(SUBSTR(CART_NO, 1, 6), 'YYYYMM')) AS ��,
       PROD_ID AS ��ǰ�ڵ�,
       SUM(CART_QTY) AS �Ǹż����հ�
  FROM LYS00.CART
 GROUP BY EXTRACT(MONTH FROM TO_DATE(SUBSTR(CART_NO, 1, 6), 'YYYYMM')), PROD_ID;

- ������̺��� �μ���, �⵵�� �Ի��� ������� ��ȸ�Ͻÿ�

SELECT DEPARTMENT_ID AS �μ���ȣ,
       EXTRACT(YEAR FROM HIRE_DATE) AS �⵵,
       COUNT(EMPLOYEE_ID) AS �Ի��ѻ����
  FROM HR.EMPLOYEES
 GROUP BY DEPARTMENT_ID, EXTRACT(YEAR FROM HIRE_DATE)
 ORDER BY 1;

- ȸ�����̺��� ���� ��ո��ϸ����� ��ȸ�Ͻÿ�.

SELECT DECODE(SUBSTR(MEM_REGNO2, 1, 1), '1', '����', '3', '����', '����') AS ����, 
       ROUND(AVG(MEM_MILEAGE)) AS ��ո��ϸ���
  FROM LYS00.MEMBER
 GROUP BY DECODE(SUBSTR(MEM_REGNO2, 1, 1), '1', '����', '3', '����', '����');
  
- ȸ�����̺��� ���ɴ뺰 ȸ������ ��ո��ϸ����� ��ȸ�Ͻÿ�

SELECT SUBSTR(EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR), 1, 1)||'0��' AS ���ɴ�,
       COUNT(*) AS ȸ����,
       ROUND(AVG(MEM_MILEAGE))��ո��ϸ���
  FROM LYS00.MEMBER
 GROUP BY SUBSTR(EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM MEM_BIR), 1, 1)
 ORDER BY 1; 

- ȸ�����̺��� �������� ��� ���ϸ����� ȸ������ ��ȸ�Ͻÿ�

SELECT SUBSTR(MEM_ADD1, 1, 2) AS ������, 
       ROUND(AVG(MEM_MILEAGE)) AS ��ո��ϸ���,
       COUNT(MEM_ID) AS ȸ����
  FROM LYS00.MEMBER
 GROUP BY SUBSTR(MEM_ADD1, 1, 2);












