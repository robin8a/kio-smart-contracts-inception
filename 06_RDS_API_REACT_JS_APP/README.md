
# References
- [API (GRAPHQL) Relational Databases](https://docs.amplify.aws/cli-legacy/graphql-transformer/relational/)
- [Amplify Getting Started](https://docs.amplify.aws/start)
- [Policy AWS Simulator](https://policysim.aws.amazon.com)
- [Scalar types in AWS AppSync](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html)
- [GraphQL API Security with AWS AppSync and Amplify](https://aws.amazon.com/blogs/mobile/graphql-security-appsync-amplify/)
- https://tokhun.io/explore/serialized/jVRMXB
- https://docs.ipfs.io/concepts/what-is-ipfs/
- https://www.europapress.es/economia/finanzas-00340/noticia-mito-galeria-arte-nft-hispanohablantes-abre-puertas-20210916183841.html
- https://js.ipfs.io/
- https://enlear.academy/complete-guide-to-aws-amplify-studio-4a14801d85e4


# Starting React App

```sh
source ~/.bash_profile
npx create-react-app kio-suan-rds-api-rjs-app
cd kio-suan-rds-api-rjs-app
npm start
```

# Amplify

## Configure

- Just when is a new aws account
```sh
amplify configure
```

## init

```sh
amplify init

Project information
| Name: kioamazingteepeepart
| Environment: dev
| Default editor: Visual Studio Code
| App type: javascript
| Javascript framework: react
| Source Directory Path: src
| Distribution Directory Path: build
| Build Command: npm run-script build
| Start Command: npm run-script start

   ╭─────────────────────────────────────────────╮
   │                                             │
   │      Update available 7.6.26 → 8.1.0        │
   │   Run npm i -g @aws-amplify/cli to update   │
   │                                             │
   ╰─────────────────────────────────────────────╯

Note: It is recommended to run this command from the root of your app directory
? Enter a name for the project kioamazingteepeepart
The following configuration will be applied:

Project information
| Name: kiosuanrdsapirjsapp
| Environment: dev
| Default editor: Visual Studio Code
| App type: javascript
| Javascript framework: react
| Source Directory Path: src
| Distribution Directory Path: build
| Build Command: npm run-script build
| Start Command: npm run-script start

CREATE_COMPLETE AuthRole   AWS::IAM::Role Wed Jul 06 2022 10:53:26 GMT-0500 (Colombia Standard Time) 
CREATE_COMPLETE UnauthRole AWS::IAM::Role Wed Jul 06 2022 10:53:26 GMT-0500 (Colombia Standard Time) 
⠇ Initializing project in the cloud...

CREATE_COMPLETE DeploymentBucket                       AWS::S3::Bucket            Wed Jul 06 2022 10:53:30 GMT-0500 (Colombia Standard Time) 
CREATE_COMPLETE amplify-kiosuanrdsapirjsapp-dev-105301 AWS::CloudFormation::Stack Wed Jul 06 2022 10:53:32 GMT-0500 (Colombia Standard Time) 
✔ Successfully created initial AWS cloud resources for deployments.
✔ Initialized provider successfully.
Initialized your environment successfully.

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

# Codecommit & Git

- [Create repo](https://docs.aws.amazon.com/cli/latest/reference/codecommit/create-repository.html)
```sh
nano ~/.aws/credentials
export PATH=~/Library/Python/3.8/bin:$PATH
# source ~/.bash_profile
# Test
aws s3 ls --profile kio-amazing-teepee-parties
export AWS_PROFILE=kio-amazing-teepee-parties

# aws codecommit create-repository --repository-name MyDemoRepo --repository-description "My demonstration repository" --tags Team=Saanvi
aws codecommit create-repository --repository-name kio-amazing-teepee-parties-rjs-app --repository-description "Amazing Teepee Parties Miami" --tags Team=kio --region us-east-1 

```

> result
```json
{
    "repositoryMetadata": {
        "accountId": "202948040252",
        "repositoryId": "53ad5060-081d-433d-b365-5f8029b38348",
        "repositoryName": "kio-amazing-teepee-parties-rjs-app",
        "repositoryDescription": "Amazing Teepee Parties Miami",
        "lastModifiedDate": 1651675111.052,
        "creationDate": 1651675111.052,
        "cloneUrlHttp": "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-amazing-teepee-parties-rjs-app",
        "cloneUrlSsh": "ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-amazing-teepee-parties-rjs-app",
        "Arn": "arn:aws:codecommit:us-east-1:202948040252:kio-amazing-teepee-parties-rjs-app"
    }
}
```


## git

```sh
ssh-keygen
/Users/robin8a/.ssh/kio_amazing_teepee_parties_codecommit_rsa

cat ~/.ssh/kio_amazing_teepee_parties_codecommit_rsa.pub

```

```sh
cd ~/.ssh
ls
nano config

# Add

# CodeCommit hosts
Host kio_amazing_teepee_parties_codecommit_rsa
   HostName git-codecommit.us-east-1.amazonaws.com
   User APKAS6QFFKY6JVXNJ2F5
   IdentityFile ~/.ssh/kio_amazing_teepee_parties_codecommit_rsa

```

<!-- https://xiaolishen.medium.com/use-multiple-ssh-keys-for-different-github-accounts-on-the-same-computer-7d7103ca8693 -->

```sh
# git remote -v
# git remote rm origin
# git init
git remote add origin ssh://kio_amazing_teepee_parties_codecommit_rsa/v1/repos/kio-amazing-teepee-parties-rjs-app
git push --set-upstream origin master
git push
```


# Amplify hosting

## Result
```sh
amplify add hosting
? Select the plugin module to execute Hosting with Amplify Console (Managed hosting with custom 
domains, Continuous deployment)
⠋ (node:13032) [DEP0128] DeprecationWarning: Invalid 'main' field in '/Users/robin8a/.npm-global/lib/node_modules/@aws-amplify/cli/node_modules/cloudform/package.json' of 'packages/cloudform/index.js'. Please either fix that or report it to the module author
(Use `node --trace-deprecation ...` to show where the warning was created)
? Choose a type Continuous deployment (Git-based deployments)
? Continuous deployment is configured in the Amplify Console. Please hit enter once you connect 
your repository 
Amplify hosting urls: 
┌──────────────┬──────────────────────────────────────────────┐
│ FrontEnd Env │ Domain                                       │
├──────────────┼──────────────────────────────────────────────┤
│ master       │ https://master.d1mqt1nfypx9zg.amplifyapp.com │
│              ├──────────────────────────────────────────────┤
│              │ https://amazingteepeepartymiami.click        │
│              ├──────────────────────────────────────────────┤
│              │ https://www.amazingteepeepartymiami.click    │
└──────────────┴──────────────────────────────────────────────┘
```

# Design
## Bootstrap
- [Getting Started](https://react-bootstrap.github.io/getting-started/introduction/)

> Install
```sh
npm install react-bootstrap bootstrap@5.1.3
```
> Add index.js

```jsx
import 'bootstrap/dist/css/bootstrap.min.css';
```

# Routing

- [Tutorial](https://github.com/remix-run/react-router/blob/main/docs/getting-started/tutorial.md)
- 


# Amplify auth

```sh
amplify add auth

   ╭─────────────────────────────────────────────╮
   │                                             │
   │      Update available 7.6.26 → 8.3.1        │
   │   Run npm i -g @aws-amplify/cli to update   │
   │                                             │
   ╰─────────────────────────────────────────────╯

Using service: Cognito, provided by: awscloudformation
 
 The current configured provider is Amazon Cognito. 
 
 Do you want to use the default authentication and security configuration? Default
 configuration
 Warning: you will not be able to edit these selections. 
 How do you want users to be able to sign in? Username
 Do you want to configure advanced settings? No, I am done.
✅ Successfully added auth resource kioamazingteepeepart57314a5f locally

✅ Some next steps:
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud

(node:18694) [DEP0128] DeprecationWarning: Invalid 'main' field in '/Users/robin8a/.npm-global/lib/node_modules/@aws-amplify/cli/node_modules/cloudform/package.json' of 'packages/cloudform/index.js'. Please either fix that or report it to the module author
(Use `node --trace-deprecation ...` to show where the warning was created)

```


# Amplify api

```sh
amplify add api
? Please select from one of the below mentioned services: GraphQL
? Provide API name: kiowillowpayrjsapp
? Choose the default authorization type for the API Amazon Cognito User Pool
Use a Cognito user pool configured as a part of this project.
? Do you want to configure advanced settings for the GraphQL API No, I am done.


? Do you have an annotated GraphQL schema? No
? Do you want a guided schema creation? Yes
? What best describes your project: Objects with fine-grained access control (e
.g., a project management app with owner-based authorization)
? Do you want to edit the schema now? Yes
Please edit the file in your editor: /Users/robin8a/Documents/react_ws/kio-willow-pay-rjs-app/amplify/backend/api/kiowillowpayrjsapp/schema.graphql
? Press enter to continue 

The following types do not have '@auth' enabled. Consider using @auth with @model
         - User
         - Measure
         - Product
         - Price
Learn more about @auth here: https://aws-amplify.github.io/docs/cli-toolchain/graphql#auth 


GraphQL schema compiled successfully.

Edit your schema at /Users/robin8a/Documents/react_ws/kio-willow-pay-rjs-app/amplify/backend/api/kiowillowpayrjsapp/schema.graphql or place .graphql files in a directory at /Users/robin8a/Documents/react_ws/kio-willow-pay-rjs-app/amplify/backend/api/kiowillowpayrjsapp/schema
Successfully added resource kiowillowpayrjsapp locally

Some next steps:
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud
```


# amplify storage
```sh
amplify add storage

? Select from one of the below mentioned services: Content (Images, audio, video, 
etc.)
(node:38482) [DEP0128] DeprecationWarning: Invalid 'main' field in '/Users/robin8a/.npm-global/lib/node_modules/@aws-amplify/cli/node_modules/cloudform/package.json' of 'packages/cloudform/index.js'. Please either fix that or report it to the module author
(Use `node --trace-deprecation ...` to show where the warning was created)
✔ Provide a friendly name for your resource that will be used to label this category in the project: · s3f4bb8d17

✔ Provide bucket name: · kioamazingteepeepartbfb3b12e221e4f9d8cd5bd9e58f
✔ Who should have access: · Auth and guest users
✔ What kind of access do you want for Authenticated users? · create/update, read, delete

✔ What kind of access do you want for Guest users? · create/update, read
✔ Do you want to add a Lambda Trigger for your S3 Bucket? (y/N) · no
⚠️ Auth configuration is required to allow unauthenticated users, but it is not configured properly.
✅ Successfully updated auth resource locally.
✅ Successfully added resource s3f4bb8d17 locally

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
# Please edit the file in your editor: /Users/robin8a/Documents/react_ws/kio-jup-places-reserve-rjs-app/amplify/backend/api/kiojupplacesreserver/schema.graphql
# ? Press enter to continue 

# The following types do not have '@auth' enabled. Consider using @auth with @model
#          - Place
#          - Reserve
# Learn more about @auth here: https://aws-amplify.github.io/docs/cli-toolchain/graphql#auth 


# GraphQL schema compiled successfully.

# Edit your schema at /Users/robin8a/Documents/react_ws/kio-jup-places-reserve-rjs-app/amplify/backend/api/kiojupplacesreserver/schema.graphql or place .graphql files in a directory at /Users/robin8a/Documents/react_ws/kio-jup-places-reserve-rjs-app/amplify/backend/api/kiojupplacesreserver/schema
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

# Install on amazon2
sudo amazon-linux-extras install postgresql10

psql \
   --host=<DB instance endpoint> \
   --port=<port> \
   --username=<master username> \
   --password \
   --dbname=<database name> 


   psql --host=mypostgresql.c6c8mwvfdgv0.us-west-2.rds.amazonaws.com --port=5432 --username=awsuser --password --dbname=mypgdb 
```


```sql
CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);
```