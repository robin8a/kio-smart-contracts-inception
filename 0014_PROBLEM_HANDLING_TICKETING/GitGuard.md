# Gitguard

what is the command on AWS CLI to list the APIs IDs and Name of AppSync?
what is the command on AWS CLI to list the APIs Keys of Graphql AppSync ?

```sh
# https://docs.aws.amazon.com/cli/latest/reference/appsync/list-api-keys.html
aws list-api-keys

aws appsync list-graphql-apis --query 'graphqlApis[*].apiId' --output text

aws appsync list-graphql-apis --query 'graphqlApis[*].[apiId,name]' --output table

aws appsync list-api-keys --api-id <your-api-id>
```
