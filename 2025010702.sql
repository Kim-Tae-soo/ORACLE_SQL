2025-0107-02)�����ڷ�Ÿ��
- NUMBER ���
(�������)
    NUMBER[(P|*)(,S)]
    P�� ��ü�ڸ���
    S�� �Ҽ��� ������ �ڸ���
    P>S�̰� S�� ����ΰ��
     - �Ҽ��� ���� S+1�ڸ����� �ݿø�
    P>S�̰� S�� �����ΰ��
     - �����κ��� S�ڸ����� �ݿø�
    P<S �� ���
     - �Ҽ��� �����ڷῡ�� S��° �ڷ���� ����(S+1��°���� �ݿø�)
��뿹)
CREATE TABLE TEMP05(
    COL1  NUMBER,
    COL2  NUMBER(3),
    COL3  NUMBER(3, 2),
    COL4  NUMBER(5, 2),
    COL5  NUMBER(7, 1),
    COL6  NUMBER(7, -1),
    COL7  NUMBER(7, -2),
    COL8  NUMBER(*, 2),
    COL9  NUMBER(4, 5),
    COL10 NUMBER(4, 7),
    COL11 NUMBER(3, 4),
    COL12 NUMBER(4, 6)
);

INSERT INTO TEMP05 VALUES(456.73, 456.73, 4.73, 456.73, 456.77, 50456.73,
                            12456.73, 12456.7393, 0.01234, 0.0001234, 0.0012,
                            0.00123789);
                            
SELECT * FROM TEMP05;                            
