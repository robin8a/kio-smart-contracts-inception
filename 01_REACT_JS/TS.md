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