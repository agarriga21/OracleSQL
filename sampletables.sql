SELECT table_name FROM user_tables ORDER BY table_name;
SELECT COUNT(*) FROM contacts;

SELECT * From CONTACTS;
SELECT * From COUNTRIES;
SELECT * From CUSTOMERS;
SELECT * From EMPLOYEES;
SELECT * From INVENTORIES;
SELECT * From LOCATIONS;
SELECT * From ORDERS;
SELECT * From ORDER_ITEMS;
SELECT * From PRODUCTS;
SELECT * From PRODUCT_CATEGORIES;
SELECT * From REGIONS;
SELECT * From WAREHOUSES;

--Drop Table company_cars;
Create Table company_cars(
car_id int GENERATED Always AS IDENTITY START WITH 1,
primary_driver int DEFAULT 1,
year int NOT NULL,
make varchar(50) NOT NULL,
model varchar(50) NOT NULL,
license_plate varchar(15) UNIQUE,
fuel varchar(25),
state_registered CHAR(2),
Cost NUMBER(20, 2),
Date_Purchased DATE,
CHECK (Cost>=0),
CHECK (year>=1900 AND year<=2100 ),
primary key(car_id),
FOREIGN KEY(primary_driver) REFERENCES EMPLOYEES(EMPLOYEE_ID));

Select * From company_cars;
--insert data
Insert INTO company_cars(primary_driver,year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(1,2022,'Toyota','Rav4','RGB-8438','gas','NY',35000.44,DATE '2022-11-14');
Insert INTO company_cars(primary_driver,year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(2,2020,'Honda','Civic','HXB-6547','hybrid','CA',32500.14,DATE '2021-12-11');
Insert INTO company_cars(primary_driver,year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(3,2021,'GMC','Sierra','FGV-2345','gas','TX',46200.99,DATE '2022-07-01');

Select * From company_cars;
--insert a car with no assigned driver
Insert INTO company_cars(year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(2023,'Honda','Accord','YTB-2645','gas','TX',41900.99,DATE '2023-02-22');

--testing constraints and data types
--state over two letters
Insert INTO company_cars(year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(2000,'Ford','F250','SAS-2677','diesel','TXX',15100.00,DATE '2018-06-02');

--string in int
Insert INTO company_cars(year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values('two thousand','Ford','F250','SAS-2677','diesel','TX',15100.00,DATE '2018-06-02');

--null value in not null
Insert INTO company_cars(year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(null,'Ford','F250','SAS-2677','diesel','TX',15100.00,DATE '2018-06-02');
Insert INTO company_cars(make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values('Ford','F250','SAS-2677','diesel','TX',15100.00,DATE '2018-06-02');

--unique constraint with same license plate as GMC in table
Insert INTO company_cars(year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(2000,'Ford','F250','FGV-2345','diesel','TX',15100.00,DATE '2018-06-02');

--Check constraint cost under 0
Insert INTO company_cars(year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(2000,'Ford','F250','SAS-2677','diesel','TX',-500.00,DATE '2018-06-02');

--Check constraint year under 1900
Insert INTO company_cars(year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(1000,'Ford','F250','SAS-2677','diesel','TX',1500.00,DATE '2018-06-02');

--Check constraint year over 2100
Insert INTO company_cars(year,make,model,license_plate,fuel,state_registered,Cost,Date_Purchased) Values(3000,'Ford','F250','SAS-2677','diesel','TX',150000.00,DATE '3018-06-02');