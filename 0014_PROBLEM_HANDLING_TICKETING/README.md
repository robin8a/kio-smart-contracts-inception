# Problem Handling

[AWS Chatbot](https://aws.amazon.com/chatbot/?nc1=h_ls)

## Requerimientos

- how to implement a chat bot with chatgpt and integrated with telegram?
- ¿Cómo implementar un chat bot con chatgpt e integrado con telegram?
- could you tell how to create a chatbot in aws and integrated with telegram?

## Discord modbot for ticketing

<https://discord.com/application-directory/557628352828014614>

## Lex example

auto-insurance-stack

### SLS

- <https://www.serverless.com/framework/docs/getting-started>
- [Examples](https://github.com/serverless/examples/tree/v4)
- <https://www.serverless.com/framework/docs-providers-aws-cli-reference-deploy>
- <https://medium.com/ssense-tech/managing-and-deploying-aws-lambda-functions-with-sls-ab47d366b004>

### Docker

- [Version that works on Mac Big Sur: 4.24.0](https://docs.docker.com/desktop/release-notes/)

### Telegram,  API Gateway, Lambda and Lex

- <https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/LexRuntimeV2.html>
- <https://codesandbox.io/examples/package/@aws-sdk/client-lex-runtime-v2>
- 2020: <https://www.youtube.com/watch?v=h3pd9p_dSbw>
- 2018: <https://www.codeproject.com/Tips/5305720/Integration-of-Amazon-Lex-Bot-and-Telegram-Bot>
- 2020: <https://medium.com/swlh/how-to-build-a-serverless-telegram-bot-with-aws-lambda-4a1fb2c611d5>
- <https://github.com/aws-samples/serverless-bot-sample>
- <https://boto3.amazonaws.com/v1/documentation/api/1.21.2/reference/services/lexv2-runtime.html>
- <https://www.youtube.com/watch?v=HOHJfDX7928>

#### Node Js

- <https://stackoverflow.com/questions/70884804/how-do-i-initiate-a-conversation-with-aws-lex-from-node-js>

```sh
serverless 
suan-ph-lex-telegram-insurance-service

suan-ph-lex-telegram-insurance-app

nvm list
nvm alias default v22.2.0

npm i --save axios


serverless invoke --function telegramToLex --path data.json

```

#### python Boto3

- <https://www.youtube.com/watch?v=HOHJfDX7928>
- <https://github.com/PradipNichite/Youtube-Tutorials/blob/main/AWS_Lex_boto3_Youtube.ipynb>
- [Collab](https://colab.research.google.com/drive/1nhBXOmsrlEbw46BA6P2Ksjf4679z41Dw?usp=sharing)


```sh
serverless 

suan-ph-lex-telegram-insurance-service-py

suan-ph-lex-telegram-insurance-py-app

# short name

serverless

suan-ph-lex-tel-ins-serv-py

## suan problem handling lex telegram insurace
suan-ph-lex-tel-ins-py-app


```

- [Serverless Python, requirements](https://www.serverless.com/plugins/serverless-python-requirements)

##### CLI bot test

```sh
aws lexv2-runtime recognize-text --bot-id <botId> --bot-alias-id TSTALIASID --locale-id 'en_GB' --session-id 'test_sessio1n' --text 'my input test'

aws lexv2-runtime recognize-text --bot-id '7TBXBYVXOE' --bot-alias-id 'TSTALIASID' --locale-id 'en_US' --session-id '99a3324' --region us-east-1 --text 'Claim'

aws lexv2-runtime recognize-text --bot-id 'TSTALIASID' --bot-alias-id 'TSTALIASID' --locale-id 'en_US' --session-id '99a3324' --region us-east-1 --text 'Claim'

aws lexv2-runtime recognize-text --bot-id 'LIRUYU2I9H' --bot-alias-id 'TSTALIASID' --locale-id 'en_US' --session-id '99a3324' --region us-east-1 --text 'Claim'

TSTALIASID
```

##### python env

```sh
brew install pyenv
pyenv --version 
pyenv install 3.12.0


pyenv global 3.12.0
pyenv local 3.12.0


# Install 
brew install pyenv-virtualenv

# Create a virtual environment
pyenv virtualenv <python_version> <environment_name>
pyenv virtualenv 3.12.0 suan_ph_lex_telegram_insurance_env
pyenv activate suan_ph_lex_telegram_insurance_env

# VSC
cmd + shift + P 
select interpreter
<suan_ph_lex_telegram_insurance_env>

# Deploy
sls deploy

# Test
sls invoke local --function hello
sls invoke --function hello --debug
pip list
pyenv deactivate

serverless invoke local --function hello --path data.json --debug

# Requirements

pip freeze > requirements.txt
`

```


### Function local test

- <https://www.serverless.com/framework/docs-providers-aws-cli-reference-invoke-local>


#### Botfather

- Fatherbotname: suan-ph-lex-telegram-insurance-bot
- Username bot: InsuranceLexBot

```sh
curl --request POST \
 --url https://api.telegram.org/bot7090977715:AAFvOyeUu2vpKG8yrxx_HtweTnwVPSsYSJM/setWebhook \
 --header 'content-type: application/json' \
 --data '{"url": "https://379v7sa0e8.execute-api.us-east-1.amazonaws.com/dev/telegram-webhook"}'

#  result
{"ok":true,"result":true,"description":"Webhook was set"}% 

```

### Change nvm on zsh

- <https://mrgregory.dev/posts/change-node-version-automatically-zsh>

### Datalake solution <https://codesandbox.io/>

- <https://codesandbox.io/p/sandbox/aws-solutions-aws-data-lake-solution-ccvddj>
- <https://github.com/aws/aws-sdk-js-v3/issues/3836>
- <https://shillehtek.com/blogs/news/how-to-install-pip-packages-in-aws-lambda-using-docker-and-ecr?utm_source=youtube&utm_medium=product_shelf>
- <https://www.youtube.com/watch?v=yXqaOS9lMr8>
- <https://www.youtube.com/watch?v=ESZCzUbdZuc>
- <https://www.youtube.com/watch?v=grRW1Z_C9vw>

```sh
serverless invoke --function telegramToLex --path data.json

```

#### Python add dependencies layer (Working)

- [How to Build an Intelligent Telegram Chatbot with Amazon Lex: minute 26](https://www.youtube.com/watch?v=h3pd9p_dSbw)
- Serverless Python Dependencies: <https://github.com/CloudSnorkel/serverless-pydeps>
- Session attributes: <https://docs.aws.amazon.com/lexv2/latest/dg/context-mgmt-session-attribs.html>
- <https://docs.aws.amazon.com/lexv2/latest/dg/how-it-works.html>

```sh
suan-ph-lex-tel-ins-serv-py-dev-us-east-1-Python312PackagerLambdaRole
suan-ph-lex-tel-ins-serv-py-dev


serverless
# Shorname avoid error name 64 characters
# Ex. suan-ph-lex-tel-ins-py-us-east-1-Python312PackagerLambdaRole 61 
# suan-ph-lex-tel-ins-serv-py-dev-us-east-1-Python312PackagerLambdaRole 70

suan-ph-lex-tel-car-py
suan-ph-lex-tel-car-py-app

Name Your Project: > suan-ph-lex-tel-car-py
Name Your New App: > suan-ph-lex-tel-car-py-app


# Your new Service "suan-ph-lex-tel-car-py" is ready. Here are next steps:

# • Open Service Directory: cd suan-ph-lex-tel-car-py
# • Install Dependencies: pip install (or use another package manager)
# • Deploy & Develop Your Service: serverless dev

# Layer Serverless Python Dependencies: https://github.com/CloudSnorkel/serverless-pydeps
sls plugin install -n serverless-pydeps
# run pip o add requirements.txt

serverless invoke --function hello --path data.json --debug

```

- Configure Function URL
- Add CORS *
- Tell to telegram with wich API is associated

```sh
curl --request POST \
 --url https://api.telegram.org/bot7090977715:AAFvOyeUu2vpKG8yrxx_HtweTnwVPSsYSJM/setWebhook \
 --header 'content-type: application/json' \
 --data '{"url": "https://hbu4qfw765.execute-api.us-east-1.amazonaws.com/dev/telegram-webhook"}'


# result
{"ok":true,"result":true,"description":"Webhook was set"}% 

```

## Pivotal tracker

- Profile: <https://www.pivotaltracker.com/profile>
- API token: <https://www.pivotaltracker.com/help/articles/api_token/>
- Postman examples: <https://www.postman.com/api-evangelist/workspace/pivotal-tracker/documentation/35240-28db29ee-ca8d-4539-8a7a-6cde82dcfb73>
- Postman collection: <https://www.pivotaltracker.com/blog/introducing-tracker-api-postman-collection>

```sh


export POSTMAN_TOKEN='<My profile postman token>'

curl -X GET -H "X-TrackerToken: $POSTMAN_TOKEN" "https://www.pivotaltracker.com/services/v5/stories/188065156"

# Project ID: https://www.pivotaltracker.com/projects/2602231/settings

export PROJECT_ID=2602231

curl -X GET -H "X-TrackerToken: $POSTMAN_TOKEN" "https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/stories/"


# Create a New Story

curl -X POST -H "X-TrackerToken: $POSTMAN_TOKEN" -H "Content-Type: application/json" -d '{"current_state":"started","estimate":1,"name":"Exhaust ports are ray shielded 👹 2"}' "https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/stories"

```

## AWS Bedrock

### Bot

- <https://www.anthropic.com/news/claude-2>
- suan-ph-lex-tel-pivotal-issues-bot
- Problem handling integration: (lex V2), telegram , pivotal tracker for issues from internal/external users
- Slot types: <https://docs.aws.amazon.com/lexv2/latest/dg/built-in-slots.html>

```sh
We want a bot to help the users to report problem or issues of an web application, with the following information: description, severity, time hour, attachments

Example Interaction
Bot: Hello! I'm here to help you report any problems or issues you're experiencing with our web application. Please describe the problem or issue you're encountering in as much detail as possible.

User: I'm trying to submit a form, but I keep getting an error message that says "Invalid input."

Bot: How severe is this issue? Please select one of the following:


Critical (Application is unusable)


Major (Significant impact on functionality)


Minor (Inconvenience or cosmetic issue)

User: 2. Major

Bot: When did you first encounter this issue?

User: About 30 minutes ago.

Bot: If you have any screenshots or other files that might help explain the issue, please attach them here.

User: [Attaches screenshot of error message]

Bot: Thank you for reporting this issue. We'll review it as soon as possible. You'll receive a confirmation email with a reference number shortly.

```

- <https://textcortex.com/es/post/claude-2-use-cases>
- suan-ph-lex-tel-pivotal-issues-bot
- Okay,  your report an Issue with the following statement: Issue severity {IssueSeverity}, that occurs on {IssueDate} and {IssueDescription}.

#### Telegram bot

- BotFather
- /newbot
- name: suan-ph-lex-tel-pivotal-issues-bot
- usename: IssuesLexBot
- Shortname: t.me/IssuesLexBot

#### Python lambda function with serveles SLS

```sh
serverless
# Shorname avoid error name 64 characters
# Ex. suan-ph-lex-tel-ins-py-us-east-1-Python312PackagerLambdaRole 61 
# suan-ph-lex-tel-ins-serv-py-dev-us-east-1-Python312PackagerLambdaRole 70

sls

Select A Template: AWS / Python / HTTP API

# Name Your Project: > SuPhLexTelIssPy
# Create A New App
# Name Your New App: > SuPhLexTelIssPyApp

Name Your Project: > su-ph-le-te-is-py
Create A New App
Name Your New App: > su-ph-le-te-is-py-ap


# su-ph-le-te-is-py-dev-us-east-1-Python312PackagerLambdaRole
# SuPhLexTelIssPy-dev-us-east-1-Python312PackagerLambdaRole
# su-ph-lex-tel-iss-py-dev-us-east-1-Python312PackagerLambdaRole
# su-ph-le-te-is-py-dev-us-east-1-Python312PackagerLambdaRole

cd su-ph-le-te-is-py
sls deploy

```

#### Adding lambda layers (python requirements)

```sh
sls plugin install -n serverless-pydeps
sls deploy
```

> Create the following files

serverless.yml

```yml
# "org" ensures this Service is used with the correct Serverless Framework Access Key.
org: kamay
# "app" enables Serverless Framework Dashboard features and sharing them with other Services.
app: su-ph-le-te-is-py-ap
# "service" is the name of this project. This will also be added to your AWS resource names.
service: su-ph-le-te-is-py

provider:
  name: aws
  runtime: python3.12
  iamRoleStatements:
    - Effect: Allow
      Action:
        - lex:*
      Resource: '*'

functions:
  hello:
    handler: handler.hello
    events:
      - http:
          path: telegram-webhook
          method: post
          cors: true

plugins:
  - serverless-pydeps

```

requirements.txt

```txt
boto3==1.34.125
botocore==1.34.125
certifi==2024.6.2
charset-normalizer==3.3.2
idna==3.7
jmespath==1.0.1
python-dateutil==2.9.0.post0
requests==2.32.3
s3transfer==0.10.1
six==1.16.0
urllib3==2.2.1

```

Deploy

```sh
sls deploy
```


#### Setup

- Configure Function URL
- Add CORS *
- Tell to telegram with wich API is associated

```sh

export TELEGRAM_BOT_TOKEN='<My botfather token>'
export TELEGRAM_BOT_URL='<My Lambda URL>'

# result
{"ok":true,"result":true,"description":"Webhook was set"}% 

```

### AWS Lex V2 conversations states

- <https://docs.aws.amazon.com/lexv2/latest/dg/managing-conversations.html>
- <https://www.geeksforgeeks.org/python-requests-post-request-with-headers-and-body/>

```sh
curl -X POST -H "X-TrackerToken: $POSTMAN_TOKEN" -H "Content-Type: application/json" -d '{"current_state":"started","estimate":1,"name":"Exhaust ports are ray shielded 👹 2"}' "https://www.pivotaltracker.com/services/v5/projects/2714676/stories/"

serverless invoke --function hello --path data.json --debug
```

### Pyhon properties

- <https://www.digitalocean.com/community/tutorials/python-read-properties-file>
