# DataLake
- https://docs.aws.amazon.com/whitepapers/latest/building-data-lakes/monitoring-optimizing-data-lake-environment.html
- https://us-east-1.console.aws.amazon.com/glue/home?region=us-east-1#/v2/data-catalog/databases
- https://docs.aws.amazon.com/athena/latest/ug/select.html


## 1. Documentacion y entregrables (OK)
- Documento 1.4.x
- Lista de entregables @sergio

## Datalake Introduction
- Udemy pdf

## Data Catalog and Querying (last session, continue... today)
Ohio

- Iris (csv)
Permissions =>  S3 Bucket => Upload Data => Configure Crawler => Add a datastore => Security settings => Specify Output (Database) => Run Crawler => Tables

- Amazon customer reviews
S3 => Create table => Run queries (Athena) 

- Requerimiento: estandarizar los nombres de los catalogos y tablas

##  Glue ETL with Apache Sparks (today)

### iris CSV to parquet
36.
1. Create Job (s3 example job)
- Visual => Change properties
- Job Details => Role
2. Querying

### 
MSISDN stands for Mobile Station International Subscriber Directory Number

Plan Assigment: MSISDN, plan_id

Subscriber: MSISDN, genre, birth_date, is_vip

Plans: plan_id, plan_desc,  plan_price


"a","b",""'String'""

# University Ranking
- ![Kaggle Datasets](https://www.kaggle.com/datasets)
- https://www.kaggle.com/code/rizqyad/qs-world-university-rankings-2017-2023

## S3
- Create buckets for every user
suan-workshop-datalake-robin-deletable-us-east-1
suan-workshop-datalake-<your_name>-deletable-us-east-1
...

- Create subfolders
university_ranking/csv

## Glue
- Create database
suan_workshop_datalake_robin_ranking_universities_db
suan_workshop_datalake_<your_name>_ranking_universities_db


## Crawler
suan_workshop_datalake_robin_ranking_universities_crawler
suan_workshop_datalake_<your_name>_ranking_universities_crawler
- Add datasource
- Choose role: suan-workshop-datalake
- Prefix: university_ranking_<your_name>
- run crawler
- check table


### Data Quality Issues


```sql

SELECT * 
FROM "university_ranking_csv"
WHERE rank_display < 6
ORDER BY year, rank_display;

--- rank_display is a string

SELECT DISTINCT rank_display
FROM "university_ranking_csv";

-- Check the data 


SELECT DISTINCT length(rank_display) 
FROM "university_ranking_csv"
ORDER BY length(rank_display) desc;

--- Distinct Rank Display Values Sorted by Length
SELECT distinct rank_display, rank_length FROM (
    SELECT rank_display, length(rank_display) as rank_length
    FROM "university_ranking_csv"
    ORDER BY rank_length, length(rank_display) desc
    )
ORDER BY rank_length DESC;




--- 2. Top 5 universities - String ---
SELECT * 
FROM "university_ranking_csv"
WHERE rank_display in ('1','2','3','4','5')
ORDER BY year, rank_display;

--- 3. Check Column Mapping - Cross Check Athena Output and CSV File Content. Look for double quotes! ---
SELECT * 
FROM "university_ranking_csv"
WHERE university like '%Nanyang Technological University%'
ORDER BY year, rank_display;


```
# OpenCSVSerDe for processing CSV

- https://docs.aws.amazon.com/athena/latest/ug/csv-serde.html
- Delete tables
- Delete crawler

- Create schema option 1
- Errors empty fields, 377

- Create schema option 2, all string
- Create workspace:  suan_workshop_datalake_<your_name>_ranking_universities_workgroup




## Next2 session: Schema evolution


## Oracle

SELECT DAT