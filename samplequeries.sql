--select examples
Select * from employees;
Select FIRST_NAME from employees;
Select FIRST_NAME, LAST_NAME from employees;
Select FIRST_NAME || ' ' || LAST_NAME from employees;
Select FIRST_NAME || ' ' || LAST_NAME  as "Full Name" from employees;
Select FIRST_NAME || ' ' || LAST_NAME  as "Full Name" from employees where EMPLOYEE_ID=11;

Select * from company_cars;
Select year || ' ' || make || ' ' || model,cost From company_cars where cost>40000;
Select year || ' ' || make || ' ' || model,cost From company_cars where year>2022;

--Conditions examples
SELECT * From ORDERS;
SELECT * From ORDERS where Status='Pending' or Status='Canceled';
SELECT * From ORDERS where Status='Pending' and Salesman_id=55;
SELECT * From ORDERS where NOT Status='Shipped';
SELECT * From ORDERS where ORDER_ID between 1 and 10;
SELECT * From ORDERS where ORDER_DATE between DATE '2017-01-01' and DATE '2017-12-31';
SELECT * FROM ORDERS WHERE SALESMAN_ID IS NULL;
SELECT * From ORDERS where Customer_ID IN(1,5,33,55,60);
SELECT * From CUSTOMERS;
SELECT * From CUSTOMERS where credit_limit<700;
SELECT Customer_id From CUSTOMERS where credit_limit<700;
SELECT * From ORDERS where Customer_ID IN(SELECT Customer_id From CUSTOMERS where credit_limit<700);
Select Customer_ID From ORDERS;
Select DISTINCT Customer_ID From ORDERS;

--like
SELECT * From CONTACTS;
Select first_Name from CONTACTS WHERE first_Name LIKE 'P%';
Select first_Name from CONTACTS WHERE first_Name LIKE '%e';
Select first_Name from CONTACTS WHERE first_Name LIKE '____y';
Select first_Name from CONTACTS WHERE first_Name LIKE '%e_e%';

--multiple conditions
SELECT * From PRODUCTS;
SELECT * FROM Products
WHERE LIST_PRICE BETWEEN 0 AND 1000
AND category_id NOT IN (1,3,5);

Select year || ' ' || make || ' ' || model as "Vehicle",cost,fuel,primary_driver From company_cars
where primary_driver IN (Select employee_ID From employees) 
AND (Fuel IN ('diesel','hybrid','electric') OR Cost>40000);

--Sorting and fetch
SELECT * From PRODUCTS order by STANDARD_COST;
SELECT * From PRODUCTS order by STANDARD_COST desc;
SELECT * From PRODUCTS order by STANDARD_COST desc FETCH NEXT 5 ROWS ONLY;
SELECT * From PRODUCTS order by product_name;
SELECT * From PRODUCTS order by product_name desc;
SELECT * From PRODUCTS order by category_id FETCH NEXT 2 ROWS WITH TIES;
SELECT * From PRODUCTS order by category_id,product_name FETCH FIRST 50 PERCENT ROWS ONLY;
SELECT * From PRODUCTS order by product_name OFFSET 20 ROWS FETCH NEXT 10 ROWS ONLY;

--aggregate
SELECT * From ORDER_ITEMS;
SELECT sum(quantity) From ORDER_ITEMS;
SELECT sum(quantity) From ORDER_ITEMS where item_id=7;
Select count(*) FROM ORDER_ITEMS where ORDER_ID=81;
SELECT * From ORDER_ITEMS where ORDER_ID=81;
SELECT max(UNIT_PRICE) From ORDER_ITEMS;
SELECT min(UNIT_PRICE) From ORDER_ITEMS;
SELECT avg(UNIT_PRICE) From ORDER_ITEMS;
SELECT MEDIAN(UNIT_PRICE) From ORDER_ITEMS;

--groupby
SELECT * From PRODUCTS;
SELECT category_id,count(product_id) From PRODUCTS group by category_id;
SELECT category_id,max(standard_cost),min(standard_cost) From PRODUCTS group by category_id;
SELECT category_id,avg(standard_cost),median(standard_cost) From PRODUCTS group by category_id;

SELECT * From INVENTORIES;
SELECT warehouse_id,sum(quantity) From INVENTORIES
group by warehouse_id
order by sum(quantity) desc;

SELECT warehouse_id,sum(quantity) From INVENTORIES
group by warehouse_id
HAVING sum(quantity)>10000
order by sum(quantity) desc;

SELECT warehouse_id,sum(quantity) From INVENTORIES
group by warehouse_id
order by sum(quantity) desc
FETCH NEXT 3 ROWS ONLY;

SELECT * From ORDERS;
SELECT Status,customer_id,count(ORDER_ID) From ORDERS
group by Status,customer_id
order by Status,customer_id;

