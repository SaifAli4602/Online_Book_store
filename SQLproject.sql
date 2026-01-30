
create table Books(
"Book_id" serial primary key,
"Title" varchar(100),
"Author" varchar(100),
"Genre" varchar(50),
"Published_year" int,
"Price" numeric(10,2),
"Stock" int
);

drop table if exists Customer;

create table Customer(
 "Customer_id" serial primary key,
 "Name" varchar(100),
 "Email" varchar(100),
 "Phone" varchar(15),
 "City" varchar(50),
 "Country" varchar(150)
);

drop table if exists Orders;

create table Orders(
"Order_id" serial primary key,
"Customer_id" int references Customer("Customer_id"),
"Book_id "int references Books("Book_id"),
"Order_Date" Date,
"Quantity" int,
"Total_Amount" numeric(10,2)
);
select * from Books;
select * from Customer;
select * from Orders;



-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM Books WHERE "Genre"='Fiction';

-- 2) Find books published after the year 1950:

SELECT * FROM Books WHERE "Published_year">1950;

-- 3) List all customers from the Canada

SELECT * FROM Customer WHERE "Country"='Canada';

-- 4) Show orders placed in November 2023:

SELECT * FROM Orders WHERE "Order_Date" BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:

SELECT SUM("Stock") AS Total_Stock From Books;


-- 6) Find the details of the most expensive book:
SELECT * FROM Books ORDER BY "Price" DESC 
LIMIT 1;


-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders WHERE "Quantity">1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders WHERE "Total_Amount">20;



-- 9) List all genres available in the Books table:
SELECT DISTINCT "Genre" FROM Books;


-- 10) Find the book with the lowest stock:
SELECT * FROM Books ORDER BY "Stock" LIMIT 1;


-- 11) Calculate the total revenue generated from all orders:
SELECT SUM("Total_Amount") As Revenue FROM Orders;


-- 12) Find the average price of books in the "Fantasy" genre:
.
SELECT AVG("Price") AS Average_Price FROM Books
WHERE "Genre" = 'Fantasy';


-- 13) List customers who have placed at least 2 orders:

SELECT o."Customer_id", c."Name", COUNT(o."Order_id") AS ORDER_COUNT
FROM Orders o
JOIN Customer c ON o."Customer_id"=c."Customer_id"
GROUP BY o."Customer_id", c."Name"
HAVING COUNT("Order_id") >=2;



-- 14) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM books
WHERE "Genre" ='Fantasy'
ORDER BY "Price" DESC LIMIT 3;




-- 15) List the cities where customers who spent over $30 are located:

SELECT DISTINCT c."City", "Total_Amount"
FROM orders o
JOIN Customer c ON o."Customer_id"=c."Customer_id"
WHERE o."Total_Amount" > 30;


-- 16) Find the customer who spent the most on orders:
SELECT c."Customer_id", c."Name", SUM(o."Total_Amount") AS Total_Spent
FROM orders o
JOIN customer c ON o."Customer_id"=c."Customer_id"
GROUP BY c."Customer_id", c."Name"
ORDER BY Total_spent Desc LIMIT 1;
















