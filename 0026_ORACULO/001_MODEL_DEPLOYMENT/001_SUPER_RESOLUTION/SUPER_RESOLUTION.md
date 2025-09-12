# Deploy

```sh
# Install 
brew install pyenv-virtualenv

# Create a virtual environment
# pyenv virtualenv <python_version> <environment_name>
pyenv virtualenv 3.10 ts_super_resolution_onnx_model
pyenv activate ts_super_resolution_onnx_model

pyenv versions

# VSC
cmd + shift + P 
select interpreter
<ts_super_resolution_onnx_model>

```

## ts_super_resolution_onnx_model

```sh
mkdir ts_super_resolution_onnx_model
cd ts_super_resolution_onnx_model
echo "# Libraries" > requirements.txt 
```

```requirements.txt
numpy==2.0.2
opencv-python==4.12.0
onnxruntime==1.22.1
scikit-learn==1.6.1
matplotlib==3.10.0

```

```sh
pip install numpy opencv-python onnxruntime scikit-learn matplotlib
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
FROM public.ecr.aws/lambda/python:3.10

# Copy function code
COPY lambda_function.py ${LAMBDA_TASK_ROOT}

# Copy model (if including in image, otherwise download from S3)
# If your model is large, stick to S3 download at runtime
COPY model/biomass_model.joblib ${LAMBDA_TASK_ROOT}/model/biomass_model.joblib

# Install the specified packages
COPY requirements.txt .
RUN pip install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Set the CMD to your handler (optional, but good practice)
CMD [ "lambda_function.lambda_handler" ]
```

```sh

docker build -t ts_super_resolution_onnx_model .

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 036134507423.dkr.ecr.us-east-1.amazonaws.com

aws ecr create-repository --repository-name ts_super_resolution_onnx_model --region us-east-1

{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:036134507423:repository/ts_super_resolution_onnx_model",
        "registryId": "036134507423",
        "repositoryName": "ts_super_resolution_onnx_model",
        "repositoryUri": "036134507423.dkr.ecr.us-east-1.amazonaws.com/ts_super_resolution_onnx_model",
        "createdAt": "2025-09-07T10:28:10.836000-05:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}

docker tag ts_super_resolution_onnx_model:latest 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts_super_resolution_onnx_model:latest


docker push 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts_super_resolution_onnx_model:latest


aws lambda create-function \
    --function-name TSSuperResONNXBiomassPredictor \
    --package-type Image \
    --code ImageUri=036134507423.dkr.ecr.us-east-1.amazonaws.com/ts_super_resolution_onnx_model:latest \
    --role arn:aws:iam::036134507423:role/ts-lambda-biomass-execution-role \
    --timeout 60 \
    --memory-size 3008 # TensorFlow can be memory intensive; 3008MB is a good starting point (or 4096MB/6144MB if needed)


{
    "FunctionName": "TSSuperResONNXBiomassPredictor",
    "FunctionArn": "arn:aws:lambda:us-east-1:036134507423:function:TSSuperResONNXBiomassPredictor",
    "Role": "arn:aws:iam::036134507423:role/ts-lambda-biomass-execution-role",
    "CodeSize": 0,
    "Description": "",
    "Timeout": 60,
    "MemorySize": 3008,
    "LastModified": "2025-09-08T16:35:23.778+0000",
    "CodeSha256": "6c582a21b71e5520e8fc0e703f7d9fd7f7587e00971c63ca0c148a8ba03502c3",
    "Version": "$LATEST",
    "TracingConfig": {
        "Mode": "PassThrough"
    },
    "RevisionId": "ddaf7e42-c67f-491b-84b2-6cae81c3152e",
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

aws lambda invoke \
    --function-name TSSuperResONNXBiomassPredictor \
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

## Update lambda function

```sh
aws lambda update-function-code \
    --function-name TSSuperResONNXBiomassPredictor \
    --image-uri 036134507423.dkr.ecr.us-east-1.amazonaws.com/ts_super_resolution_onnx_model:latest
```
