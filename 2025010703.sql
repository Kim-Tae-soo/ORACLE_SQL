2025-0107-03)날짜데이터 타입
- DATE, TIMESTAMP, TIMESTAMP WITH LOCAL TIME ZONE, TIMESTAMP WITH TIME ZONE
- 덧셈과 뺄셈의 대상
- DATE : 기본 날짜 타입(년, 월, 일, 시, 분, 초) - 반올림과 자리버림(시간을 기준)
    - 함수는 SYSDATE를 사용
- TIMESTAMP : 소숫점 9자리까지 정교한 초를 반환, 시간대역 정보는 없음
    - 함수는 SYSTIMESTAMP를 사용
- TIMESTAMP WITH LOCAL TIME ZONE : 서버와 클라이언트 간의 시간차이를 반환
    - 서버와 클라이언트가 같은 곳에 있으면 TIMESTAMP와 같다.
- TIMESTAMP WITH TIME ZONE : GMT와 클라이언트의 시간차이를 반환

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';

사용예)
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

SELECT MOD((TRUNC(SYSDATE) - TRUNC(TO_DATE('00010101')) - 1),7) AS 경과일수 FROM DUAL;