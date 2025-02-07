# DataLake

- <https://docs.aws.amazon.com/whitepapers/latest/building-data-lakes/monitoring-optimizing-data-lake-environment.html>
- <https://us-east-1.console.aws.amazon.com/glue/home?region=us-east-1#/v2/data-catalog/databases>
- <https://docs.aws.amazon.com/athena/latest/ug/select.html>

## Datalake Introduction

- Udemy pdf

## Data Catalog and Querying (last session, continue... today)

> Ohio

- Iris (csv)
Permissions =>  S3 Bucket => Upload Data => Configure Crawler => Add a datastore => Security settings => Specify Output (Database) => Run Crawler => Tables

Use: AWSGlueServiceRole

- Amazon customer reviews
S3 => Create table => Run queries (Athena)

- Requerimiento: estandarizar los nombres de los catalogos y tablas

## Glue ETL with Apache Sparks (today)

### iris CSV to parquet

1. Create Job (s3 example job)
    - Visual => Change properties
    - Job Details => Role

2. Querying

MSISDN stands for Mobile Station International Subscriber Directory Number

Plan Assigment: MSISDN, plan_id

Subscriber: MSISDN, genre, birth_date, is_vip

Plans: plan_id, plan_desc,  plan_price

"a","b",""'String'""

## University Ranking

- [Kaggle Datasets](https://www.kaggle.com/datasets)
- <https://www.kaggle.com/code/rizqyad/qs-world-university-rankings-2017-2023>

### S3

- Create buckets for every user
suan-workshop-datalake-robin-deletable-us-east-1
suan-workshop-datalake-<your_name>-deletable-us-east-1
...

- Create subfolders
university_ranking/csv

### Glue

- Create database
suan_workshop_datalake_robin_ranking_universities_db
suan_workshop_datalake_<your_name>_ranking_universities_db

### Crawler

suan_workshop_datalake_robin_ranking_universities_crawler
suan_workshop_datalake_<your_name>_ranking_universities_crawler

- Add datasource
- Choose role: suan-workshop-datalake
- Prefix: university_ranking_<your_name>
- run crawler
- check table

#### Data Quality Issues

```SQL

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

## OpenCSVSerDe for processing CSV

### Schema Option 1

- <https://docs.aws.amazon.com/athena/latest/ug/csv-serde.html>
- Delete tables
- Delete crawler

- Create schema option 1
- Errors empty fields, 377

### Schema Option 2

- Create schema option 2, all string
- Create workspace:  suan_workshop_datalake_<your_name>_ranking_universities_workgroup
- 39.

> Check the data

```sql
SELECT * 
FROM "university_ranking_csv_all_strings"
WHERE university like '%Nanyang Technological University%'
ORDER BY year, rank_display;

SELECT distinct rank_display, rank_length FROM (
    SELECT rank_display, length(rank_display) as rank_length
    FROM "university_ranking_csv_all_strings"
    ORDER BY rank_length, length(rank_display) desc
    )
ORDER BY rank_length DESC;


```

> 40

### Data cleanup

- ref: [Data type formatting functions](https://docs.aws.amazon.com/clean-rooms/latest/sql-reference/r_Data_type_formatting.html)
- Convert string to correct data type
- Handle missing values

#### CAST

```SQL

SELECT CAST(year as integer)
FROM "university_ranking_csv_all_strings"
LIMIT 10;

-- what happend with all?

SELECT cast(rank_display as integer)
FROM "university_ranking_csv_all_strings"
LIMIT 10;

-- what happend with all?

```

#### SPLIT-PART

```SQL
SELECT SPLIT_PART('abc$def$ghi','$',2);

SELECT rank_display, SPLIT_PART(rank_display,'-',1) AS n_rank
FROM "university_ranking_csv_all_strings";


SELECT rank_display, SPLIT_PART(rank_display,'-',1) AS n_rank
FROM "university_ranking_csv_all_strings"
WHERE rank_display LIKE '%-%';


SELECT rank_display, CAST(SPLIT_PART(rank_display,'-',1) AS INTEGER) AS n_rank
FROM "university_ranking_csv_all_strings";

-- INVALID_CAST_ARGUMENT: Cannot cast '' to INT, what can we do?
-- Show the rank_display with missing values

SELECT *
FROM "university_ranking_csv_all_strings"
WHERE rank_display = '';  -- Works with ""?

SELECT count (*)
FROM "university_ranking_csv_all_strings"
WHERE rank_display = '';  

```

#### TRY, NVL

 ```SQL
SELECT rank_display, TRY(CAST(SPLIT_PART(rank_display,'-',1) AS INTEGER)) AS n_rank
FROM "university_ranking_csv_all_strings";

SELECT rank_display, COALESCE(TRY(CAST(SPLIT_PART(rank_display,'-',1) AS INTEGER)),-1) AS n_rank
FROM "university_ranking_csv_all_strings";

 ```

#### Wrapping up

```SQL
SELECT university, year, 
       rank_display, 
       COALESCE(TRY(CAST(split_part(rank_display,'-',1) AS INT)), -1) AS n_rank,
       score, country, city, region, type,
       research_output, student_faculty_ratio, international_students,
       size, faculty_count
FROM "university_ranking_csv_all_strings";

SELECT *
    FROM (
        SELECT university, year, 
        rank_display, 
        COALESCE(TRY(CAST(split_part(rank_display,'-',1) AS INT)), 9999) AS n_rank,
        score, country, city, region, type,
        research_output, student_faculty_ratio, international_students,
        size, faculty_count
        FROM "university_ranking_csv_all_strings"
    )
WHERE n_rank < 6
ORDER BY year, n_rank;

```

#### REGEXP

- <https://docs.aws.amazon.com/clean-rooms/latest/sql-reference/REGEXP_REPLACE.html>

```SQL
SELECT *
FROM "university_ranking_csv_all_strings"
WHERE country = 'Norway';
-- what happend?

SELECT international_students
FROM "university_ranking_csv_all_strings"
WHERE country = 'Norway'
LIMIT 10;
-- thoudsands with comas?

SELECT  REGEXP_REPLACE(international_students, '[.,]',''),
        REGEXP_REPLACE(faculty_count, '[.,]','')
FROM "university_ranking_csv_all_strings"
WHERE country = 'Norway'
LIMIT 10;

SELECT  CAST(REGEXP_REPLACE(international_students, '[.,]','') as INT),
        CAST(REGEXP_REPLACE(faculty_count, '[.,]','') as INT)
FROM "university_ranking_csv_all_strings"
WHERE country = 'Norway'
LIMIT 10;

SELECT  TRY(CAST(REGEXP_REPLACE(international_students, '[.,]','') as INT)),
        TRY(CAST(REGEXP_REPLACE(faculty_count, '[.,]','') as INT))
FROM "university_ranking_csv_all_strings"
WHERE country = 'Norway'
LIMIT 10;


SELECT  COALESCE(TRY(CAST(REGEXP_REPLACE(international_students, '[.,]','') as INT)), -1),
        TRY(CAST(REGEXP_REPLACE(faculty_count, '[.,]','') as INT))
FROM "university_ranking_csv_all_strings"
WHERE country = 'Norway'
LIMIT 10;


SELECT  COALESCE(TRY(CAST(REGEXP_REPLACE(international_students, '[.,]','') as INT)), -1),
        COALESCE(TRY(CAST(REGEXP_REPLACE(faculty_count, '[.,]','') as INT)), -1)
FROM "university_ranking_csv_all_strings"
WHERE country = 'Norway'
LIMIT 10;


```

#### Wrapping up two

```SQL
--- 10.2 Complete Query ---
SELECT university,
       COALESCE(TRY(CAST(year AS int)),9999) AS year, 
       rank_display, 
       COALESCE(TRY(CAST(split_part(rank_display,'-',1) AS int)),9999) AS n_rank,
       COALESCE(TRY(CAST(score AS double)),-1) AS score, 
       country, 
       city, 
       region, 
       type,
       research_output, 
       COALESCE(TRY(CAST(student_faculty_ratio AS double)),-1) AS student_faculty_ratio,
       COALESCE(TRY(CAST(regexp_replace(international_students,'[.,]','') AS int)),-1) as international_students,
       size, 
       COALESCE(TRY(CAST(regexp_replace(faculty_count,'[.,]','') AS int)),-1) as faculty_count
FROM "university_ranking_csv_all_strings"
order by year, n_rank;
```

#### Pros/Cons with las approch
>
> Pros

- As a tool for check the raw data
- Fast testing to detect problems with the raw data

> Cons

- Complex queries
- Expert on SQL
- Easy commit mistakes
- Hard to mantain
- Cost and performance

### Simplify querying with Views

```SQL
CREATE OR REPLACE VIEW university_ranking_view AS
SELECT university,
       COALESCE(TRY(CAST(year AS int)),9999) AS year, 
       rank_display, 
       COALESCE(TRY(CAST(split_part(rank_display,'-',1) AS int)),9999) AS n_rank,
       COALESCE(TRY(CAST(score AS double)),-1) AS score, 
       country, city, region, type,
       research_output, 
       COALESCE(TRY(CAST(student_faculty_ratio AS double)),-1) AS student_faculty_ratio,
       COALESCE(TRY(CAST(regexp_replace(international_students,'[.,]','') AS int)),-1) AS international_students,
       size, 
       COALESCE(TRY(CAST(regexp_replace(faculty_count,'[.,]','') AS int)),-1) AS faculty_count
FROM "university_ranking_csv_all_strings"
ORDER BY YEAR, n_rank;


SELECT * FROM "suan_workshop_datalake_robin_ranking_universities_db"."university_ranking_view" limit 10;


SELECT year, university, n_rank, country, region, score, type
FROM "suan_workshop_datalake_robin_ranking_universities_db"."university_ranking_view" 
WHERE n_rank < 6
LIMIT 10;

```

#### DENSE_RANK

- [Function dense rank](https://docs.aws.amazon.com/redshift/latest/dg/r_WF_DENSE_RANK.html)

```SQL
--- 12.3. Top 5 universities in each region by year --- 
SELECT * 
FROM (
        SELECT  year, 
                region, 
                DENSE_RANK() OVER(PARTITION BY year, region ORDER BY n_rank) AS region_rank,
                n_rank, university, country, score, type
        FROM "suan_workshop_datalake_robin_ranking_universities_db"."university_ranking_view" 
    )
WHERE region_rank < 6
ORDER BY year, region, region_rank;

SELECT * 
FROM (
        SELECT  year, 
                region, 
                DENSE_RANK() OVER(PARTITION BY year, region ORDER BY n_rank) AS region_rank,
                n_rank, university, country, score, type
        FROM "suan_workshop_datalake_robin_ranking_universities_db"."university_ranking_view" 
    )
WHERE   region_rank < 6 AND
        country = 'United States'
ORDER BY year, region, region_rank;


SELECT  region, 
        COUNT(*) as count_by_region
FROM "suan_workshop_datalake_robin_ranking_universities_db"."university_ranking_view" 
GROUP BY region
ORDER BY count_by_region DESC;

--- 12.5 University Count by Region - Remove Duplicates ---
SELECT region, count(*) as count
FROM (
    SELECT region, university
    FROM "suan_workshop_datalake_robin_ranking_universities_db"."university_ranking_view" 
    GROUP BY region, university
    )
GROUP BY region
ORDER BY count;

```

## Benefits Data Lake

• Take source data as-is and enable SQL querying
• Quickly build prototypes and proof-of- concepts
• Extract, Load and Transform - Cleanup at query time
• Query time cleanup can be inefficient

## Apache Spark (Serverless PySpark)

- <https://github.com/ChandraLingam/DataLake/blob/main/UniversityRanking/university_ranking_notebook.ipynb>

- Glue => Jupyter Notebook

- IAM permissions: AWS Glue Service Role (AWSGlueServiceRole) => Inline policy (iam:PassRole)
arn:aws:iam::036134507423:role/suan-workshop-data-lake

```JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": "arn:aws:iam::1234567890:role/AWSGlueServiceNotebookRoleDefault"            
        }
    ]
   }
```

- Load database and table

## Two (2) view interfaces

### SQL and object interface

```SQL
CREATE EXTERNAL TABLE IF NOT EXISTS `suan_workshop_datalake_robin_ranking_universities_db.university_ranking_csv_clean`(
  `university` string, 
  `year` int, 
  `rank_display` string, 
  `n_rank` int,
  `score` float, 
  `country` string, 
  `city` string, 
  `region` string, 
  `type` string, 
  `research_output` string, 
  `student_faculty_ratio` float, 
  `international_students` int, 
  `size` string, 
  `faculty_count` int)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\\", "quoteChar"='\"') 
LOCATION
  's3://suan-workshop-datalake-robin-deletable-us-east-1/university_ranking/csv_clean/'
TBLPROPERTIES ("skip.header.line.count"="1")
```

## Quicksight

- ref: <https://aws.amazon.com/quicksight/pricing/?refid=0f475f0a-13f6-475c-88be-fd775e266ddf>
- Add role permissions to Athena and S3
- Dataset
- year format (no comas)
- Top rank for each year | (x: year, y: region, value: n_rank, ) | change bar chart for table
- Number of Universities for each region and Type | bar char | (x: region y: value: universities - count distinct) group: type
- Top five Universities | Pivot table | rows: year & univesity , values: n_rank (min) | filter n_rank
- Best universities for each region/country | calculated column: Datasets => Edit dataset => Add calculated field

name: region_rank

```js
denseRank([{n_rank} ASC], [{year}, {region}])
```

pivotal: add all teh columns from the computed column
rows: year, region, universiy
filter: top ten region_rank < 10

## AWS Glue vs Lambda

- [Medium: When to use AWS Lambda over AWS Glue Job(A Use case)](https://anujpachawadkar123.medium.com/when-to-use-aws-lambda-over-aws-glue-job-a-use-case-e86ee97eff5b)
- [Stack: Is AWS Lambda preferred over AWS Glue Job?](https://stackoverflow.com/questions/63599886/is-aws-lambda-preferred-over-aws-glue-job)

## Lambda

- Number of requests: 30 (dias) *12 (sensor por hora)* 24 (horas) = 8640
- test Luis: por hora 12 archivos por hora
- prueba Ignacio: 30 Kb, 8 segundos

## BI

- Luis pruebe si le funciona el workgroup

```SQL
CREATE OR REPLACE VIEW suan_iot_test_device_clean_view AS
SELECT 
        deviceid,
        devicevalue, 
        deviceparameter, 
        TO_DATE(datetime, 'YYYY-MM-DD HH24:MI-SS')    
FROM "suan_iot_test_device";




CREATE OR REPLACE VIEW suan_iot_test_db_view_clean AS
SELECT 
        deviceid,
        devicevalue, 
        deviceparameter, 
        CAST(datetime as date), 
       
FROM "university_ranking_csv_all_strings"
ORDER BY YEAR, n_rank;

select cast('2008-02-18 02:36:48' as date) as mysaletime;

select cast('2008-02-18 02:36:48' as date) as mysaletime;

```

## Schema evolution

### CSV and TSV

- Shuffle columns: athena returns first mapping CSV or TSV format (error: wrong values)
- Missing or new columns: not matches the catalog schema (error: wrong index columns and values)
- Works wells when is added new columns at the end
- Support renaming columns for the index
- Wich user cases fits?

### Parquet

- Shuffle: doesn't matter, works!
- Missing or new columns: works!
- Column rename not supported.
- Wich user cases fits?: Large volume of data

### Lab 1 Schema changes with CSV

#### previous labs

- Glue,
- iris data, s3 (iris csv, s3://suan-workshop-datalake/iris/csv/)
- crawlers
- athena: AWSDataCatalog =>  suan-workshop-datalake-db => iris_csv
- data examples: <https://github.com/ChandraLingam/DataLake/tree/main/Iris/data>
- iris_new_plant_type.csv


```SQL
SELECT * FROM "suan-workshop-datalake-db"."iris_csv" limit 10;

SELECT class, count(*) 
FROM "suan-workshop-datalake-db"."iris_csv" 
GROUP BY class;
```

>

```sh
aws s3 sync 's3://tutorialiotbucket/' 's3://suan-datalake-iot-test-us-east-1/' 
```

## IoT test

> Prueba Luis

### Columnas

- Evitar palabras reservadas (datetime)
- separar palabra por mayus
- datetime, posixtime

```SQL
SELECT 
    devicevalue, 
    deviceparameter, 
    deviceid, 
    posixtime, 
    datetime, 
    COALESCE(posixtime, datetime) as epoch_time
FROM "suan_datale_iot_test_device";


CREATE OR REPLACE VIEW suan_datele_iot_test_clean_view AS
    SELECT 
        devicevalue, 
        deviceparameter, 
        deviceid, 
        posixtime, 
        datetime, 
        COALESCE(posixtime, datetime) as epoch_time
    FROM "suan_datale_iot_test_device";

```
