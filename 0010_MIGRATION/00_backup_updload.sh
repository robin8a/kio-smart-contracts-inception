# exit on error
set -eo pipefail
# export AWS_PROFILE=suan-blockchain
# https://stackoverflow.com/questions/12241161/copying-one-table-to-another-in-dynamodb

# tables
TABLE_FROM=Category-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Category-csbpzicidrh7vmfyrsgft53qvm-prod


# read
aws dynamodb scan \
  --table-name "$TABLE_FROM" \
  --output json \
 | jq "{ \"$TABLE_TO\": [ .Items[] | { PutRequest: { Item: . } } ] }" \
 > "$TABLE_TO-payload.json"

# write
aws dynamodb batch-write-item --request-items file://"$TABLE_TO-payload.json"

# clean up
rm "$TABLE_TO-payload.json"