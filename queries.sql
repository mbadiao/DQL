-- Display all the data of customers 
SELECT * FROM Costumer
-- Display the product_name and category for products which their price is between 5000 and 10000
SELECT (product_name,category) FROM Product WHERE (Price > 5000 AND Price < 10000) 
-- Display all the data of products sorted in descending order of price.
SELECT (product_name,category) FROM Product ORDER BY Price DESC 
-- Display the total number of orders, the average amount, the highest total amount and the lower total amountFor each product_id, display the number of orders
SELECT COUNT(*), AVG(Amount), MAX(Amount), MIN(Amount),Product_ID, COUNT(*) AS NumberOfOrdersPerProduct FROM OrdersGROUP BY Product_ID;
-- Display the customer_id which has more than 2 orders 
SELECT Costumer_id FROM Costumer WHERE COUNT(Quanty) > 2 JOIN Orders ON Orders.Costumer_id = Costumer_id
-- For each month of the 2020 year, display the number of orders
SELECT 
    YEAR(OrderDate) AS Annee,
    MONTH(OrderDate) AS Mois,
    COUNT(*) AS Nombre_de_commandes
FROM 
    Orders
WHERE 
    YEAR(OrderDate) = 2020
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY 
    Annee, Mois;

-- For each order, display the product_name, the customer_name and the date of the order
SELECT 
    Product.product_Name,
    Customers.customer_Name,
    Orders.OrderDate
FROM 
    Orders
JOIN 
    Product ON Orders.Product_id = Product.Product_id
JOIN 
    Customers ON Orders.Costumer_id = Customers.Costumer_id;
-- Display all the orders made three months ago 
SELECT 
    Product.product_Name,
    Customers.customer_Name,
    Orders.OrderDate
FROM 
    Orders
JOIN 
    Product ON Orders.Product_id = Product.Product_id
JOIN 
    Customers ON Orders.Costumer_id = Customers.Costumer_id
WHERE 
    Orders.OrderDate BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH) AND CURRENT_DATE;
-- Display customers (customer_id) who have never ordered a product
SELECT 
    Costumer_id
FROM 
    Customers
WHERE 
    NOT EXISTS (
        SELECT 
            * 
        FROM 
            Orders 
        WHERE 
            Customers.Costumer_id = Orders.Costumer_id
    );
