# Remote exec with React
- https://stackoverflow.com/questions/46536667/how-do-i-execute-system-scripts-from-within-a-reactjs-project
- https://medium.com/technoetics/how-to-create-in-browser-terminal-using-react-and-nodejs-e923b5f9d28f
- https://www.npmjs.com/package/remote-exec
- https://morioh.com/p/5f77a8cb3c59
- https://stackabuse.com/executing-shell-commands-with-node-js/
- https://medium.com/stackfame/how-to-run-shell-script-file-or-command-using-nodejs-b9f2455cb6b7    
- https://itnext.io/how-to-auto-deploy-your-app-with-one-command-12f9ac00d34a
- https://zaiste.net/posts/few-ways-to-execute-commands-remotely-ssh/


# su-amazing-leads-roisense
- [Amplify Getting Started](https://docs.amplify.aws/start)

# Starting React App

```sh
source ~/.bash_profile
npx create-react-app kio-smart-contract-rjs-app
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
# Scanning for plugins...
# Plugin scan successful
# Note: It is recommended to run this command from the root of your app directory
# ? Enter a name for the project 
# ➜  kio-smart-contract-rjs-app git:(master) amplify init
# Note: It is recommended to run this command from the root of your app directory
# ? Enter a name for the project kiosmartcontractrjsa
# ? Enter a name for the environment kioscenv
# ? Choose your default editor: Visual Studio Code
# ? Choose the type of app that you're building javascript
# Please tell us about your project
# ? What javascript framework are you using react
# ? Source Directory Path:  src
# ? Distribution Directory Path: build
# ? Build Command:  npm run-script build
# ? Start Command: npm run-script start
# Using default provider  awscloudformation

# For more information on AWS Profiles, see:
# https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html

# ? Do you want to use an AWS profile? Yes
# ? Please choose the profile you want to use kio-indoor-emap
# Adding backend environment kioscenv to AWS Amplify Console app: d1l1kwcqq235gy
# ⠋ Initializing project in the cloud...

# CREATE_IN_PROGRESS DeploymentBucket                             AWS::S3::Bucket            Wed Apr 28 2021 17:49:22 GMT-0500 (Colombia Standard Time)               
# CREATE_IN_PROGRESS UnauthRole                                   AWS::IAM::Role             Wed Apr 28 2021 17:49:22 GMT-0500 (Colombia Standard Time)               
# CREATE_IN_PROGRESS AuthRole                                     AWS::IAM::Role             Wed Apr 28 2021 17:49:22 GMT-0500 (Colombia Standard Time)               
# CREATE_IN_PROGRESS amplify-kiosmartcontractrjsa-kioscenv-174913 AWS::CloudFormation::Stack Wed Apr 28 2021 17:49:17 GMT-0500 (Colombia Standard Time) User Initiated
# ⠦ Initializing project in the cloud...

# CREATE_IN_PROGRESS AuthRole   AWS::IAM::Role Wed Apr 28 2021 17:49:23 GMT-0500 (Colombia Standard Time) Resource creation Initiated
# CREATE_IN_PROGRESS UnauthRole AWS::IAM::Role Wed Apr 28 2021 17:49:23 GMT-0500 (Colombia Standard Time) Resource creation Initiated
# ⠋ Initializing project in the cloud...

# CREATE_IN_PROGRESS DeploymentBucket AWS::S3::Bucket Wed Apr 28 2021 17:49:23 GMT-0500 (Colombia Standard Time) Resource creation Initiated
# ⠏ Initializing project in the cloud...

# CREATE_COMPLETE UnauthRole AWS::IAM::Role Wed Apr 28 2021 17:49:36 GMT-0500 (Colombia Standard Time) 
# CREATE_COMPLETE AuthRole   AWS::IAM::Role Wed Apr 28 2021 17:49:35 GMT-0500 (Colombia Standard Time) 
# ⠧ Initializing project in the cloud...

# CREATE_COMPLETE amplify-kiosmartcontractrjsa-kioscenv-174913 AWS::CloudFormation::Stack Wed Apr 28 2021 17:49:46 GMT-0500 (Colombia Standard Time) 
# CREATE_COMPLETE DeploymentBucket                             AWS::S3::Bucket            Wed Apr 28 2021 17:49:44 GMT-0500 (Colombia Standard Time) 
# ✔ Successfully created initial AWS cloud resources for deployments.
# ✔ Initialized provider successfully.
# Initialized your environment successfully.

# Your project has been successfully initialized and connected to the cloud!

# Some next steps:
# "amplify status" will show you what you've added already and if it's locally configured or deployed
# "amplify add <category>" will allow you to add features like user login or a backend API
# "amplify push" will build all your local backend resources and provision it in the cloud
# “amplify console” to open the Amplify Console and view your project status
# "amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud

# Pro tip:
# Try "amplify add api" to create a backend API and then "amplify publish" to deploy everything

```

# Codecommit

[Create repo](https://docs.aws.amazon.com/cli/latest/reference/codecommit/create-repository.html)
```sh
nano ~/.aws/credentials
export PATH=~/Library/Python/3.8/bin:$PATH
# source ~/.bash_profile
# test
aws s3 ls --profile kio-indoor-emap
export AWS_PROFILE=kio-indoor-emap

# aws codecommit create-repository --repository-name MyDemoRepo --repository-description "My demonstration repository" --tags Team=Saanvi
aws codecommit create-repository --repository-name kio-smart-contract-rjs-app --repository-description "Cardano Smart Contracts" --tags Team=kio --region us-east-1 

```

## result
```json
{
    "repositoryMetadata": {
        "accountId": "429849394467",
        "repositoryId": "a86835c0-3778-4812-9417-660228a569d3",
        "repositoryName": "kio-smart-contract-rjs-app",
        "repositoryDescription": "Cardano Smart Contracts",
        "lastModifiedDate": "2021-04-28T17:55:35.862000-05:00",
        "creationDate": "2021-04-28T17:55:35.862000-05:00",
        "cloneUrlHttp": "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-smart-contract-rjs-app",
        "cloneUrlSsh": "ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/kio-smart-contract-rjs-app",
        "Arn": "arn:aws:codecommit:us-east-1:429849394467:kio-smart-contract-rjs-app"
    }
}
```


# git

```sh
ssh-keygen
/Users/robin8a/.ssh/kio_smart_contracts_rsa

cat ~/.ssh/kio_smart_contracts_rsa.pub

```


```sh
cd ~/.ssh
ls
nano config

# Add

# CodeCommit hosts
# Host kio_smart_contracts_rsa
#    HostName git-codecommit.us-east-1.amazonaws.com
#    User AKIAWIFIFHURQXRLUPPD
#    IdentityFile ~/.ssh/kio_smart_contracts_rsa

```

https://xiaolishen.medium.com/use-multiple-ssh-keys-for-different-github-accounts-on-the-same-computer-7d7103ca8693

```sh
# git remote -v
# git remote rm origin
# Using the same kio_indoor_emap_rsa because is on the same account
git remote add origin ssh://kio_indoor_emap_rsa/v1/repos/kio-smart-contract-rjs-app
git push
```



# Install libraries
```sh
npm install react-bootstrap bootstrap
npm i react-external-link
npm i react-router-dom
npm i aws-amplify @aws-amplify/ui-react
npm i aws-amplify-react
npm i --save react-select
npm i styled-components
npm i uuid
```


# Amplify hosting
```sh
`amplify add hosting`
```
## Result
```sh
amplify add hosting
? Select the plugin module to execute Hosting with Amplify Console (Managed hosting with custom domains, Continuous deployment)
? Choose a type Continuous deployment (Git-based deployments)
? Continuous deployment is configured in the Amplify Console. Please hit enter once you connect your repository 
Amplify hosting urls: 
┌──────────────┬────────────────────────────────────────────┐
│ FrontEnd Env │ Domain                                     │
├──────────────┼────────────────────────────────────────────┤
│ main         │ https://main.d1l1kwcqq235gy.amplifyapp.com │
```

# Amplify auth

```sh
amplify add auth
# Using service: Cognito, provided by: awscloudformation
 
#  The current configured provider is Amazon Cognito. 
 
#  Do you want to use the default authentication and security configuration? Default configuration
#  Warning: you will not be able to edit these selections. 
#  How do you want users to be able to sign in? Username
#  Do you want to configure advanced settings? No, I am done.
# Successfully added resource kiosmartcontractrjsa43ea2996 locally

# Some next steps:
# "amplify push" will build all your local backend resources and provision it in the cloud
# "amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud
```

# Amplify push

```sh
amplify push
```

# Credentails


# Amplify pub and sub example with React

- [Follow this intructions: ***works*** Amplify PUBSUB Getting started](https://docs.amplify.aws/lib/pubsub/getting-started/q/platform/js)
- https://docs.amplify.aws/lib/pubsub/getting-started/q/platform/js
- [aws named profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
- [aws-amplify-react-iot-pub-sub-demo](https://github.com/matwerber1/aws-amplify-react-iot-pub-sub-demo)
- [Get cognito Identity Id](https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetId.html)
- https://techdocs.broadcom.com/us/en/ca-enterprise-software/layer7-api-management/mobile-api-gateway/4-2/solutions-and-integrations/aws-iot-for-messaging.html
- https://www.youtube.com/watch?v=j2KJVHGHaFc
- https://aws.amazon.com/blogs/iot/configuring-cognito-user-pools-to-communicate-with-aws-iot-core/
- https://docs.aws.amazon.com/iot/latest/developerguide/attach-to-cert.html

```sh

export PATH=~/Library/Python/3.7/bin:$PATH
source ~/.bash_profile


# Check profiles
nano ~/.aws/config

# kio-indoor-emap
export AWS_PROFILE=kio-indoor-emap


# Simple command
aws ec2 describe-instances --profile lemon-wifi

# or for multiples commands
export AWS_PROFILE=kio-indoor-emap

aws iot attach-principal-policy --policy-name 'ReactIoTPolicy' --principal '<YOUR_COGNITO_IDENTITY_ID>' 
aws iot attach-principal-policy --policy-name 'ReactIoTPolicy' --principal 'us-east-1:fd6f28e9-4b12-4739-a54d-d52c281bd4b4'
aws iot attach-principal-policy --policy-name ReactIoTPolicy --principal us-east-1:fd6f28e9-4b12-4739-a54d-d52c281bd4b4
```

![Role IoT policies attached to auth cognito](_images/role_iot_policy.png)

## Policy Test 
[Policy AWS Simulator](https://policysim.aws.amazon.com)
Ex: arn:aws:iam::879105828344:role/kl-lwf-amp-dev-20190703114204-authRole