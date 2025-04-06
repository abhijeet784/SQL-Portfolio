**Retail Sales Analysis SQL Project**
Overview
**This project showcases SQL queries for retail sales data analysis. It involves database setup, data cleaning, and answering business questions. Perfect for beginners aiming to strengthen their SQL skills.
Objectives**
**- Create a retail sales database.
- Perform data cleaning and exploratory data analysis.
- Extract business insights using SQL queries.**

**Features**
- Database Setup: Includes scripts for creating a database and table structure.
- Data Cleaning: Eliminates records with missing values.
- Business Insights: Answers questions on sales trends, customer behavior, and product performance.

**Key SQL Queries**
Some highlights include:
- Calculating total sales by category.
- Finding top customers based on sales.
- Analyzing sales patterns by shift (Morning, Afternoon, Evening).

**How to Use**
- Clone the repository.
- Import the SQL scripts into MySQL Workbench.
- Execute queries and explore the dataset.

Conclusion
This project demonstrates the power of SQL in business data analysis, providing valuable insights for decision-making.

```sql
use retail;
### 1. Data Exploration & Cleaning

- **distinct customer_id check **
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SSelect distinct(customer_id) from retail;

select * from retail
where transactions_id is null;

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

```

### 2. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
SELECT 
    *
FROM
    retail
WHERE
    YEAR(sale_date) = 2022
        AND MONTH(sale_date) = 11
        AND DAY(sale_date) = 05;

```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 2 in the month of Nov-2022**:
```sql
SELECT 
    transactions_id
FROM
    retail
WHERE
    category = 'clothing' AND quantity > 2
        AND YEAR(sale_date) = '2022'
        AND MONTH(sale_date) = 11
ORDER BY transactions_id ASC;

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
SELECT 
    category, SUM(total_sale) AS categoricl_sales
FROM
    retail
GROUP BY 1;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
SELECT 
    AVG(age) AS average_age
FROM
    retail
WHERE
    category = 'Beauty';
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
SELECT 
    transactions_id
FROM
    retail
WHERE
    total_sale > 1000
ORDER BY 1 ASC;
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
SELECT 
    gender, category, SUM(transactions_id) AS tot_transactions
FROM
    retail
GROUP BY 1 , 2
ORDER BY 2 ASC;
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_Sale) AS avg_sale
FROM
    retail
GROUP BY 1 , 2
ORDER BY avg(total_sale) desc;

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
```sql
SELECT 
    customer_id, SUM(total_sale) AS top_customer
FROM
    retail
GROUP BY customer_id
ORDER BY 1 DESC
LIMIT 5;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
SELECT 
    category, COUNT(DISTINCT customer_id) AS unique_customer
FROM
    retail
WHERE
    category IN ('clothing' , 'beauty', 'electronics')
GROUP BY category;
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
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
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

## How to Use

1. **Clone the Repository**: Clone this project repository from GitHub.
2. **Set Up the Database**: Run the SQL scripts provided in the `database_setup.sql` file to create and populate the database.
3. **Run the Queries**: Use the SQL queries provided in the `analysis_queries.sql` file to perform your analysis.
4. **Explore and Modify**: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.



