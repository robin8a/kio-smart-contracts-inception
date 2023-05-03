# Error: errorMessage: "AMQJS0008I Socket closed."
## Solution:
- https://github.com/aws-amplify/amplify-js/issues/2739

# Error: exports is not defined in ES module scope AWS Lambda
## Solution: 
- https://stackoverflow.com/questions/72359031/exports-is-not-defined-in-es-module-scope-aws-lambda
```js
// The handler must be in this way
const handler = async (event) => {

}
```

# aws lambda Error: Could not load lambda handler function due to Error [ERR_REQUIRE_ESM]: Must use import to load ES Module
- https://stackoverflow.com/questions/66676555/nodejs-14-x-native-aws-lambda-import-export-support

