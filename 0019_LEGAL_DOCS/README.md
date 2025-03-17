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

## react-admin-amplify react-admin

- <https://github.com/MrHertal/react-admin-amplify>
- <https://marmelab.com/react-admin/Tutorial.html>

```sh
aws cognito-idp list-user-pools --max-results 60 > users.json


aws cognito-idp admin-confirm-sign-up --user-pool-id us-east-1_8bR8oirR9 --username legal_docs_admin

aws cognito-idp admin-set-user-password --user-pool-id <user-pool-id> --username <username> --password <temporary-password> --permanent false


admin-confirm-sign-up


aws cognito-idp admin-create-user --user-pool-id <user_pool_id> --username <username> --user-attributes Name=<user_name>,email=<user_email> --message-action SUPPRESS

aws cognito-idp admin-create-user --user-pool-id us-east-1_8bR8oirR9 --username legal_docs_admin --user-attributes Name=legal_docs_admin,email=robin8a@gmail.com --message-action SUPPRESS

aws cognito-idp admin-create-user --user-pool-id us-east-1_8bR8oirR9 --username admin --user-attributes Name=legal_docs_admin --message-action SUPPRESS


aws cognito-idp admin-create-user --user-pool-id <user_pool_id> --username <username> --user-attributes Name=<user_name>,email=<user_email> --message-action SUPPRESS

# main: https://awscli.amazonaws.com/v2/documentation/api/2.9.6/reference/cognito-idp/index.html#cli-aws-cognito-idp

# https://awscli.amazonaws.com/v2/documentation/api/2.9.6/reference/cognito-idp/admin-create-user.html

aws cognito-idp admin-create-user \
    --user-pool-id us-east-1_8bR8oirR9 \
    --username admin \
    --user-attributes Name=email,Value=robin8a@gmail.com Name=phone_number,Value="+573053216272" \
    --message-action SUPPRESS

aws cognito-idp admin-confirm-sign-up --user-pool-id us-east-1_8bR8oirR9 --username admin

aws cognito-idp admin-set-user-password --user-pool-id us-east-1_8bR8oirR9 --username admin --password <password> --permanent
```

## Clone based on confi host /Users/robinochoa/.ssh/config

```sh
git clone ssh://kio_sl_legal_docs_rjs_app_rsa/v1/repos/kio-sl-legal-docs-rjs-app
```

## Automatización Estudio de titulos

### SLS

```sh

# ts=terrasacha, cu=custom, cer=cetificado, lib=libertad, tra=tradición, py=python, lf=lambda-function
ts-cu-cer-lib-tra-py-lf
ts-cu-cer-lib-tra-py-lf-app

sls deploy
```

### Github

<https://github.com/robin8a/ts-cu-cer-lib-tra-py-lf>

```sh

# Install 
brew install pyenv-virtualenv

# Create a virtual environment
# pyenv virtualenv <python_version> <environment_name>
pyenv virtualenv 3.12.0 ts_cu_cer_lib_tra_py_lf_env
pyenv activate ts_cu_cer_lib_tra_py_lf_env

# VSC
cmd + shift + P 
select interpreter
<ts_cu_cer_lib_tra_py_lf_env>


```

### Libraries

- <https://github.com/serverless/serverless-python-requirements>

```sh
sls plugin install -n serverless-python-requirements

pip install google
pip install google-cloud-documentai
```

requirements.txt

```txt
beautifulsoup4           4.13.3
boto3                    1.37.13
botocore                 1.37.13
cachetools               5.5.2
certifi                  2024.6.2
charset-normalizer       3.3.2
google                   3.0.0
google-api-core          2.24.2
google-auth              2.38.0
google-cloud-documentai  3.2.0
googleapis-common-protos 1.69.1
grpcio                   1.71.0
grpcio-status            1.71.0
idna                     3.7
jmespath                 1.0.1
pip                      23.2.1
proto-plus               1.26.1
protobuf                 5.29.3
pyasn1                   0.6.1
pyasn1_modules           0.4.1
python-dateutil          2.9.0.post0
requests                 2.32.3
rsa                      4.9
s3transfer               0.11.4
six                      1.16.0
soupsieve                2.6
typing_extensions        4.12.2
urllib3                  2.2.1
```

or

```sh
pip freeze > requirements.txt
```
### Test

```sh
sls invoke -f hello
# Invoke and display logs:
serverless invoke -f hello --log

```

### S3

S3 bucket: ts-cu-cer-lib-tra-bucket
