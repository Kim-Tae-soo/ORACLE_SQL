2025-0117-02) �����Լ�

��뿹) ������̺��� �ټӳ���� ���� ���� ������� ����� �ο��Ͻÿ�
       Alias�� �����ȣ, �����, �Ի���, �ټӳ��, ���

SELECT EMPLOYEE_ID AS �����ȣ,
       EMP_NAME AS �����,
       HIRE_DATE AS �Ի���,
       EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)||'��' AS �ټӳ��,
       RANK() OVER(ORDER BY HIRE_DATE) AS "���(RANK)",
       DENSE_RANK() OVER(ORDER BY HIRE_DATE) AS"���(DENSE_RANK)",
       ROW_NUMBER() OVER(ORDER BY HIRE_DATE) AS"���(ROW_NUMBER)"
  FROM HR.EMPLOYEES
  
��뿹) ��ǰ���̺��� �з��� �ǸŰ��� ū�� ������ ������ �ο��Ͻÿ�
       Alias�� ��ǰ��ȣ, ��ǰ��, �з��ڵ�, �ǸŰ�, ����

SELECT PROD_ID AS ��ǰ��ȣ,
       PROD_NAME AS ��ǰ��,
       LPROD_GU AS �з��ڵ�,
       PROD_PRICE AS �ǸŰ�,
       RANK() OVER(PARTITION BY LPROD_GU ORDER BY PROD_PRICE DESC) AS ����
  FROM LYS00.PROD;
  
��뿹) 2020�� 1-3�� ��ǰ�� ���Լ����հ踦 �������� ������ �ο��Ͻÿ�
       Alias�� ��ǰ�ڵ�, ���Լ����հ�, ����
       
       SELECT PROD_ID AS ��ǰ�ڵ�,
              SUM(BUY_QTY) AS ���Լ����հ�, 
              RANK() OVER (ORDER BY SUM(BUY_QTY) DESC) AS ����
         FROM LYS00.BUYPROD
         WHERE BUY_DATE BETWEEN '20200101' AND LAST_DAY('20200301')
        GROUP BY PROD_ID;
        