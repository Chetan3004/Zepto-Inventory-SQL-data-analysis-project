select * from zepto_v2 ;

select count(*) from zepto_v2 ;

-- sample data
SELECT * FROM zepto_v2
LIMIT 10;

-- null values

SELECT * FROM zepto_v2
WHERE name IS NULL
OR
ï»¿Category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- different product categories
SELECT DISTINCT ï»¿Category
FROM zepto_v2
ORDER BY ï»¿Category;

-- products in stock vs out of stock
SELECT outOfStock, COUNT(availableQuantity)
FROM zepto_v2
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(availableQuantity) AS "Number of products"
FROM zepto_v2
GROUP BY name
HAVING count(availableQuantity) > 1
ORDER BY count(availableQuantity) DESC;

-- data cleaning

-- products with price = 0
SELECT * FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto_v2
WHERE mrp = 0;

-- convert paise to rupees
UPDATE zepto_v2
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;

-- data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;


-- Q2. Which products are being sold at a discount of more than 25% and are still in stock?
SELECT DISTINCT name, availableQuantity, discountPercent
FROM zepto_v2
WHERE availableQuantity > 0 AND discountPercent > 25
ORDER BY availableQuantity DESC, discountPercent DESC;


-- Q3.What are the Products with High MRP but Out of Stock

SELECT DISTINCT name,mrp
FROM zepto_v2
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

-- Q4.Calculate Estimated Revenue for each category
SELECT ï»¿Category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_v2
GROUP BY ï»¿Category
ORDER BY total_revenue;

-- Q5. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q6. Identify the top 5 categories offering the highest average discount percentage.
SELECT ï»¿Category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_v2
GROUP BY ï»¿Category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q7. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto_v2
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q8.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto_v2;

-- Q9.What is the Total Inventory Weight Per Category 
SELECT ï»¿Category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_v2
GROUP BY ï»¿Category
ORDER BY total_weight;

-- Q10. What is the Total Inventory Value Per Category?
SELECT 
    ï»¿Category,
    SUM(availableQuantity * discountedSellingPrice) AS totalInventoryValue
FROM zepto_v2
GROUP BY ï»¿Category
ORDER BY totalInventoryValue DESC;



