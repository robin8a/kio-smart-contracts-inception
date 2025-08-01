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

tensorflow pandas rasterio boto3 scikit-learn matplotlib ipywidgets

```requirements.txt
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

## Git

<https://github.com/robin8a/aws_biomass_lambda.git>

## aws_tf_biomass_lambda @luis_gomez

```requirements.txt
boto3==1.39.14
tensorflow==2.18.0
pandas==2.2.2
rasterio==1.4.3
scikit-learn==1.6.1
matplotlib==3.10.0
```

```sh

# Create a virtual environment
# pyenv virtualenv <python_version> <environment_name>
pyenv virtualenv 3.12.0 ts_tf_biomass_model
pyenv activate ts_tf_biomass_model

pyenv unactivate

```

```sh

mkdir aws_tf_biomass_lambda
cd aws_tf_biomass_lambda

# Create a 'model' subdirectory to keep things organized
mkdir model

# Copy your model files into the 'model' directory
cp /path/to/your/modelo_entrenado.h5 model/
cp /path/to/your/pesos_entrenados.weights.h5 model/
```

```sh

docker build -t ts-biomass-tf-predictor-image .

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 036134507423.dkr.ecr.us-east-1.amazonaws.com

aws ecr create-repository --repository-name ts-biomass-tf-predictor-repo --region us-east-1

{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:036134507423:repository/ts-biomass-tf-predictor-repo",
        "registryId": "036134507423",
        "repositoryName": "ts-biomass-tf-predictor-repo",
        "repositoryUri": "036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-tf-predictor-repo",
        "createdAt": "2025-07-01T16:14:29.158000-05:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}


docker tag ts-biomass-tf-predictor-image:latest 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-tf-predictor-repo:latest


docker push 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-tf-predictor-repo:latest


aws lambda create-function \
    --function-name TSTensorFlowBiomassPredictor \
    --package-type Image \
    --code ImageUri=036134507423.dkr.ecr.us-east-1.amazonaws.com/ts-biomass-tf-predictor-repo:latest \
    --role arn:aws:iam::036134507423:role/ts-lambda-biomass-execution-role \
    --timeout 60 \
    --memory-size 3008 # TensorFlow can be memory intensive; 3008MB is a good starting point (or 4096MB/6144MB if needed)


{
    "FunctionName": "TSTensorFlowBiomassPredictor",
    "FunctionArn": "arn:aws:lambda:us-east-1:036134507423:function:TSTensorFlowBiomassPredictor",
    "Role": "arn:aws:iam::036134507423:role/ts-lambda-biomass-execution-role",
    "CodeSize": 0,
    "Description": "",
    "Timeout": 60,
    "MemorySize": 3008,
    "LastModified": "2025-07-02T02:01:55.415+0000",
    "CodeSha256": "db4381f9a645d1e4d093f556aef6de70dc099827e704162297c6d38e33ce3d26",
    "Version": "$LATEST",
    "TracingConfig": {
        "Mode": "PassThrough"
    },
    "RevisionId": "e383bfd9-7be6-460f-a01d-26e2401d8296",
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


aws lambda invoke \
    --function-name TSTensorFlowBiomassPredictor \
    --cli-binary-format raw-in-base64-out \
    --payload '{"features": [0.7, 0.5]}' \
    output.json

curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"features": [0.7, 0.5]}' \
  https://9e7wnzvwcb.execute-api.us-east-1.amazonaws.com/dev/predict_tensor_flow


```

## Lambda

ts-models-function

```python
import json

def lambda_handler(event, context):
    """
    AWS Lambda function to return metadata about a machine learning model.

    This function is designed to be triggered by an API Gateway endpoint
    and will return a JSON object containing details about a specific
    machine learning model.

    Args:
        event (dict): The event dict contains information about the
                      triggering event. For API Gateway, it includes
                      details like HTTP method, path, headers, etc.
        context (object): The context object provides runtime information
                          from the Lambda environment.

    Returns:
        dict: A dictionary containing the HTTP status code and the
              JSON body with the ML model metadata.
    """
    # Define the metadata for your machine learning model
    # You can replace these with actual values or fetch them from a database
    # or environment variables in a more complex scenario.
    model_metadata = {
        "name": "SentimentAnalysisV1",
        "description": "A machine learning model for Normalized Difference Vegetation Index (NDVI)",
        "document_link": "https://example.com/docs/ndvi-v1",
        "api_link": "https://9e7wnzvwcb.execute-api.us-east-1.amazonaws.com/dev/predict",
        "version": "1.0.2",
        "is_approved": True
    }

    # Construct the response object as required by AWS Lambda for API Gateway integration
    response = {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*" # Important for CORS if consumed by a web frontend
        },
        "body": json.dumps(model_metadata)
    }

    return response

```

API Gateway endpoint

<https://9e7wnzvwcb.execute-api.us-east-1.amazonaws.com/dev/models>

```sh
curl -X GET \
  -H "Content-Type: application/json" \
  https://9e7wnzvwcb.execute-api.us-east-1.amazonaws.com/dev/models

```