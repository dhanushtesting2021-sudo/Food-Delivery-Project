USE food_delivery_analyst;
CREATE TABLE Customers (
    Customer_Id VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    SignUp_Date DATE
);
CREATE TABLE Restaurants (
    Restaurant_Id VARCHAR(20) PRIMARY KEY,
    Restaurant_Name VARCHAR(100),
    Cuisine VARCHAR(100),
    City VARCHAR(50),
    Rating DECIMAL(3,1)
);
CREATE TABLE Orders (
    Order_Id VARCHAR(20) PRIMARY KEY,
    Customer_Id VARCHAR(20),
    Restaurant_Id VARCHAR(20),
    Order_Date_Time DATETIME,
    Order_Value DECIMAL(10,2),
    Payment_Mode VARCHAR(50),
    Order_Status VARCHAR(30),
    FOREIGN KEY (Customer_Id)
        REFERENCES Customers(Customer_Id),
	FOREIGN KEY (Restaurant_Id)
        REFERENCES Restaurants(Restaurant_Id)
);
CREATE TABLE Delivery (
    Delivery_ID VARCHAR(20) PRIMARY KEY,
    Order_ID VARCHAR(20),
    Agent_ID VARCHAR(20),
    Distance_KM DECIMAL(10,2),
    Delivery_Time INT,
    Delay_Status VARCHAR(30),
        FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_Id)
);
CREATE TABLE Ratings (
    Rating_ID VARCHAR(20) PRIMARY KEY,
    Order_ID VARCHAR(20),
    Customer_Rating DECIMAL(3,1),
    Feedback TEXT,
    FOREIGN KEY (Order_ID)
	REFERENCES Orders(Order_Id)
);
SHOW TABLES;
