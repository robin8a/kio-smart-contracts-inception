# Deploy

```sh
# Install 
brew install pyenv-virtualenv

# Create a virtual environment
# pyenv virtualenv <python_version> <environment_name>
pyenv virtualenv 3.12.0 ts_ndvi_biomass_model
pyenv activate ts_ndvi_biomass_model

pyenv versions

# VSC
cmd + shift + P 
select interpreter
<ts_ndvi_biomass_model>
```


```txt
scikit-learn==1.16.0 # or the version you used to train the model
numpy==2.3.1
pandas==2.3.0
joblib==1.5.1
```

```sh
aws s3 mb s3://ts-biomass-lambda-bucket --region us-east-1
make_bucket: ts-biomass-lambda-bucket

aws s3 cp biomass_model_deployment_package.zip s3://ts-biomass-lambda-bucket/biomass_model_deployment_package.zip


aws lambda create-function \
    --function-name BiomassPredictor \
    --runtime python3.12.0 \
    --code S3Bucket=ts-biomass-lambda-bucket,S3Key=biomass_model_deployment_package.zip \
    --handler lambda_function.lambda_handler \
    --role arn:aws:iam::036134507423:role/ts-ts- \
    --timeout 30 \
    --memory-size 512
```


```sh

aws s3 mb s3://ts-biomass-lambda-bucket --region us-east-1

aws s3 cp biomass_dependencies_layer.zip s3://ts-biomass-lambda-bucket/layers/biomass_dependencies_layer.zip

aws lambda publish-layer-version \
    --layer-name ts-biomass-model-dependencies \
    --description "Numpy, Pandas, Scikit-learn for Biomass Model" \
    --content S3Bucket=ts-biomass-lambda-bucket,S3Key=layers/biomass_dependencies_layer.zip \
    --compatible-runtimes python3.9


```


```sh
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 036134507423.dkr.ecr.us-east-1.amazonaws.com

aws ecr create-repository --repository-name ts-biomass-predictor-repo --region us-east-1

{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:036134507423:repository/ts-biomass-predictor-repo",
        "registryId": "036134507423",
        "repositoryName": "ts-biomass-predictor-repo",
        "repositoryUri": "036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-predictor-repo",
        "createdAt": "2025-06-26T22:37:27.296000-05:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}

docker tag ts-biomass-predictor-image:latest 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-predictor-repo:latest
docker push 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-predictor-repo:latest

aws lambda create-function \
    --function-name ts-biomass-predictor \
    --package-type Image \
    --code ImageUri=036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-predictor-repo:latest \
    --role arn:aws:iam::036134507423:role/lambda-biomass-execution-role \
    --timeout 30 \
    --memory-size 512

```

```sh

docker tag ts-biomass-predictor-repo:latest 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-predictor-repo:latest

arn:aws:iam::036134507423:role/ts-lambda-biomass-execution-role

aws lambda create-function \
    --function-name ts-biomass-predictor \
    --package-type Image \
    --code ImageUri=036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-predictor-repo:latest \
    --role arn:aws:iam::036134507423:role/ts-lambda-biomass-execution-role \
    --timeout 30 \
    --memory-size 512
```

## This works

```sh
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 036134507423.dkr.ecr.us-east-1.amazonaws.com

docker build -t ts-biomass-predictor-image .

docker tag ts-biomass-predictor-image:latest 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-predictor-repo:latest

docker push 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-predictor-repo:latest


aws lambda create-function \
    --function-name ts-biomass-predictor \
    --package-type Image \
    --code ImageUri=036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-predictor-repo:latest \
    --role arn:aws:iam::036134507423:role/ts-lambda-biomass-execution-role \
    --timeout 30 \
    --memory-size 512

{
    "FunctionName": "ts-biomass-predictor",
    "FunctionArn": "arn:aws:lambda:us-east-1:036134507423:function:ts-biomass-predictor",
    "Role": "arn:aws:iam::036134507423:role/ts-lambda-biomass-execution-role",
    "CodeSize": 0,
    "Description": "",
    "Timeout": 30,
    "MemorySize": 512,
    "LastModified": "2025-06-27T17:25:49.388+0000",
    "CodeSha256": "1edcb8558b2b52de56b1007ef75263a607966da5a77547d7d039d553386b38d4",
    "Version": "$LATEST",
    "TracingConfig": {
        "Mode": "PassThrough"
    },
    "RevisionId": "4a5072bb-188f-43cd-af0a-07a0effaac51",
    "State": "Pending",
    "StateReason": "The function is being created.",
    "StateReasonCode": "Creating",
    "PackageType": "Image",
    "Architectures": [
        "x86_64"
    ],
    "EphemeralStorage": {
        "Size": 512
    },
    "SnapStart": {
        "ApplyOn": "None",
        "OptimizationStatus": "Off"
    }
}




```

```sh

curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"NDVI": 0.7, "EVI": 0.5}' \
  https://9e7wnzvwcb.execute-api.us-east-1.amazonaws.com/dev/predict

```
