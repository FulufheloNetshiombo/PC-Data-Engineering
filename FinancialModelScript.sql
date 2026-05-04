SELECT TOP (1000) [TaskID]
      ,[ModelName]
      ,[Principal]
      ,[AnnualRate]
      ,[TermYears]
      ,[Frequency]
  FROM [FinancialEngineeringDB].[dbo].[FinancialTasks]

  
   --1.  Simple Interest: I = P * r * t
   select cast (principal*annualrate*termyears as decimal(10,2)) as simple_interest
   from [financialengineeringdb].[dbo].[FinancialTasks]
   where taskid='1'
  
   --2.Annual Compound: A = P * (1 + r)^n
    select cast (Principal*power((1+AnnualRate),(TermYears)) as decimal(10,2)) as annual_compound
   from [financialengineeringdb].[dbo].[FinancialTasks]
   where taskid='2'

   --3.Hire Purchase Installment: Monthly = [P * (1 + r * t)] / 36
   select cast (Principal *(1+AnnualRate*TermYears)/36 as decimal(10,2))as monthyly
   from [financialengineeringdb].[dbo].[FinancialTasks]
   where taskid='3'

   --4.Inflation Projection: A = P * (1 + i)^n
   select cast(1550*power((1+AnnualRate),TermYears) as decimal(10,2)) as inflation
   from [financialengineeringdb].[dbo].[FinancialTasks]
   where taskid='4'

   --**5.Reducing Balance Depreciation: A = P * (1 - i)^n
   select cast(Principal*power((1-AnnualRate),TermYears) as decimal(10,2)) as Reducing_Balance_Depreciation
    from [financialengineeringdb].[dbo].[FinancialTasks]
    where TaskID='5'

    --6. **Quarterly Compound: A = P * (1 + r/4)^(4 * n)
    select cast(Principal*power((1+AnnualRate/4),4*TermYears) as decimal(10,2)) as Quarterly_Compound
    from [financialengineeringdb].[dbo].[FinancialTasks]
    where TaskID='6'

    --7.Monthly Loan Accrual: I = [P * (1 + r/12)^12] - P
    select cast((Principal*power((1+AnnualRate/12),12) - Principal) as decimal(10,2)) as Monthly_Loan_Accrual
    from [financialengineeringdb].[dbo].[FinancialTasks]
    where TaskID ='7'

    --8. Doubling Time (Simple): t = 1 / r
    select cast((1/AnnualRate) as decimal(10,2)) as Doubling_Time
      from [financialengineeringdb].[dbo].[FinancialTasks]
      where TaskID='8'

    
      --9. Effective Annual Rate: EAR = (1 + r/m)^m - 1
      select cast((power((1+AnnualRate/TermYears),TermYears) - 1) as decimal (10,2)) as Effective_Annual_Rate
      from [financialengineeringdb].[dbo].[FinancialTasks]
      where TaskID='9'
      
      --**10. Semi-Annual Growth: A = P * (1 + r/2)^(2 * n)
      select cast(Principal*power((1+AnnualRate/2),2*10) as decimal(10,2)) as Semi_Annual_Growth
      from [financialengineeringdb].[dbo].[FinancialTasks]
      where TaskID ='10'

      