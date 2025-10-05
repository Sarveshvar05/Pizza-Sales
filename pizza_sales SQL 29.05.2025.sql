CREATE TABLE pizza_sales ( sale_id INT AUTO_INCREMENT PRIMARY KEY,
sale_date DATE NOT NULL,
pizza_type VARCHAR(50) NOT NULL,


size VARCHAR(20),
quantity INT,
price DECIMAL(10, 2), 
location VARCHAR(50) );
 
 DESC pizza_sales;


INSERT INTO pizza_sales (sale_date, pizza_type, size, quantity, price, location)
VALUES
('2024-01-01', 'Pepperoni', 'Small', 5, 8.99, 'New York'),
('2024-01-01', 'Pepperoni', 'Medium', 3, 12.99, 'New York'),
('2024-01-02', 'Margherita', 'Large', 2, 15.99, 'New York'),
('2024-01-02', 'BBQ Chicken', 'Small', 4, 9.99, 'Chicago'),
('2024-01-03', 'Vegetarian', 'Large', 6, 14.99, 'Los Angeles'),
('2024-01-04', 'Pepperoni', 'Small', 7, 8.99, 'Chicago'),
('2024-01-05', 'BBQ Chicken', 'Medium', 2, 13.99, 'Los Angeles'),
('2024-01-06', 'Margherita', 'Small', 8, 7.99, 'New York'),
('2024-01-07', 'Vegetarian', 'Medium', 3, 12.99, 'Chicago'),
('2024-01-08', 'Pepperoni', 'Large', 1, 15.99, 'Los Angeles'),
('2024-01-09', 'BBQ Chicken', 'Large', 2, 17.99, 'New York'),
('2024-01-10', 'Vegetarian', 'Small', 5, 9.99, 'Chicago');

SELECT * FROM pizza_sales;

-- 1. Total sales amount by pizza type 
SELECT pizza_type,
   SUM(price*quantity) AS 'TOTAL SALES'
   FROM pizza_sales
   GROUP BY pizza_type
   ORDER BY SUM(price*quantity) DESC;
   
   -- 2. Average price of each pizza type 
   SELECT pizza_type,
ROUND(AVG(price),2) AS 'AVERAGE PRICE'
   FROM pizza_sales
   GROUP BY  pizza_type
   ORDER BY  AVG(price) DESC;
   
   -- 3. Total quantity sold by location 
   SELECT quantity,location,
    SUM(quantity) AS'TOTAL QUANTITY'
    FROM pizza_sales
    GROUP BY quantity,location
    ORDER BY  SUM(quantity) DESC;
    
--    4. Total sales amount by size 
SELECT size,
 SUM(price)  AS ' TOTAL SALES'
 FROM pizza_sales
 GROUP BY size
 ORDER BY  SUM(price) DESC;
 
 -- 5. Total sales amount by pizza type and size 
 SELECT pizza_type,size,
 SUM(price) AS 'TOTAL SALES BY PIZZA_TYPE AND SIZE'
 FROM pizza_sales
 GROUP BY pizza_type,size
 ORDER BY  SUM(price) DESC;
 
 ALTER TABLE pizza_sales  ADD COLUMN month_name VARCHAR(100);
 
 UPDATE pizza_sales
 SET month_name = monthname(sale_date);
 
 SELECT * FROM pizza_sales;
 
 
 -- 6. Total sales amount by month
 SELECT month_name,
 SUM(price) AS 'AMOUNT BY MONTH'
 FROM pizza_sales
 GROUP BY month_name
 ORDER BY SUM(price) DESC;

-- 7. Total sales amount by location and pizza type
SELECT location,pizza_type,
SUM(price) AS 'SALES BY LOCATION AND TYPE'
FROM pizza_sales
GROUP BY  location,pizza_type
ORDER BY SUM(price) DESC;

-- 8. Count of sales by pizza type 
SELECT pizza_type,
COUNT(quantity) AS 'COUNT OF SALES'
FROM pizza_sales
GROUP BY pizza_type
ORDER BY COUNT(quantity) DESC;
SELECT * FROM pizza_sales;
-- 9. Total sales amount categorized by price range
SELECT price,
      CASE
        WHEN price < 10 THEN 'LOW'
        WHEN price >= 10 AND 15 THEN 'MEDIUM'
        ELSE 'HIGH'
        END AS 'CATEGORIZED'
        FROM pizza_sales
        ORDER BY  CASE  WHEN price < 10 THEN 'LOW'
        WHEN price >= 10 AND 15 THEN 'MEDIUM'
        ELSE 'HIGH'
        END;
        

-- 10. Total sales amount by pizza type with a minimum of 5 pizzas sold 
SELECT pizza_type,
 SUM(quantity) AS 'MINIUM SALES'
 FROM pizza_sales
 GROUP BY pizza_type
 HAVING SUM(quantity) >= 5
 ORDER BY  SUM(quantity) DESC;
 
 -- 11. Total sales amount by size and location 
 SELECT size,location,
 SUM(price) AS'TOTAL SALES OF SIZE AND LOCATION'
 FROM pizza_sales
 GROUP BY size,location
 ORDER BY  SUM(price)DESC;
 
 -- 12. Average quantity sold by pizza type
 SELECT pizza_type,
 ROUND(AVG(quantity),2) AS 'AVERAGEOF PIZZA TYPE'
 FROM pizza_sales
 GROUP BY pizza_type
 ORDER BY  AVG(quantity) DESC;
 
 -- 13. Total sales amount by location with average price above 10 
 SELECT location,
 ROUND(AVG(price) ,2)AS 'AVERAGE PRICE'
 FROM pizza_sales
 GROUP BY location
 HAVING AVG(PRICE) > 10
 ORDER BY  AVG(price) DESC;
 SELECT * FROM pizza_sales;
 
 ALTER TABLE pizza_sales ADD COLUMN day_name VARCHAR(100);
 UPDATE pizza_sales
 SET day_name = dayname(sale_date);
 SELECT * FROM pizza_sales;
 
 -- 14. Total sales amount by day of the week
 SELECT day_name,
 SUM(price) AS 'TOTAL SALES BY DAY'
 FROM pizza_sales
 GROUP BY day_name
 ORDER BY SUM(price)DESC;
 
 -- 15. Total sales amount by month and location
 SELECT month_name,location,
 SUM(price) AS'TOTAL SALES BY MONTH AND LOCATION'
 FROM pizza_sales
 GROUP BY month_name,location
 ORDER BY  SUM(price)DESC;
 
 -/*16. Total sales amount by pizza type with price range categorization ( Price < 10, “Low”, Between
10 and 15, “Medium”, Else “High”) */
SELECT pizza_type,
CASE
   WHEN price < 10 THEN 'LOW'
   WHEN price BETWEEN 10 AND 15 THEN 'MEDIUM'
   ELSE 'HIGH'
   END AS 'TOTAL SALES BY PIZZA_TYPE'
   FROM pizza_sales
   ORDER BY CASE
   WHEN price < 10 THEN 'LOW'
   WHEN price BETWEEN 10 AND 15 THEN 'MEDIUM'
   ELSE 'HIGH'
   END;
   
-- 17. Total sales amount by location with a minimum total sales of 100
SELECT location,
    SUM(price) AS 'MINIMUM SALES'
    FROM pizza_sales
    GROUP BY  location
    HAVING SUM(price) >= 100
    ORDER BY  SUM(price);
    SELECT * FROM pizza_sales;
-- 18. Average sales amount per order by pizza type
SELECT pizza_type,
 ROUND(AVG(price),2) AS 'AVERAGE SALES AMOUNT'
 FROM pizza_sales
 GROUP BY pizza_type
 ORDER BY  AVG(price) DESC;
 
 -- 19. Total sales amount by location and day of the week
 SELECT location,day_name,
      SUM(price) AS 'SALES BY LOCATION'
      FROM pizza_sales
      GROUP BY location,day_name
      ORDER BY SUM(price)DESC;

    
 
 
 
 
 
 



 
 
 
 
 
 
 
 
 
 
 


