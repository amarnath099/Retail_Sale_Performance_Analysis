create database project1;
use project1;
select * from retail_sales1;

alter table retail_sales1 modify column Date date;
alter table retail_sales1 modify column Year year;
alter table retail_sales1 modify column Month text;
alter table retail_sales1 modify column Time time;

-- setting for time out or lost connection
SET SESSION net_read_timeout=600;
SET SESSION net_write_timeout=600;
SET SESSION wait_timeout=600;

alter table retail_sales1 modify column amount decimal(20,2);
alter table project1.retail_sales1 modify column total_amount decimal(20,2);
alter table retail_sales1 modify column city text;
desc retail_sales1;


select * from retail_sales1; 
-- SQL Task – Data Extraction & Manipulation

-- -1 Retrieve total sales per region.

select country,sum(Total_Amount) as Total_sales_Per_resion from retail_sales1  
group by country ORDER BY sum(Total_Amount) DESC; 

-- 2 Find the top 5 best-selling products
SELECT products,count(products) 5_best_selling FROM retail_sales1
GROUP BY products  ORDER BY count(products) DESC LIMIT 5;

-- -3 Calculate monthly revenue.
select Month,sum(Total_Amount) as Monthly_revenue from retail_sales1  
group by Month ORDER BY sum(Total_Amount) DESC; 

-- -4 Identify repeat customers.
select name,count(name) as Repeat_customers from retail_sales1 group by name order by count(name) desc limit 10;

-- -5 Find average order value per region.
select country,avg(Total_Amount) as Average_Value_Per_resion from retail_sales1  
group by country ORDER BY Avg(Total_Amount) DESC;

 
-- -6 Determine peak sales hour in a day.
SELECT HOUR(time) AS hour_of_day,SUM(Total_Amount) AS total_sales 
FROM retail_sales1 GROUP BY hour_of_day ORDER BY total_sales DESC;

-- -7 Rank products by sales within each category.
SELECT product_category,products,SUM(Total_Amount) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(Total_Amount) DESC
    ) AS sales_rank
FROM retail_sales1 GROUP BY product_category, products;

select sum(total_amount) from retail_sales1;

