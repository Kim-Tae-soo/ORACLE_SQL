2025-0114-02

��뿹) ȸ�����̺��� '�泲'�� �����ϴ� ȸ�������� ��ȸ�Ͻÿ�(ȸ����ȣ, ȸ����, �ּ�, �ֹι�ȣ)
       �� �ּҴ� �⺻�ּҿ� ���ּҸ� �����Ͽ� ����ϵ� ��ĭ�� ������ �� �ڷ� ���̿� 
       �߰��ϸ� CONCAT�Լ��� ����Ͻÿ�
    
SELECT MEM_ID AS ȸ����ȣ, 
       MEM_NAME AS ȸ����,
       CONCAT(CONCAT(MEM_ADD1, ' '),MEM_ADD2) AS �ּ�,
       CONCAT(CONCAT(MEM_REGNO1, '-'),MEM_REGNO2) AS �ֹι�ȣ
  FROM LYS00.MEMBER
 WHERE MEM_ADD1 LIKE '�泲%';
       
��뿹) ��ٱ������̺��� 6���� �Ǹŵ� ������ ����Ͻÿ� (����, ��ǰ��ȣ, ����) 
       ��¥������ ����Ұ�   

SELECT TO_DATE(SUBSTR(CART_NO, 1, 8)) AS ����,
       PROD_ID AS ��ǰ��ȣ,
       CART_QTY AS ����
  FROM LYS00.CART
 WHERE SUBSTR(CART_NO, 1, 6) = '202006'
 ORDER BY 1;
       
��뿹) ȸ�����̺��� �ֹε�Ϲ�ȣ�� �̿��Ͽ� ���̸� ����Ͽ� ����Ͻÿ�
       (ȸ����ȣ, ȸ����, �ֹε�Ϲ�ȣ, ����)
SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ����,
       MEM_REGNO1||'-'||MEM_REGNO2 AS �ֹε�Ϲ�ȣ,
       CASE WHEN SUBSTR(MEM_REGNO2, 1, 1) IN (1, 2) THEN
            EXTRACT(YEAR FROM SYSDATE) - 
                TO_NUMBER('19'||SUBSTR(MEM_REGNO1, 1, 2))
       ELSE EXTRACT(YEAR FROM SYSDATE) - 
                TO_NUMBER('20'||SUBSTR(MEM_REGNO1, 1, 2)) END  AS ����
  FROM LYS00.MEMBER
 ORDER BY 4;
  
SELECT EMP_NAME, LOWER(EMP_NAME), UPPER(EMP_NAME), INITCAP(EMP_NAME), INITCAP(LOWER(EMP_NAME))
  FROM HR.EMPLOYEES;
  
SELECT PROD_ID, PROD_NAME,
       NVL(PROD_COLOR, '�������� ����') AS ����1,
       NVL(LPAD(PROD_COLOR, 7), '�������� ����') AS ����2
  FROM LYS00.PROD;

SELECT PROD_ID, PROD_NAME, LPAD(PROD_PRICE, 10, '*'), RPAD(PROD_PRICE, 10, '*')
  FROM LYS00.PROD;

SELECT LTRIM('AABBAACCAA', 'AA'),
       LTRIM('AABBAACCAA', 'AB'),
       LTRIM('AABBAACCAA', 'ABC')
  FROM SYS.DUAL;

SELECT PROD_NAME,
       REPLACE(PROD_NAME, '���', 'APPLE'),
       REPLACE(PROD_NAME, ' ')
  FROM LYS00.PROD;   
  
UPDATE HR.EMPLOYEES SET FIRST_NAME = TRIM(FIRST_NAME);
COMMIT;