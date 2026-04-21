--Creating standard procedures
create procedure sp_create_dim_location

as begin
--dim_location
drop table [PCDATADE].[dbo].[dim_location]
create table [PCDATADE].[dbo].[dim_location]
([location_id] int identity(1,1) primary key,
[continent] [nvarchar](250) not null,
[country_or_state] [nvarchar](250) not null,
[province_or_city] [nvarchar](250) not null)

--insert data into created dim location from the main

insert into [pcdatade].[dbo].[dim_location] (continent, country_or_state, province_or_city)
select distinct continent,
country_or_state,
province_or_city
from [pcdatade].[dbo].[mainpc_data]
end;

----
create procedure sp_create_dim_pcspec
as begin
drop table [pcdatade].[dbo].[dim_pcspec]
create table [pcdatade].[dbo].[dim_pcspec]
([pcspec_id] int identity(1,1) primary key,
[pc_make] nvarchar (250) not null,
[pc_model] nvarchar (250) not null,
[storage_type] nvarchar (250) not null,
[storage_capacity] nvarchar (250) not null,
[ram] nvarchar (250) not null)

--insert data to the created dim_pcspec table
insert into [pcdatade].[dbo].[dim_pcspec] (pc_make,pc_model,storage_type,storage_capacity,ram)
select distinct pc_make,pc_model,storage_type,storage_capacity,ram
from [pcdatade].[dbo].[mainpc_data]
end;

--
create procedure sp_create_dim_customer
as begin 
drop table [pcdatade].[dbo].[dim_cutomer]
create table [pcdatade].[dbo].[dim_cutomer]
([customer_id] int identity(1,1) primary key,
[customer_name] nvarchar (250) not null,
[customer_surname] nvarchar (250) not null,
[customer_contact_number] nvarchar (250) not null,
[customer_email_address] nvarchar (250) not null)

--insert data into the created table 
insert into [pcdatade].[dbo].[dim_cutomer] (customer_name, customer_surname,customer_contact_number,customer_email_address)
select distinct customer_name,customer_surname,customer_contact_number,customer_email_address
from [pcdatade].[dbo].[mainpc_data]
end;

--
create procedure sp_create_dim_salesperson
as begin
drop table [pcdatade].[dbo].[dim_salesperson]
create table [pcdatade].[dbo].[dim_salesperson]
([salesperson_id] int identity (1,1) primary key,
[sales_person_name] nvarchar (250) not null,
[sales_person_department] nvarchar (250) not null)

--insert data into the created dim_salesperson
insert into [pcdatade].[dbo].[dim_salesperson] (sales_person_name,sales_person_department)
select distinct sales_person_name,sales_person_department
from [pcdatade].[dbo].[mainpc_data]
end;
---
create procedure sp_create_dim_payment
as begin
drop table [pcdatade].[dbo].[dim_payment]
create table [pcdatade].[dbo].[dim_payment]
([payment_id] int identity (1,1) primary key,
[payment_method] nvarchar (250) not null)

--inserting data into the created dim_payment table
insert into [pcdatade].[dbo].[dim_payment] (payment_method)
select distinct payment_method from [pcdatade].[dbo].[mainpc_data]
end;

--
create procedure sp_create_dim_date
as begin
drop table [pcdatade].[dbo].[dim_date]
create table [pcdatade].[dbo].[dim_date]
([date_id] int identity (1,1) primary key,
[purchase_date] date not null,
[ship_date] date not null)

--inserting data into the dim_date
insert into [pcdatade].[dbo].[dim_date] (purchase_date, ship_date)
select distinct coalesce(try_convert(date,purchase_date,103),'1900-01-01'), coalesce(try_convert (date, ship_date,103),'1900-01-01') from [pcdatade].[dbo].[mainpc_data]
end;

--
create procedure sp_create_dim_channel
as begin
drop table [pcdatade].[dbo].[dim_channel]
create table [pcdatade].[dbo].[dim_channel](
[channel_id] int identity (1,1) primary key,
[channel] nvarchar (250) not null)

--inserting data to the created table
insert into [pcdatade].[dbo].[dim_channel] (channel)
select distinct channel from [pcdatade].[dbo].[mainpc_data]
end;

--
create procedure sp_create_dim_priority
as begin
drop table [pcdatade].[dbo].[dim_priority]
create table [pcdatade].[dbo].[dim_priority]
([priority_id] int identity (1,1) primary key,
[priority] nvarchar (250) not null)

--inserting data to dim_priority
insert into [pcdatade].[dbo].[dim_priority] (priority)
select distinct priority from [pcdatade].[dbo].[mainpc_data]
end;

--
create procedure sp_create_dim_shops
as begin
drop table [pcdatade].[dbo].[dim_shops]
create table [pcdatade].[dbo].[dim_shops]
([shop_id] int identity (1,1) primary key,
[shop_name] nvarchar (250) not null,
[shop_age] nvarchar (250) not null)

--inserting data into dim_shop
insert into [pcdatade].[dbo].[dim_shops] (shop_name,shop_age)
select distinct shop_name,shop_age from [pcdatade].[dbo].[mainpc_data]
end;




