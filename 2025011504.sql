SELECT SUM(MEM_MILEAGE) AS "���ϸ��� �հ�",
       ROUND(AVG(MEM_MILEAGE), 2) AS "��� ���ϸ���",
       COUNT(MEM_ID) AS �ο���,
       MAX(MEM_MILEAGE) AS �ִ븶�ϸ���,
       MIN(MEM_MILEAGE) AS �ּҸ��ϸ���
  FROM LYS00.MEMBER;

SELECT GREATEST(201, '67', '4'),
       GREATEST('ȫ�浿', 'ȫ���', 'ȫ�泲')
  FROM DUAL;
  
SELECT LEAST(201, '67', '4'),
       LEAST('ȫ�浿', 'ȫ���', 'ȫ�泲')
  FROM DUAL;
  COMMIT;
����)
ȸ�����̺��� ���ϸ����� 1000�̸��� ȸ������ ���ϸ����� 1000���� �ο��Ͻÿ�
Alias ȸ����ȣ, ȸ����, �����ϸ���, ���渶�ϸ���

SELECT MEM_ID AS ȸ����ȣ,
       MEM_NAME AS ȸ����,
       MEM_MILEAGE AS �����ϸ���,
       GREATEST(MEM_MILEAGE , 1000) AS ���渶�ϸ���
  FROM LYS00.MEMBER;
  
��뿹) ȸ�����̺��� ���ϸ����� �������� ����� �ο��Ͻÿ�
       ���� ������ 1000�̰� ������ 8000�̸� ������ ������ 8���̴�.
       Alias ȸ����ȣ, ȸ����, ���ϸ���, ���
       
   SELECT MEM_ID AS ȸ����ȣ,
          MEM_NAME AS ȸ����, 
          MEM_MILEAGE AS ���ϸ���, 
          10 - WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) AS ���
     FROM LYS00.MEMBER;
     
��뿹) ȸ�����̺��� ���ϸ����� �������� ����� �ο��Ͻÿ� ����� ���ϸ����� ���� ����
       ȸ���� 1��޿��� ���ʴ�� �ο��Ͻÿ�
       ���� ������ 1000�̰� ������ 8000�̸� ������ ������ 8���̴�.
       Alias ȸ����ȣ, ȸ����, ���ϸ���, ���
       
   SELECT MEM_ID AS ȸ����ȣ,
          MEM_NAME AS ȸ����, 
          MEM_MILEAGE AS ���ϸ���, 
          10 - WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) AS ���
     FROM LYS00.MEMBER;
       
��뿹) ȸ�����̺��� ���ϸ����� �������� ����� �ο��Ͻÿ�
       ���� ������ 1000�̰� ������ 8000�̸� ������ ������ 8���̴�.
       ����� 0-3��� : ����ȸ��, 4-7 : ��ȸ��, 8��� �̻� : VIPȸ��
       Alias ȸ����ȣ, ȸ����, ���ϸ���, ���
       
       
   SELECT MEM_ID AS ȸ����ȣ,
          MEM_NAME AS ȸ����, 
          MEM_MILEAGE AS ���ϸ���, 
          WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) AS ���,
          CASE WHEN WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) IN (0, 1, 2, 3) THEN '����ȸ��'
               WHEN WIDTH_BUCKET(MEM_MILEAGE, 1000, 8000, 8) IN (4, 5, 6, 7) THEN '��ȸ��'
               ELSE 'VIPȸ��'
          END AS ����
     FROM LYS00.MEMBER;
     
     
     
     
     
     
     
     
     