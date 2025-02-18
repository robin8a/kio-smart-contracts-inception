# Show a chart using Athena Recharts

## References

- <https://medium.com/@sassenthusiast/advanced-serverless-techniques-iv-aws-athena-for-serverless-data-analysis-ee137e1bc86f>
- <https://www.robkjohnson.com/posts/using-aws-lambda-python-athena-to-etl-data/>
- <https://gist.github.com/gadavis2/3bb03e724a4dd27c73af731ff9e68e21>
- <https://docs.aws.amazon.com/cli/v1/userguide/cli_athena_code_examples.html>
- <https://stackoverflow.com/questions/54603703/create-an-athena-table-with-lambda-function-node-js>

## Serverless (Node JS)

```sh
serverless

# Suan an=analytics 
suan-an-athena-query-resolver-js

# App
suan-an-athena-query-resolver-js-app

sls deploy

# Test
# serverless invoke local --function hello --path data.json --debug

serverless invoke --function hello --debug
```

## CLI

```sh
aws athena batch-get-query-execution \
    --query-execution-ids a1b2c3d4-5678-90ab-cdef-EXAMPLE11111 a1b2c3d4-5678-90ab-cdef-EXAMPLE22222

```

. Generación de reportes consumiendo el servicio de Query Resolver
. Scripts para la captura de video

## How to Query AWS Athena from a Lambda Function | Step by Step Tutorial

- <https://www.youtube.com/watch?v=a_Og1t3ULOI>


## Design patterns: Set up AWS Glue Crawlers using S3 event notifications

- <https://aws.amazon.com/blogs/big-data/run-aws-glue-crawlers-using-amazon-s3-event-notifications/>
- <https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-s3-object-created-tutorial.html>

Default SNS Topic

```json
{
  "Version": "2008-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__default_statement_ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "SNS:Publish",
        "SNS:RemovePermission",
        "SNS:SetTopicAttributes",
        "SNS:DeleteTopic",
        "SNS:ListSubscriptionsByTopic",
        "SNS:GetTopicAttributes",
        "SNS:AddPermission",
        "SNS:Subscribe"
      ],
      "Resource": "arn:aws:sns:us-east-2:036134507423:trazability_s3_event_notifications_topic.fifo",
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "036134507423"
        }
      }
    }
  ]
}
```

```json
{
  "Version": "2012-10-17",
  "Id": "s3_to_sns_events_access_policy_1",
  "Statement": [
    {
      "Sid": "s3_to_sns_events_stmt_1",
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "SNS:Publish",
      "Resource": "arn:aws:sns:us-east-2:036134507423:trazability_s3_event_notifications_topic",
      "Condition": {
        "StringEquals": {
          "aws:SourceAccount": "036134507423"
        },
        "ArnLike": {
          "aws:SourceArn": "arn:aws:s3:::trazability"
        }
      }
    }
  ]
}
```
