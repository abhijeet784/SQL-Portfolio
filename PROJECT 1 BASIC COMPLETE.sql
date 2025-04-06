use retail;
select* from retail;

-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022'
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


# cleaning data 
select * from retail
where transactions_id is null;

select * from retail;

select * from retail
where sale_date is null;

select * from retail
where sale_time is null;

select * from retail
where customer_id is null;

select * from retail
where gender is null;

select * from retail
where age is null;

select * from retail
where category is null;

select * from retail
where quantity is null;

select * from retail 
where price_per_unit is null;

select * from retail 
where cogs is null;

select * from retail
where total_sale is null;

select * from retail;

-- Q.1Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT 
    *
FROM
    retail
WHERE
    YEAR(sale_date) = 2022
        AND MONTH(sale_date) = 11
        AND DAY(sale_date) = 05;

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT 
    transactions_id
FROM
    retail
WHERE
    category = 'clothing' AND quantity > 2
        AND YEAR(sale_date) = '2022'
        AND MONTH(sale_date) = 11
ORDER BY transactions_id ASC;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category, SUM(total_sale) AS categoricl_sales
FROM
    retail
GROUP BY 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
    AVG(age) AS average_age
FROM
    retail
WHERE
    category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT 
    transactions_id
FROM
    retail
WHERE
    total_sale > 1000
ORDER BY 1 ASC;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
    gender, category, SUM(transactions_id) AS tot_transactions
FROM
    retail
GROUP BY 1 , 2
ORDER BY 2 ASC;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_Sale) AS avg_sale
FROM
    retail
GROUP BY 1 , 2
ORDER BY 1 ASC;

-- .8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT 
    customer_id, SUM(total_sale) AS top_customer
FROM
    retail
GROUP BY customer_id
ORDER BY 1 DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    category, COUNT(DISTINCT customer_id) AS unique_customer
FROM
    retail
WHERE
    category IN ('clothing' , 'beauty', 'electronics')
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sales AS (
    SELECT *,
           CASE
               WHEN HOUR(sale_time) < 12 THEN 'Morning'
               WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
               WHEN HOUR(sale_time) > 17 THEN 'Evening'
           END AS Period
    FROM retail
)
SELECT Period, COUNT(*) AS Total_Orders
FROM hourly_sales
GROUP BY Period;



