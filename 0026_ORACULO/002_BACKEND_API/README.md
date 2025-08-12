# Amplify

## Directories

```sh
mkdir ts_be_oraculo_api
```

## Amplify configure

- Just when is a new aws account

```sh
amplify configure
```

```txt
Deployment state saved successfully.
✔ Initialized provider successfully.
✅ Initialized your environment successfully.
✅ Your project has been successfully initialized and connected to the cloud!
Some next steps:

"amplify status" will show you what you've added already and if it's locally configured or deployed
"amplify add <category>" will allow you to add features like user login or a backend API
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify console" to open the Amplify Console and view your project status
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud
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

