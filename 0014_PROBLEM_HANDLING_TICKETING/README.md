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

### Datalake solution (https://codesandbox.io/)

- <https://codesandbox.io/p/sandbox/aws-solutions-aws-data-lake-solution-ccvddj>

## Anti - Aging

- Proceso manual actualmente
- Proceso de compra
- Lo que receta el medico lo debo ver yo
- Historial clinico
