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
