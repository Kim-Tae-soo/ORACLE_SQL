2025-0107-02)숫자자료타입
- NUMBER 사용
(사용형식)
    NUMBER[(P|*)(,S)]
    P는 전체자리수
    S는 소수점 이하의 자리수
    P>S이고 S가 양수인경우
     - 소숫점 이하 S+1자리에서 반올림
    P>S이고 S가 음수인경우
     - 정수부분의 S자리에서 반올림
    P<S 인 경우
     - 소숫점 이하자료에서 S번째 자료까지 저장(S+1번째에서 반올림)
사용예)
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
