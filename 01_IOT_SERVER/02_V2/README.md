# References
- 
- https://www.typescriptlang.org/docs/handbook/2/basic-types.html
- https://github.com/aws/aws-iot-device-sdk-js-v2/tree/main/samples#nodepub_sub
- https://www.npmjs.com/package/pinata-sdk?activeTab=readme
- https://www.npmjs.com/package/aws-sdk
- https://docs.aws.amazon.com/cloud9/latest/user-guide/sample-typescript.html
- https://www.npmjs.com/package/uuid
- https://code.visualstudio.com/docs/typescript/typescript-compiling
- 
## Cardano Wallet
- https://github.com/tango-crypto/cardano-wallet-js

# Getting Started
- Follow the intructions on [IoT JS SDK V2](https://github.com/aws/aws-iot-device-sdk-js-v2/tree/main/samples#nodepub_sub)



mkdir -p /home/luisr/receive-ada-sample/keys

node inspect dist/index.js \
--endpoint az6wto8a6h0jn-ats.iot.us-east-1.amazonaws.com \
--ca_file certs/root-CA.crt \
--cert certs/kio-smart-contracts-iot-device.cert.pem \
--key certs/kio-smart-contracts-iot-device.private.key