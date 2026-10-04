-- Online Retail Application Database (Oracle SQL)
-- DML: sample data for the 14 tables (insert in this order to satisfy the foreign keys)

-- Country
INSERT INTO Country VALUES (1, 'Saudi Arabia');
INSERT INTO Country VALUES (2, 'Kuwait');
INSERT INTO Country VALUES (3, 'Qatar');
INSERT INTO Country VALUES (4, 'UAE');
INSERT INTO Country VALUES (5, 'Bahrain');

-- EmailDomain
INSERT INTO EmailDomain VALUES (1, 'gmail.com');
INSERT INTO EmailDomain VALUES (2, 'icloud.com');
INSERT INTO EmailDomain VALUES (3, 'hotmail.com');
INSERT INTO EmailDomain VALUES (4, 'yahoo.com');
INSERT INTO EmailDomain VALUES (5, 'outlook.com');

-- Customers
INSERT INTO Customers VALUES (1, 'Nasser', 'Al-Saif', 'nasser.saif88', 1, '0501234567', 'Olaya St.', 'Riyadh', '11564', 1);
INSERT INTO Customers VALUES (2, 'Sara', 'Al-Fahad', 'soso.fahad', 2, '0509876543', 'Prince Sultan St.', 'Jeddah', '21577', 1);
INSERT INTO Customers VALUES (3, 'Khaled', 'Al-Mutairi', 'kh.mtairi22', 3, '0532456789', 'Al-Mughrizat', 'Riyadh', '11452', 1);
INSERT INTO Customers VALUES (4, 'Laila', 'Al-Sabah', 'layla.sabah9', 4, '0559876521', 'Al-Salam', 'Dammam', '32415', 1);
INSERT INTO Customers VALUES (5, 'Mariam', 'Al-Ali', 'mimi.ali', 5, '9003457890', 'Kuwait Towers St.', 'Kuwait City', '13001', 2);
INSERT INTO Customers VALUES (6, 'Fahad', 'Al-Kuwari', 'fahad.kw7', 1, '3005671234', 'Souq Wagif', 'Doha', '32110', 3);
INSERT INTO Customers VALUES (7, 'Noor', 'Al-Jaber', 'noor.jbri1', 2, '3002345678', 'Madinat Khalifa', 'Doha', '32115', 3);
INSERT INTO Customers VALUES (8, 'Hassan', 'Al-Dosari', 'hassan_dosari44', 3, '3303234567', 'Corniche St.', 'Manama', '11215', 5);
INSERT INTO Customers VALUES (9, 'Aisha', 'Al-Mazrouei', 'aisha.mz00', 4, '5003456789', 'Al Maqta', 'Abu Dhabi', '12211', 4);
INSERT INTO Customers VALUES (10, 'Rashid', 'Al-Nuaimi', 'rash.nuaimi13', 5, '5554567890', 'Jumeirah', 'Dubai', '45321', 4);
INSERT INTO Customers VALUES (11, 'Dana', 'Al-Sabah', 'dana.sbh5', 1, '5001122334', 'Al Asimah', 'Kuwait City', '13002', 2);
INSERT INTO Customers VALUES (12, 'Abdullah', 'Al-Attiyah', 'abdullah.attiyah', 2, '5552233445', 'West Bay', 'Doha', '32118', 3);
INSERT INTO Customers VALUES (13, 'Fatimah', 'Al-Qassimi', 'fato_qas', 3, '5003344556', 'Corniche Rd.', 'Abu Dhabi', '12345', 4);
INSERT INTO Customers VALUES (14, 'Salem', 'Al-Farsi', 'salem_farsi29', 4, '3904455667', 'Al Seef', 'Manama', '11225', 5);
INSERT INTO Customers VALUES (15, 'Latifa', 'Al-Harbi', 'latifa_77', 5, '5585566778', 'Salahuddin Rd.', 'Dubai', '45331', 4);
INSERT INTO Customers VALUES (16, 'Mohammed', 'Al-Ansari', 'mo.asi11', 1, '5576677889', 'King Faisal Rd.', 'Sharjah', '32411', 4);
INSERT INTO Customers VALUES (17, 'Ranya', 'Al-Ahmed', 'ranya_ahmed', 2, '3557788990', 'Al Sadd', 'Doha', '32117', 3);
INSERT INTO Customers VALUES (18, 'Omar', 'Al-Rashid', 'omar.rashid7', 3, '5008899001', 'King Khalid St.', 'Dammam', '32416', 1);
INSERT INTO Customers VALUES (19, 'Alaa', 'Al-Subai', 'alaa_sb90', 4, '3999900011', 'Sahat Al Mina', 'Abu Dhabi', '12456', 4);
INSERT INTO Customers VALUES (20, 'Muna', 'Al-Balushi', 'muna_lushi88', 5, '3300112234', 'Isa Town', 'Manama', '11230', 5);
INSERT INTO Customers VALUES (21, 'Yasser', 'Al-Zahrani', 'yasser.zhr90', 1, '0512345678', 'King Abdulaziz Rd.', 'Khobar', '31952', 1);
INSERT INTO Customers VALUES (22, 'Reem', 'Al-Rashed', 'reem.rash07', 2, '0503456789', 'Al Hamra', 'Riyadh', '11525', 1);
INSERT INTO Customers VALUES (23, 'Bader', 'Al-Shammari', 'bader.sh88', 3, '2904567890', 'Fahaheel Rd.', 'Kuwait City', '13003', 2);
INSERT INTO Customers VALUES (24, 'Noura', 'Al-Ansari', 'noura_ansari92', 4, '5575678901', 'Airport St.', 'Abu Dhabi', '12233', 4);
INSERT INTO Customers VALUES (25, 'Maha', 'Al-Mansoor', 'maha.mansoor1', 5, '3336789012', 'Muharrag Rd.', 'Manama', '11331', 5);

-- Categories
INSERT INTO Categories VALUES (1, 'Mobile Phones', 'Smartphones and mobile devices');
INSERT INTO Categories VALUES (2, 'Laptops', 'Various models of laptops for all purposes');
INSERT INTO Categories VALUES (3, 'Tablets', 'Tablets for reading, browsing, and media');
INSERT INTO Categories VALUES (4, 'Smart Home Devices', 'Devices for home automation and security');
INSERT INTO Categories VALUES (5, 'Gaming Consoles', 'Consoles and gaming accessories');
INSERT INTO Categories VALUES (6, 'Audio Devices', 'Speakers, headphones, and audio accessories');
INSERT INTO Categories VALUES (7, 'Cameras', 'Digital cameras and accessories');
INSERT INTO Categories VALUES (8, 'Accessories', 'Chargers, cases, and other electronic accessories');

-- Suppliers
INSERT INTO Suppliers VALUES (1, 'Apple Inc.', 'contact0apple.com', '+1-800-275-2273', 'USA');
INSERT INTO Suppliers VALUES (2, 'Samsung Electronics', 'contact0samsung.com', '+82-2-2053-3000', 'South Korea');
INSERT INTO Suppliers VALUES (3, 'Huawei Technologies', 'contact0huawei.com', '+86-755-2878-0808', 'China');
INSERT INTO Suppliers VALUES (4, 'Sony Corporation', 'contact0sony.com', '+81-3-6748-2111', 'Japan');
INSERT INTO Suppliers VALUES (5, 'LG Electronics', 'contact0lge.com', '+82-2-3777-1114', 'South Korea');
INSERT INTO Suppliers VALUES (6, 'JBL (Harman International)', 'contact0jbl.com', '+1-203-328-3500', 'USA');
INSERT INTO Suppliers VALUES (7, 'Canon Inc.', 'contact0canon.com', '+81-3-3758-2111', 'Japan');
INSERT INTO Suppliers VALUES (8, 'Nikon Corporation', 'contact0nikon.com', '+81-3-6433-3600', 'Japan');
INSERT INTO Suppliers VALUES (9, 'Microsoft Corporation', 'contact0microsoft.com', '+1-425-882-8080', 'USA');

-- Products
INSERT INTO Products VALUES (1, 1, 1, 'iPhone 14 Pro', 'Latest Apple smartphone with A16 chip', 999.99, 50);
INSERT INTO Products VALUES (2, 1, 2, 'Samsung Galaxy S23', 'Flagship Samsung phone with high performance', 899.99, 45);
INSERT INTO Products VALUES (3, 1, 3, 'Huawei Mate 50 Pro', 'High-end Huawei phone with superior camera', 849.99, 30);
INSERT INTO Products VALUES (4, 2, 1, 'MacBook Pro 16', 'Apple laptop with M1 Pro chip', 2499.99, 20);
INSERT INTO Products VALUES (5, 2, 9, 'Microsoft Surface Laptop 5', 'Sleek and portable laptop by Microsoft', 1199.99, 25);
INSERT INTO Products VALUES (6, 2, 2, 'Samsung Galaxy Book 3', 'Lightweight laptop for daily use', 999.99, 35);
INSERT INTO Products VALUES (7, 3, 1, 'iPad Pro', 'High-end Apple tablet with powerful features', 799.99, 40);
INSERT INTO Products VALUES (8, 3, 3, 'Huawei MatePad Pro', 'Premium Huawei tablet for productivity', 599.99, 30);
INSERT INTO Products VALUES (9, 3, 5, 'LG G Pad 5', 'Affordable tablet for basic usage', 299.99, 50);
INSERT INTO Products VALUES (10, 4, 6, 'JBL Link Portable', 'Portable smart speaker with Google Assistant', 149.99, 60);
INSERT INTO Products VALUES (11, 4, 4, 'Sony Smart Speaker', 'Home speaker with Alexa support', 199.99, 50);
INSERT INTO Products VALUES (12, 4, 2, 'Samsung SmartThings Hub', 'Smart home automation hub by Samsung', 89.99, 80);
INSERT INTO Products VALUES (13, 5, 4, 'PlayStation 5', 'Sony gaming console with 4K support', 499.99, 15);
INSERT INTO Products VALUES (14, 5, 2, 'Samsung Odyssey Gaming Monitor', 'Ultra-wide monitor for immersive gaming', 399.99, 20);
INSERT INTO Products VALUES (15, 6, 6, 'JBL Flip 6', 'Portable Bluetooth speaker with powerful sound', 129.99, 70);
INSERT INTO Products VALUES (16, 6, 4, 'Sony WH-1000XM4', 'Noise-canceling headphones by Sony', 349.99, 40);
INSERT INTO Products VALUES (17, 6, 6, 'JBL PartyBox 310', 'Powerful party speaker with dynamic lighting', 499.99, 15);
INSERT INTO Products VALUES (18, 7, 7, 'Canon EOS R5', 'High-end mirrorless camera by Canon', 3899.99, 10);
INSERT INTO Products VALUES (19, 7, 8, 'Nikon Z6 II', 'Versatile mirrorless camera by Nikon', 1999.99, 12);
INSERT INTO Products VALUES (20, 7, 8, 'Nikon Coolpix P950', 'Zoom camera with 83x optical zoom', 899.99, 20);
INSERT INTO Products VALUES (21, 8, 1, 'Apple MagSafe Charger', 'Magnetic wireless charger for iPhones', 39.99, 100);
INSERT INTO Products VALUES (22, 8, 2, 'Samsung Galaxy Buds2', 'Wireless earbuds by Samsung', 149.99, 60);
INSERT INTO Products VALUES (23, 8, 4, 'Sony Camera Bag', 'Camera bag for DSLR and mirrorless cameras', 79.99, 25);
INSERT INTO Products VALUES (24, 8, 5, 'LG USB-C Adapter', 'Adapter for fast charging and data transfer', 29.99, 75);
INSERT INTO Products VALUES (25, 8, 6, 'JBL TUNE 220TWS', 'True wireless earbuds with powerful bass', 99.99, 50);

-- Wishlist
INSERT INTO Wishlist VALUES (1, 1);
INSERT INTO Wishlist VALUES (1, 7);
INSERT INTO Wishlist VALUES (7, 12);
INSERT INTO Wishlist VALUES (7, 18);
INSERT INTO Wishlist VALUES (14, 9);
INSERT INTO Wishlist VALUES (14, 20);
INSERT INTO Wishlist VALUES (2, 4);
INSERT INTO Wishlist VALUES (3, 2);
INSERT INTO Wishlist VALUES (4, 10);
INSERT INTO Wishlist VALUES (5, 15);
INSERT INTO Wishlist VALUES (6, 3);
INSERT INTO Wishlist VALUES (9, 21);
INSERT INTO Wishlist VALUES (10, 5);
INSERT INTO Wishlist VALUES (11, 8);
INSERT INTO Wishlist VALUES (12, 13);
INSERT INTO Wishlist VALUES (13, 6);
INSERT INTO Wishlist VALUES (16, 17);
INSERT INTO Wishlist VALUES (17, 14);
INSERT INTO Wishlist VALUES (18, 25);
INSERT INTO Wishlist VALUES (19, 22);
INSERT INTO Wishlist VALUES (20, 11);
INSERT INTO Wishlist VALUES (21, 23);
INSERT INTO Wishlist VALUES (22, 24);
INSERT INTO Wishlist VALUES (24, 16);
INSERT INTO Wishlist VALUES (25, 5);

-- Orders
INSERT INTO Orders VALUES (1, 5, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (2, 10, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (3, 15, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Orders VALUES (4, 20, TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (5, 8, TO_DATE('2023-10-12', 'YYYY-MM-DD'), 'Cancelled');
INSERT INTO Orders VALUES (6, 12, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Orders VALUES (7, 1, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (8, 6, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (9, 7, TO_DATE('2023-07-22', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (10, 14, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (11, 3, TO_DATE('2023-12-18', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (12, 9, TO_DATE('2023-11-25', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (13, 2, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Orders VALUES (14, 19, TO_DATE('2023-10-30', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (15, 13, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Orders VALUES (16, 11, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 'Cancelled');
INSERT INTO Orders VALUES (17, 16, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (18, 17, TO_DATE('2023-08-20', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (19, 18, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (20, 4, TO_DATE('2023-09-01', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Orders VALUES (21, 25, TO_DATE('2024-02-12', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (22, 23, TO_DATE('2023-11-15', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (23, 24, TO_DATE('2024-03-28', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (24, 21, TO_DATE('2023-07-12', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Orders VALUES (25, 22, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (26, 15, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (27, 20, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Orders VALUES (28, 13, TO_DATE('2023-08-02', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (29, 8, TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'Cancelled');
INSERT INTO Orders VALUES (30, 4, TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (31, 14, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (32, 18, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 'Completed');
INSERT INTO Orders VALUES (33, 7, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (34, 5, TO_DATE('2023-11-22', 'YYYY-MM-DD'), 'Shipped');
INSERT INTO Orders VALUES (35, 3, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Completed');

-- OrderDetails
INSERT INTO OrderDetails VALUES (1, 1, 1, 999.99);
INSERT INTO OrderDetails VALUES (2, 2, 1, 899.99);
INSERT INTO OrderDetails VALUES (2, 18, 1, 149.99);
INSERT INTO OrderDetails VALUES (3, 4, 1, 2499.99);
INSERT INTO OrderDetails VALUES (4, 5, 1, 1199.99);
INSERT INTO OrderDetails VALUES (5, 8, 1, 599.99);
INSERT INTO OrderDetails VALUES (6, 17, 2, 79.98);
INSERT INTO OrderDetails VALUES (7, 10, 1, 499.99);
INSERT INTO OrderDetails VALUES (8, 12, 1, 399.99);
INSERT INTO OrderDetails VALUES (9, 13, 1, 129.99);
INSERT INTO OrderDetails VALUES (10, 7, 1, 799.99);
INSERT INTO OrderDetails VALUES (11, 14, 1, 349.99);
INSERT INTO OrderDetails VALUES (12, 15, 1, 3899.99);
INSERT INTO OrderDetails VALUES (13, 17, 3, 119.97);
INSERT INTO OrderDetails VALUES (14, 6, 1, 999.99);
INSERT INTO OrderDetails VALUES (14, 18, 1, 149.99);
INSERT INTO OrderDetails VALUES (15, 20, 1, 79.99);
INSERT INTO OrderDetails VALUES (15, 5, 1, 1199.99);
INSERT INTO OrderDetails VALUES (16, 16, 2, 69.98);
INSERT INTO OrderDetails VALUES (17, 13, 1, 129.99);
INSERT INTO OrderDetails VALUES (18, 6, 1, 999.99);
INSERT INTO OrderDetails VALUES (18, 20, 1, 79.99);
INSERT INTO OrderDetails VALUES (19, 9, 1, 149.99);
INSERT INTO OrderDetails VALUES (20, 11, 1, 499.99);
INSERT INTO OrderDetails VALUES (21, 7, 1, 799.99);
INSERT INTO OrderDetails VALUES (22, 19, 1, 29.99);
INSERT INTO OrderDetails VALUES (23, 4, 1, 2499.99);
INSERT INTO OrderDetails VALUES (24, 1, 1, 999.99);
INSERT INTO OrderDetails VALUES (25, 12, 1, 399.99);
INSERT INTO OrderDetails VALUES (26, 18, 1, 149.99);
INSERT INTO OrderDetails VALUES (27, 10, 1, 499.99);
INSERT INTO OrderDetails VALUES (28, 2, 1, 899.99);
INSERT INTO OrderDetails VALUES (29, 8, 1, 599.99);
INSERT INTO OrderDetails VALUES (30, 3, 1, 849.99);
INSERT INTO OrderDetails VALUES (31, 7, 1, 799.99);
INSERT INTO OrderDetails VALUES (32, 16, 1, 34.99);
INSERT INTO OrderDetails VALUES (33, 19, 1, 29.99);
INSERT INTO OrderDetails VALUES (34, 15, 1, 3899.99);
INSERT INTO OrderDetails VALUES (35, 5, 1, 1199.99);
INSERT INTO OrderDetails VALUES (35, 20, 1, 79.99);

-- PaymentMethods
INSERT INTO PaymentMethods VALUES (1, 'Credit Card');
INSERT INTO PaymentMethods VALUES (2, 'Debit Card');
INSERT INTO PaymentMethods VALUES (3, 'PayPal');
INSERT INTO PaymentMethods VALUES (4, 'Apple Pay');
INSERT INTO PaymentMethods VALUES (5, 'Google Pay');
INSERT INTO PaymentMethods VALUES (6, 'Bank Transfer');
INSERT INTO PaymentMethods VALUES (7, 'Cash on Delivery');

-- Payments
INSERT INTO Payments VALUES (1, 1, 999.99, TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (4, 7, 1199.99, TO_DATE('2023-11-25', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (7, 2, 499.99, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (10, 4, 799.99, TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (12, 7, 399.99, TO_DATE('2023-11-30', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (14, 1, 1149.98, TO_DATE('2023-10-30', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (17, 2, 129.99, TO_DATE('2024-03-15', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (19, 5, 149.99, TO_DATE('2024-04-20', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (21, 7, 1279.98, TO_DATE('2024-02-17', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (25, 3, 79.99, TO_DATE('2024-01-18', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (26, 1, 2499.99, TO_DATE('2023-10-05', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (30, 7, 849.99, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (32, 3, 1199.99, TO_DATE('2023-12-12', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (35, 2, 1279.98, TO_DATE('2024-04-10', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (2, 5, 1049.98, TO_DATE('2023-12-10', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (8, 1, 399.99, TO_DATE('2024-04-10', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (9, 2, 399.99, TO_DATE('2023-07-22', 'YYYY-MM-DD'));

-- Shipping
INSERT INTO Shipping VALUES (1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (4, TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-11-25', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (7, TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (10, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (12, TO_DATE('2023-11-25', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (14, TO_DATE('2023-10-30', 'YYYY-MM-DD'), TO_DATE('2023-11-04', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (17, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (19, TO_DATE('2024-04-20', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (21, TO_DATE('2024-02-12', 'YYYY-MM-DD'), TO_DATE('2024-02-17', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (25, TO_DATE('2024-01-18', 'YYYY-MM-DD'), TO_DATE('2024-01-23', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (26, TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (30, TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (32, TO_DATE('2023-12-12', 'YYYY-MM-DD'), TO_DATE('2023-12-17', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (35, TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-10', 'YYYY-MM-DD'));
INSERT INTO Shipping VALUES (2, TO_DATE('2023-12-10', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (8, TO_DATE('2024-04-10', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (9, TO_DATE('2023-07-22', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (11, TO_DATE('2023-12-18', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (18, TO_DATE('2023-08-20', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (22, TO_DATE('2023-11-15', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (23, TO_DATE('2024-03-28', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (28, TO_DATE('2023-08-02', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (31, TO_DATE('2024-01-25', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (33, TO_DATE('2024-02-15', 'YYYY-MM-DD'), NULL);
INSERT INTO Shipping VALUES (34, TO_DATE('2023-11-22', 'YYYY-MM-DD'), NULL);

-- Reviews
INSERT INTO Reviews VALUES (1, 5, 5, 'Amazing performance and battery life.');
INSERT INTO Reviews VALUES (3, 4, 4, 'Great camera and design, but could use some improvements.');
INSERT INTO Reviews VALUES (5, 20, 5, 'Lightweight and stylish, perfect for work.');
INSERT INTO Reviews VALUES (5, 3, 4, 'Good performance but slightly overpriced.');
INSERT INTO Reviews VALUES (6, 19, 4, 'Solid laptop for daily tasks with good battery.');
INSERT INTO Reviews VALUES (7, 14, 5, 'Best tablet experience with excellent display.');
INSERT INTO Reviews VALUES (9, 18, 3, 'Affordable, but lacks some features.');
INSERT INTO Reviews VALUES (18, 19, 5, 'Perfect camera for professional photographers.');
INSERT INTO Reviews VALUES (20, 3, 2, 'Disappointed with the image quality, expected better for the price.');
INSERT INTO Reviews VALUES (10, 1, 4, NULL);
INSERT INTO Reviews VALUES (18, 15, 4, NULL);

-- Promotions
INSERT INTO Promotions VALUES (1, 3, 20);
INSERT INTO Promotions VALUES (2, 5, 35);
INSERT INTO Promotions VALUES (3, 1, 50);
INSERT INTO Promotions VALUES (4, 7, 75);

COMMIT;
