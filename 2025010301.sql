2025-0103-01)���̺����
 - CREATE TABLE ��� ���
 - �⺻ ���尴ü�� TABLE�� ����
 (�������)
 
CREATE TABLE ���̺��(
    �÷��� ������Ÿ��[(ũ��)] [NOT NULL] [DEFAULT ��] [,]
                        :
    �÷��� ������Ÿ��[(ũ��)] [NOT NULL] [DEFAULT ��] [,]
    [CONSTRAINT �⺻Ű������ PRIMARY KEY(�÷���[�÷���,...])]
    [CONSTRAINT �ܷ�Ű������ FOREIGN KEY(�÷���) REFERENCE ���̺��(�÷���)[,]]
                                :
    [CONSTRAINT �ܷ�Ű������ FOREIGN KEY(�÷���) REFERENCE ���̺��(�÷���)[,]]
);

** ��¥ FORMAT ����

SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
SELECT SYSDATE FROM DUAL;

��뿹)

CREATE TABLE goods(       --��ǰ���̺�
    gid CHAR(4) NOT NULL,
    g_name VARCHAR2(50) NOT NULL,
    g_price NUMBER(6) DEFAULT 0,
    CONSTRAINT PK_goods PRIMARY KEY (gid) 
);