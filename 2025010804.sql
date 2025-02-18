2025-0108-04) ALTER 명령
 - 테이블을 대상으로 이름변경(테이블, 컬럼), 컬럼삭제, 추가, 변경, 제약조건 삭제, 추가
   등의 작어 수행
1) 테이블명 변경
    ALTER TABLE old_table_name RENAME TO new_table_name;
    
사용예) customers테이블을 cust로 변경하시오
    ALTER TABLE customers RENAME TO cust;
    
2) 컬럼이름 변경
    ALTER TABLE 테이블명 RENAME COLUMN old_컬럼명 TO new_컬럼명;
    
사용예) goods테이블의 gid컬럼을 goods_id로 변경하시오
    ALTER TABLE goods RENAME COLUMN gid TO goods_id;
    
3) 컬럼의 추가, 수정, 삭제
    ALTER TABLE 테이블명 ADD|MODIFY (컬럼명 데이터타입[크기] [NOT NULL] [DEFAULT 값])
    ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
    
사용예) HR계정의 EMPLOYEES테이블에 EMP_NAME 컬럼을 추가하시오
ALTER TABLE HR.EMPLOYEES ADD EMP_NAME VARCHAR2(50);