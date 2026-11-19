##Inner Join orders and Customers
SELECT
    o.Order_Id,
    c.Customer_Name,
    c.City,
    o.Order_Value,
    o.Order_Status
FROM orders_cleaned o
INNER JOIN customers_cleaned c
ON o.Customer_Id = c.Customer_Id;
##Inner Join orders and Restuarants
SELECT
    o.Order_Id,
    r.Restaurant_Name,
    r.Cuisine,
    o.Order_Value,
    o.Order_Status
FROM orders_cleaned o
INNER JOIN restaurants_cleaned r
ON o.Restaurant_Id = r.Restaurant_Id;
##Multiple Join Complete Order Details
SELECT
    o.Order_Id,
    c.Customer_Name,
    r.Restaurant_Name,
    r.Cuisine,
    o.Order_Value,
    d.Delivery_Time,
    rt.Customer_Rating
FROM orders_cleaned o
LEFT JOIN customers_cleaned c
    ON o.Customer_Id = c.Customer_Id
LEFT JOIN restaurants_cleaned r
    ON o.Restaurant_Id = r.Restaurant_Id
LEFT JOIN delivery_cleaned d
    ON o.Order_Id = d.Order_ID
LEFT JOIN ratings_cleaned rt
    ON o.Order_Id = rt.Order_ID;
##Above Order Value
SELECT *
FROM orders_cleaned
WHERE Order_Value > (
    SELECT AVG(Order_Value)
    FROM orders_cleaned
);
##Top Spending Customers
SELECT
    Customer_Id,
    SUM(Order_Value) AS Total_Spending
FROM orders_cleaned
WHERE Order_Status = 'Delivered'
GROUP BY Customer_Id
ORDER BY Total_Spending DESC;
##Monthly Revenue Analysis
SELECT
    DATE_FORMAT(Order_Date_Time, '%Y-%m') AS Order_Month,
    SUM(Order_Value) AS Total_Revenue
FROM orders_cleaned
WHERE Order_Status = 'Delivered'
GROUP BY DATE_FORMAT(Order_Date_Time, '%Y-%m')
ORDER BY Order_Month;
##Rank Top Customers
SELECT
    Customer_Id,
    SUM(Order_Value) AS Total_Spending,
    RANK() OVER (ORDER BY SUM(Order_Value) DESC) AS Customer_Rank
FROM orders_cleaned
WHERE Order_Status = 'Delivered'
GROUP BY Customer_Id
ORDER BY Total_Spending DESC;
##Customer Segmentation
SELECT
    Customer_Id,
    SUM(Order_Value) AS Total_Spending,

    CASE
        WHEN SUM(Order_Value) >= 3000 THEN 'Premium Customer'
        WHEN SUM(Order_Value) >= 1500 THEN 'Regular Customer'
        ELSE 'Low Spending Customer'
    END AS Customer_Segment

FROM orders_cleaned
WHERE Order_Status = 'Delivered'
GROUP BY Customer_Id
ORDER BY Total_Spending DESC;
##Restaurant Performance
SELECT
    r.Restaurant_Name,
    COUNT(o.Order_Id) AS Total_Orders,
    SUM(o.Order_Value) AS Total_Revenue,
    AVG(o.Order_Value) AS Average_Order_Value

FROM restaurants_cleaned r
INNER JOIN orders_cleaned o
    ON r.Restaurant_Id = o.Restaurant_Id

WHERE o.Order_Status = 'Delivered'

GROUP BY r.Restaurant_Id, r.Restaurant_Name
ORDER BY Total_Revenue DESC;
##Delivery time vs Customer Rating
SELECT
    d.Delivery_Time,
    AVG(rt.Customer_Rating) AS Average_Rating,
    COUNT(*) AS Total_Orders

FROM delivery_cleaned d
INNER JOIN ratings_cleaned rt
    ON d.Order_ID = rt.Order_ID

GROUP BY d.Delivery_Time
ORDER BY d.Delivery_Time;