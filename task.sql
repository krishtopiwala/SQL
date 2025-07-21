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

-- Exercise
-- a

SELECT name
FROM client_master
WHERE name LIKE '_a%';

-- +----------------+
-- | name           |
-- +----------------+
-- | Mamta Muzumdar |
-- | Hansel Colaco  |
-- +----------------+
-- 2 rows in set (0.00 sec)

-- b

SELECT client_no, name, city
FROM client_master
WHERE city LIKE 'M%';

-- +-----------+----------------+-----------+
-- | client_no | name           | city      |
-- +-----------+----------------+-----------+
-- | C00001    | Ivan Bayross   | Mumbai    |
-- | C00002    | Mamta Muzumdar | Madras    |
-- | C00003    | Chhaya Bankar  | Mumbai    |
-- | C00005    | Hansel Colaco  | Mumbai    |
-- | C00006    | Deepak Sharma  | Mangalore |
-- +-----------+----------------+-----------+
-- 5 rows in set (0.00 sec)

-- c

SELECT client_no, name, city
FROM client_master
WHERE (city = 'Bangalore') OR (city = 'Mangalore');

-- +-----------+---------------+-----------+
-- | client_no | name          | city      |
-- +-----------+---------------+-----------+
-- | C00004    | Ashwini Joshi | Bangalore |
-- | C00006    | Deepak Sharma | Mangalore |
-- +-----------+---------------+-----------+
-- 2 rows in set (0.00 sec)

-- d

SELECT client_no, name
FROM client_master
WHERE bal_due > 10000;

-- +-----------+--------------+
-- | client_no | name         |
-- +-----------+--------------+
-- | C00001    | Ivan Bayross |
-- +-----------+--------------+
-- 1 row in set (0.00 sec)

-- e

SELECT * FROM sales_order
WHERE order_date BETWEEN '04-06-01' AND '04-06-30';

-- +----------+-----------+------------+-----------+-------------+-----------+---------+------------+--------------+
-- | order_no | client_no | order_date | dely_addr | salesman_no | dely_type | bill_yn | dely_date  | order_status |
-- +----------+-----------+------------+-----------+-------------+-----------+---------+------------+--------------+
-- | O19001   | C00001    | 2004-06-12 | Mumbai    | S00001      | F         | N       | 2002-07-20 | In Process   |
-- | O19002   | C00002    | 2004-06-25 | Surat     | S00002      | P         | N       | 2002-06-27 | Cancelled    |
-- +----------+-----------+------------+-----------+-------------+-----------+---------+------------+--------------+
-- 2 rows in set (0.00 sec)

-- f

SELECT * FROM sales_order
WHERE (client_no = 'C00001') OR (client_no = 'C00002');

-- +----------+-----------+------------+-----------+-------------+-----------+---------+------------+--------------+
-- | order_no | client_no | order_date | dely_addr | salesman_no | dely_type | bill_yn | dely_date  | order_status |
-- +----------+-----------+------------+-----------+-------------+-----------+---------+------------+--------------+
-- | O19001   | C00001    | 2004-06-12 | Mumbai    | S00001      | F         | N       | 2002-07-20 | In Process   |
-- | O19003   | C00001    | 2004-04-03 | Surat     | S00001      | F         | Y       | 2002-04-07 | Fulfilled    |
-- | O19002   | C00002    | 2004-06-25 | Surat     | S00002      | P         | N       | 2002-06-27 | Cancelled    |
-- +----------+-----------+------------+-----------+-------------+-----------+---------+------------+--------------+
-- 3 rows in set (0.00 sec)

-- g

SELECT product_no, description
FROM product_master
WHERE (sell_price > 500) OR (sell_price <= 750);

-- +------------+--------------+
-- | product_no | description  |
-- +------------+--------------+
-- | P00001     | T-Shirts     |
-- | P0345      | Shirts       |
-- | P06734     | Cotton Jeans |
-- | P07865     | Jeans        |
-- | P07868     | Trousers     |
-- | P07885     | Pull Overs   |
-- | P07965     | Denim Shirts |
-- | P07975     | Lycra Tops   |
-- | P08865     | Skirts       |
-- +------------+--------------+
-- 9 rows in set (0.00 sec)

-- h

SELECT product_no, description, sell_price "old_price", (sell_price * 0.15) "new_price"
FROM product_master
WHERE sell_price > 500;

-- +------------+--------------+-----------+-----------+
-- | product_no | description  | old_price | new_price |
-- +------------+--------------+-----------+-----------+
-- | P06734     | Cotton Jeans |    600.00 |   90.0000 |
-- | P07865     | Jeans        |    750.00 |  112.5000 |
-- | P07868     | Trousers     |    850.00 |  127.5000 |
-- | P07885     | Pull Overs   |    700.00 |  105.0000 |
-- +------------+--------------+-----------+-----------+
-- 4 rows in set (0.00 sec)

-- i

SELECT client_no, name, city, state
FROM client_master
WHERE state != 'Maharashtra';

-- +-----------+----------------+-----------+------------+
-- | client_no | name           | city      | state      |
-- +-----------+----------------+-----------+------------+
-- | C00002    | Mamta Muzumdar | Madras    | Tamil Nadu |
-- | C00004    | Ashwini Joshi  | Bangalore | Karnataka  |
-- | C00006    | Deepak Sharma  | Mangalore | Karnataka  |
-- +-----------+----------------+-----------+------------+
-- 3 rows in set (0.00 sec)

-- j

SELECT COUNT(*) "total_order" FROM sales_order;

-- +-------------+
-- | total_order |
-- +-------------+
-- |           6 |
-- +-------------+
-- 1 row in set (0.00 sec)

-- k

SELECT AVG(sell_price) FROM product_master;

-- +-----------------+
-- | AVG(sell_price) |
-- +-----------------+
-- |      538.888889 |
-- +-----------------+
-- 1 row in set (0.00 sec)

-- l

SELECT MAX(sell_price) "max_price", MIN(sell_price)
FROM product_master;

-- +-----------+-----------------+
-- | max_price | MIN(sell_price) |
-- +-----------+-----------------+
-- |    850.00 |          300.00 |
-- +-----------+-----------------+
-- 1 row in set (0.00 sec)

-- m

SELECT COUNT(*)
FROM product_master
WHERE sell_price <= 500;

-- +----------+
-- | COUNT(*) |
-- +----------+
-- |        5 |
-- +----------+
-- 1 row in set (0.00 sec)

-- n

SELECT product_no, description
FROM product_master
WHERE qty_on_hand < reorder_lvl;

-- Empty set (0.00 sec)

-- Group By and Having Clause

-- a

SELECT product_master. product_no, product_master.description, SUM(qty_ordered) "quantity_sold"
FROM product_master
INNER JOIN sales_order_details on product_master.product_no = sales_order_details.product_no
GROUP BY product_master.product_no;

-- +------------+--------------+---------------+
-- | product_no | description  | quantity_sold |
-- +------------+--------------+---------------+
-- | P00001     | T-Shirts     |            34 |
-- | P07965     | Denim Shirts |             3 |
-- | P07885     | Pull Overs   |             5 |
-- | P07868     | Trousers     |             3 |
-- | P0345      | Shirts       |             4 |
-- | P06734     | Cotton Jeans |             1 |
-- | P07975     | Lycra Tops   |             6 |
-- +------------+--------------+---------------+
-- 7 rows in set (0.00 sec)

-- b

SELECT product_master.product_no, product_master.description, SUM(qty_ordered * product_rate) "product_value"
FROM product_master
INNER JOIN sales_order_details ON product_master.product_no = sales_order_details.product_no
GROUP BY sales_order_details.product_no;

-- +------------+--------------+---------------+
-- | product_no | description  | product_value |
-- +------------+--------------+---------------+
-- | P00001     | T-Shirts     |      17850.00 |
-- | P07965     | Denim Shirts |      25200.00 |
-- | P07885     | Pull Overs   |      26250.00 |
-- | P07868     | Trousers     |       9450.00 |
-- | P0345      | Shirts       |       4200.00 |
-- | P06734     | Cotton Jeans |      12000.00 |
-- | P07975     | Lycra Tops   |       6300.00 |
-- +------------+--------------+---------------+
-- 7 rows in set (0.00 sec)

-- c

SELECT AVG(qty_ordered), client_master.name
FROM client_master
INNER JOIN sales_order ON sales_order.client_no = client_master.client_no
INNER JOIN sales_order_details ON sales_order_details.order_no = sales_order.order_no
GROUP BY sales_order.client_no
HAVING SUM(qty_ordered * product_rate) > 15000;

-- +------------------+---------------+
-- | AVG(qty_ordered) | name          |
-- +------------------+---------------+
-- |           2.2500 | Ivan Bayross  |
-- |           5.0000 | Chhaya Bankar |
-- +------------------+---------------+
-- 2 rows in set (0.00 sec)

-- d

SELECT SUM(qty_ordered * product_rate) "sum"
FROM sales_order_details
INNER JOIN sales_order ON sales_order.order_no = sales_order_details.order_no
INNER JOIN product_master ON product_master.product_no = sales_order_details.product_no
WHERE order_date BETWEEN '04-06-01' AND '04-06-30';

-- +----------+
-- | sum      |
-- +----------+
-- | 34650.00 |
-- +----------+
-- 1 row in set (0.00 sec)


-- Joins
-- ANSI Style

-- a

SELECT product_master.description
FROM product_master
INNER JOIN sales_order_details ON sales_order_details.product_no = product_master.product_no
INNER JOIN sales_order ON sales_order.order_no = sales_order_details.order_no
INNER JOIN client_master ON client_master.client_no = sales_order.client_no
WHERE client_master.name = 'Ivan Bayross';

-- +--------------+
-- | description  |
-- +--------------+
-- | T-Shirts     |
-- | Denim Shirts |
-- | Pull Overs   |
-- | Cotton Jeans |
-- +--------------+
-- 4 rows in set (0.00 sec)

-- b

select description, qty_ordered
from product_master
inner join sales_order_details on sales_order_details.product_no = product_master.product_no
inner join sales_order on sales_order.order_no = sales_order_details.order_no
where dely_date = '2002-04-07';

-- +--------------+-------------+
-- | description  | qty_ordered |
-- +--------------+-------------+
-- | Cotton Jeans |           1 |
-- +--------------+-------------+
-- 1 row in set (0.01 sec)

-- c

SELECT product_master.product_no, product_master.description
FROM product_master
INNER JOIN sales_order_details ON sales_order_details.product_no = product_master.product_no
INNER JOIN sales_order ON sales_order.order_no = sales_order_details.order_no
GROUP BY product_master.product_no;

-- +------------+--------------+
-- | product_no | description  |
-- +------------+--------------+
-- | P00001     | T-Shirts     |
-- | P07965     | Denim Shirts |
-- | P07885     | Pull Overs   |
-- | P06734     | Cotton Jeans |
-- | P07868     | Trousers     |
-- | P0345      | Shirts       |
-- | P07975     | Lycra Tops   |
-- +------------+--------------+
-- 7 rows in set (0.00 sec)

-- d

SELECT client_master.name
FROM client_master
INNER JOIN sales_order ON sales_order.client_no = client_master.client_no
INNER JOIN sales_order_details ON sales_order_details.order_no = sales_order.order_no
INNER JOIN product_master ON product_master.product_no = sales_order_details.product_no
WHERE product_master.description = 'Trousers';

-- +---------------+
-- | name          |
-- +---------------+
-- | Chhaya Bankar |
-- +---------------+
-- 1 row in set (0.00 sec)

-- e

SELECT client_master.name, product_master.description, sales_order_details.qty_ordered
FROM product_master
INNER JOIN sales_order_details ON sales_order_details.product_no = product_master.product_no
INNER JOIN sales_order ON sales_order.order_no = sales_order_details.order_no
INNER JOIN client_master ON client_master.client_no = sales_order.client_no
WHERE (sales_order_details.qty_ordered < 5) AND (product_master.description = 'Pull Overs');

-- +---------------+-------------+-------------+
-- | name          | description | qty_ordered |
-- +---------------+-------------+-------------+
-- | Ivan Bayross  | Pull Overs  |           2 |
-- | Chhaya Bankar | Pull Overs  |           3 |
-- +---------------+-------------+-------------+
-- 2 rows in set (0.01 sec)

-- f

SELECT client_master.name, product_master.description, sales_order_details.qty_ordered
FROM product_master
INNER JOIN sales_order_details ON sales_order_details.product_no = product_master.product_no
INNER JOIN sales_order ON sales_order.order_no = sales_order_details.order_no
INNER JOIN client_master ON client_master.client_no = sales_order.client_no
WHERE (client_master.name = 'Ivan Bayross') OR (client_master.name = 'Mamta Muzumdar');

-- +----------------+--------------+-------------+
-- | name           | description  | qty_ordered |
-- +----------------+--------------+-------------+
-- | Ivan Bayross   | T-Shirts     |           4 |
-- | Ivan Bayross   | Denim Shirts |           2 |
-- | Ivan Bayross   | Pull Overs   |           2 |
-- | Ivan Bayross   | Cotton Jeans |           1 |
-- | Mamta Muzumdar | T-Shirts     |          10 |
-- +----------------+--------------+-------------+
-- 5 rows in set (0.00 sec)

-- g

SELECT client_master.name, product_master.description, sales_order_details.qty_ordered
FROM product_master
INNER JOIN sales_order_details ON sales_order_details.product_no = product_master.product_no
INNER JOIN sales_order ON sales_order.order_no = sales_order_details.order_no
INNER JOIN client_master ON client_master.client_no = sales_order.client_no
WHERE (client_master.client_no = 'C00001') OR (client_master.client_no = 'C00002');

-- +----------------+--------------+-------------+
-- | name           | description  | qty_ordered |
-- +----------------+--------------+-------------+
-- | Ivan Bayross   | T-Shirts     |           4 |
-- | Ivan Bayross   | Denim Shirts |           2 |
-- | Ivan Bayross   | Pull Overs   |           2 |
-- | Ivan Bayross   | Cotton Jeans |           1 |
-- | Mamta Muzumdar | T-Shirts     |          10 |
-- +----------------+--------------+-------------+
-- 5 rows in set (0.00 sec)

-- Theta Style

-- a

SELECT product_master.description
FROM product_master, client_master, sales_order, sales_order_details
WHERE sales_order_details.product_no = product_master.product_no
AND sales_order.order_no = sales_order_details.order_no
AND client_master.client_no = sales_order.client_no
AND client_master.name = 'Ivan Bayross';

-- +--------------+
-- | description  |
-- +--------------+
-- | T-Shirts     |
-- | Denim Shirts |
-- | Pull Overs   |
-- | Cotton Jeans |
-- +--------------+
-- 4 rows in set (0.00 sec)

-- b

SELECT product_master.description
FROM product_master, sales_order, sales_order_details
WHERE sales_order_details.product_no = product_master.product_no
AND sales_order.order_no = sales_order_details.order_no
AND sales_order.dely_date = '02-07-20';

-- +--------------+
-- | description  |
-- +--------------+
-- | T-Shirts     |
-- | Denim Shirts |
-- | Pull Overs   |
-- +--------------+
-- 3 rows in set (0.00 sec)

-- c

SELECT pm.product_no, pm.description
FROM product_master pm, sales_order so, sales_order_details sod
WHERE sod.order_no = so.order_no
AND sod.product_no = pm.product_no;

-- +------------+--------------+
-- | product_no | description  |
-- +------------+--------------+
-- | P00001     | T-Shirts     |
-- | P07965     | Denim Shirts |
-- | P07885     | Pull Overs   |
-- | P06734     | Cotton Jeans |
-- | P00001     | T-Shirts     |
-- | P07868     | Trousers     |
-- | P07885     | Pull Overs   |
-- | P00001     | T-Shirts     |
-- | P0345      | Shirts       |
-- | P07965     | Denim Shirts |
-- | P07975     | Lycra Tops   |
-- | P00001     | T-Shirts     |
-- | P07975     | Lycra Tops   |
-- +------------+--------------+
-- 13 rows in set (0.00 sec)

-- d

SELECT cm.name
FROM client_master cm, product_master pm, sales_order so, sales_order_details sod
WHERE so.client_no = cm.client_no
AND sod.order_no = so.order_no
AND pm.product_no = sod.product_no
AND pm.description = 'Trousers';

-- +---------------+
-- | name          |
-- +---------------+
-- | Chhaya Bankar |
-- +---------------+
-- 1 row in set (0.00 sec)

-- e

SELECT name, description, qty_ordered
FROM client_master, product_master, sales_order, sales_order_details
WHERE sales_order_details.order_no = sales_order.order_no
AND product_master.product_no = sales_order_details.product_no
AND client_master.client_no = sales_order.client_no
AND (sales_order_details.qty_ordered < 5) AND (product_master.description = 'Pull Overs');

-- +---------------+-------------+-------------+
-- | name          | description | qty_ordered |
-- +---------------+-------------+-------------+
-- | Ivan Bayross  | Pull Overs  |           2 |
-- | Chhaya Bankar | Pull Overs  |           3 |
-- +---------------+-------------+-------------+
-- 2 rows in set (0.00 sec)

-- f

select name, description, qty_ordered
from client_master, product_master, sales_order, sales_order_details
where sales_order.order_no = sales_order_details.order_no
AND client_master.client_no = sales_order.client_no
AND product_master.product_no = sales_order_details.product_no
AND  (client_master.name = 'Ivan Bayross' OR client_master.name = 'Mamta Muzumdar');

-- +----------------+--------------+-------------+
-- | name           | description  | qty_ordered |
-- +----------------+--------------+-------------+
-- | Ivan Bayross   | T-Shirts     |           4 |
-- | Ivan Bayross   | Denim Shirts |           2 |
-- | Ivan Bayross   | Pull Overs   |           2 |
-- | Ivan Bayross   | Cotton Jeans |           1 |
-- | Mamta Muzumdar | T-Shirts     |          10 |
-- +----------------+--------------+-------------+
-- 5 rows in set (0.00 sec)

-- g

select name, description, qty_ordered
from client_master, product_master, sales_order, sales_order_details
where sales_order.order_no = sales_order_details.order_no
AND client_master.client_no = sales_order.client_no
AND product_master.product_no = sales_order_details.product_no
AND  (client_master.client_no = 'C00001' OR client_master.client_no = 'C00002');

-- +----------------+--------------+-------------+
-- | name           | description  | qty_ordered |
-- +----------------+--------------+-------------+
-- | Ivan Bayross   | T-Shirts     |           4 |
-- | Ivan Bayross   | Denim Shirts |           2 |
-- | Ivan Bayross   | Pull Overs   |           2 |
-- | Ivan Bayross   | Cotton Jeans |           1 |
-- | Mamta Muzumdar | T-Shirts     |          10 |
-- +----------------+--------------+-------------+
-- 5 rows in set (0.00 sec)


-- SubQuery

-- a

SELECT product_no, description
FROM product_master
WHERE product_no NOT IN (SELECT sales_order_details.product_no FROM sales_order_details WHERE sales_order_details.product_no = product_master.product_no);

-- +------------+-------------+
-- | product_no | description |
-- +------------+-------------+
-- | P07865     | Jeans       |
-- | P08865     | Skirts      |
-- +------------+-------------+
-- 2 rows in set (0.00 sec)

-- b

SELECT name, address1, address2, city, pincode
FROM client_master
WHERE client_no = (SELECT sales_order.client_no FROM sales_order WHERE sales_order.order_no = 'O19001');

-- +--------------+----------+----------+--------+---------+
-- | name         | address1 | address2 | city   | pincode |
-- +--------------+----------+----------+--------+---------+
-- | Ivan Bayross | A-14     | Nandalay | Mumbai |  400054 |
-- +--------------+----------+----------+--------+---------+
-- 1 row in set (0.01 sec)

-- c

SELECT name
FROM client_master
WHERE client_no IN (SELECT sales_order.client_no FROM sales_order WHERE sales_order.client_no = client_master.client_no AND sales_order.dely_date BETWEEN '2002-01-01' AND '2002-04-30');

-- +---------------+
-- | name          |
-- +---------------+
-- | Ivan Bayross  |
-- | Chhaya Bankar |
-- +---------------+
-- 2 rows in set (0.01 sec)

-- d

SELECT client_no, name
FROM client_master
WHERE client_no IN (SELECT sales_order.client_no FROM sales_order, sales_order_details, product_master WHERE sales_order.client_no = client_master.client_no AND sales_order.order_no = sales_order_details.order_no AND sales_order_details.product_no = product_master.product_no AND product_master.product_no = "P07975");

-- +-----------+---------------+
-- | client_no | name          |
-- +-----------+---------------+
-- | C00004    | Ashwini Joshi |
-- | C00005    | Hansel Colaco |
-- +-----------+---------------+
-- 2 rows in set (0.01 sec)

-- e

SELECT name
FROM client_master
WHERE client_no IN (SELECT sales_order.client_no FROM sales_order, sales_order_details WHERE sales_order.client_no = client_master.client_no AND sales_order_details.order_no = sales_order.order_no GROUP BY client_master.name HAVING SUM(sales_order_details.qty_ordered * sales_order_details.product_rate) > 10000);

-- +---------------+
-- | name          |
-- +---------------+
-- | Ivan Bayross  |
-- | Chhaya Bankar |
-- | Hansel Colaco |
-- +---------------+
-- 3 rows in set (0.01 sec)