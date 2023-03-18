-- TEAM INFORMATION
/* Team 4
Member_1: Neha reddy chama( Ordering database)
Member_2: Tejaswini Ginjipalli(Ordering database)
Member_3: Yogichandar Boppana(Ordering database)
Member_4: Nitisha Nahar(Inventory database) 
*/

--DELETION OF ALL THE PREEXISTING TABLES AND PROCEDURES

-- setting the serveroutput on
set serveroutput on;
-- dropping all the pre existing procedures and table names that are used as part of the program
drop table keys_list;
drop table metadata_mappings;
drop sequence Keyword_ID_seq;
drop procedure check_mappings;
drop procedure if_keyword;
drop procedure find_token;
drop procedure execute_strings;
drop procedure prc_show_rows;

--------------DROP TABLES W.R.T DB1--------------------------
drop table LDB1_line_item cascade constraints; 
drop table LDB1_product cascade constraints; 
drop table LDB1_orders cascade constraints;
drop table LDB1_customer cascade constraints; 

------------------Drop Sequence W.R.T DB2-------------------
DROP SEQUENCE LDB2_Line_Item_sequence;
DROP SEQUENCE LDB2_orders_sequence;
DROP SEQUENCE LDB2_products_sequence;
DROP SEQUENCE LDB2_customers_sequence;

----------------Drop Tables   W.R.T DB2-------------------
drop table LDB2_line_items cascade constraints;
drop table LDB2_orders cascade constraints;
drop table LDB2_products cascade constraints;
drop table LDB2_customers cascade constraints;

-----------------------------------dropping the existing sequences W.R.T DB3-----------------
drop sequence LDB3_cust_id_seq;
drop sequence LDB3_product_seq;
drop sequence LDB3_order_id_seq;
drop sequence LDB3_line_item_seq;

--------------------------------- dropping the existing tables W.R.T DB3---------------
drop table LDB3_line_item;
drop table LDB3_product ;
drop table LDB3_orders;
drop table LDB3_customers;

-------------------------------------
--Drop Tables and Sequence W.R.T DB4
------------------------------------

DROP TABLE Music_CD_Order;
DROP TABLE Book_Order;
DROP TABLE LDB4_Customer;
DROP TABLE MusicCD_Inventory;
DROP TABLE Book_Inventory;
DROP SEQUENCE LDB4_Customer_ID_seq;

--commit;

-------------------Creating Sequence THAT ARE USED IN DB2-----------------

CREATE SEQUENCE LDB2_customers_sequence
start with 1
increment by 1;

CREATE SEQUENCE LDB2_products_sequence
start with 20
increment by 1;

CREATE SEQUENCE LDB2_orders_sequence
start with 40
increment by 1;

CREATE SEQUENCE LDB2_Line_Item_sequence
start with 60
increment by 1;

----------------creating sequences to update the values in the table W.R.T DB3----------------
create sequence LDB3_cust_id_seq start with  1 increment by 1;
create sequence LDB3_product_seq start with  1 increment by 1;
create sequence LDB3_order_id_seq start with 1 increment by 1;
create sequence LDB3_line_item_seq start with 1 increment by 1;

--------------------------
--LDB4_Customer_ID_seq Sequence
--------------------------

CREATE SEQUENCE  LDB4_Customer_ID_seq START WITH 50000 NOCYCLE ;
-------------------------------------------------------------------------------------------------------
--CREATION OF INITIAL DATABASES
--DB1
--Neha Reddy Chama (QU35490)
-- I have choosen ordering database which has LDB1_orders, LDB1_customer, LDB1_products and line item tables.
-- This database keeps track of the LDB1_customer order information. It contains detailed information about each LDB1_customer and each purchase order.

--creating LDB1_customer table in local db1

create table LDB1_customer 
(c_id int,
c_name varchar(60),
c_address  varchar (200),
c_phone_number varchar(15),
c_email varchar(100),
primary key(c_id));

--creating order table in local db1

create table LDB1_orders
(o_id int,
c_id int,
o_date date,
total_price float,
o_quantity int,
primary key(o_id),
foreign key(c_id) references LDB1_customer(c_id));

--creating LDB1_product table in local database db1

create table LDB1_product
(p_id int,
p_name varchar(60),
p_description  varchar (500),
p_quantity  int,
p_price float,
primary key(p_id)
);

--creating LDB1_line_item table in local database db1

create table LDB1_line_item 
(l_id int,
o_id int,
p_id int,
l_quantity int,
primary key(l_id),
foreign key(o_id) references LDB1_orders(o_id),
foreign key(p_id) references LDB1_product(p_id)
);


-------------------------------------------------DB2--------------------------------------------------
------Name: Tejaswini G -------------------------------
------Functionality: This is an (LDB2_ordersing) database with four different tables called LDB2_customers, LDB2_orders, LDB2_products and LDB2_line_items.------------
------Queries are made for all the six questions-------------------------------

create table LDB2_customers (
    cid int NOT NULL,
    cname varchar(50),
	address varchar(250),
	phone varchar(15),
	email varchar(150),
    primary key (cid)
    );


create table LDB2_products (
    pid int NOT NULL ,
	pname varchar(50),
	pdescription varchar(150),
	quantity int,
	price float,
    primary key (pid)
	);   
    

create table LDB2_orders (
    orid int NOT NULL,
	cid int,
	odate date,
	total_price float, 
    primary key (orid),
    foreign key (cid) references LDB2_customers(cid)
    );
    
     
create table LDB2_line_items (
    lid int NOT NULL,
	orid int,
	pid int,
    quantity_ordered int,
    lunit_price float,
    primary key (lid),
	foreign key (orid) references LDB2_orders(orid),
	foreign key (pid) references LDB2_products(pid)
    );


--------------------------------------------------DB3 -------------------------------------------------
--Yogichandar boppana(NO98814)
/* Choosen the orderding data base 
for the project deliverable D1 
which consists of tables customer,(LDB3_orders),LDB3_line_items and LDB3_products 
that keeps tracks of customer details and their order details and list of different items that are ordered by a customer.
*/


--creating the new tables LDB3_customers,LDB3_products,LDB3_orders,Item_line
create table LDB3_customers
(c_id int,
cust_name varchar(100),
adress varchar(100),
phone varchar(10),
email varchar(100),
cc_number varchar(20),
primary key(c_id));

create table LDB3_orders
(o_id int,
c_id int,
ord_date date,
total_price float,
primary key(o_id),
foreign key(c_id) references LDB3_customers(c_id));

create table LDB3_product
(p_id int,
p_name varchar(100),
p_description  varchar (200),
p_quantity  int,
p_price float,
primary key(p_id));

create table LDB3_line_item 
(l_id int,
o_id int,
p_id int,
unit_price float,
quantity  int,
total_price float,
c_id int,
primary key(l_id),
foreign key(o_id) references LDB3_orders(o_id),
foreign key(p_id) references LDB3_product(p_id),
foreign key(c_id) references LDB3_customers(c_id));

----------------------------------------------------DB4--------------------------------------------------
--Nitisha Nahar
--JD37852
--Inventory database

----------------------
--Book_Inventory Table
----------------------

CREATE TABLE Book_Inventory (
ISBN INT NOT NULL,
Title VARCHAR(255),
Authors VARCHAR(255),
Edition INT,
Price_Book INT NOT NULL,
Category VARCHAR (50),
Keywords VARCHAR (255),
Publisher VARCHAR(255),
Quantity INT NOT NULL,
CONSTRAINT Book_Inventory_ISBN_UN UNIQUE (ISBN)
);


-------------------------
--MusicCD_Inventory Table
-------------------------
CREATE TABLE MusicCD_Inventory (
CD_ID INT NOT NULL,
Title VARCHAR(255),
Artists VARCHAR(255),
Release_Year INT,
Price_CD INT NOT NULL,
Category VARCHAR (50),
Keywords VARCHAR (255),
Recording_Company VARCHAR (255),
Quantity INT NOT NULL,
CONSTRAINT MusicCD_Inventory_CD_ID_UN UNIQUE (CD_ID)
);

----------------
--Customer Table
----------------

CREATE TABLE LDB4_Customer (
Customer_ID INT NOT NULL,
Name VARCHAR(255),
Address VARCHAR(255),
City VARCHAR (255),
State VARCHAR (255),
Country VARCHAR (255),
Phone_Number INT,
CONSTRAINT Customer_ID_UN UNIQUE (Customer_ID)
);

------------------
--Book_Order Table
------------------

CREATE TABLE Book_Order (
Order_ID_B INT NOT NULL PRIMARY KEY,
Customer_ID INT NOT NULL,
ISBN INT NOT NULL,
Quantity_Purchase INT NOT NULL,
Total_Price INT,
FOREIGN KEY (ISBN) REFERENCES Book_Inventory(ISBN),
FOREIGN KEY (Customer_ID) REFERENCES LDB4_Customer(Customer_ID)
);

----------------------
--Music_CD_Order Table
----------------------

CREATE TABLE Music_CD_Order (
Order_ID_M INT NOT NULL PRIMARY KEY,
Customer_ID INT NOT NULL,
CD_ID INT NOT NULL,
Quantity_Purchase INT NOT NULL,
Total_Price INT,
FOREIGN KEY (CD_ID) REFERENCES MusicCD_Inventory(CD_ID),
FOREIGN KEY (Customer_ID) REFERENCES LDB4_Customer(Customer_ID)
);

------------------------------------CREATION OF META DATA LAYER AND KEYWORD TABLES----------------------
--creation of the mapping table
CREATE TABLE Metadata_Mappings (
Global_Representation Varchar2(255),
Column_name_localDB1  Varchar2(255),
Data_Type_localDB1 Varchar2(255),
Mapping_LocalDB1 Varchar2(255),
Column_name_localDB2 Varchar2(255),
Data_Type_localDB2 Varchar2(255),
Mapping_LocalDB2 Varchar2(255),
Column_name_localDB3 Varchar2(255),
Data_Type_localDB3 Varchar2(255),
Mapping_LocalDB3 Varchar2(255),
Column_name_localDB4 Varchar2(255),
Data_Type_localDB4 Varchar2(255),
Mapping_LocalDB4 Varchar2(255)
);

-- Need to create a table named as keys to insert all the keywords
create sequence Keyword_ID_seq start with 1 increment by 1;
create table keys_list(Keyword_ID int,Keyword varchar(100),primary key(Keyword_ID));

----------------------------------------------------------INSERTS---------------------------------------
------------------------------------------------LOCAL DATABASE DB1 INSERTS-----------------------------
--inserting values into LDB1_customer table

insert into LDB1_customer VALUES(1,'Jeff','2341 park street, arligton, Virginia','5436671239','jeff1@gmail.com' );
insert into LDB1_customer VALUES(2,'Mary','6751 newlane street, arligton, Virginia','9987234576','mary12@gmail.com' );
insert into LDB1_customer VALUES(3,'Ria','3674 hudsun yards, arligton, Virginia','4437628798','riano@gmail.com' );
insert into LDB1_customer VALUES(4,'Mark','9871 marine drive, arligton, Virginia','9547666719','mark123@gmail.com' );
insert into LDB1_customer VALUES(5,'Ben','4680 aldgate green,Baltimore, Maryland','6674532897','ben99@gmail.com' );
insert into LDB1_customer VALUES(6,'Jack','4700 fernley square, Baltimore, Maryland','6672345678','jack@gmail.com' );
insert into LDB1_customer VALUES(7,'Moriis','4680 Chapel square, Baltimore, Maryland','6675438769','morris1@gmail.com' );
insert into LDB1_customer VALUES(8,'Rachel','2436 belwood green, Baltimore,Maryland','6677768907','rachel@gmail.com' );
insert into LDB1_customer VALUES(9,'Devi','3265 holand drive, Baltimore, Maryland','6675436765','devi2@gmail.com' );
insert into LDB1_customer VALUES(10,'Natasha','4540 drayton green, Baltimore, Maryland','6673425432','natsha@gmail.com' );


--inserting values into LDB1_orders table

insert into LDB1_orders VALUES(1,2,date'2022-08-01','900',3);
insert into LDB1_orders VALUES(2,4,date'2022-09-11','200',4);
insert into LDB1_orders VALUES(3,5,date'2022-09-11','60',1);
insert into LDB1_orders VALUES(4,4,date'2022-09-11','65',1);
insert into LDB1_orders VALUES(5,5,date'2022-09-16','50',1);
insert into LDB1_orders VALUES(6,6,date'2022-08-12','35',1);
insert into LDB1_orders VALUES(7,7,date'2022-08-16','50',1);
insert into LDB1_orders VALUES(8,8,date'2022-08-12','38',1);
insert into LDB1_orders VALUES(9,9,date'2022-09-19','55',1);
insert into LDB1_orders VALUES(10,1,date'2022-07-12','90',2);


--inserting values into LDB1_product table

insert into LDB1_product VALUES (1,'earphone','wireless',50,120);
insert into LDB1_product VALUES (2,'phone','iphone 13 mini',30,700);
insert into LDB1_product VALUES (3,'bag','shoulder',40,50);
insert into LDB1_product VALUES (4,'table','40 inch',25,60);
insert into LDB1_product VALUES (5,'bottle','40 oz',25,45);
insert into LDB1_product VALUES (6,'charger','iphone',30,30);
insert into LDB1_product VALUES (7,'fan','electric',35,50);
insert into LDB1_product VALUES (8,'dryer','revlon dryer',37,45);
insert into LDB1_product VALUES (9,'lamp','yelow lamp 40 inch',32,35);
insert into LDB1_product VALUES (10,'shoe stand','30 inch',23,40);

--inserting values into LDB1_line_item table;

insert into LDB1_line_item VALUES(1,1,1,1);
insert into LDB1_line_item VALUES(2,1,2,1);
insert into LDB1_line_item VALUES(3,1,3,1);
insert into LDB1_line_item VALUES(4,2,3,1);
insert into LDB1_line_item VALUES(5,2,7,1);
insert into LDB1_line_item VALUES(6,2,5,1);
insert into LDB1_line_item VALUES(7,3,7,1);
insert into LDB1_line_item VALUES(8,4,4,1);
insert into LDB1_line_item VALUES(9,5,5,1);
insert into LDB1_line_item VALUES(10,6,6,1);
insert into LDB1_line_item VALUES(11,7,8,1);
insert into LDB1_line_item VALUES(12,8,9,1);
insert into LDB1_line_item VALUES(13,9,7,1);
insert into LDB1_line_item VALUES(14,10,10,2);
insert into LDB1_line_item VALUES(15,2,3,1);


-------------------------------------------LOCAL DATABASE LBD2 INSERTS -----------------------------------

insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Andy', '2350 27th south s Arlington', '4346284981', 'andyk@gmail.com');
insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Bob', '1283 13th North s Arlington', '4873457621', 'bobyr@gmail.com');
insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Catherine', '4623 9th south s Arlington', '4871259746', 'cathy@gmail.com');
insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Daniel', '9283 19th North s Arlington', '4763254671', 'daniel@gmail.com');
insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Ernest', '7623 12th East s Arlington', '4985674308', 'ernestj@gmail.com');
insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Francis', '1297 8th south s Arlington', '4659761203', 'franc05@gmail.com');
insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Grey', '9845 26th West s Arlington', '4081974185', 'grey02@gmail.com');
insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Hanley', '7635 14th south s Arlington', '4961653092', 'hanley@gmail.com');
insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Ian Cruz', '7183 29th North s Arlington', '4981732099', 'ianc459@gmail.com');
insert into LDB2_customers
values(LDB2_customers_sequence.nextval,'Jacob', '9346 13th south s Arlington', '4971720942', 'jacob1245@gmail.com');


insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Spinach', 'This is a leafy vegetable', 50, 5);
insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Avocado', 'Good Fruit', 100, 7);
insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Eggs', 'Protein rich food', 200, 10);
insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Bread', 'Staple food', 20, 4);
insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Strawberries', 'Rich in antioxidants', 25, 10);
insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Blueberries', 'Rich in vitamin C and vitamin K', 30, 15);
insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Milk', 'Important source of many essential nutrients', 50, 5);
insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Mushroom', 'Great source of selenium', 40, 10);
insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Springleaf', 'Mix of multiple varieties of leafy vegetables', 20, 4);
insert into LDB2_products
values(LDB2_products_sequence.nextval, 'Corn', 'Rich in vitamin C and combats free radical damage', 150, 2);


insert into LDB2_orders 
values(LDB2_orders_sequence.nextval,1, date '2022-09-03', 59);
insert into LDB2_orders
values(LDB2_orders_sequence.nextval,2, date '2022-09-04', 96);
insert into LDB2_orders
values(LDB2_orders_sequence.nextval,3, date '2022-09-05', 62);
insert into LDB2_orders
values(LDB2_orders_sequence.nextval,4, date '2022-09-06', 93);
insert into LDB2_orders
values(LDB2_orders_sequence.nextval,5, date '2022-09-07', 50);
insert into LDB2_orders
values(LDB2_orders_sequence.nextval,6, date '2022-09-08', 16);
insert into LDB2_orders
values(LDB2_orders_sequence.nextval,7, date '2022-09-09', 4);
insert into LDB2_orders
values(LDB2_orders_sequence.nextval,8, date '2022-09-10', 20);
insert into LDB2_orders
values(LDB2_orders_sequence.nextval,9, date '2022-09-11', 21);
insert into LDB2_orders
values(LDB2_orders_sequence.nextval,10, date '2022-09-12', 20);


insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,40,20,3,5);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,40,21,2,7);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,40,22,3,10);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,41,23,4,4);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,41,24,5,10);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,41,25,2,15);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,42,26,6,5);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,42,27,2,10);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,42,28,3,4);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,43,22,4,10);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,43,23,2,4);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,43,25,3,15);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,44,27,5,10);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,45,28,4,4);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,46,29,2,2);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,47,20,4,5);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,48,21,3,7);
insert into LDB2_line_items
values(LDB2_Line_Item_sequence.nextval,49,23,5,4);

--------------------------------------------LOCAL DATABASE 3 INSERTS-----------------------------------

--manual inserts into the table
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Rahul','4712 belwood green MD 21227','6673048612','rahul12@gmail.com','123467899876');
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Ram','4412 Courtney Road MD 21250', '4434674567','ram12@gmail.com','456745674567');
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Rakesh','1000 Hilltop circle MD 21250','9815791927','rakesh12@gmail.com','223422342234');
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Rohith','4412 aldgate green MD 21227','5634565436','rohith12@gmail.com','345634563456');
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Mohith','4812 drayton green MD 21227','7815671927','mohith34@gmail.com','678967896789');
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Vamsi','4702 Houvland gardens MD 21227','9817651567','vamsi123@gmail.com','223422342234');
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Khan','4812 Eldon green MD 21227','6673408765','khan23@gmail.com','123467896789');
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Jasmine','4703 Belwood green MD 21227','5675678861','jasmine45@gmail.com','452145214521');
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Hemanth','4512 Gateway terrace MD 21227','4568456847','hemanth34@gmail.com','898989891212');
insert into LDB3_customers values(LDB3_cust_id_seq.nextval,'Sam','4817 Grenville Square MD 21227','3453456543','sam23@gmail.com','567556755675');



insert into LDB3_product values(LDB3_product_seq.nextval,'pen','cello zel pen',30,3);
insert into LDB3_product values(LDB3_product_seq.nextval,'book','Every one has a story by savi sharma',100,10);
insert into LDB3_product values(LDB3_product_seq.nextval,'book','A brief history of time',35,15);
insert into LDB3_product values(LDB3_product_seq.nextval,'book','The grand design',40,22);
insert into LDB3_product values(LDB3_product_seq.nextval,'pencil','Natraj',50,2);
insert into LDB3_product values(LDB3_product_seq.nextval,'shirt','Calvien klien',24,30);
insert into LDB3_product values(LDB3_product_seq.nextval,'shades','Gucci',60,70);
insert into LDB3_product values(LDB3_product_seq.nextval,'cofee cup','Tupperware',20,5);
insert into LDB3_product values(LDB3_product_seq.nextval,'camera','canon',3,150);
insert into LDB3_product values(LDB3_product_seq.nextval,'school bag','MK',45,30);


insert into LDB3_orders values(LDB3_order_id_seq.nextval,1,date'2022-09-15',26);
insert into LDB3_orders values(LDB3_order_id_seq.nextval,2,date'2022-09-10',10);
insert into LDB3_orders values(LDB3_order_id_seq.nextval,3,date'2022-09-11',44);
insert into LDB3_orders values(LDB3_order_id_seq.nextval,1,date'2022-09-16',70);
insert into LDB3_orders values(LDB3_order_id_seq.nextval,2,date'2022-09-10',150);
insert into LDB3_orders values(LDB3_order_id_seq.nextval,8,date'2022-09-08',30);
insert into LDB3_orders values(LDB3_order_id_seq.nextval,4,date'2022-09-11',30);
insert into LDB3_orders values(LDB3_order_id_seq.nextval,5,date'2022-09-17',30);
insert into LDB3_orders values(LDB3_order_id_seq.nextval,6,date'2022-09-15',20);
insert into LDB3_orders values(LDB3_order_id_seq.nextval,7,date'2022-09-05',180);



insert into LDB3_line_item values(LDB3_line_item_seq.nextval,1,1,3,2,6,1);-- order id 1 contains pen, book and a cofee cup ordered by cust 1  on 15 sept
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,1,2,10,1,10,1);
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,1,8,5,2,10,1);
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,2,5,2,5,10,2);-- order id 2 has contains 2 pencils on 10 sept ordered by cust 2
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,3,4,22,2,44,3);-- orderid 3 contains 2 books on 11 sept ordrered by cust 3
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,4,7,70,1,70,1);-- order id 4 contains shades thatwas orderd by cust 1 on 16 sept
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,5,9,150,1,150,2);-- order id 5 contains camera that was ordered by cust 2 on 10 sept
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,6,10,30,1,30,8);--order id 6 contains school bag that was ordered by cust 8 on 17 sept
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,7,6,30,1,30,4);--order id 7 contains shirt that was ordered by cust 4 on 11 sept
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,8,3,15,2,30,5);--order id 8 contains a book ordered by cust 5 on 17 sept
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,9,8,5,4,20,6);--order id 9 contains cofeecup ordered by cust 6 on 15 sept
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,10,7,70,2,140,7);-- order id 10 contains shades,school bag and a cofee mug ordered by cust 7
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,10,10,30,1,30,7);
insert into LDB3_line_item values(LDB3_line_item_seq.nextval,10,8,5,2,10,7);
----------------------------------------LOCAL DATABASE 4 INSERTS --------------------------------------------
--check the inserts as per the mappings that are made
INSERT INTO Book_Inventory (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (393019217, '"Surely youre joking, Mr. Feynman" : adventures of a curious character', 'Feynman, Richard Phillips', 1985, 50, 'Biography', 'Joking, Feynman',	'New York : W.W. Norton', 10);
INSERT INTO Book_Inventory  (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (201021153,	'The Feynman lectures on physics', 'Feynman, Richard Phillips',	1963, 40,	'Non-Fiction', 'Feynman, Physics', 'London : Addison-Wesley', 8);
INSERT INTO Book_Inventory  (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (978034581,	'12 Rules for Life: An Antidote to Chaos',	'Jordan B. Peterson', 2018,30,	'Non Fiction', 'Life, Chaos',	'Toronto : Random House Canada', 9);
INSERT INTO Book_Inventory  (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (811858049,	'Lets Make Cookies',	'Elinor Klivans',	2007, 20,	'Non Fiction', 'Cooking, Baking, Cookies',	'Chronicle Books',5);
INSERT INTO Book_Inventory  (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (1551301474,	'Richard Lionheart, the Crusader King',	'W. Gordon West',	2000, 25,	'Biography','Richard Lionheart, King', 'Canadian Scholars Press',2);
INSERT INTO Book_Inventory  (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (750663197,	'Strategic Operations Management',	'Steve Brown',	2005, 55,	'Business Non-Fiction', 'Management, Operations',	'Butterworth-Heinemann', 10);
INSERT INTO Book_Inventory  (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (1558583998,	'The Sleeping Beauty',	'Jacob Grimm',	1995, 10,	'Fiction', 'Fantasy, Beauty, Sleeping',	'NorthSouth',30);
INSERT INTO Book_Inventory  (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (595657052,	'Dreams Happen Only When Youre Sleeping',	'M. Shay',	2003, 35,	'Literature', 'Dreams, Sleep',	'iUniverse', 7);
INSERT INTO Book_Inventory  (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (865734909,	'The Painted Wall',	'Sasha Cohen',	2001, 30,	'Biography', 'Sasha, Paint',	'Quarry Books', 8);
INSERT INTO Book_Inventory  (ISBN, Title, Authors, Edition, Price_Book, Category, Keywords, Publisher, Quantity) VALUES (1842156926,	'Paint Finishes (Do it Yourself)',	'Sasha Cohen',	2002, 25,	'Do it yourself', 'Paint, Sasha',	'Southwater Publishing', 8);

INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1000,	'Toosie Slide',	'Drake',	2020,	30,	'Hip-Hop',	'Drake, Hip-Hop',	'OZ',	50);
INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1001,	'Music',	'Madonna',	2000,	25,	'Pop',	'Madonna, Pop',	'Warner Records/Maverick',	40);
INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1002,	'High Off Life	Future', 'Drake',	2020,	35,	'Hip-Hop',	'Future, Drake',	'Chalice',	10);
INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1003,	'Future Nostalgia',	'Dua Lipa',	2020,	30,	'Pop',	'Dua, Lipa, Nostalgia',	'Warner Records',	3);
INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1004,	'Stuck with U',	'Ariana Grande, Justin Bieber',	2001,	25,	'Pop',	'Stuck, Ariana, Grande, Justin', 	'Warner Records/Maverick',	48);
INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1005,	'Certified Hitmaker',	'Lil Mosey',	2005,	20,	'Retro',	'Lil, Hitmaker',	'Interscope Records',	69);
INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1006,	'Please Excuse Me For Being Antisocial',	'Roddy Ricch',	2008,	20,	'Hip-Hop',	'Antisocial, Roddy',	'ATL Jacob',	46);
INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1007,	'After Hours	The Weeknd', 'ABC',	2020,	30,	'Contemporary',	'Weekend, Hours',	'XO', 0);
INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1008,	'Where the Light Is	Surfaces',	'ABC', 2007,	30,	'Acoustic',	'Light, Surfaces',	'John Mayers',	39);
INSERT INTO MusicCD_Inventory  (CD_ID, Title, Artists, Release_Year, Price_CD, Category, Keywords, Recording_Company, Quantity) VALUES (1009,	'Birds In The Trap Sing McKnight',	'Travis Scott',	2016,	27,	'Hip-Hop',	'Birds, Trap, Travis, Scott',	'Grand Hustle Records',	38);

INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Jack Quick', '10 Main St', 'Austin', 'Texas', 'USA', 3987654378);
INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Joe Williams', '20 Plenty St', 'Rockville', 'Virginia', 'USA', 7685945689);
INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Marie Jones','101 Main St', 'Elkridge', ' West Virginia', 'USA', 6574930456);
INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Pam Wilson', '108 Main St', 'Los Angeles', 'California', 'USA',5785947689);
INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Kumar Rao', '20 Main St', 'Parlier', 'California', 'USA',7687595689);
INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Mary Slim', '90 Plenty St', 'Modesto', 'Vriginia', 'USA',4565945689);
INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Jude Bigbelly', '101 Main St', 'Stockton', 'California', 'USA',5409845689);
INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Pamela Reddy', '107 Main St','Reston', 'Virginia', 'USA',7686945689);
INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Ann Phat', '30 Main St', 'Tujunga', 'Delaware', 'USA',5789945689);
INSERT INTO LDB4_Customer (Customer_ID, Name, Address, City, State, Country, Phone_Number) VALUES (LDB4_Customer_ID_seq.nextval, 'Jenny Ross', '40 Plenty St', 'San Diego', 'California', 'USA',8945945689);

INSERT INTO Book_Order (Order_ID_B, Customer_ID, ISBN, Quantity_Purchase, Total_Price) VALUES ( 900001, 50004, 201021153, 2, 80);
INSERT INTO Book_Order (Order_ID_B, Customer_ID, ISBN, Quantity_Purchase, Total_Price) VALUES ( 900002, 50009, 978034581, 1, 30);
INSERT INTO Book_Order (Order_ID_B, Customer_ID, ISBN, Quantity_Purchase, Total_Price) VALUES ( 900003, 50001, 201021153, 4, 160);
INSERT INTO Book_Order (Order_ID_B, Customer_ID, ISBN, Quantity_Purchase, Total_Price) VALUES ( 900004, 50004, 393019217, 3, 150);
INSERT INTO Book_Order (Order_ID_B, Customer_ID, ISBN, Quantity_Purchase, Total_Price) VALUES ( 900005, 50007, 865734909, 1, 30);
INSERT INTO Book_Order (Order_ID_B, Customer_ID, ISBN, Quantity_Purchase, Total_Price) VALUES ( 900006, 50006, 1558583998, 6, 60);
INSERT INTO Book_Order (Order_ID_B, Customer_ID, ISBN, Quantity_Purchase, Total_Price) VALUES ( 900007, 50005, 201021153, 4, 160);

INSERT INTO Music_CD_Order (Order_ID_M, Customer_ID, CD_ID, Quantity_Purchase, Total_Price) VALUES (900007, 50008, 1002, 1, 35);
INSERT INTO Music_CD_Order (Order_ID_M, Customer_ID, CD_ID, Quantity_Purchase, Total_Price) VALUES (900008, 50004, 1003, 1, 30);
INSERT INTO Music_CD_Order (Order_ID_M, Customer_ID, CD_ID, Quantity_Purchase, Total_Price) VALUES (900009, 50009, 1009, 3, 81);
INSERT INTO Music_CD_Order (Order_ID_M, Customer_ID, CD_ID, Quantity_Purchase, Total_Price) VALUES (900010, 50009, 1001, 4, 100);
INSERT INTO Music_CD_Order (Order_ID_M, Customer_ID, CD_ID, Quantity_Purchase, Total_Price) VALUES (900011, 50002, 1002, 2, 70);
INSERT INTO Music_CD_Order (Order_ID_M, Customer_ID, CD_ID, Quantity_Purchase, Total_Price) VALUES (900012, 50005, 1002, 1, 35);


-----------------------------------META DATA MAPPING INSERTS -------------------------------------------
INSERT INTO  metadata_mappings VALUES('Customer','LDB1_customer','Table','LDB1_customer','LDB2_customers','Table','LDB2_customers','LDB3_customers','Table','LDB3_customers','LDB4_Customer','Table','LDB4_Customer');
INSERT INTO  metadata_mappings VALUES('Customer_ID','c_id','number','c_id','cid','number','cid','c_id','number','c_id','Customer_ID','number','Customer_ID');
INSERT INTO  metadata_mappings VALUES('Customer_Name','c_name','varchar2','c_name','cname','varchar2','cname','cust_name','varchar2','cust_name','Name','Varchar2','Name');
INSERT INTO  metadata_mappings VALUES('Customer_Address','c_address','varchar2','c_address','address','varchar2','address','adress','varchar2','adress','Address','varchar2','concat(concat(concat(Address,City),State),Country) as LDB4_Customer_address');
INSERT INTO  metadata_mappings VALUES('Customer_Phonenumber','c_phonenumber','varchar2','c_phone_number','phone','varchar2','phone','phone','varchar2','phone','Phone_number','number','To_Char(Phone_number)');
INSERT INTO  metadata_mappings VALUES('Customer_Email','c_email','varchar2','c_email','email','varchar2','email','email','varchar2','email','NULL','NULL','NULL');
INSERT INTO  metadata_mappings VALUES('cc_number','NULL','NULL','NULL','NULL','NULL','NULL','cc_number','varchar2','cc_number','NULL','NULL','NULL');

--select (concat(concat(concat(Address,City),State),Country)) as LDB4_Customer from LDB4_Customer;
INSERT INTO  metadata_mappings VALUES('Customer_City','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','City','varchar2','City');
INSERT INTO  metadata_mappings VALUES('Customer_State','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','State','varchar2','State');
INSERT INTO  metadata_mappings VALUES('Customer_Country','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','Country','varchar2','Country');

-- product table mapping inserts
INSERT INTO  metadata_mappings VALUES('Product','LDB1_product','Table','LDB1_product','LDB2_products','Table','LDB2_products','LDB3_product','Table','LDB3_product','MusicCD_Inventory','Table','MusicCD_Inventory');
INSERT INTO  metadata_mappings VALUES('Product_ID','p_id','number','p_id','pid','number','pid','p_id','number','p_id','CD_ID','number','CD_ID');
INSERT INTO  metadata_mappings VALUES('Product_Name','p_name','varchar2','p_name','pname','varchar2','pname','p_name','varchar2','p_name','Title','varchar2','Title');
INSERT INTO  metadata_mappings VALUES('Product_Description','p_description','varchar2','p_description','pdescription','varchar2','pdescription','p_description','varchar2','p_description','NULL','NULL','NULL');
INSERT INTO  metadata_mappings VALUES('Product_Quantity','p_quantity','number','p_quantity','quantity','number','quantity','p_quantity','number','p_quantity','Quantity','number','Quantity');
INSERT INTO  metadata_mappings VALUES('Product_Price','p_price','float','p_price','price','float','price','p_price','float','p_price','Price_CD','number','Price_CD');
INSERT INTO  metadata_mappings VALUES('Product_Author','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','Artists','varchar2','Artists');
INSERT INTO  metadata_mappings VALUES('Product_Release','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','Release_Year','number','Release_Year');
INSERT INTO  metadata_mappings VALUES('Product_Category','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','Category','varchar2','Category');
INSERT INTO  metadata_mappings VALUES('Product_Keywords','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','Keywords','varchar2','Keywords');
INSERT INTO  metadata_mappings VALUES('Product_Company','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','Recording_Company','varchar2','Recording_Company');

-- orders table mapping inserts
INSERT INTO Metadata_Mappings VALUES ('Orders', 'LDB1_orders', 'Table', 'LDB1_orders', 'LDB2_orders', 'Table', 'LDB2_orders', 'LDB3_orders', 'Table', 'LDB3_orders', 'Music_CD_Order', 'Table', 'Music_CD_Order');
INSERT INTO Metadata_Mappings VALUES ('Order_ID', 'o_id', 'number', 'o_id', 'orid', 'number', 'orid', 'o_id', 'number', 'o_id', 'Order_ID_M', 'number', 'Order_ID_M');
INSERT INTO Metadata_Mappings VALUES ('Order_Date', 'o_date', 'DATE', 'o_date', 'odate', 'DATE', 'odate', 'ord_date', 'DATE', 'o_date', 'NULL', 'NULL', 'NULL');
INSERT INTO Metadata_Mappings VALUES ('Order_TotalPrice', 'total_price', 'FLOAT', 'total_price', 'total_price', 'FLOAT', 'total_price', 'total_price', 'FLOAT', 'total_price', 'Total_Price', 'number', 'Total_Price');
INSERT INTO Metadata_Mappings VALUES ('Order_Quantity', 'o_quantity', 'number', 'o_quantity', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'Quantity_Purchase', 'number', 'Quantity_Purchase');

-- Line_item table mapping inserts
INSERT INTO Metadata_Mappings VALUES ('LINE_ITEM', 'LDB1_line_item', 'Table', 'LDB1_line_item', 'LDB2_line_items', 'Table', 'LDB2_line_items', 'LDB3_line_item', 'Table', 'LDB3_line_item', 'NULL', 'NULL', 'dual');
INSERT INTO Metadata_Mappings VALUES ('LINEITEM_ID', 'l_id', 'number', 'l_id', 'lid', 'number', 'lid', 'l_id', 'number', 'l_id', 'NULL', 'NULL', 'NULL');
INSERT INTO Metadata_Mappings VALUES ('LINEITEM_QUANTITY', 'l_quantity', 'number', 'l_quantity', 'quantity_ordered', 'number', 'quantity_ordered', 'quantity', 'number', 'quantity', 'NULL', 'NULL', 'NULL');
INSERT INTO Metadata_Mappings VALUES ('UNIT_PRICE', 'NULL', 'NULL', 'NULL', 'lunit_price', 'FLOAT', 'lunit_price', 'unit_price', 'FLOAT', 'unit_price', 'NULL', 'NULL', 'NULL');
INSERT INTO Metadata_Mappings VALUES ('TOTAL_PRICE', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'total_price', 'FLOAT', 'total_price', 'NULL', 'NULL', 'NULL');

-- Books table mapping inserts
INSERT INTO Metadata_Mappings VALUES ('Books', 'NULL', 'NULL', 'dual', 'NULL', 'NULL', 'dual', 'NULL', 'NULL', 'dual', 'Book_Inventory', 'Table', 'Book_Inventory');
INSERT INTO Metadata_Mappings VALUES ('ISBN', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'ISBN', 'number', 'ISBN');
INSERT INTO Metadata_Mappings VALUES ('Title_Book', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'Title', 'Varchar2', 'Title');
INSERT INTO Metadata_Mappings VALUES ('Authors', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'Authors', 'Varchar2', 'Authors');
INSERT INTO Metadata_Mappings VALUES ('Edition', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'Edition', 'number', 'Edition');
INSERT INTO Metadata_Mappings VALUES ('Price_Book', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'Price_Book', 'number', 'Price_Book');
INSERT INTO Metadata_Mappings VALUES ('Category_Book', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'Category', 'Varchar2', 'Category');
INSERT INTO Metadata_Mappings VALUES ('Keywords_Book', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'Keywords', 'Varchar2', 'Keywords');
INSERT INTO Metadata_Mappings VALUES ('Publisher', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'Publisher', 'Varchar2', 'Publisher');
INSERT INTO Metadata_Mappings VALUES ('Quantity_Book', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'Quantity', 'number', 'Quantity');

--book order inserts
INSERT INTO  metadata_mappings VALUES('Book_Orders','NULL','NULL','dual','NULL','NULL','dual','NULL','NULL','dual','Book_Order','Table','Book_Order');
INSERT INTO  metadata_mappings VALUES('Book_OrderID','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','Order_ID_Book','number','Order_ID_B');
INSERT INTO  metadata_mappings VALUES('Purchase_Quantity','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','Quantity_Purchase','number','Quantity_Purchase');
INSERT INTO  metadata_mappings VALUES('Total_BookPrice','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL','Total_Price','number','Total_Price');

--select * from metadata_mappings;
------------------------------------------------------------KEYWORD LIST INSERTIONS--------------------------------------------
insert into keys_list values(Keyword_ID_seq.nextval,'create');
insert into keys_list values(Keyword_ID_seq.nextval,'primary key');
insert into keys_list values(Keyword_ID_seq.nextval,'insert');
insert into keys_list values(Keyword_ID_seq.nextval,'select');
insert into keys_list values(Keyword_ID_seq.nextval,'from');
insert into keys_list values(Keyword_ID_seq.nextval,'alter');
insert into keys_list values(Keyword_ID_seq.nextval,'add');
insert into keys_list values(Keyword_ID_seq.nextval,'distinct');
insert into keys_list values(Keyword_ID_seq.nextval,'update');
insert into keys_list values(Keyword_ID_seq.nextval,'set');
insert into keys_list values(Keyword_ID_seq.nextval,'delete');
insert into keys_list values(Keyword_ID_seq.nextval,'truncate');
insert into keys_list values(Keyword_ID_seq.nextval,'as');
insert into keys_list values(Keyword_ID_seq.nextval,'order by');
insert into keys_list values(Keyword_ID_seq.nextval,'asc');
insert into keys_list values(Keyword_ID_seq.nextval,'desc');
insert into keys_list values(Keyword_ID_seq.nextval,'between');
insert into keys_list values(Keyword_ID_seq.nextval,'where');
insert into keys_list values(Keyword_ID_seq.nextval,'and');
insert into keys_list values(Keyword_ID_seq.nextval,'or');
insert into keys_list values(Keyword_ID_seq.nextval,'not');
insert into keys_list values(Keyword_ID_seq.nextval,'limit');
insert into keys_list values(Keyword_ID_seq.nextval,'is null');
insert into keys_list values(Keyword_ID_seq.nextval,'drop');
insert into keys_list values(Keyword_ID_seq.nextval,'drop column');
insert into keys_list values(Keyword_ID_seq.nextval,'drop database');
insert into keys_list values(Keyword_ID_seq.nextval,'drop table');
insert into keys_list values(Keyword_ID_seq.nextval,'group by');
insert into keys_list values(Keyword_ID_seq.nextval,'having');
insert into keys_list values(Keyword_ID_seq.nextval,'in');
insert into keys_list values(Keyword_ID_seq.nextval,'join');
insert into keys_list values(Keyword_ID_seq.nextval,'union');
insert into keys_list values(Keyword_ID_seq.nextval,'all');
insert into keys_list values(Keyword_ID_seq.nextval,'any');
insert into keys_list values(Keyword_ID_seq.nextval,'case');
insert into keys_list values(Keyword_ID_seq.nextval,'if');
insert into keys_list values(Keyword_ID_seq.nextval,'elsif');
insert into keys_list values(Keyword_ID_seq.nextval,'end if');
insert into keys_list values(Keyword_ID_seq.nextval,'for');
insert into keys_list values(Keyword_ID_seq.nextval,'check');
insert into keys_list values(Keyword_ID_seq.nextval,'default');
insert into keys_list values(Keyword_ID_seq.nextval,'table');
-- delimiters are special cases in keywords which are initially treated as keywords for time being
insert into keys_list values(Keyword_ID_seq.nextval,' ');
insert into keys_list values(Keyword_ID_seq.nextval,';');
insert into keys_list values(Keyword_ID_seq.nextval,'''');
insert into keys_list values(Keyword_ID_seq.nextval,'""');
insert into keys_list values(Keyword_ID_seq.nextval,'=');
insert into keys_list values(Keyword_ID_seq.nextval,'>');
insert into keys_list values(Keyword_ID_seq.nextval,'<');
-- display the output of keywords table
--select * from keys_list;

--------------------------------------------OPERATIONS D1----------------------------------------------
-------------------------------------LOCAL DATA BASE 1------------------------------------------------
/*

--commit;

--question:1
--lists all the LDB1_orders
select * from LDB1_orders;

--question:2
--lists all the order details when given a unique identifier
select * from LDB1_orders where o_id=10;

--question:3
--Lists all LDB1_orders of a particular LDB1_customer 
select * from LDB1_orders  where c_id=5;

--question:4
--Lists each order with at least  3 different items 
select LDB1_orders.o_id,LDB1_orders.o_date, LDB1_orders.total_price,LDB1_orders.o_quantity,
LDB1_customer.c_id,LDB1_customer.c_name from LDB1_orders,LDB1_customer 
where LDB1_customer.c_id=LDB1_orders.c_id 
and o_id in (select o_id  from LDB1_line_item 
group by o_id having count(*)>=3);

--question:5
--Lists all LDB1_orders  that have been ordered after a specific date
select * from LDB1_orders where o_date> date '2022-09-02';

--question:6
--Lists the LDB1_customer name and a total number of LDB1_orders by that LDB1_customer
select c_name, count(*) as total_LDB1_orders from LDB1_orders,LDB1_customer where LDB1_orders.c_id = LDB1_customer.c_id group by c_name;

commit;


--------------------------------------LOCAL DATABASE 2--------------------------------------------------
-------------Query 1. List all LDB2_orders in the database  -------------
SELECT * FROM LDB2_orders;


-------------Query 2. List all details of an LDB2_orders, given its unique identifier--------------
SELECT * FROM LDB2_orders
where orid= 40;


------------Query 3. List all LDB2_orders of a particular LDB2_customers------------
select * 
from LDB2_orders o, LDB2_customers c
where o.cid = c.cid and c.cid = 1;


------------Query 4. List each LDB2_orders with at least  3 different items-----------
select orid,LDB2_orders.cid,odate,LDB2_customers.cname
from LDB2_orders,LDB2_customers
where orid in(select orid from LDB2_line_items 
group by orid
having count(lid)>=3) and LDB2_orders.cid=LDB2_customers.cid;


------------Query 5. List all LDB2_orders  that have been LDB2_ordersed after a specific date of your choice-----------
select * 
from LDB2_orders,LDB2_line_items
where odate>date'2022-09-09' and LDB2_orders.orid=LDB2_line_items.orid;


-----------Query 6. List the LDB2_customers name and a total number of LDB2_orders by that LDB2_customers---------------
select cname, count(LDB2_orders.orid) as total_LDB2_orders
from LDB2_orders,LDB2_customers 
where LDB2_orders.cid=LDB2_customers.cid
group by cname;

-----------------------------------------LOCAL DATABASE 3---------------------------------------------
--------------------------------------query 1-------------------------------------
--1-----------------Displays all the LDB3_orders in the DB)----------------------------
select * from LDB3_orders;

--------------------------------------query 2-----------------------------------------
--2----------List all details of an order, given its unique identifier----------------

select * from LDB3_orders,LDB3_line_item where LDB3_orders.o_id=1 and LDB3_orders.o_id=LDB3_line_item.o_id;
--if just expecting the results only from LDB3_orders table just writing the below query will give the expected output
--select * from LDB3_orders where o_id=1;


-- order id 1 contains three different items in the cart which were diplayed as the output of this query

--------------------------------------query 3--------------------------------------
-----------------List all LDB3_orders of a particular customer--------------------------- 
select * from LDB3_orders,LDB3_customers where LDB3_customers.c_id=1 and LDB3_orders.c_id=LDB3_customers.c_id;


-- customer 1 has two LDB3_orders in the DB with order id 1 and 4 on the same date.
---------------------------------------query 4-------------------------------------
---------4.	List each order with at least  3 different items ---------------------

select o_id,LDB3_orders.c_id,ord_date,LDB3_customers.cust_name
from LDB3_orders,LDB3_customers
where o_id in(select o_id from LDB3_line_item 
group by o_id
having count(l_id)>=3) and LDB3_orders.c_id=LDB3_customers.c_id;


------------------------------------------query 5----------------------------------
--5.	List all LDB3_orders  that have been ordered after a specific date of your choice--
select * 
from LDB3_orders,LDB3_line_item
where ord_date>date'2022-09-15' and LDB3_orders.o_id=LDB3_line_item.o_id;

-----------------------------------------query 6-----------------------------------
----6.	List the customer name and a total number of LDB3_orders by that customer--------

select cust_name,count(LDB3_orders.o_id) as total_LDB3_orders
from LDB3_orders,LDB3_customers
where LDB3_orders.c_id=LDB3_customers.c_id 
group by cust_name;

--------------------------------------------LOCAL DATABASE 4 OPERATIONS---------------------
----------------------------------------------------------------------------
--1.	List all products in inventory (just a few columns for each product)
----------------------------------------------------------------------------

SELECT Book_Inventory.TITLE, Book_Inventory.AUTHORS, Book_Inventory.QUANTITY
FROM Book_Inventory
union ALL 
SELECT MusicCD_Inventory.TITLE, MusicCD_Inventory.Artists,  MusicCD_Inventory.QUANTITY
FROM MusicCD_Inventory;

-----------------------------------------------------------------
--2.	List all details of a product given its unique identifier
-----------------------------------------------------------------

SELECT *
FROM Book_Inventory
WHERE ISBN = 201021153;


-------------------------------------------------------------
--3.	List each product(s) of a particular author or artist
-------------------------------------------------------------
SElect *
FROM Book_Inventory
WHERE Authors = 'Feynman, Richard Phillips';

--------------------------------------------------
--4.	List each product with at least quantity 4 
--------------------------------------------------

SELECT Book_Inventory.TITLE, Book_Inventory.AUTHORS, Book_Inventory.QUANTITY
FROM Book_Inventory
WHERE QUANTITY >= 4
union ALL 
SELECT MusicCD_Inventory.TITLE, MusicCD_Inventory.Artists,  MusicCD_Inventory.QUANTITY
FROM MusicCD_Inventory
WHERE QUANTITY >= 4;

----------------------------------------------
--5.	List each product that is out of stock
----------------------------------------------

SELECT Book_Inventory.TITLE, Book_Inventory.AUTHORS, Book_Inventory.QUANTITY
FROM Book_Inventory
WHERE QUANTITY = 0
union ALL 
SELECT MusicCD_Inventory.TITLE, MusicCD_Inventory.Artists,  MusicCD_Inventory.QUANTITY
FROM MusicCD_Inventory
WHERE QUANTITY = 0;

-----------------------------------------------------------------
--6.	List each product that is  bought by at least 3 customers
-----------------------------------------------------------------

select Book_Order.ISBN as Book_or_CD_ID, count(*) as Order_count
from Book_Order
group by Book_Order.ISBN
having count(Book_Order.ISBN)>=3
UNION ALL
select Music_CD_Order.CD_ID, count(*)
from Music_CD_Order
group by Music_CD_Order.CD_ID
having count(Music_CD_Order.CD_ID)>=3;	 

*/
/


-- This procedure is used to find the mapping from the Global_Representation table
-- This will be called from if_keyword procedure if the given token is not a keyword 
-- The splitted token from find_token is passed as input for the procedure 
create or replace procedure check_mappings(token in varchar,type_of_delimeter in out varchar,str1 in out varchar,str2 in out varchar,str3 in out varchar,str4 in out varchar)
is
-- considering the 4 local varibles such as GR,Mapping_LDB1,Mapping_LDB2,Mapping_LDB3,Mapping_LDB4 to hande the outputs
GR Varchar(100);
Mapping_LDB1 Varchar(100);
Mapping_LDB2 Varchar(100);
Mapping_LDB3 Varchar(100);
Mapping_LDB4 Varchar(100);
del_type varchar(100):=type_of_delimeter;
LDB1_str1 varchar(1000):=str1;
LDB2_str2 varchar(1000):=str2;
LDB3_str3 varchar(1000):=str3;
LDB4_str4 varchar(1000):=str4;
--type_of_delimeter varchar(100);
begin
-- an implicit cursor to obtain the results that matches the input token(Nothing but an attribute)
select Global_Representation,Mapping_LocalDB1,Mapping_LocalDB2,Mapping_LocalDB3,Mapping_LocalDB4 into GR,Mapping_LDB1,Mapping_LDB2,Mapping_LDB3,Mapping_LDB4 from Metadata_mappings where token=Global_Representation;
-- Handling the output 
--dbms_output.put_line(token ||'   '||'(attribute) '||'   ' ||'Global representation: '||'   '||GR ||'   '||'DB1: '||'     '||Mapping_LDB1 ||'    '||'DB2: '||'   '||Mapping_LDB2 ||'     '||'DB3: '||'      '||Mapping_LDB3 ||'   '||'DB4: '||'    '||Mapping_LDB4);
LDB1_str1:=concat(concat(LDB1_str1,Mapping_LDB1),del_type);
LDB2_str2:=concat(concat(LDB2_str2,Mapping_LDB2),del_type);
LDB3_str3:=concat(concat(LDB3_str3,Mapping_LDB3),del_type);
LDB4_str4:=concat(concat(LDB4_str4,Mapping_LDB4),del_type);
str1:=LDB1_str1;
str2:=LDB2_str2;
str3:=LDB3_str3;
str4:=LDB4_str4;
exception
when no_data_found then
-- Usually there won't be any mapping for the values hence just printing the token obtained as it is using exception handling
--dbms_output.put_line(token);
LDB1_str1:=concat(concat(LDB1_str1,token),del_type);
LDB2_str2:=concat(concat(LDB2_str2,token),del_type);
LDB3_str3:=concat(concat(LDB3_str3,token),del_type);
LDB4_str4:=concat(concat(LDB4_str4,token),del_type);
str1:=LDB1_str1;
str2:=LDB2_str2;
str3:=LDB3_str3;
str4:=LDB4_str4;
--dbms_output.put_line('could not find any mappings');
end;

/

--This procedure is used to check whether the given input token is a keyword or not
-- The splitted token from find_token is taken as input for the procedure.
create or replace procedure if_keyword(token in varchar,type_of_delimeter in out varchar,str1 in out varchar,str2 in out varchar,str3 in out varchar,str4 in out varchar)
is
-- taking an varible t to handle the outputs of implicit cursor 
t varchar(100);
del_type varchar(100):=type_of_delimeter;
LDB1_str1 varchar(1000):=str1;
LDB2_str2 varchar(1000):=str2;
LDB3_str3 varchar(1000):=str3;
LDB4_str4 varchar(1000):=str4;
begin
--implicit cursor to obtain the keyword from Keyword table(Keys_list)
select keyword into t from keys_list where token=KEYWORD;
--if the above condition is true printing that the given token is a keyword
--dbms_output.put_line(t||'      '||'Keyword');
LDB1_str1:=concat(concat(LDB1_str1,t),del_type);
LDB2_str2:=concat(concat(LDB2_str2,t),del_type);
LDB3_str3:=concat(concat(LDB3_str3,t),del_type);
LDB4_str4:=concat(concat(LDB4_str4,t),del_type);
--dbms_output.put_line(LDB1_str1);
--dbms_output.put_line(LDB2_str2);
--dbms_output.put_line(LDB3_str3);
--dbms_output.put_line(LDB4_str4);
str1:=LDB1_str1;
str2:=LDB2_str2;
str3:=LDB3_str3;
str4:=LDB4_str4;
--dbms_output.put_line(str1);
--Handling the exceptions
exception
when no_data_found then
--if the given word is not a keyword it will checj whether it is an attribute or not
check_mappings(token,type_of_delimeter,str1,str2,str3,str4);
--dbms_output.put_line('no keyword is found');
END;
/
create or replace procedure prc_show_rows (table_in in varchar2 )
is
-- a cusor is used get all the coulumns that are availble from the table using all_tab_coulumns
  CURSOR c1 IS SELECT * FROM all_tab_columns WHERE table_name = upper (table_in);
  type table_output is table of varchar2(32000);  -- this can be a problem with large rows
  work table_output;
  v_statement varchar2(2000);
  drop_table_statement varchar(1000);
BEGIN
--drop_table_statement:='drop table subquery_results;';
  --
  v_statement := 'select ';
  --
  FOR j IN c1 LOOP
    v_statement := v_statement || j.column_name || ' || '' '' || ';  -- may be you need some more formatting with appropriate to_char clauses
  END LOOP;
  --
  v_statement := rtrim ( v_statement, ' |''') || ' from ' || table_in;
  --
  dbms_output.put_line ( v_statement ); -- not necessary, only for testing
  --
  execute immediate v_statement
     bulk collect INTO work;
  --
  for i in 1..work.COUNT loop
    dbms_output.put_line(work(i));
  end loop;
  exception 
  when no_data_found then
  dbms_output.put_line('The table data could not be displayed');
END;

/
create or replace procedure execute_strings(str1 in varchar,str2 in varchar,str3 in varchar,str4 in varchar)
is
-- queries 1-4 will help to remove the semicolon from the input strings to execute the union statement
query_1 varchar(1000):=regexp_substr(str1,'[^;]+' );
query_2 varchar(1000):=regexp_substr(str2,'[^;]+' );
query_3 varchar(1000):=regexp_substr(str3,'[^;]+' );
query_4 varchar(1000):=regexp_substr(str4,'[^;]+' );
table_name varchar(100):='subquery_results';
--create table and drop table statements for the table subquery results are executed using drop_table and create_table_statement variables
drop_table_statement varchar(1000);
create_table_statement varchar(1000);
begin
--dbms_output.put_line(query_1);
--dbms_output.put_line(query_2);
-- creation of table with union of strings
create_table_statement:='create table subquery_results as '||query_1 ||' union ' ||query_2|| ' union ' ||query_3|| ' union '||query_4;
dbms_output.put_line(create_table_statement);
EXECUTE IMMEDIATE create_table_statement;
-- passing the table name to view the results
prc_show_rows(table_name);
drop_table_statement:='drop table subquery_results';
execute immediate drop_table_statement;
exception when no_data_found then 
dbms_output.put_line('please check back the global queries to execute the strings');
end;

/

/*
declare 
table_name  varchar(100):='subquery_results';
drop_table_statement varchar(1000);
create_table_statement varchar(1000);
query_1 varchar(1000):='select LDB1_customer.c_name from LDB1_customer,LDB1_orders where LDB1_customer.c_id=LDB1_orders.c_id and total_price>50';
query_2 varchar(1000):='select LDB2_customers.cname from LDB2_customers,LDB2_orders where LDB2_customers.cid=LDB2_orders.cid and total_price>50';
query_3 varchar(1000):='select LDB3_customers.cust_name from LDB3_customers,LDB3_orders where LDB3_customers.c_id=LDB3_orders.c_id and total_price>50';
begin
drop_table_statement:='drop table subquery_results';
execute immediate drop_table_statement;
create_table_statement:='create table subquery_results as '||query_1 ||' union ' ||query_2|| ' union ' ||query_3;
dbms_output.put_line(create_table_statement);
EXECUTE IMMEDIATE create_table_statement;
prc_show_rows(table_name);
end;
*/





--This procedure is useful in splitting the given input query into tokens(dividing the query until it finds a delimeter)
create or replace procedure find_token(Global_query in varchar)
is
--varibles to handle the results
--var_type indicates the type of delimters that will be extracted from regexp_substr function
var_type varchar(100);
str1 varchar(1000):='';
str2 varchar(1000):='';
str3 varchar(1000):='';
str4 varchar(1000):='';
--pos and pos_count are two intermidiate varibles that are used calculate the length and identify the starting position to observe the delimeters in the Instr and substr functions
pos number:=0;
pos_count number:=1;
--to count on next occurances 
occurance_of_delimeter number:=1;
--token varible that will be handling the output of the procedure(The input query is splitted into tokens which are stored in variable token)
token varchar(100);
begin 
-- initially var_type is set as an empty space so that the loop will be proceed and the loop breaks at the point when it encounters the semicolon delimeter
var_type:=' ';
--while(condition i.e when it is not eqaul to semicolon) execute the loop
while (var_type!=';') loop 
--capturing the delimeter using regexp_substr
--Regexp_substr(inputquery,matched string,from 1 st position, n th ocuurance)
var_type:=REGEXP_SUBSTR(Global_query, '[ |;|=|>|<|,|.]',1,occurance_of_delimeter);
--observing the type of delimeter 
--dbms_output.put_line('type of delimeter'||var_type);  
--observing where the delimeter occurs using instr function, instr return a value
--instr(input query,type of delimeter ocuuring,start position: These need to be updated to capture the next string)
pos_count:=instr(Global_query,var_type,(pos+1));
--observing the position of delimeter that was obtained
--dbms_output.put_line('position of delimeter'||pos_count);
--obtaining the token from the input query using substr
--substr(input query,starting position,length of the token(pos_count:position of next delimeter, pos:position of last delimter subtraction of them gives the length of token)
token:=substr(Global_query,(pos+1),(pos_count-pos-1));
--printing the obtained token
--dbms_output.put_line(token);
--checking whether the given token is keyword or not 
if_keyword(token,var_type,str1,str2,str3,str4);
--updating the values of pos and ocuurance of delimeter to next values
pos:=pos_count;
occurance_of_delimeter:=occurance_of_delimeter+1;
--end the loop when meet with exit condition
--writing the string generator code execution over here
-- can we take a varible value and update based on the return from previous functions?
end loop;
dbms_output.put_line(str1);
dbms_output.put_line(str2);
dbms_output.put_line(str3);
dbms_output.put_line(str4);
execute_strings(str1,str2,str3,str4);
end;
/

--executing few queries 
--tried to join customers table and orders table 


-- queries based on the scenarioes

--checking the output for book_order table
--exec find_token('select Order_ID_Book from Book_Order where Order_Quantity>5;');
--tried combining the orders table and line_items table 
--exec find_token('select Orders.Order_ID,LINE_ITEM.LINEITEM_ID,LINE_ITEM.TOTAL_PRICE from Orders,LINE_ITEM where LINE_ITEM.Order_ID=Orders.Order_ID;');


--1)Search for all books that have been authored by a specific author of your choice
exec find_token('Select ISBN as ID_B,Title_Book as B_Title,Publisher as B_Publisher,Quantity_Book as B_Quantity from Books where Authors = ''Steve Brown'';');
--2)Search for all CDs that feature a specific artist
exec find_token('Select Product_ID as P_ID,Product_Name as P_Name,Product_Release as P_rel,Product_Price as P_Price,Product_Quantity as P_Quantity FROM Product WHERE Product_Author =''Drake'';');

--3)Display a few columns of your choice from existing orders in the local databases
exec find_token('select Customer_ID,Order_ID,Order_TotalPrice FROM Orders;');

--4)Search for each product with at least quantity N (you choose what N is)
exec find_token('Select Product_Name,Product_Quantity from Product WHERE Product_Quantity > 3;');

--5)Display all orders of a particular customer
exec find_token('select Customer_Name,Customer.Customer_ID,Order_ID,Order_TotalPrice from Orders,Customer WHERE Customer.Customer_ID=Orders.Customer_ID and Customer.Customer_ID=2;');

--6)Create your own scenarios, showcasing how great your system is
exec find_token('select Book_OrderID As B_ID,Total_BookPrice AS B_Price from Book_Orders where Purchase_Quantity>5;');

--How the algorithm was able to perform when there are missing attributes in the other DB's(Credit card was just present in db3)
exec find_token('select Customer.Customer_Name as custs_name,cc_number as  creditcard_number from Customer;');

--How the algorithm was able to convert or was able to handle the data of different types.(Phonenumber was a number in local database 4 where as it was string in other data bases
exec find_token('select Customer.Customer_Name as cust_name,Customer_Phonenumber as custs_phone_number,Customer_Address from Customer,Orders where Customer.Customer_ID=Orders.Customer_ID and Order_TotalPrice>50;');



--select * from metadata_mappings;
