-- Preview Customer Reviews
SELECT * 
FROM "amazon_reviews_parquet"
limit 10;

-- Show distinct sentiments
SELECT distinct sentiment
FROM "amazon_reviews_parquet"
limit 10;

-- Star Rating and Sentiment
SELECT star_rating, sentiment, count(*) as total_reviews
FROM "amazon_reviews_parquet"
group by star_rating, sentiment
order by star_rating, sentiment;

-- List top rated appliances
SELECT 
    product_title, star_rating,
    sentiment, review_headline, review_body
FROM "amazon_reviews_parquet"
order by star_rating desc
limit 10;

-- Good star rating but sentiment is not positive
SELECT
    product_title, star_rating,
    sentiment, review_headline, review_body
FROM "amazon_reviews_parquet"
where star_rating > 3
and sentiment != 'POSITIVE'
limit 10;

-- List top rated 
SELECT
    product_title, star_rating,
    sentiment, review_headline, review_body
FROM "amazon_reviews_parquet"
where product_category='Major Appliances'
and star_rating > 3
and product_title like '%Dryer%'
limit 10;


SELECT TRUNC(DATE_XXX, 'DD')
FROM my_table

30/04/2024 10:48:19

30/04/2024