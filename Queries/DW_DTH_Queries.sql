/* Name of top 3 employee who did maximum sales on a particular date */

SELECT TOP 3 se.Employee_Name, sum(sf.Quantity_Sold) AS "Units Sold" 
FROM Sales_Fact_Table sf, Sales_Employee_Table se 
WHERE se.Sales_Employee_ID=sf.Empolyee_ID AND Date = '11/07/2020' 
GROUP BY se.Employee_Name 
ORDER BY "Units Sold" DESC

/* Revenue of company year wise */

SELECT year(Payment_Date) AS Revenue_Year, SUM(revenue) AS Total_revenue 
FROM Revenue_Fact_Table 
GROUP BY year(Payment_Date) 
ORDER BY Total_revenue DESC;

/* SELECT the 3 top-selling packs in the Country */

SELECT top 3 Pack_ID, COUNT(Customer_ID) AS No_of_Sell 
FROM Customer_Fact_Table 
GROUP BY Pack_ID 
ORDER BY No_of_Sell DESC

/* List of customers whose plan expires on a particular day */

SELECT cd.Customer_ID,cd.Customer_Name,pv.Plan_Validity_Date 
FROM Customer_Dimension cd, Customer_Fact_Table cf, Plan_Validity_Date pv 
WHERE cd.Customer_ID = cf.Customer_ID AND pv.Plan_Validity_Date = cf.Plan_Validity_Date 
AND pv.Plan_Validity_Date = '2020/05/02'

/* Top 5 cities with the highest customer base */

SELECT Top 5 City, COUNT(DISTINCT Cu.Customer_ID) AS Subscribers  
FROM Customer_Fact_Table C,Customer_Dimension Cu, Subscription_Date S 
WHERE C.Customer_ID = Cu.Customer_ID and C.Subscription_Date = S.Subscription_Date
GROUP BY City 
ORDER BY Subscribers DESC;

/* List of top 5 cities which have the highest cancellation rate */

SELECT Top 5 City, COUNT(*)AS Cancellations 
FROM Customer_Fact_Table C,Customer_Dimension Cu, Cancellation_Date S
WHERE C.Customer_ID = Cu.Customer_ID and C.Cancellation_Date = S.Cancellation_Date
GROUP BY City order by Cancellations DESC;

/*  List of  5 cities with lowest subscription */

SELECT  top 5 Customer_Dimension.City,COUNT(Customer_Dimension.Customer_ID) AS subscription_count
FROM Customer_Dimension
INNER JOIN Customer_Fact_Table ON Customer_Fact_Table.Customer_ID = Customer_Dimension.Customer_ID  
GROUP BY Customer_Dimension.City 
ORDER BY subscription_count ASC;

/*  SELECT the 3 top-selling pack in particular city */

SELECT top 3 Customer_Fact_Table.Pack_ID,COUNT(Customer_Fact_Table.Customer_ID) AS Hydrabad_COUNT
FROM Customer_Fact_Table INNER JOIN Customer_Dimension 
ON Customer_Fact_Table.Customer_ID = Customer_Dimension.Customer_ID  
WHERE Customer_Dimension.City = 'Hydrabad'
GROUP BY Customer_Fact_Table.Pack_ID 
ORDER BY Hydrabad_COUNT DESC;

/* Show customer payment history */

SELECT cf.Customer_ID, cd.Customer_Name, cf.Payment_Date, cf.Total_Amount 
FROM Customer_Fact_Table AS cf,Customer_Dimension AS cd 
WHERE Cf.Customer_ID = Cd.Customer_ID and cf.Customer_ID = 285

/*  Find the model that has the highest quantity sold */

SELECT top 1 STB_Model_No,COUNT(Customer_ID) AS No_of_sell 
FROM Customer_Dimension 
GROUP BY STB_Model_No

/* Top 3 dates that has most new subscription */

 SELECT top 3 Month(Subscription_Date) as Month_Subscription, 
 COUNT(Customer_ID) AS No_of_New_Sub FROM Customer_Fact_Table 
 GROUP BY Month(Subscription_Date) 
 ORDER BY No_of_New_Sub DESC

