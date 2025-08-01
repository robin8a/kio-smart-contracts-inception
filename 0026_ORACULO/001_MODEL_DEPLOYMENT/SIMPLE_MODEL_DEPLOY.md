# Deploy

```sh
# Install 
brew install pyenv-virtualenv

# Create a virtual environment
# pyenv virtualenv <python_version> <environment_name>
pyenv virtualenv 3.11.1 ts_simple_tf_biomass_model
pyenv activate ts_simple_tf_biomass_model

pyenv versions

# VSC
cmd + shift + P 
select interpreter
<ts_simple_tf_biomass_model>

```

## ts_simple_tf_biomass_model

```sh
mkdir ts_simple_tf_biomass_model
cd ts_simple_tf_biomass_model
echo "# Libraries" > requirements.txt 
```

```requirements.txt
boto3==1.39.14
tensorflow==2.18.0
pandas==2.2.2
rasterio==1.4.3
scikit-learn==1.6.1
matplotlib==3.10.0
```

```sh


# Create a 'model' subdirectory to keep things organized
mkdir model

# Copy your model files into the 'model' directory
cp biomass_estimation_model.h5 model/

```

## Create app.py

## Create docker file

```Dockerfile
# Dockerfile

# Use the AWS Lambda Python base image for your desired Python version
# For TensorFlow, consider a Python version compatible with the TF version you need.
# Python 3.9 or 3.10 are common for recent TensorFlow.
FROM public.ecr.aws/lambda/python:3.11.1

# Copy the Lambda handler function and its dependencies
COPY app.py ${LAMBDA_TASK_ROOT}

# Copy the model files into the container
COPY model/ ${LAMBDA_TASK_ROOT}/model/

# Install the Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Set the CMD to your handler (format: "app_file_name.handler_function_name")
CMD [ "app.handler" ]
```

```sh

docker build -t ts_simple_tf_biomass_model .

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 036134507423.dkr.ecr.us-east-1.amazonaws.com

aws ecr create-repository --repository-name ts_simple_tf_biomass_model --region us-east-1

{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:036134507423:repository/ts_simple_tf_biomass_model",
        "registryId": "036134507423",
        "repositoryName": "ts_simple_tf_biomass_model",
        "repositoryUri": "036134507423.dkr.ecr.us-east-1.amazonaws.com/ts_simple_tf_biomass_model",
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


docker tag ts_simple_tf_biomass_model:latest 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts_simple_tf_biomass_model:latest


docker push 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts_simple_tf_biomass_model:latest


aws lambda create-function \
    --function-name TSTensorFlowBiomassPredictor \
    --package-type Image \
    --code ImageUri=036134507423.dkr.ecr.us-east-1.amazonaws.com/ts_simple_tf_biomass_model:latest \
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