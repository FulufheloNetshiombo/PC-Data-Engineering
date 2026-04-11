--create the dim location
create table [PCDATADE].[dbo].[dim_location]
([location_id] int identity(1,1) primary key,
[continent] [nvarchar](100) not null,
[country_or_state] [nvarchar](100) not null,
[province_or_city] [nvarchar](100) not null)

--insert data into created dim location from the main

insert into [pcdatade].[dbo].[dim_location] (continent, country_or_state, province_or_city)
select continent,
country_or_state,
province_or_city
from [pcdatade].[dbo].[mainpc_data]

--testing if the data is added to the table
select * from [pcdatade].[dbo].[dim_location]

--Create dim_pcspec
create table [pcdatade].[dbo].[dim_pcspec]
([pcspec_id] int identity(1,1) primary key,
[pc_make] nvarchar (100) not null,
[pc_model] nvarchar (100) not null,
[storage_type] nvarchar (100) not null,
[storage_capacity] nvarchar (100) not null,
[ram] nvarchar (100) not null)

--insert data to the created dim_pcspec table
insert into [pcdatade].[dbo].[dim_pcspec] (pc_make,pc_model,storage_type,storage_capacity,ram)
select pc_make,pc_model,storage_type,storage_capacity,ram
from [pcdatade].[dbo].[mainpc_data]

--Testing if the values are added into the dim_pcspec
select * from [pcdatade].[dbo].[dim_pcspec]

--creating the dim_customer table
create table [pcdatade].[dbo].[dim_cutomer]
([customer_id] int identity(1,1) primary key,
[customer_name] nvarchar (100) not null,
[customer_surname] nvarchar (100) not null,
[customer_contact_number] nvarchar (100) not null,
[customer_email_address] nvarchar (100) not null)

--insert data into the created table 
insert into [pcdatade].[dbo].[dim_cutomer] (customer_name, customer_surname,customer_contact_number,customer_email_address)
select customer_name,customer_surname,customer_contact_number,customer_email_address
from [pcdatade].[dbo].[mainpc_data]

--testing if data is isnerted in the dim_customer
select * from [pcdatade].[dbo].[dim_cutomer]

--creating the dim_salesperson
create table [pcdatade].[dbo].[dim_salesperson]
([salesperson_id] int identity (1,1) primary key,
[sales_person_name] nvarchar (100) not null,
[sales_person_department] nvarchar (100) not null)

--insert data into the created dim_salesperson
insert into [pcdatade].[dbo].[dim_salesperson] (sales_person_name,sales_person_department)
select sales_person_name,sales_person_department
from [pcdatade].[dbo].[mainpc_data]

--Testing if the data has been inserted
select * from [pcdatade].[dbo].[dim_salesperson]

--creating dim_payment table 

create table [pcdatade].[dbo].[dim_payment]
([payment_id] int identity (1,1) primary key,
[payment_method] nvarchar (100) not null)

--inserting data into the created dim_payment table
insert into [pcdatade].[dbo].[dim_payment] (payment_method)
select payment_method from [pcdatade].[dbo].[mainpc_data]

--testing if the data has been inserted
select * from [pcdatade].[dbo].[dim_payment]

--creating the dim_date
create table [pcdatade].[dbo].[dim_date]
([date_id] int identity (1,1) primary key,
[purchase_date] date not null,
[ship_date] date not null)

--inserting data into the dim_date
insert into [pcdatade].[dbo].[dim_date] (purchase_date, ship_date)
select coalesce(try_convert(date,purchase_date,103),'1900-01-01'), coalesce(try_convert (date, ship_date,103),'1900-01-01') from [pcdatade].[dbo].[mainpc_data]

--testing if the data is inserted into the dim_date
select * from [pcdatade].[dbo].[dim_date]

--creating the dim_channel table
create table [pcdatade].[dbo].[dim_channel](
[channel_id] int identity (1,1) primary key,
[channel] nvarchar (100) not null)

--inserting data to the created table
insert into [pcdatade].[dbo].[dim_channel] (channel)
select channel from [pcdatade].[dbo].[mainpc_data]

--testing if the data is inserted
select * from [pcdatade].[dbo].[dim_channel]

--creating dim_priority table
create table [pcdatade].[dbo].[dim_priority]
([priority_id] int identity (1,1) primary key,
[priority] nvarchar (100) not null)

--inserting data to dim_priority
insert into [pcdatade].[dbo].[dim_priority] (priority)
select priority from [pcdatade].[dbo].[mainpc_data]

--testing if the data is inserted
select * from [pcdatade].[dbo].[dim_priority]

--creating the dim_shop table
create table [pcdatade].[dbo].[dim_shops]
([shop_id] int identity (1,1) primary key,
[shop_name] nvarchar (100) not null,
[shop_age] nvarchar (100) not null)

--inserting data into dim_shop
insert into [pcdatade].[dbo].[dim_shops] (shop_name,shop_age)
select shop_name,shop_age from [pcdatade].[dbo].[mainpc_data]

--testing  if the data is inserted
select * from [pcdatade].[dbo].[dim_shops]