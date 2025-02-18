2025-0117-01)

SELECT PROD_ID, PROD_NAME, PROD_COLOR
  FROM LYS00.PROD
 WHERE PROD_COLOR IS NOT NULL;
 
 SELECT EMPLOYEE_ID AS ȸ����ȣ,
        EMP_NAME AS ȸ����,
        SALARY AS �⺻��,
        NVL(COMMISSION_PCT, 0) AS ��������,
        SALARY * NVL(COMMISSION_PCT, 0) * 0.3 AS ���ʽ�,
        SALARY + (SALARY * NVL(COMMISSION_PCT, 0) * 0.3) AS���޾�
   FROM HR.EMPLOYEES;
 
��뿹) ��ǰ���̺��� ũ�Ⱑ NULL�� �ƴ� ��ǰ�� ũ�⸦ ����ϰ� NULL�� ��ǰ�� 0�� ����Ͻÿ�
       Alias�� ��ǰ�ڵ�, ��ǰ��, ũ��
       
       SELECT PROD_ID AS ��ǰ�ڵ�,
              PROD_NAME AS ��ǰ��, 
              NVL(PROD_SIZE, 0) AS ũ��
         FROM LYS00.PROD;
 
 **PROD���̺��� ��������(PROD_INSDATE)�� 2020�� 2�� 08���� �ڷḦ ã��
   �������ڸ� NULLó���Ͻÿ�
 
UPDATE LYS00.PROD 
   SET PROD_INSDATE = NULL
 WHERE PROD_INSDATE = TO_DATE('20200208');
 
 COMMIT;
 
��뿹) PROD���̺��� �������ڸ� �˼� ����
       ��ǰ�� ���������÷��� '������ �Һи�'�̶� �޽����� ����Ͻÿ�.
       Alias �� ��ǰ�ڵ�, ��ǰ��, ������
SELECT PROD_ID AS ��ǰ�ڵ�,
       PROD_NAME AS ��ǰ��,
       NVL(TO_CHAR(PROD_INSDATE), '������ �Һи�') AS ������
  FROM LYS00.PROD;
 WHERE PROD_INSDATE BETWEEN TO_DATE(20200201) AND LAST_DAY(TO_DATE(20200201));
 
 SELECT NVL(TO_CHAR(COMMISSION_PCT), '����')
   FROM HR.EMPLOYEES;

��뿹) ��ǰ���̺��� ���������� ��ȸ�Ͽ� ������ ������ ��� �÷��� '������ �ִ� ��ǰ'
        ���������� ������ ��� �÷��� '������ ���� ��ǰ'�� ����Ͻÿ�
        Alias�� ��ǰ�ڵ�, ��ǰ��, ���� 
        
SELECT PROD_ID AS ��ǰ�ڵ�,
       PROD_NAME AS ��ǰ��,
       NVL2(PROD_COLOR, '������ �ִ� ��ǰ', '������ ���� ��ǰ') AS ���
  FROM LYS00.PROD ;
 
 
**��ǰ���̺��� �з��ڵ� 'P301'�� ��ǰ�� ����ܰ��� ���Դܰ��� �����Ͻÿ�

SELECT PROD_ID, PROD_COST, PROD_PRICE
  FROM LYS00.PROD
 WHERE LPROD_GU = 'P301';
 
UPDATE LYS00.PROD SET PROD_PRICE = PROD_COST
 WHERE LPROD_GU = 'P301';
 
COMMIT;

��뿹) ��ǰ���̺��� ���Դܰ��� ����ܰ��� ���� ��ǰ�� ã�Ƽ� ��� ���� '�������� ��ǰ'��
       ����Ͻÿ�. �� �ܰ��� ���� ���� ������ ���Դܰ��� ��� ����Ͻÿ�.
       Alias�� ��ǰ�ڵ�, ��ǰ��, ���Դܰ�, ����ܰ�, ���(���Դܰ�)
       
SELECT PROD_ID AS ��ǰ�ڵ�,
       PROD_NAME AS ��ǰ��,
       PROD_COST AS ���Դܰ�,
       PROD_PRICE AS ����ܰ�, 
       NVL(TO_CHAR(NULLIF(PROD_COST, PROD_PRICE),'99,999,999'),'�������� ��ǰ') 
       AS "���(���Դܰ�)"
  FROM LYS00.PROD;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 