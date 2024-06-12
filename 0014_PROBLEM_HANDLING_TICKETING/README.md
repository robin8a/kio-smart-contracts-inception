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


```sh
serverless 
suan-ph-lex-telegram-insurance-service

suan-ph-lex-telegram-insurance-app

nvm list
nvm alias default v22.2.0

npm i --save axios

```

#### python Boto3

- <https://www.youtube.com/watch?v=HOHJfDX7928>
- <https://github.com/PradipNichite/Youtube-Tutorials/blob/main/AWS_Lex_boto3_Youtube.ipynb>

Ubuntu_Mate_for_Catan

```sh
serverless 

suan-ph-lex-telegram-insurance-service-py

suan-ph-lex-telegram-insurance-py-app

```

##### CLI bot test

```sh
aws lexv2-runtime recognize-text --bot-id <botId> --bot-alias-id TSTALIASID --locale-id 'en_GB' --session-id 'test_sessio1n' --text 'my input test'

aws lexv2-runtime recognize-text --bot-id '7TBXBYVXOE' --bot-alias-id 'TSTALIASID' --locale-id 'en_US' --session-id '99a3324' --region us-east-1 --text 'Claim'

aws lexv2-runtime recognize-text --bot-id 'TSTALIASID' --bot-alias-id 'TSTALIASID' --locale-id 'en_US' --session-id '99a3324' --region us-east-1 --text 'Claim'

aws lexv2-runtime recognize-text --bot-id 'LIRUYU2I9H' --bot-alias-id 'TSTALIASID' --locale-id 'en_US' --session-id '99a3324' --region us-east-1 --text 'Claim'



TSTALIASID
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


## Anti - Aging

- Proceso manual actualmente
- Proceso de compra
- Lo que receta el medico lo debo ver yo
- Historial clinico
