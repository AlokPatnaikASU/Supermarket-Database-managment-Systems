create database supermarket;
use supermarket;

create table Branch
(Branch_ID varchar(10) PRIMARY KEY ,
city varchar(100));
drop table branch;

INSERT INTO Branch(Branch_ID, city)
SELECT distinct Branch,city
FROM  supermarket_sales;

select * from Branch;

create table Products
(Productline varchar(100),
Unitprice varchar(20),
Product_Id varchar(10) Primary key);
drop table products;

INSERT INTO Products(Productline,Unitprice,Product_Id)
SELECT Productline,Unitprice,Product_Id
FROM  supermarket_sales;

create table Customers
(Gender varchar(50),
customertype varchar(100),
customer_Id varchar(50) Primary key);
drop table customers;

INSERT INTO Customers(Gender,customertype,customer_Id)
SELECT Gender,customertype,customer_Id
FROM  supermarket_sales;

select * from  customers;
drop table customers;
create table Invoice
(InvoiceID varchar(100) PRIMARY KEY,
Quantity varchar(20),
Tax varchar (20),
Date_info varchar(50),               
Time_info varchar(50),
customer_Id varchar(50),
Product_Id varchar(10),
Branch_ID varchar(10),
cogs varchar(100),
Payment varchar(100),
rating varchar (100),
FOREIGN KEY (customer_Id) REFERENCES customers(customer_Id),
FOREIGN KEY (product_Id) REFERENCES Products(Product_Id),
FOREIGN KEY (branch_Id) REFERENCES Branch(Branch_ID));
drop table invoice;

INSERT INTO Invoice (InvoiceID,Quantity,Tax,Date_info,Time_info,customer_Id,Product_Id,Branch_ID,cogs,Payment,rating)
select InvoiceID,Quantity,Tax,Date,Time,customer_Id,Product_Id,Branch,cogs,Payment,rating
from supermarket_sales;

select distinct(InvoiceID) from invoice;

select * from i;

select* from supermarket_sales;
select * from branch;
select* from customers;
select* from invoice;
select * from products;


-- Query 1
SELECT SUM(cogs) 
AS TOTAL,Branch_ID from invoice 
inner join branch on Branch.Branch_ID = invoice.Branch_ID 
group by Branch_ID;

	-- Query 2
    Select branch_id, avg(rating) from invoice group by branch_id;
    
 -- Query 3  
 select productline from products inner join 
 invoice on products.product_id = invoice.product_id group by productline having sum(cogs)=
 (select max(total)from(SELECT SUM(cogs) as total,productline  
 FROM invoice inner join products on products.product_id = invoice.product_id GROUP BY productline)as subquery );
 