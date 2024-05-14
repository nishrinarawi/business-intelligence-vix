# Virtual Internship Program: Business Intelligence-Bank Muamalat
Name: Nishrina Rawi
E-mail: nishrinarawi@gmail.com
LinkedIn: www.linkedin.com/in/nishrina-rawi  

## Objective
As a Big Data Analytics Intern at Kimia Farma, my tasks include a series of challenges that require a deep understanding of data and analytical skills. I have been asked to evaluate the business performance of Kimia Farma from 2020 to 2023. 

## Tools
The analysis process begins with creating a database using Google BigQuery and then proceeds with creating a performance analytics dashboard using Looker Studio.

## Dataset 
There are four tables used in this project, including: 
- Customer 
- Products 
- Orders 
- ProductCategory 


## Create Database
1. Import data to Google Bigquery
2. Set Primary Key and Foreign Key  
After all datasets are imported into BigQuery, primary key and foreign key settings are configured to connect those tables to each other.

```sql
ALTER TABLE digitaluser.customers ADD PRIMARY KEY (CustomerID) NOT ENFORCED;
ALTER TABLE digitaluser.orders ADD PRIMARY KEY (OrderID) NOT ENFORCED;
ALTER TABLE digitaluser.product_category ADD PRIMARY KEY (CategoryID) NOT ENFORCED;
ALTER TABLE digitaluser.products ADD PRIMARY KEY (ProdNumber) NOT ENFORCED;

ALTER TABLE digitaluser.orders ADD FOREIGN KEY (CustomerID) REFERENCES digitaluser.customers(CustomerID) NOT ENFORCED;
ALTER TABLE digitaluser.orders ADD FOREIGN KEY (ProdNumber) REFERENCES digitaluser.products(ProdNumber) NOT ENFORCED;
ALTER TABLE digitaluser.products ADD FOREIGN KEY (Category) REFERENCES digitaluser.product_category(CategoryID) NOT ENFORCED;
```
3. Table's Relationship
- Relationship of customers-orders table: one-to-many
- Relationship of products-orders table: one-to-many
- Relationship of product_category-products table: one-to-many

![erd]()

4. Create Master Table  
To create a new table whose columns come from different tables, we need to join the table with the primary key and foreign key from that table  

```sql
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
```

![master_table]()  

## Create Sales Dashboard
Here is the performance analytics dashboard that I have created. 

![dashboard]()  

Click [here](https://lookerstudio.google.com/reporting/104eca3c-0beb-4d91-bac9-f5c031db52c5) to see Sales Dashboard

### Insight  
- Since 2020 to 2021 PT. Sejahtera Bersama get 3.339 orders from 1.671 customers with total sales $1.754.751
- 987 customers is repeated customers, which made order for more than one time in PT. Sejahtera Bersama
- Total order and total sales of PT. Sejahtera bersama is fluctuated month by month since 2020 to 2021
- Washington is customer city with the highest total sales and total order 
- Product category with the highest total sales is robots, while product category with the highest total order quantity is eBooks  

### Recommendations  
- Give a promotion, such as bundle offers to increase order quantity of robots category so it can also increase the total sales. 
- To increase sales of eBooks product, use dynamic pricing where eBooks prices fluctuate based on demand, time of day, or specific promotions.
- Customer city with the highest total sales and total order quantity is Washington. To increase the sales it can be done by focused on Washington. Open the offline store or branch on that city might will be profitable. 
- Implement cross-selling and upselling to increase the order quantity and sales of other product. 
- To effectively engage and retain customers, consider sending targeted marketing emails that include compelling promotions tailored to their interests and needs.
