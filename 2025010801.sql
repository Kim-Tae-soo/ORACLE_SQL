2025-0108-01) ��¥������ Ÿ��
��뿹)  Ű����� ��¥�� �Է� �޾� ������ ����ϴ� ���� �ۼ�

ACCEPT P_DATE PROMPT '��¥ �Է�(YYYYMMDD) : '
DECLARE
    L_DATE DATE:=TO_DATE('&P_DATE');
    L_REMAINDER NUMBER:=0;
    L_AMT_DAYS NUMBER:=0;
    L_RESULT VARCHAR2(200);
BEGIN
    L_AMT_DAYS:=L_DATE-TO_DATE('00010101');
    L_REMAINDER:=MOD(L_AMT_DAYS-1,7);
    CASE L_REMAINDER 
        WHEN 0 THEN L_RESULT:=L_DATE||'�� �Ͽ����Դϴ�.';
        WHEN 1 THEN L_RESULT:=L_DATE||'�� �������Դϴ�.';
        WHEN 2 THEN L_RESULT:=L_DATE||'�� ȭ�����Դϴ�.';
        WHEN 3 THEN L_RESULT:=L_DATE||'�� �������Դϴ�.';
        WHEN 4 THEN L_RESULT:=L_DATE||'�� ������Դϴ�.';
        WHEN 5 THEN L_RESULT:=L_DATE||'�� �ݿ����Դϴ�.';
        ELSE L_RESULT:=L_DATE||'�� ������Դϴ�.';
    END CASE;
    DBMS_OUTPUT.PUT_LINE(L_RESULT);
    DBMS_OUTPUT.PUT_LINE(L_AMT_DAYS);
    DBMS_OUTPUT.PUT_LINE(L_REMAINDER);
END;    
        
    