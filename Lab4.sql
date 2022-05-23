-- Create a E-Commerece website database  
CREATE DATABASE ECommerce_Website;
USE ECommerce_Website;

-- Create Supplier Table
CREATE TABLE supplier (
    SUPP_ID INT,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL,
    PRIMARY KEY (SUPP_ID)
);

-- Create Customer Table
CREATE TABLE customer (
    CUS_ID INT,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR,
    PRIMARY KEY (CUS_ID)
);

-- Create Category Table
CREATE TABLE category (
    CAT_ID INT,
    CAT_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY (CAT_ID)
);

-- Create Product Table
CREATE TABLE product (
    PRO_ID INT,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    PRIMARY KEY (PRO_ID),
    FOREIGN KEY (CAT_ID)
        REFERENCES category (CAT_ID)
);

-- Create Supplier Pricing Table
CREATE TABLE supplier_pricing (
    PRICING_ID INT,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT DEFAULT 0,
    PRIMARY KEY (PRICING_ID),
    FOREIGN KEY (PRO_ID)
        REFERENCES product (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES supplier (SUPP_ID)
);

-- Create Orders Table
CREATE TABLE orders (
    ORD_ID INT,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    PRIMARY KEY (ORD_ID),
    CONSTRAINT fk_cust FOREIGN KEY (CUS_ID)
        REFERENCES customer (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES supplier_pricing (PRICING_ID)
);

-- Create Rating Table
CREATE TABLE rating (
    RAT_ID INT,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    PRIMARY KEY (RAT_ID),
    FOREIGN KEY (ORD_ID)
        REFERENCES orders (ORD_ID)
);

-- Inserting data into Supplier Table
INSERT INTO supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
VALUES 
   (1,"Rajesh Retails","Delhi","1234567890"),
   (2,"Appario Ltd.","Mumbai","2589631470"),
   (3,"Knome products","Banglore","9785462315"),
   (4,"Bansal Retails","Kochi","8975463285"),
   (5,"Mittal Ltd.","Lucknow","7898456532");

-- -- Inserting data into Customer Table   
INSERT INTO customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
VALUES 
   (1,"AAKASH","9999999999","DELHI",'M'),
   (2,"AMAN","9785463215","NOIDA",'M'),
   (3,"NEHA","9999999999","MUMBAI",'F'),
   (4,"MEGHA","9994562399","KOLKATA",'F'),
   (5,"PULKIT","7895999999","LUCKNOW",'M');

-- Inserting data into Category Table
INSERT INTO category(CAT_ID,CAT_NAME)
VALUES 
   (1,"BOOKS"),
   (2,"GAMES"),
   (3,"GROCERIES"),
   (4,"ELECTRONICS"),
   (5,"CLOTHES");

-- Inserting data into Product Table
INSERT INTO product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
VALUES 
   (1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2),
   (2,"TSHIRT","SIZE-L with Black, Blue and White variations",5),
   (3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4),
   (4,"OATS","Highly Nutritious from Nestle",3),
   (5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1),
   (6,"MILK","1L Toned MIlk",3),
   (7,"Boat Earphones","1.5Meter long Dolby Atmos",4),
   (8,"Jeans","Stretchable Denim Jeans with various sizes and color",5),
   (9,"Project IGI","compatible with windows 7 and above",2),
   (10,"Hoodie","Black GUCCI for 13 yrs and above",5),
   (11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1),
   (12,"Train Your Brain","By Shireen Stephen ",1);

-- Inserting data into Supplier Pricing Table
/* I have inserted random data from row 6 to 16 to support the foreign key constraint */
INSERT INTO supplier_pricing(PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE)
VALUES 
   (1,1,2,1500),
   (2,3,5,30000),
   (3,5,1,3000),
   (4,2,3,2500),
   (5,4,1,1000),
   (6,6,2,1500),
   (7,7,5,30000),
   (8,8,1,3000),
   (9,9,3,2500),
   (10,10,1,1000),
   (11,11,2,1500),
   (12,3,5,30000),
   (13,5,1,3000),
   (14,12,3,2500),
   (15,4,1,1000),
   (16,4,1,1000);

-- Inserting data into Orders Table
INSERT INTO orders(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)
VALUES 
   (101,1500,'2021-10-06',2,1),
   (102,1000,'2021-10-12',3,5),
   (103,30000,'2021-09-16',5,2),
   (104,1500,'2021-10-05',1,1),
   (105,3000,'2021-08-16',4,3),
   (106,1450,'2021-08-18',1,9),
   (107,789,'2021-09-01',3,7),
   (108,780,'2021-09-07',5,6),
   (109,3000,'2021-00-10',5,3),
   (110,2500,'2021-09-10',2,4),
   (111,1000,'2021-09-15',4,5),
   (112,789,'2021-09-16',4,7),
   (113,31000,'2021-09-16',1,8),
   (114,1000,'2021-09-16',3,5),
   (115,3000,'2021-09-16',5,3),
   (116,99,'2021-09-17',2,14);

-- Inserting data into Rating Table
INSERT INTO rating(RAT_ID,ORD_ID,RAT_RATSTARS)
VALUES 
   (1,101,4),
   (2,102,3),
   (3,103,1),
   (4,104,2),
   (5,105,4),
   (6,106,3),
   (7,107,4),
   (8,108,4),
   (9,109,3),
   (10,110,5),
   (11,111,3),
   (12,112,4),
   (13,113,2),
   (14,114,1),
   (15,115,1),
   (16,116,0);

-- Question 3
/* Display the total number of customers based on gender who have placed orders of worth at least Rs.3000 */

SELECT 
    COUNT(DISTINCT B.CUS_NAME) AS Total_customers,
    B.CUS_GENDER AS GENDER
FROM
    orders A
        INNER JOIN
    customer B ON A.CUS_ID = B.CUS_ID
WHERE
    A.ORD_AMOUNT >= 3000
GROUP BY B.CUS_GENDER;
   
   -- Question 4
   /* Display all the orders along with product name ordered by a customer having Customer_Id=2 */
SELECT 
    A.*, prod.PRO_NAME
FROM
    orders A
        INNER JOIN
    supplier_pricing S ON A.PRICING_ID = S.PRICING_ID
        INNER JOIN
    product Prod ON S.PRO_ID = prod.PRO_ID
WHERE
    CUS_ID = 2;

-- Question 5
/* Display the Supplier details who can supply more than one product */

SELECT 
    S.*
FROM
    supplier S
        INNER JOIN
    supplier_pricing SP ON S.SUPP_ID = SP.SUPP_ID
GROUP BY SP.SUPP_ID
HAVING COUNT(SP.SUPP_ID) > 1;

-- Question 6
/* Find the least expensive product from each category and print the table with category id, name, product name and price of the product */

SELECT 
    MIN(A.SUPP_PRICE) AS MINIMUM_PRICE,
    B.CAT_ID,
    B.PRO_NAME,
    C.CAT_NAME
FROM
    supplier_pricing A
        JOIN
    product B ON A.PRO_ID = B.PRO_ID
        JOIN
    category C ON C.CAT_ID = B.CAT_ID
GROUP BY B.CAT_ID;

-- Question 7
/* Display the Id and Name of the Product ordered after “2021-10-05” */

select p.PRO_ID, p.PRO_NAME
from product p
inner join supplier_pricing SP
on SP.PRO_ID = p.PRO_ID
inner join orders O
on O.PRICING_ID = SP.PRICING_ID
where O.ORD_DATE > '2021-10-05';

-- Question 8
/* Display customer name and gender whose names start or end with character 'A' */

select CUS_NAME, CUS_GENDER from customer where CUS_NAME LIKE '%A%';

-- Question 9
/* Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent 
Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service” Display_ratings*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Display_ratings`()
BEGIN
select S.SUPP_ID, S.SUPP_NAME, R.RAT_RATSTARS,
case when R.RAT_RATSTARS = 5 then 'Excellent' when R.RAT_RATSTARS >= 4 and R.RAT_RATSTARS <5  then 'Good Service' when R.RAT_RATSTARS >= 2 and R.RAT_RATSTARS < 4  then 'Average Service'else 'Poor Service' 
end AS Type_of_Service
from supplier S
inner join supplier_pricing SP
on SP.SUPP_ID = S.SUPP_ID
inner join orders O
on O.PRICING_ID = SP.PRICING_ID
inner join rating R
on R.ORD_ID = O.ORD_ID  ;
END$$
DELIMITER ;

-- Executing Stored Procedure
 /* call `ecommerce_website`.`Display_ratings` */   
   