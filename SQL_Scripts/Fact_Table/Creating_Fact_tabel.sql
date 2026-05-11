--creating the fact table
IF OBJECT_ID('pcdatade.dbo.fact_pc_sales', 'U') IS NOT NULL
    DROP TABLE pcdatade.dbo.fact_pc_sales;
GO
Create table [pcdatade].[dbo].[Fact_pc_sales]
([pc_sales_id] int identity (1,1) primary key,
[location_id] int not null,
[pcspec_id] int not null,
[customer_id] int not null,
[salesperson_id] int not null,
[payment_id] int not null,
[date_id] int not null,
[channel_id] int not null,
[priority_id] int not null,
[shop_id] int not null,
[credit_score] int,
[cost_price] decimal(10,2),
[sale_price] decimal(10,2),
[discount_amount] decimal(10,2),
[finance_amount] decimal(10,2),
[cost_of_repairs] decimal(10,2),
[Total_sales_per_employee] int,
[pc_market_price] decimal(10,2),
constraint fk_fact_location
foreign key (location_id)
references [pcdatade].[dbo].[dim_location](location_id),
constraint fk_fact_pcspec
foreign key (pcspec_id)
references [pcdatade].[dbo].[dim_pcspec](pcspec_id),
constraint fk_fact_customer
foreign key (customer_id)
references [pcdatade].[dbo].[dim_cutomer](customer_id),
    constraint fk_fact_salesperson
foreign key (salesperson_id)
references [pcdatade].[dbo].[dim_salesperson](salesperson_id),
    constraint fk_fact_payment
foreign key (payment_id)
references [pcdatade].[dbo].[dim_payment](payment_id),
    constraint fk_fact_date
foreign key (date_id)
references [pcdatade].[dbo].[dim_date](date_id),
    constraint fk_fact_channel
foreign key (channel_id)
references [pcdatade].[dbo].[dim_channel](channel_id),
    constraint fk_fact_priority
foreign key (priority_id)
references [pcdatade].[dbo].[dim_priority](priority_id),
    constraint fk_fact_shop
foreign key (shop_id)
references [pcdatade].[dbo].[dim_shops](shop_id));
    
    --insert data into the created table
    insert into [pcdatade].[dbo].[fact_pc_sales] (s.shop_id,pr.priority_id,ch.channel_id,d.date_id,pm.payment_id,e.salesperson_id,l.location_id,p.pcspec_id,c.customer_id,credit_score, cost_price,sale_price,discount_amount,finance_amount,cost_of_repairs,Total_sales_per_employee,pc_market_price)

    select distinct s.shop_id,pr.priority_id,ch.channel_id,d.date_id,pm.payment_id,e.salesperson_id,l.location_id,p.pcspec_id,c.customer_id,credit_score,cost_price,sale_price,discount_amount,finance_amount,cost_of_repairs,Total_sales_per_employee,pc_market_price
    from [pcdatade].[dbo].[mainpc_data] f
  

    ---Joining the tables
    JOIN pcdatade.dbo.dim_cutomer c 
    ON f.customer_name = c.customer_name 
   AND f.customer_surname = c.customer_surname
   AND f.customer_contact_number = c.customer_contact_number
   AND f.customer_email_address = c.customer_email_address

   JOIN pcdatade.dbo.dim_channel ch 
    ON f.channel = ch.channel

JOIN pcdatade.dbo.dim_date d 
    ON TRY_CONVERT(DATE, f.purchase_date, 103) = d.purchase_date
   AND ISNULL
   (
       TRY_CONVERT(DATE, NULLIF(f.ship_date, 'N/A'), 103),
       '2099-12-31'
   ) = d.ship_date

JOIN pcdatade.dbo.dim_salesperson e 
    ON f.sales_person_name = e.sales_person_name
    AND f.sales_person_department = e.sales_person_department

JOIN pcdatade.dbo.dim_location l 
    ON f.continent = l.continent
    AND f.country_or_state = l.country_or_state
    AND f.province_or_city = l.province_or_city

JOIN pcdatade.dbo.dim_payment pm 
    ON f.payment_method = pm.payment_method

JOIN pcdatade.dbo.dim_pcspec p
    ON f.pc_make = p.pc_make
    AND f.pc_model = p.pc_model
    AND f.storage_type = p.storage_type
    AND f.storage_capacity = p.storage_capacity
    AND f.ram = p.ram

JOIN pcdatade.dbo.dim_priority pr
    ON f.priority = pr.priority

JOIN pcdatade.dbo.dim_shops s 
    ON f.shop_name = s.shop_name
    AND f.shop_age = s.shop_age;

--testing the table 
    select * from [pcdatade].[dbo].[Fact_pc_sales]