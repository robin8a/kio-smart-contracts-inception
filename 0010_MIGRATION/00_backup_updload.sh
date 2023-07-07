# exit on error
set -eo pipefail
# export AWS_PROFILE=suan-blockchain
# https://stackoverflow.com/questions/12241161/copying-one-table-to-another-in-dynamodb

# tables
# TABLE_FROM=Category-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Category-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=Document-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Document-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=Feature-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Feature-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=FeatureType-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=FeatureType-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=Formula-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Formula-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=Image-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Image-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=Order-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Order-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=ProductFeatureResult-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=ProductFeatureResult-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=ProductFeature-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=ProductFeature-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=Product-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Product-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=Result-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Result-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=Transactions-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Transactions-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=UnitOfMeasure-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=UnitOfMeasure-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=UserProduct-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=UserProduct-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=User-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=User-csbpzicidrh7vmfyrsgft53qvm-prod
# TABLE_FROM=Verification-d6sfnut2zrdljfaz3ysbjfhvke-dev
# TABLE_TO=Verification-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Wallet-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Wallet-csbpzicidrh7vmfyrsgft53qvm-prod

# read
aws dynamodb scan \
  --table-name "$TABLE_FROM" \
  --output json \
 | jq "{ \"$TABLE_TO\": [ .Items[] | { PutRequest: { Item: . } } ] }" \
 > "$TABLE_TO-payload.json"

# write
# aws dynamodb batch-write-item --request-items file://"$TABLE_TO-payload.json"

# clean up
# rm "$TABLE_TO-payload.json"