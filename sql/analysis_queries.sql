-- Query 1: Sales and profit broken down by discount range

SELECT
     CASE
	     WHEN Discount = 0 THEN '0%'
		 WHEN Discount <= 0.10 THEN '1-10%'
		 WHEN Discount <= 0.20 THEN '11-20%'
		 WHEN Discount <= 0.30 THEN '21-30%'
		 ELSE '31%+'
		END AS discount_bucket,
		 ROUND(SUM(Sales), 2) AS total_sales,
		 ROUND(SUM(Profit), 2) AS total_profit
	FROM orders
	GROUP BY discount_bucket 
	ORDER BY MIN(Discount);
	
--Query 2: Profit by category
	
	SELECT
	    Category,
		ROUND(SUM(Sales), 2) AS total_sales,
		ROUND(SUM(Profit), 2) AS total_profit
	FROM orders
	GROUP BY Category
	ORDER BY total_profit DESC;
	
--Query 3: Profit by region	
	
SELECT 
    Region,
	ROUND(SUM(Sales), 2) AS total_sales,
	ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Region 
ORDER BY total_profit DESC;

--Query 4: Sales and profit by customer Segment

SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Segment
ORDER BY total_profit DESC;	

--Query 5: Which category is hit hardestby high discounts

SELECT 
     Category,
	 CASE
	   WHEN Discount > 0.20 THEN 'Above 20%'
	   ELSE '20% or below'
	END AS discount_tier,
	ROUND(SUM(Sales), 2) AS total_sales,
	ROUND(SUM(Profit), 2) AS total_profit,
	COUNT(*) AS order_count
  FROM orders
  GROUP BY Category, discount_tier
  ORDER BY Category, discount_tier;

