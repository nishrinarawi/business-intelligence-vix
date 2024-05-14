SELECT o.Date AS order_date,
       pc.CategoryName AS category_name,
       p.ProdName AS product_name,
       p.Price AS product_price,
       o.Quantity AS order_qty,
       p.Price*o.Quantity AS total_sales,
       c.CustomerEmail AS cust_email,
       c.CustomerCity AS cust_city
FROM digitaluser.orders AS o
JOIN digitaluser.customers AS c ON c.CustomerID=o.CustomerID
JOIN digitaluser.products AS p On p.ProdNumber=o.ProdNumber
JOIN digitaluser.product_category AS pc ON pc.CategoryID=p.Category
ORDER BY 1 ASC;

