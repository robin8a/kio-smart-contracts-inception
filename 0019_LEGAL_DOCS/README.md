# Starting React App

```sh
npx create-react-app kio-sl-legal-docs-rjs-app
cd kio-sl-legal-docs-rjs-app
```

## Amplify

### configure

- Just when is a new aws account

```sh
amplify configure
```

### init

```sh
amplify init
```

## Codecommit

[Create repo](https://docs.aws.amazon.com/cli/latest/reference/codecommit/create-repository.html)

```sh
nano ~/.aws/credentials
aws s3 ls --profile kio-sl-legal-docs-rjs-app
export AWS_PROFILE=kio-sl-legal-docs-rjs-app

# aws codecommit create-repository --repository-name MyDemoRepo --repository-description "My demonstration repository" --tags Team=Saanvi
aws codecommit create-repository --repository-name kio-sl-legal-docs-rjs-app --repository-description "Serverless Legal Documents System" --tags Team=kio --region us-east-1 

```

### Result

```json
{
    "repositoryMetadata": {
        "accountId": "036134507423",
        "repositoryId": "5e50594a-db76-464a-a24b-291b59c6fee0",
        "repositoryName": "kio-sl-legal-docs-rjs-app",
        "repositoryDescription": "Serverless Legal Documents System",
        "lastModifiedDate": "2023-12-13T16:21:24.762000-05:00",
        "creationDate": "2023-12-13T16:21:24.762000-05:00",
        "cloneUrlHttp": "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-sl-legal-docs-rjs-app",
        "cloneUrlSsh": "ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-sl-legal-docs-rjs-app",
        "Arn": "arn:aws:codecommit:us-east-1:036134507423:kio-sl-legal-docs-rjs-app"
    }
}
```

## git

```sh

ssh-keygen
# or if to short the key
ssh-keygen -t rsa -b 4096

# Type
/Users/robinochoa/.ssh/kio_sl_legal_docs_rjs_app_rsa

cat ~/.ssh/kio_sl_legal_docs_rjs_app_rsa.pub

```

### Configure AWS IAM user

![AWS Config](_images/aws_iam_ssh_config.png)

```sh
cd ~/.ssh
ls
nano config

# Add

# CodeCommit hosts
Host kio_sl_legal_docs_rjs_app_rsa
   HostName git-codecommit.us-east-1.amazonaws.com
   User APKAQQ2OI2OPWBS7ZOEE
   IdentityFile ~/.ssh/kio_sl_legal_docs_rjs_app_rsa
```

```sh
git remote -v
git remote rm origin
git remote add origin ssh://kio_sl_legal_docs_rjs_app_rsa/v1/repos/kio-sl-legal-docs-rjs-app
git push
```

## Amplify hosting

### Result 2

```sh
amplify add hosting
```

### Amplify Auth

```sh
amplify add auth
# Scanning for plugins...
# Plugin scan successful
# Using service: Cognito, provided by: awscloudformation
 
#  The current configured provider is Amazon Cognito. 
 
#  Do you want to use the default authentication and security configuration? Defa
# ult configuration
#  Warning: you will not be able to edit these selections. 
#  How do you want users to be able to sign in? Username
#  Do you want to configure advanced settings? No, I am done.
# Successfully added resource kiosllms9a43b205 locally

# Some next steps:
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud
```

## API

```sh
amplify add api
```
