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


SELECT*From customers_cleaned
  WHERE Customer_Id IS NULL
  OR Customer_Name IS NULL
  OR City IS NULL;
  
SELECT*From restaurants_cleaned
	WHERE Restaurant_Id IS NULL
	OR Restaurant_Name IS NULL
	OR Cuisine IS NULL;
    
SELECT*From delivery_cleaned
     WHERE Delivery_ID IS NULL
     OR Order_ID IS NULL
     OR Agent_ID IS NULL;
     

     
    





