
# References
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
npx create-react-app kio-suan-bc-rjs-app
cd kio-suan-bc-rjs-app
npm start
```

# Amplify

## configure

- Just when is a new aws account
```sh
amplify configure
```


## init

```sh
amplify init

Project information
| Name: kiosuanbcrjsapp
| Environment: dev
| Default editor: Visual Studio Code
| App type: javascript
| Javascript framework: react
| Source Directory Path: src
| Distribution Directory Path: build
| Build Command: npm run-script build
| Start Command: npm run-script start

```

# Codecommit & Git

- [Create repo](https://docs.aws.amazon.com/cli/latest/reference/codecommit/create-repository.html)
```sh
nano ~/.aws/credentials
export PATH=~/Library/Python/3.8/bin:$PATH
# source ~/.bash_profile
# Test
aws s3 ls --profile suan-blockchain
export AWS_PROFILE=suan-blockchain

# aws codecommit create-repository --repository-name MyDemoRepo --repository-description "My demonstration repository" --tags Team=Saanvi
aws codecommit create-repository --repository-name kio-suan-bc-rjs-app --repository-description "SUAN BC" --tags Team=kio --region us-east-1 

```

> result
```json
{
    "repositoryMetadata": {
        "accountId": "036134507423",
        "repositoryId": "26ec626a-ed2b-4639-b92f-79d30ad1dbdd",
        "repositoryName": "kio-suan-bc-rjs-app",
        "repositoryDescription": "SUAN BC",
        "lastModifiedDate": "2022-09-09T15:01:00.405000-05:00",
        "creationDate": "2022-09-09T15:01:00.405000-05:00",
        "cloneUrlHttp": "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-suan-bc-rjs-app",
        "cloneUrlSsh": "ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-suan-bc-rjs-app",
        "Arn": "arn:aws:codecommit:us-east-1:036134507423:kio-suan-bc-rjs-app"
    }
}
```


## git on mac

```sh
ssh-keygen
/Users/robin8a/.ssh/kio_suan_bc_codecommit_rsa

cat ~/.ssh/kio_suan_bc_codecommit_rsa.pub

```

```sh
cd ~/.ssh
ls
nano config

# Add

# CodeCommit hosts
Host kio_suan_bc_codecommit_rsa
   HostName git-codecommit.us-east-1.amazonaws.com
   User APKAQQ2OI2OP22OSSNG4
   IdentityFile ~/.ssh/kio_suan_bc_codecommit_rsa

```

<!-- https://xiaolishen.medium.com/use-multiple-ssh-keys-for-different-github-accounts-on-the-same-computer-7d7103ca8693 -->

```sh
# git remote -v
# git remote rm origin
# git init
# https://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-suan-bc-rjs-app
git remote add origin ssh://kio_suan_bc_codecommit_rsa/v1/repos/kio-suan-bc-rjs-app
git push --set-upstream origin master
git push
```

## git on windows

```sh
ssh-keygen
C:\Users\USUARIO/.ssh/kio_mapping_id_rsa

cd ~/.ssh
code .

copy and paste on IAM => Credentials

``` 

```conf

# Read more about SSH config files: https://linux.die.net/man/5/ssh_config
Host git-codecommit.*.amazonaws.com
    User APKAWIFIFHURRIUXP7TM
    IdentityFile ~/.ssh/kio_mapping_id_rsa
    
```

```sh
# test
ssh git-codecommit.us-east-1.amazonaws.com
# clone
git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-indoor-emap
```

# Amplify hosting

## Result
```sh
amplify add hosting
? Select the plugin module to execute Hosting with Amplify Console (Managed hosting with custom domains, Continuous deployment)
⠋ (node:70466) [DEP0128] DeprecationWarning: Invalid 'main' field in '/Users/robin8a/.npm-global/lib/node_modules/@aws-amplify/cli/node_modules/cloudform/package.json' of 'packages/cloudform/index.js'. Please either fix that or report it to the module author
(Use `node --trace-deprecation ...` to show where the warning was created)
? Choose a type Continuous deployment (Git-based deployments)
? Continuous deployment is configured in the Amplify Console. Please hit enter once you connect your repository 
Amplify hosting urls: 
┌──────────────┬─────────────────────────────────────────────┐
│ FrontEnd Env │ Domain                                      │
├──────────────┼─────────────────────────────────────────────┤
│ master       │ https://master.db3zbcxaygrmf.amplifyapp.com │
└──────────────┴─────────────────────────────────────────────┘
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
Using service: Cognito, provided by: awscloudformation
 
 The current configured provider is Amazon Cognito. 
 
 Do you want to use the default authentication and security configuration? Default configuration
 Warning: you will not be able to edit these selections. 
 How do you want users to be able to sign in? Username
 Do you want to configure advanced settings? No, I am done.
✅ Successfully added auth resource kiosuanbcrjsappa6accc93 locally

✅ Some next steps:
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud
```


# Amplify api

```sh
amplify add api
? Select from one of the below mentioned services: GraphQL
? Here is the GraphQL API that we will create. Select a setting to edit or continue (Use arrow keys)
  Name: kioproyectobrjsapp 
  Authorization modes: API key (default, expiration time: 7 days from now) 
? Here is the GraphQL API that we will create. Select a setting to edit or continue Continue
? Choose a schema template: One-to-many relationship (e.g., “Blogs” with “Posts” and “Comments”)

⚠️  WARNING: your GraphQL API currently allows public create, read, update, and delete access to all models via an API Key. To configure PRODUCTION-READY authorization rules, review: https://docs.amplify.aws/cli/graphql/authorization-rules

GraphQL schema compiled successfully.

Edit your schema at /Users/robin8a/Documents/react_ws/kio-suan-bc-rjs-app/amplify/backend/api/kioproyectobrjsapp/schema.graphql or place .graphql files in a directory at /Users/robin8a/Documents/react_ws/kio-suan-bc-rjs-app/amplify/backend/api/kioproyectobrjsapp/schema
✔ Do you want to edit the schema now? (Y/n) · yes
Edit the file in your editor: /Users/robin8a/Documents/react_ws/kio-suan-bc-rjs-app/amplify/backend/api/kioproyectobrjsapp/schema.graphql
✅ Successfully added resource kioproyectobrjsapp locally

✅ Some next steps:
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud
```


# amplify storage
```sh
amplify add storage
? Select from one of the below mentioned services: Content (Images, audio, video, etc.)
(node:74072) [DEP0128] DeprecationWarning: Invalid 'main' field in '/Users/robin8a/.npm-global/lib/node_modules/@aws-amplify/cli/node_modules/cloudform/package.json' of 'packages/cloudform/index.js'. Please either fix that or report it to the module author
(Use `node --trace-deprecation ...` to show where the warning was created)
✔ Provide a friendly name for your resource that will be used to label this category in the project: · s37845b3b9
✔ Provide bucket name: · kiosuanbcrjsappcad3eb2dd1b14457b491c910d5aa45dd
✔ Who should have access: · Auth and guest users
✔ What kind of access do you want for Authenticated users? · create/update, read
✔ What kind of access do you want for Guest users? · read
✔ Do you want to add a Lambda Trigger for your S3 Bucket? (y/N) · no
⚠️ Auth configuration is required to allow unauthenticated users, but it is not configured properly.
✅ Successfully updated auth resource locally.
✅ Successfully added resource s37845b3b9 locally

⚠️ If a user is part of a user pool group, run "amplify update storage" to enable IAM group policies for CRUD operations
✅ Some next steps:
"amplify push" builds all of your local backend resources and provisions them in the cloud
"amplify publish" builds all of your local backend and front-end resources (if you added hosting category) and provisions them in the cloud

amplify push   

```

# AWS enviroment
- https://docs.amplify.aws/cli/teams/overview/
  
# aws amplify storage unauthenticated access
- https://medium.com/floom/public-read-access-for-aws-amplify-storage-9eb5621abff
- https://docs.amplify.aws/lib/storage/configureaccess/q/platform/js/
- https://docs.amplify.aws/lib/storage/configureaccess/q/platform/js/#customization
- https://stackoverflow.com/questions/60936666/getting-missing-required-field-principal-when-adding-policy-to-s3-bucket

# Paragraph css styles
- https://wdexplorer.com/20-examples-beautiful-css-typography-design/

# ToDo
- Show is on caruosel images
- Modal titles


# avoid cycle call on route react router

- https://stackoverflow.com/questions/67361430/how-can-i-avoid-infinite-loops-in-my-react-router-private-routes
- https://www.freecodecamp.org/news/a-complete-beginners-guide-to-react-router-include-router-hooks/

# Calculate string value in javascript, not using eval
- https://stackoverflow.com/questions/6479236/calculate-string-value-in-javascript-not-using-eval

```js
function evil(fn) {
  return new Function('return ' + fn)();
}

undefined
console.log( evil('12/5*9+9.4*2') );
VM192:1 40.4
undefined
h = 5
5
b = 4
4
formula = (b*h)/2
10
formula = '(b*h)/2'
'(b*h)/2'
console.log( evil(formula) );
VM504:1 10
undefined
```
