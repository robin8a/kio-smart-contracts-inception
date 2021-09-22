# I'm getting AWS_ERROR_MQTT_UNEXPECTED_HANGUP currently.

- [***solved*** ](https://github.com/aws/aws-iot-device-sdk-cpp-v2/issues/167)
1. AWS IoT Core
2. Manage => Things
3. Click on Thing
4. Certificates
5. Click on Active Certificate
6. Policies
7. Open the Policy
8. Edit policy document
Example policicy that works!
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iot:Publish",
        "iot:Receive"
      ],
      "Resource": [
        "arn:aws:iot:us-east-1:429849394467:topic/test/topic"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "iot:Subscribe"
      ],
      "Resource": [
        "arn:aws:iot:us-east-1:429849394467:topicfilter/test/topic"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "iot:Connect"
      ],
      "Resource": [
        "arn:aws:iot:us-east-1:429849394467:client/test-*"
      ]
    }
  ]
}
```

# error TS2732 ...Consider using '--resolveJsonModule' to import module with '.json' extension

- https://www.typescriptlang.org/docs/handbook/tsconfig-json.html
- https://www.typescriptlang.org/docs/handbook/project-references.html
- https://github.com/TypeStrong/grunt-ts/issues/445
- https://mariusschulz.com/blog/series/typescript-evolution


# [TypeScript] Error: Could not find a declaration file for module XYZ
https://amandeepkochhar.medium.com/typescript-error-could-not-find-a-declaration-file-for-module-xyz-dfbe6e45c2bd

tsconfig.json
```json
"noImplicitAny": false
```