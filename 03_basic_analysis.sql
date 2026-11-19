USE food_delivery_analyst;
## Check Customers
SELECT*From Customers_cleaned;
##Check orders
SELECT*From orders_cleaned;
##Check Restuarant
SELECT*From restaurants_cleaned;
##Check Delivery
SELECT*From delivery_cleaned;
##Check Rating
SELECT*From ratings_cleaned;

##Delivered Order
SELECT*From orders_cleaned
    WHERE Order_Status='Deliverd';
##Cancelled Order
SELECT*From orders_cleaned
    WHERE Order_Status='cancelled';
##Pending Order
SELECT*From orders_cleaned
    WHERE Order_Status='Pending';
##Chennai Customers
SELECT*From Customers_cleaned
  WHERE City='Chennai';
##Orders Above 600
SELECT *
FROM orders_cleaned
WHERE Order_Value > 600;
##Highest Order First
SELECT*From orders_cleaned
ORDER BY Order_Value DESC;
##Highest Delivery
SELECT*From delivery_cleaned
ORDER BY Delivery_Time;
##Order By Status
SELECT Order_Status, COUNT(*) AS Total_Orders
FROM orders_cleaned
GROUP BY Order_Status;
##Customer By City
SELECT City, COUNT(*) AS Total_Customers
FROM customers_cleaned
GROUP BY City;
##Orders by payment mode
SELECT Payment_Mode, COUNT(*) AS Total_Orders
FROM orders_cleaned
GROUP BY Payment_Mode;

##Total Revenue
SELECT SUM(Order_Value) AS Total_Revenue
FROM orders_cleaned
WHERE Order_Status = 'Delivered';
##Average Order Value
SELECT AVG(Order_Value) AS Average_Order_Value
FROM orders_cleaned;
##Total Orders
SELECT COUNT(*) AS Total_Orders
FROM orders_cleaned;
##Maximum Order Value
SELECT MAX(Order_Value) AS Highest_Order
FROM orders_cleaned;
##Minimum Order Value
SELECT MIN(Order_Value) AS Lowest_Order
FROM orders_cleaned;
##Top 20 Highest Order
SELECT*From orders_cleaned
ORDER BY Order_Value DESC
Limit 20;
##Unique Cities
SELECT DISTINCT City
FROM Customers_cleaned;
##Unique payment modes
SELECT DISTINCT Payment_Mode
FROM orders_cleaned;
##Unique Cuisines
SELECT DISTINCT Cuisine
FROM restaurants_cleaned;

    
