ALTER TABLE digitaluser.customers ADD PRIMARY KEY (CustomerID) NOT ENFORCED;
ALTER TABLE digitaluser.orders ADD PRIMARY KEY (OrderID) NOT ENFORCED;
ALTER TABLE digitaluser.product_category ADD PRIMARY KEY (CategoryID) NOT ENFORCED;
ALTER TABLE digitaluser.products ADD PRIMARY KEY (ProdNumber) NOT ENFORCED;

ALTER TABLE digitaluser.orders ADD FOREIGN KEY (CustomerID) REFERENCES digitaluser.customers(CustomerID) NOT ENFORCED;
ALTER TABLE digitaluser.orders ADD FOREIGN KEY (ProdNumber) REFERENCES digitaluser.products(ProdNumber) NOT ENFORCED;
ALTER TABLE digitaluser.products ADD FOREIGN KEY (Category) REFERENCES digitaluser.product_category(CategoryID) NOT ENFORCED;