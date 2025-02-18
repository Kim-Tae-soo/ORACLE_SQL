2025-0107-03)��¥������ Ÿ��
- DATE, TIMESTAMP, TIMESTAMP WITH LOCAL TIME ZONE, TIMESTAMP WITH TIME ZONE
- ������ ������ ���
- DATE : �⺻ ��¥ Ÿ��(��, ��, ��, ��, ��, ��) - �ݿø��� �ڸ�����(�ð��� ����)
    - �Լ��� SYSDATE�� ���
- TIMESTAMP : �Ҽ��� 9�ڸ����� ������ �ʸ� ��ȯ, �ð��뿪 ������ ����
    - �Լ��� SYSTIMESTAMP�� ���
- TIMESTAMP WITH LOCAL TIME ZONE : ������ Ŭ���̾�Ʈ ���� �ð����̸� ��ȯ
    - ������ Ŭ���̾�Ʈ�� ���� ���� ������ TIMESTAMP�� ����.
- TIMESTAMP WITH TIME ZONE : GMT�� Ŭ���̾�Ʈ�� �ð����̸� ��ȯ

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';

��뿹)
CREATE TABLE TEMP06(
    COL1 DATE,
    COL2 DATE,
    COL3 DATE,
    COL4 TIMESTAMP,
    COL5 TIMESTAMP WITH LOCAL TIME ZONE,
    COL6 TIMESTAMP WITH TIME ZONE
);

INSERT INTO TEMP06 VALUES(SYSDATE, SYSDATE-10, SYSDATE+10,
                            SYSTIMESTAMP,
                            SYSTIMESTAMP,
                            SYSTIMESTAMP);
SELECT * FROM TEMP06;

SELECT ROUND(COL1) FROM TEMP06;

SELECT MOD((TRUNC(SYSDATE) - TRUNC(TO_DATE('00010101')) - 1),7) AS ����ϼ� FROM DUAL;