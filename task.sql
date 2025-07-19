-- CREATING A DATABASE

CREATE DATABASE task;

USE task;

-- CLIENT_MASTER TABLE

CREATE TABLE client_master (
    client_no varchar(6),
    name varchar(20) NOT NULL,
    address1 varchar(30),
    address2 varchar(30),
    city varchar(15),
    pincode numeric(8),
    state varchar(15),
    bal_due numeric(10, 2),
    CONSTRAINT PK_CLIENT_NO PRIMARY KEY (client_no),
    CONSTRAINT CHK_CLIENT_NO CHECK (client_no LIKE 'C%')
);

desc client_master;

-- +-----------+---------------+------+-----+---------+-------+
-- | Field     | Type          | Null | Key | Default | Extra |
-- +-----------+---------------+------+-----+---------+-------+
-- | client_no | varchar(6)    | NO   | PRI | NULL    |       |
-- | name      | varchar(20)   | NO   |     | NULL    |       |
-- | address1  | varchar(30)   | YES  |     | NULL    |       |
-- | address2  | varchar(30)   | YES  |     | NULL    |       |
-- | city      | varchar(15)   | YES  |     | NULL    |       |
-- | pincode   | decimal(8,0)  | YES  |     | NULL    |       |
-- | state     | varchar(15)   | YES  |     | NULL    |       |
-- | bal_due   | decimal(10,2) | YES  |     | NULL    |       |
-- +-----------+---------------+------+-----+---------+-------+
-- 8 rows in set (0.00 sec)

-- INSERTING DATA

INSERT INTO client_master VALUES('C00001', 'Ivan Bayross', 'A-5', 'Nandalay', 'Mumbai', 400054, 'Maharashtra', 15000);
INSERT INTO client_master VALUES('C00002', 'Mamta Muzumdar', 'B-1', 'Shivalay', 'Madras', 780001, 'Tamil Nadu', 0);
INSERT INTO client_master VALUES('C00003', 'Chhaya Bankar', 'A-2', 'Ganesh Krupa', 'Mumbai', 400057, 'Maharashtra', 5000);
INSERT INTO client_master VALUES('C00004', 'Ashwini Joshi', 'C-10', 'Gokul Dham', 'Bangalore', 560001, 'Karnataka', 0);
INSERT INTO client_master VALUES('C00005', 'Hansel Colaco', 'A-10', 'Dwarka Niwas', 'Mumbai', 400060, 'Maharashtra', 2000);
INSERT INTO client_master VALUES('C00006', 'Deepak Sharma', 'C-3', 'Radha Raman', 'Mangalore', 560050, 'Karnataka', 0);

-- PRODUCT_MASTER TABLE

CREATE TABLE product_master (
    product_no varchar(6),
    description varchar(15) NOT NULL,
    profit_percent numeric(4, 2) NOT NULL,
    unit_measure varchar(10) NOT NULL,
    qty_on_hand numeric(8) NOT NULL,
    reorder_lvl numeric(8) NOT NULL,
    sell_price numeric(8, 2) NOT NULL,
    cost_price numeric(8, 2) NOT NULL,
    CONSTRAINT PK_PRODUCT_NO PRIMARY KEY (product_no),
    CONSTRAINT CHK_PRODUCT_NO CHECK (product_no LIKE 'P%'),
    CONSTRAINT CHK_SELL_PRICE CHECK (sell_price != 0),
    CONSTRAINT CHK_COST_PRICE CHECK (cost_price != 0)
);

-- +----------------+--------------+------+-----+---------+-------+
-- | Field          | Type         | Null | Key | Default | Extra |
-- +----------------+--------------+------+-----+---------+-------+
-- | product_no     | varchar(6)   | NO   | PRI | NULL    |       |
-- | description    | varchar(15)  | NO   |     | NULL    |       |
-- | profit_percent | decimal(4,2) | NO   |     | NULL    |       |
-- | unit_measure   | varchar(10)  | NO   |     | NULL    |       |
-- | qty_on_hand    | decimal(8,0) | NO   |     | NULL    |       |
-- | reorder_lvl    | decimal(8,0) | NO   |     | NULL    |       |
-- | sell_price     | decimal(8,2) | NO   |     | NULL    |       |
-- | cost_price     | decimal(8,2) | NO   |     | NULL    |       |
-- +----------------+--------------+------+-----+---------+-------+
-- 8 rows in set (0.00 sec)

-- INSERTING DATA

INSERT INTO product_master VALUES('P00001', 'T-Shirts', 5, 'Piece', 200, 50, 350, 250);
INSERT INTO product_master VALUES('P0345', 'Shirts', 6, 'Piece', 150, 50, 500, 350);
INSERT INTO product_master VALUES('P06734', 'Cotton Jeans', 5, 'Piece', 100, 20, 600, 450);
INSERT INTO product_master VALUES('P07865', 'Jeans', 5, 'Piece', 100, 20, 750, 500);
INSERT INTO product_master VALUES('P07868', 'Trousers', 2, 'Piece', 150, 50, 850, 550);
INSERT INTO product_master VALUES('P07885', 'Pull Overs', 2.5, 'Piece', 80, 30, 700, 450);
INSERT INTO product_master VALUES('P07965', 'Denim Shirts', 4, 'Piece', 100, 40, 350, 250);
INSERT INTO product_master VALUES('P07975', 'Lycra Tops', 5, 'Piece', 70, 30, 300, 175);
INSERT INTO product_master VALUES('P08865', 'Skirts', 5, 'Piece', 75, 30, 450, 300);

-- SALESMAN_MASTER TABLE

CREATE TABLE salesman_master (
    salesman_no varchar(6),
    salesman_name varchar(20) NOT NULL,
    address1 varchar(30) NOT NULL,
    address2 varchar(30),
    city varchar(20),
    pincode numeric(8),
    state varchar(20),
    sal_amt numeric(8, 2) NOT NULL,
    tgt_to_get numeric(6, 2) NOT NULL,
    ytd_sales numeric(6, 2) NOT NULL,
    remarks varchar(60),
    CONSTRAINT PK_SALESMAN_NO PRIMARY KEY (salesman_no),
    CONSTRAINT CHK_SALESMAN_NO CHECK (salesman_no LIKE 'S%'),
    CONSTRAINT CHK_SAL_AMT CHECK(sal_amt != 0),
    CONSTRAINT CHK_TGT_TO_GET CHECK(tgt_to_get != 0)
);

-- +---------------+--------------+------+-----+---------+-------+
-- | Field         | Type         | Null | Key | Default | Extra |
-- +---------------+--------------+------+-----+---------+-------+
-- | salesman_no   | varchar(6)   | NO   | PRI | NULL    |       |
-- | salesman_name | varchar(20)  | NO   |     | NULL    |       |
-- | address1      | varchar(30)  | NO   |     | NULL    |       |
-- | address2      | varchar(30)  | YES  |     | NULL    |       |
-- | city          | varchar(20)  | YES  |     | NULL    |       |
-- | pincode       | decimal(8,0) | YES  |     | NULL    |       |
-- | state         | varchar(20)  | YES  |     | NULL    |       |
-- | sal_amt       | decimal(8,2) | NO   |     | NULL    |       |
-- | tgt_to_get    | decimal(6,2) | NO   |     | NULL    |       |
-- | ytd_sales     | decimal(6,2) | NO   |     | NULL    |       |
-- | remarks       | varchar(60)  | YES  |     | NULL    |       |
-- +---------------+--------------+------+-----+---------+-------+
-- 11 rows in set (0.00 sec)

-- INSERTING DATA

INSERT INTO salesman_master VALUES('S00001', 'Aman', 'A/14', 'Worli', 'Mumbai', 400002, 'Maharashtra', 3000, 100, 50, 'Good');
INSERT INTO salesman_master VALUES('S00002', 'Omkar', '65', 'Nariman', 'Mumbai', 400001, 'Maharashtra', 3000, 200, 100, 'Good');
INSERT INTO salesman_master VALUES('S00003', 'Raj', 'P-7', 'Bandra', 'Mumbai', 400032, 'Maharashtra', 3000, 200, 100, 'Good');
INSERT INTO salesman_master VALUES('S00004', 'Ashish', 'A/5', 'Juhu', 'Mumbai', 400044, 'Maharashtra', 3500, 200, 150, 'Good');

-- SALES_ORDER TABLE

CREATE TABLE sales_order (
    order_no varchar(6),
    client_no varchar(6),
    order_date date NOT NULL,
    dely_addr varchar(25),
    salesman_no varchar(6),
    dely_type char(1) DEFAULT 'F',
    bill_yn char(1),
    dely_date date,
    order_status varchar(10),
    CONSTRAINT PK_ORDER_NO PRIMARY KEY (order_no),
    CONSTRAINT CHK_ORDER_NO CHECK (order_no LIKE 'O%'),
    CONSTRAINT FK_client_no FOREIGN KEY (client_no) REFERENCES client_master (client_no),
    CONSTRAINT FK_salesman_no FOREIGN KEY (salesman_no) REFERENCES salesman_master (salesman_no),
    CONSTRAINT CHK_ORDER_STATUS CHECK ((order_status = 'In Process') || (order_status = 'Fulfilled') || (order_status = 'BackOrder') || (order_status = 'Cancelled'))
);

-- +--------------+-------------+------+-----+---------+-------+
-- | Field        | Type        | Null | Key | Default | Extra |
-- +--------------+-------------+------+-----+---------+-------+
-- | order_no     | varchar(6)  | NO   | PRI | NULL    |       |
-- | client_no    | varchar(6)  | YES  | MUL | NULL    |       |
-- | order_date   | date        | NO   |     | NULL    |       |
-- | dely_addr    | varchar(25) | YES  |     | NULL    |       |
-- | salesman_no  | varchar(6)  | YES  | MUL | NULL    |       |
-- | dely_type    | char(1)     | YES  |     | F       |       |
-- | bill_yn      | char(1)     | YES  |     | NULL    |       |
-- | dely_date    | date        | YES  |     | NULL    |       |
-- | order_status | varchar(10) | YES  |     | NULL    |       |
-- +--------------+-------------+------+-----+---------+-------+
-- 9 rows in set (0.00 sec)

INSERT INTO sales_order(order_no, client_no, order_date, dely_addr, salesman_no, bill_yn, dely_date, order_status) VALUES ('O19001', 'C00001', '04-06-12', 'Mumbai', 'S00001', 'N', '02-07-20', 'In Process');
INSERT INTO sales_order VALUES('O19002', 'C00002', '04-06-25', 'Surat', 'S00002', 'P', 'N', '02-06-27', 'Cancelled');
INSERT INTO sales_order VALUES('O46865', 'C00003', '04-02-18', 'Ahmedabad', 'S00003', 'F', 'Y', '02-02-20', 'Fulfilled');
INSERT INTO sales_order VALUES('O19003', 'C00001', '04-04-03', 'Surat', 'S00001', 'F', 'Y', '02-04-07', 'Fulfilled');
INSERT INTO sales_order VALUES('O46866', 'C00004', '04-05-20', 'Worli', 'S00002', 'P', 'N', '02-05-22', 'Cancelled');
INSERT INTO sales_order VALUES('O19008', 'C00005', '04-05-24', 'Vadodara', 'S00004', 'F', 'N', '02-07-22', 'In Process');

-- SALES_ORDER_DETAILS

CREATE TABLE sales_order_details (
    order_no varchar(6),
    product_no varchar(6),
    qty_ordered numeric(8),
    qty_disp numeric(8),
    product_rate numeric(10, 2),
    CONSTRAINT FK_order_no FOREIGN KEY (order_no) REFERENCES sales_order (order_no),
    CONSTRAINT FK_product_no FOREIGN KEY (product_no) REFERENCES product_master (product_no)
);

-- +--------------+---------------+------+-----+---------+-------+
-- | Field        | Type          | Null | Key | Default | Extra |
-- +--------------+---------------+------+-----+---------+-------+
-- | order_no     | varchar(6)    | YES  | MUL | NULL    |       |
-- | product_no   | varchar(6)    | YES  | MUL | NULL    |       |
-- | qty_ordered  | decimal(8,0)  | YES  |     | NULL    |       |
-- | qty_disp     | decimal(8,0)  | YES  |     | NULL    |       |
-- | product_rate | decimal(10,2) | YES  |     | NULL    |       |
-- +--------------+---------------+------+-----+---------+-------+
-- 5 rows in set (0.00 sec)


INSERT INTO sales_order_details VALUES('O19001', 'P00001', 4, 4, 525);
INSERT INTO sales_order_details VALUES('O19001', 'P07965', 2, 1, 8400);
INSERT INTO sales_order_details VALUES('O19001', 'P07885', 2, 1, 5250);
INSERT INTO sales_order_details VALUES('O19002', 'P00001', 10, 0, 525);
INSERT INTO sales_order_details VALUES('O46865', 'P07868', 3, 3, 3150);
INSERT INTO sales_order_details VALUES('O46865', 'P07885', 3, 1, 5250);
INSERT INTO sales_order_details VALUES('O46865', 'P00001', 10, 10, 525);
INSERT INTO sales_order_details VALUES('O46865', 'P0345', 4, 4, 1050);
INSERT INTO sales_order_details VALUES('O19003', 'P03453', 2, 2, 1050);
INSERT INTO sales_order_details VALUES('O19003', 'P06734', 1, 1, 12000);
INSERT INTO sales_order_details VALUES('O46866', 'P07965', 1, 0, 8400);
INSERT INTO sales_order_details VALUES('O46866', 'P07975', 1, 0, 1050);
INSERT INTO sales_order_details VALUES('O19008', 'P00001', 10, 5, 525);
INSERT INTO sales_order_details VALUES('O19008', 'P07975', 5, 3, 1050);