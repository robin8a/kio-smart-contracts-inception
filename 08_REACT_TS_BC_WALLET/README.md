# References
- [API (GRAPHQL) Relational Databases](https://docs.amplify.aws/cli-legacy/graphql-transformer/relational/)
- [Amplify Getting Started](https://docs.amplify.aws/start)
- [Policy AWS Simulator](https://policysim.aws.amazon.com)
- [Scalar types in AWS AppSync](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html)
- [GraphQL API Security with AWS AppSync and Amplify](https://aws.amazon.com/blogs/mobile/graphql-security-appsync-amplify/)

## MeshProvider - TypeScript
- https://meshjs.dev/react/getting-started


# Starting React App with 

```sh
# source ~/.bash_profile
# npx create-react-app my-app --template typescript
npx create-react-app kio-suan-wallet-tjs-app
cd kio-suan-wallet-tjs-app
npm start
```

# Amplify

## Configure
<!-- - Just when is a new aws account -->
```sh
amplify configure
```

## init
```sh
amplify init
Note: It is recommended to run this command from the root of your app directory
? Enter a name for the project kiosuanwallettjsapp
The following configuration will be applied:

Project information
| Name: kiosuanwallettjsapp
| Environment: dev
| Default editor: Visual Studio Code
| App type: javascript
| Javascript framework: react
| Source Directory Path: src
| Distribution Directory Path: build
| Build Command: npm run-script build
| Start Command: npm run-script start

? Initialize the project with the above configuration? Yes
Using default provider  awscloudformation
? Select the authentication method you want to use: AWS profile

For more information on AWS Profiles, see:
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html

? Please choose the profile you want to use suan-blockchain
Adding backend environment dev to AWS Amplify app: d133pa77bbytzb

Deployment completed.
Deployed root stack kiosuanwallettjsapp [ ======================================== ] 4/4
        amplify-kiosuanwallettjsapp-d… AWS::CloudFormation::Stack     CREATE_COMPLETE                Thu Feb 09 2023 08:44:33…     
        UnauthRole                     AWS::IAM::Role                 CREATE_COMPLETE                Thu Feb 09 2023 08:44:30…     
        AuthRole                       AWS::IAM::Role                 CREATE_COMPLETE                Thu Feb 09 2023 08:44:30…     
        DeploymentBucket               AWS::S3::Bucket                CREATE_COMPLETE                Thu Feb 09 2023 08:44:31…     

✔ Help improve Amplify CLI by sharing non sensitive configurations on failures (y/N) · yes
Deployment state saved successfully.
✔ Initialized provider successfully.
✅ Initialized your environment successfully.

Your project has been successfully initialized and connected to the cloud!

Some next steps:
"amplify status" will show you what you've added already and if it's locally configured or deployed
"amplify add <category>" will allow you to add features like user login or a backend API
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify console" to open the Amplify Console and view your project status
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud

Pro tip:
Try "amplify add api" to create a backend API and then "amplify push" to deploy everything
```


# Codecommit

[Create repo](https://docs.aws.amazon.com/cli/latest/reference/codecommit/create-repository.html)
```sh
# nano ~/.aws/credentials
# export PATH=~/Library/Python/3.8/bin:$PATH
# export PATH=~/Library/Python/3.7/bin:$PATH
# source ~/.bash_profile
# test
aws s3 ls --profile suan-block-chain-wallet
export AWS_PROFILE=suan-block-chain-wallet

# aws codecommit create-repository --repository-name MyDemoRepo --repository-description "My demonstration repository" --tags Team=Saanvi
aws codecommit create-repository --repository-name kio-suan-wallet-tjs-app --repository-description "Wallet Smart Contracts" --tags Team=kio --region us-east-1 

```

# Result

```json
{
    "repositoryMetadata": {
        "accountId": "036134507423",
        "repositoryId": "35141468-0692-423e-9e70-b3d83b9e1016",
        "repositoryName": "kio-suan-wallet-tjs-app",
        "repositoryDescription": "Wallet Smart Contracts",
        "lastModifiedDate": "2023-02-09T09:38:11.273000-05:00",
        "creationDate": "2023-02-09T09:38:11.273000-05:00",
        "cloneUrlHttp": "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-suan-wallet-tjs-app",
        "cloneUrlSsh": "ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-suan-wallet-tjs-app",
        "Arn": "arn:aws:codecommit:us-east-1:036134507423:kio-suan-wallet-tjs-app"
    }
}
```

## git

```sh
git init

# 
ssh-keygen
kio_suan_wallet_tjs_app
/Users/robinochoa/.ssh/kio_suan_wallet_tjs_app

cat ~/.ssh/kio_suan_wallet_tjs_app.pub

```


```sh
cd ~/.ssh
ls
nano config

# Add

# CodeCommit hosts
Host kio_suan_wallet_tjs_app
   HostName git-codecommit.us-east-1.amazonaws.com
   User APKAQQ2OI2OP7BR5Q4LY
   IdentityFile ~/.ssh/kio_suan_wallet_tjs_app

```

<!-- https://xiaolishen.medium.com/use-multiple-ssh-keys-for-different-github-accounts-on-the-same-computer-7d7103ca8693 -->

```sh
# git remote -v
# git remote rm origin
# git init
git remote add origin ssh://kio_suan_wallet_tjs_app/v1/repos/kio-suan-wallet-tjs-app
git push --set-upstream origin master
git push
```


# Amplify hosting

## Result
```sh
amplify add hosting
│ FrontEnd Env │ Domain                                      │
├──────────────┼─────────────────────────────────────────────┤
│ master       │ https://master.d6r9pw8s9c88j.amplifyapp.com │
```

# Amplify auth

```sh
amplify add auth
Using service: Cognito, provided by: awscloudformation
 
 The current configured provider is Amazon Cognito. 
 
 Do you want to use the default authentication and security configuration? Default configuration
 Warning: you will not be able to edit these selections. 
 How do you want users to be able to sign in? Username
 Do you want to configure advanced settings? No, I am done.
✅ Successfully added auth resource kiosuancultivosacuicf502e377 locally

✅ Some next steps:
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud

(node:27903) [DEP0128] DeprecationWarning: Invalid 'main' field in '/Users/robinochoa/.npm-global/lib/node_modules/@aws-amplify/cli/node_modules/cloudform/package.json' of 'packages/cloudform/index.js'. Please either fix that or report it to the module author
(Use `node --trace-deprecation ...` to show where the warning was created)

```


# Amplify api

```sh
amplify add api
? Select from one of the below mentioned services: GraphQL
? Here is the GraphQL API that we will create. Select a setting to edit or continue (Use arrow keys)
  Name: kiosuancultivosacuic 
  Authorization modes: API key (default, expiration time: 7 days from now) 
? Here is the GraphQL API that we will create. Select a setting to edit or continue Authorization modes: API key (default, expiration time: 7 days from now)
? Choose the default authorization type for the API Amazon Cognito User Pool
Use a Cognito user pool configured as a part of this project.
? Configure additional auth types? Yes
? Choose the additional authorization types you want to configure for the API API key
API key configuration
? Enter a description for the API key: api-for-not-authorize
? After how many days from now the API key should expire (1-365): 365
? Here is the GraphQL API that we will create. Select a setting to edit or continue Continue
? Choose a schema template: One-to-many relationship (e.g., “Blogs” with “Posts” and “Comments”)

⚠️  WARNING: your GraphQL API currently allows public create, read, update, and delete access to all models via an API Key. To configure PRODUCTION-READY authorization rules, review: https://docs.amplify.aws/cli/graphql/authorization-rules

GraphQL schema compiled successfully.

Edit your schema at /Users/robinochoa/Documents/react_ws/kio-suan-wallet-tjs-app/amplify/backend/api/kiosuancultivosacuic/schema.graphql or place .graphql files in a directory at /Users/robinochoa/Documents/react_ws/kio-suan-wallet-tjs-app/amplify/backend/api/kiosuancultivosacuic/schema
✔ Do you want to edit the schema now? (Y/n) · yes
Edit the file in your editor: /Users/robinochoa/Documents/react_ws/kio-suan-wallet-tjs-app/amplify/backend/api/kiosuancultivosacuic/schema.graphql
✅ Successfully added resource kiosuancultivosacuic locally

✅ Some next steps:
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud
```


# amplify storage
```sh
amplify add storage
? Select from one of the below mentioned services: Content (Images, audio, video, etc.)
(node:33192) [DEP0128] DeprecationWarning: Invalid 'main' field in '/Users/robinochoa/.npm-global/lib/node_modules/@aws-amplify/cli/node_modules/cloudform/package.json' of 'packages/cloudform/index.js'. Please either fix that or report it to the module author
(Use `node --trace-deprecation ...` to show where the warning was created)
✔ Provide a friendly name for your resource that will be used to label this category in the project: · kiosuanacuaboxstorage
✔ Provide bucket name: · kiosuancultivosacuic6b8f0ee9fcbe45a9803254d820f
✔ Who should have access: · Auth and guest users
✔ What kind of access do you want for Authenticated users? · create/update, read, delete
✔ What kind of access do you want for Guest users? · read
✔ Do you want to add a Lambda Trigger for your S3 Bucket? (y/N) · no
⚠️ Auth configuration is required to allow unauthenticated users, but it is not configured properly.
✅ Successfully updated auth resource locally.
✅ Successfully added resource kiosuanacuaboxstorage locally

⚠️ If a user is part of a user pool group, run "amplify update storage" to enable IAM group policies for CRUD operations
✅ Some next steps:
"amplify push" builds all of your local backend resources and provisions them in the cloud
"amplify publish" builds all of your local backend and front-end resources (if you added hosting category) and provisions them in the cloud
```


# Amplify API

```sh
amplify add api
# ? Please select from one of the below mentioned services: GraphQL
# ? Provide API name: kiojupplacesreserver
# ? Choose the default authorization type for the API API key
# ? Enter a description for the API key: 
# ? After how many days from now the API key should expire (1-365): 365
# ? Do you want to configure advanced settings for the GraphQL API No, I am done.
# ? Do you have an annotated GraphQL schema? No
# ? Do you want a guided schema creation? Yes
# ? What best describes your project: One-to-many relationship (e.g., “Blogs” with “Posts” and “Comments”)
# ? Do you want to edit the schema now? Yes
# Please edit the file in your editor: /Users/robinochoa/Documents/react_ws/kio-jup-places-reserve-rjs-app/amplify/backend/api/kiojupplacesreserver/schema.graphql
# ? Press enter to continue 

# The following types do not have '@auth' enabled. Consider using @auth with @model
#          - Place
#          - Reserve
# Learn more about @auth here: https://aws-amplify.github.io/docs/cli-toolchain/graphql#auth 


# GraphQL schema compiled successfully.

# Edit your schema at /Users/robinochoa/Documents/react_ws/kio-jup-places-reserve-rjs-app/amplify/backend/api/kiojupplacesreserver/schema.graphql or place .graphql files in a directory at /Users/robinochoa/Documents/react_ws/kio-jup-places-reserve-rjs-app/amplify/backend/api/kiojupplacesreserver/schema
# Successfully added resource kiojupplacesreserver locally

# Some next steps:
# "amplify push" will build all your local backend resources and provision it in the cloud
# "amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud

```

## Result

```sh
amplify push   

```

# AWS enviroment
- https://docs.amplify.aws/cli/teams/overview/
  
# aws amplify storage unauthenticated access
- https://medium.com/floom/public-read-access-for-aws-amplify-storage-9eb5621abff
- https://docs.amplify.aws/lib/storage/configureaccess/q/platform/js/
- https://docs.amplify.aws/lib/storage/configureaccess/q/platform/js/#customization
- https://stackoverflow.com/questions/60936666/getting-missing-required-field-principal-when-adding-policy-to-s3-bucket

> Continuar con 
> http://suanapicardano-env.eba-rjbtbq22.us-east-2.elasticbeanstalk.com/
> https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create-deploy-python-django.html
> Estaba en la instalacion y pruebas de EB y configuracion de las credenciales, ya fue instalado en la instacia
> https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create-deploy-python-django.html


To create an environment and deploy your Django application


# Connect to Serverless Aurora Database using Cloud 9
https://aws.amazon.com/getting-started/hands-on/configure-connect-serverless-mysql-database-aurora/#:~:text=To%20access%20your%20new%20Aurora,will%20login%20to%20your%20cluster.

- Connect psql https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ConnectToPostgreSQLInstance.html
- Errors: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ConnectToPostgreSQLInstance.html
```sh

