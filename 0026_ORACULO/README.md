# AWS Implementatio

## References

- IoT Core: <https://docs.aws.amazon.com/iot/latest/developerguide/what-is-aws-iot.html>
- AWS IoT - Device data to dashboard in 10 minutes - A demonstration: <https://www.youtube.com/watch?v=z8T4hAERuOg>
- How to Get Started with AWS IoT SiteWise - Intro: <https://youtu.be/Q89oqK_nzFg?si=cLKL0uHcTb5gfeou>
- Udemy: <https://www.udemy.com/share/101XUo3@waW-j0TBSvKiE89gz60tsdBrfwRMQnof4btEIcCgLafCHtVCoUhLYvd7Br2zLA-6/>
- LoraWAN: <https://docs.aws.amazon.com/iot-wireless/latest/developerguide/what-is-iot-lorawan.html>

## LoraWAN

- <https://lora-alliance.org/about-lorawan/>
- <https://lora-alliance.org/agriculture-vertical-market/>

### Devices

- <https://iotfactory.eu/p/exclusive-lorawan-devices/>
- <https://www.amazon.com/-/es/MakerFocus-Desarrollo-Integrado-Meshtastic-Inteligentes/dp/B076MSLFC9/ref=sr_1_4?__mk_es_US=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=1V2AMIU6KAN01&dib=eyJ2IjoiMSJ9.UHuGE3Jd6QzkpOkViTUfm4p4xDYYU-yVz5jo7agQAWqPbjaO8EeA69l7APzzsWx03-16I3fKE99NaNFOjg6DwMbun9bGAEGJ9FpyUZ2oXo14IHShEmeEkGngcj0GzV7Vym5Mb1Fsol0s30C4ES8S2epIuOdl48D_KOLxesoTTC2r1RCeoZGdsbKtRmCtOF9ZjZQpd2Y310wg07us3fbDwLWy7NW_huBqmdbRr8VyB4M.ogI1jo9fIx3l-CvqsGeS-iklsKt0E3ppdaq_SmOKYgw&dib_tag=se&keywords=lora&qid=1744041773&sprefix=lora%2Caps%2C494&sr=8-4&th=1>

## AWS IoT Core services

- <https://docs.aws.amazon.com/iot/latest/developerguide/aws-iot-how-it-works.html>

## Learn

- <https://docs.aws.amazon.com/iot/latest/developerguide/aws-iot-learn-more.html>

### Telemetry

- <https://docs.aws.amazon.com/wellarchitected/latest/iot-lens/device-telemetry.html>

. 4. Multiple publishing topics and a single subscriber
. 5. AWS IoT SiteWise Edge software

### AWS SDK

- <https://docs.aws.amazon.com/iot/latest/developerguide/sdk-general-information-section.html>

Python Boto3: <https://github.com/awsdocs/aws-doc-sdk-examples/tree/main/python>

### Device Client (Mauricio)

- <https://docs.aws.amazon.com/iot/latest/developerguide/iot-dc-install-dc.html>

### (jobs) with the AWS IoT Device Client

- <https://docs.aws.amazon.com/iot/latest/developerguide/iot-dc-runjobs.html>

### Tutorial: Monitoring soil moisture with AWS IoT and Raspberry Pi

- <https://docs.aws.amazon.com/iot/latest/developerguide/iot-moisture-tutorial.html>

## AWS IoT Core FastAPI Web Application

## IoT

```sh
aws iot describe-endpoint --endpoint-type iot:Data-ATS --region <your-aws-region>
aws iot describe-endpoint --endpoint-type iot:Data-ATS --region us-east-1

```

- Usa éste tutorial para iniciar un device de IoT en AWS, no olvidar agregar la politica al certificado: <https://medium.com/@desaiaditya589/connecting-a-device-to-aws-iot-core-by-using-python-device-sdk-using-vs-code-15dc495ed9bd>
- <https://github.com/aws/aws-iot-device-sdk-python-v2>

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iot:Publish",
        "iot:Receive"
      ],
      "Resource": [
        "arn:aws:iot:us-east-1:036134507423:topic/sdk/test/java",
        "arn:aws:iot:us-east-1:036134507423:topic/sdk/test/python",
        "arn:aws:iot:us-east-1:036134507423:topic/sdk/test/js"
      ]
    },
    {
      "Effect": "Allow",
      "Action": "iot:Subscribe",
      "Resource": [
        "arn:aws:iot:us-east-1:036134507423:topicfilter/sdk/test/java",
        "arn:aws:iot:us-east-1:036134507423:topicfilter/sdk/test/python",
        "arn:aws:iot:us-east-1:036134507423:topicfilter/sdk/test/js"
      ]
    },
    {
      "Effect": "Allow",
      "Action": "iot:Connect",
      "Resource": [
        "arn:aws:iot:us-east-1:036134507423:client/sdk-java",
        "arn:aws:iot:us-east-1:036134507423:client/basicPubSub",
        "arn:aws:iot:us-east-1:036134507423:client/sdk-nodejs-*"
      ]
    }
  ]
}
```

- <https://docs.aws.amazon.com/iot/latest/developerguide/iot-moisture-policy.html>

## ESP32 => Glue Crawler => Athena DataBase raw/agregation (hourly, daily, monthly)

- S3 raw data bucket: s3://esp32dht22
- ts-glue-esp32-PassRole
- ts-sesp32dht22-iot-db-raw
- Notebok ETL Job: ts-sesp32dht22-iot-job-hourly
- S3 agregated bucket: esp32dht22-parquet

Database for esp32dht22 IoT sensor raw data

## ESP32 with Athena

- <https://repost.aws/knowledge-center/schedule-query-athena>
- <https://docs.aws.amazon.com/redshift/latest/dg/r_DATE_TRUNC.html>

```sql
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


SELECT * FROM "ts-sesp32dht22-iot-db-raw"."2025" limit 10;

SELECT COALESCE(TRY(CAST(timestamp AS bigint)),9999) AS timestamp,
       thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025";

SELECT timestamp,
       thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025";

ORDER BY YEAR, n_rank;


SELECT DATE_TRUNC('houe', TIMESTAMP COALESCE(TRY(CAST(timestamp AS bigint)),9999)),
thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025";


SELECT DATE_TRUNC('hour', TIMESTAMP COALESCE(TRY(CAST(timestamp AS 'timestamp')),9999)),
thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025";

SELECT DATE_TRUNC('hour', DATE_FORMAT(from_unixtime(COALESCE(TRY(CAST(timestamp AS 'timestamp'))/1000,'%Y-%m-%d %h:%i%p')9999))),
thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025";


date_format(from_unixtime(bigint_timestamp_column/1000),'%Y-%m-%d %h:%i%p')


SELECT from_unixtime(COALESCE(TRY(CAST(timestamp))/1000,'%Y-%m-%d %h:%i%p'),9999),
thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025";

SELECT date_format(from_unixtime(esp32.timestamp/1000),'%Y-%m-%d %h:%i%p'),
thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025" as esp32;


SELECT DATE_FORMAT(TRY(FROM_UNIXTIME(esp32.timestamp/1000)),'%Y-%m-%d %h:%i%p'),
esp32.thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025" as esp32;

SELECT DATE_FORMAT(TRY(FROM_UNIXTIME(esp32.timestamp/1000)),'%Y-%m-%d %h:%i%p'),
esp32.thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025" as esp32;

SELECT DATE_FORMAT(TRY(FROM_UNIXTIME(esp32.timestamp/1000)),'MM/DD/YYYY HH24:MI:SS'),
esp32.thing_name
FROM "ts-sesp32dht22-iot-db-raw"."2025" as esp32;


```

- <https://docs.aws.amazon.com/athena/latest/ug/query-examples-waf-logs-date-time.html>

```sql

CREATE OR REPLACE VIEW ts_sesp32dht22_iot_db_raw_view AS
SELECT DATE_FORMAT(TRY(FROM_UNIXTIME(esp32.timestamp/1000)),'%Y-%m-%d %h:%i%p') AS date_time,
esp32.thing_name,
humidity,
temperature
FROM "ts-sesp32dht22-iot-db-raw"."2025" as esp32;

SELECT DATE_FORMAT(TRY(to_timestamp(esp32.timestamp/1000)),'YYYY-MM-DD HH24:MI:SS') AS date_second,
esp32.thing_name,
humidity,
temperature
FROM "ts-sesp32dht22-iot-db-raw"."2025" as esp32;


to_timestamp


CREATE OR REPLACE VIEW ts_sesp32dht22_iot_db_raw_view AS
SELECT DATE_FORMAT(TRY(FROM_UNIXTIME(esp32.timestamp/1000)),'%Y-%m-%d %h:%i%p') AS date_time,
esp32.thing_name,
humidity,
temperature
FROM "ts-sesp32dht22-iot-db-raw"."2025" as esp32;


CREATE OR REPLACE VIEW ts_sesp32dht22_iot_db_hour_view AS
SELECT DATE_TRUNC('hour', date_time,
esp32_hour.thing_name,
esp32_hour.humidity,
esp32_hour.temperature
FROM "ts-sesp32dht22-iot-db-raw"."ts_sesp32dht22_iot_db_raw_view" as esp32_hour;



```