USE food_delivery_analyst;
##Total Revenue
SELECT SUM(Order_Value)AsTotal_Revenue
From orders_cleaned
WHERE Order_Status ='Delivered';
##Total Order by Status
SELECT
    Order_Status,
    COUNT(*) AS Total_Orders
FROM orders_cleaned
GROUP BY Order_Status;
##Top 5 Restuarants by Revenue
SELECT
    r.Restaurant_Name,
    SUM(o.Order_Value) AS Total_Revenue
FROM orders_cleaned o
JOIN restaurants_cleaned r
ON o.Restaurant_Id = r.Restaurant_Id
WHERE o.Order_Status = 'Delivered'
GROUP BY r.Restaurant_Name
ORDER BY Total_Revenue DESC
LIMIT 10;
##Most Popular Cuisine
SELECT
    Customer_Id,
    SUM(Order_Value) AS Total_Spending
FROM orders_cleaned
WHERE Order_Status = 'Delivered'
GROUP BY Customer_Id
ORDER BY Total_Spending DESC
LIMIT 10;
##Average Delivery Time
SELECT Avg(Delivery_Time) AS Average_Delivery_Time
From delivery_cleaned;
##Customer Ratings Analysis
SELECT Customer_Rating,
    Count(*) AS Total_Ratings
FROM ratings_cleaned
Group BY Customer_Rating
Order BY Customer_Rating DESC;
##Payment mode Analysis
SELECT Payment_Mode,
     Count(*) AS Total_Orders
From orders_cleaned
Group BY Payment_Mode
Order By Total_Orders DESC;
##Delayed Deliveries
SELECT Delay_Status,
	Count(*) As Total_Deliveries
From delivery_cleaned
Group by Delay_Status;
##Monthly Revenue
SELECT
    DATE_FORMAT(Order_Date_Time, '%Y-%m') AS Order_Month,
    SUM(Order_Value) AS Total_Revenue
FROM orders_cleaned
WHERE Order_Status = 'Delivered'
GROUP BY Order_Month
ORDER BY Order_Month;

