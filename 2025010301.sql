2025-0103-01)테이블생성
 - CREATE TABLE 명령 사용
 - 기본 저장객체인 TABLE을 생성
 (사용형식)
 
CREATE TABLE 테이블명(
    컬럼명 데이터타입[(크기)] [NOT NULL] [DEFAULT 값] [,]
                        :
    컬럼명 데이터타입[(크기)] [NOT NULL] [DEFAULT 값] [,]
    [CONSTRAINT 기본키설정명 PRIMARY KEY(컬럼명[컬럼명,...])]
    [CONSTRAINT 외래키설정명 FOREIGN KEY(컬럼명) REFERENCE 테이블명(컬럼명)[,]]
                                :
    [CONSTRAINT 외래키설정명 FOREIGN KEY(컬럼명) REFERENCE 테이블명(컬럼명)[,]]
);

** 날짜 FORMAT 변경

SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
SELECT SYSDATE FROM DUAL;

사용예)

CREATE TABLE goods(       --상품테이블
    gid CHAR(4) NOT NULL,
    g_name VARCHAR2(50) NOT NULL,
    g_price NUMBER(6) DEFAULT 0,
    CONSTRAINT PK_goods PRIMARY KEY (gid) 
);