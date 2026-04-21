--creating the fact table
drop table [pcdatade].[dbo].[Fact_pc_sales]
Create table [pcdatade].[dbo].[Fact_pc_sales]
([pc_sales_id] int identity (1,1) primary key,
[location_id] int,
[pcspec_id] int,
[customer_id] int,
[salesperson_id] int,
[payment_id] int,
[date_id] int,
[channel_id] int,
[priority_id] int,
[shop_id] int,
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
references [pcdatade].[dbo].[dim_shops](shop_id))
    
    --insert data into the created table
    insert into [pcdatade].[dbo].[Fact_pc_sales] (credit_score, cost_price,sale_price,discount_amount,finance_amount,cost_of_repairs,Total_sales_per_employee,pc_market_price)
    select distinct credit_score, cost_price,sale_price,discount_amount,finance_amount,cost_of_repairs,Total_sales_per_employee,pc_market_price
    from [pcdatade].[dbo].[mainpc_data]
  

    --testing the table 
    select * from [pcdatade].[dbo].[Fact_pc_sales]