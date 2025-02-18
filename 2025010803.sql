2025-0108-03) 테이블 생성
- CREATE TABLE 을 사용

CREATE TABLE goods(
    gid CHAR(4) NOT NULL,
    g_name VARCHAR2(50),
    g_price NUMBER(6),
    CONSTRAINT pk_goods PRIMARY KEY (gid)
);

CREATE TABLE customers(
    cust_id NUMBER(4) NOT NULL,
    cust_name VARCHAR2(30),
    cust_addr VARCHAR(250),
    CONSTRAINT pk_customers PRIMARY KEY (cust_id)
);

CREATE TABLE orders(
    order_num CHAR(12) NOT NULL,
    cust_id NUMBER(4),
    order_date DATE,
    CONSTRAINT pk_orders PRIMARY kEY (order_num),
    CONSTRAINT fk_cust_id FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

CREATE TABLE order_goods (
    gid CHAR(4),
    order_num CHAR(12),
    order_qty NUMBER(3),
    CONSTRAINT pk_order_goods PRIMARY KEY (gid,order_num),
    CONSTRAINT fk_order_goods FOREIGN KEY (gid) REFERENCES goods(gid),
    CONSTRAINT fk_order_orders FOREIGN KEY (order_num) REFERENCES orders(order_num)
);
