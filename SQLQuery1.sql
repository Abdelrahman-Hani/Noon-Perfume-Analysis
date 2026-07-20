select *from dbo.noon_perfumes_clean
-------------------------------------

SELECT COUNT(*) AS Total_Products
FROM dbo.noon_perfumes_clean

-------------------------------------
select count(Distinct brand) AS total_brands from dbo.noon_perfumes_clean

-------------------------------------
select count(distinct seller)as total_seller from dbo.noon_perfumes_clean

-------------------------------------
select AVG (new_price) AS avr_newprice from dbo.noon_perfumes_clean

-------------------------------------
select max(new_price)as max_price,
min(new_price) as min_price
from dbo.noon_perfumes_clean

-------------------------------------
select brand,count(*) as total_product
from dbo.noon_perfumes_clean
group by brand
order by total_product desc
-------------------------------------
select brand,avg(new_price) AS AVG_price
from dbo.noon_perfumes_clean
group by brand
order by avg(new_price) desc
-------------------------------------
select brand,avg(item_rating) as AVG_rating
from dbo.noon_perfumes_clean
group by brand
order by AVG_rating desc
-------------------------------------
select department,count(*) AS products
from dbo.noon_perfumes_clean
group by department

-------------------------------------

select brand,avg(discount_amount) as AVG_discount
from dbo.noon_perfumes_clean
group by brand
order by AVG_discount desc
 ------------------------------------
 SELECT *
FROM dbo.noon_perfumes_clean
WHERE department = 'Women';
-------------------------------------
SELECT *
FROM dbo.noon_perfumes_clean
WHERE item_rating >= 4.5;
-------------------------------------
SELECT *
FROM dbo.noon_perfumes_clean
WHERE new_price > 300;
-------------------------------------
SELECT
    brand,
    AVG(item_rating) AS Avg_Rating
FROM dbo.noon_perfumes_clean
GROUP BY brand
HAVING AVG(item_rating) >= 4.5
ORDER BY Avg_Rating DESC;
----------------------------------------
SELECT
    name,
    new_price,
    CASE
        WHEN new_price < 100 THEN 'Budget'
        WHEN new_price BETWEEN 100 AND 300 THEN 'Mid'
        ELSE 'Luxury'
    END AS Price_Category
FROM dbo.noon_perfumes_clean;
-------------------------------------------
SELECT
    name,
    brand,
    new_price,
    RANK() OVER(ORDER BY new_price DESC) AS Price_Rank
FROM dbo.noon_perfumes_clean;
-------------------------------------------
SELECT
    brand,
    name,
    new_price,
    ROW_NUMBER() OVER(PARTITION BY brand ORDER BY new_price DESC) AS RN
FROM dbo.noon_perfumes_clean;