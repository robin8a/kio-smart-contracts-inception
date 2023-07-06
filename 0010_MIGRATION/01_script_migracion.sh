#!/bin/bash

# exit on error
set -eo pipefail

# Aqui se definen los arrays con los nombres de las tablas de las que quiero migrar y a las que quiero migrar
# El tamaño de ambos arrays debe ser IGUAL y las tablas que se quieren actualizar deben estar en la misma posicion de los respectivos arrays.
TABLES_FROM=(
  "Category-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Document-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "FeatureFormula-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Feature-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "FeatureType-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Formula-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Image-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Order-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "ProductFeatureResult-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "ProductFeature-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Product-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Result-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Transactions-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "UnitOfMeasure-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "UserProduct-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "User-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "VerificationComment-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Verification-d6sfnut2zrdljfaz3ysbjfhvke-dev"
  "Wallet-d6sfnut2zrdljfaz3ysbjfhvke-dev" 
)

TABLES_TO=(
  "Category-csbpzicidrh7vmfyrsgft53qvm-prod"
  "Document-csbpzicidrh7vmfyrsgft53qvm-prod"
  "FeatureFormula-csbpzicidrh7vmfyrsgft53qvm-prod"
  "Feature-csbpzicidrh7vmfyrsgft53qvm-prod"
  "FeatureType-csbpzicidrh7vmfyrsgft53qvm-prod"
  "Formula-csbpzicidrh7vmfyrsgft53qvm-prod"
  "Image-csbpzicidrh7vmfyrsgft53qvm-prod"
  "Order-csbpzicidrh7vmfyrsgft53qvm-prod"
  "ProductFeatureResult-csbpzicidrh7vmfyrsgft53qvm-prod"
  "ProductFeature-csbpzicidrh7vmfyrsgft53qvm-prod"
  "Product-csbpzicidrh7vmfyrsgft53qvm-prod"
  "Result-csbpzicidrh7vmfyrsgft53qvm-prod"
  "Transactions-csbpzicidrh7vmfyrsgft53qvm-prod"
  "UnitOfMeasure-csbpzicidrh7vmfyrsgft53qvm-prod"
  "UserProduct-csbpzicidrh7vmfyrsgft53qvm-prod"
  "User-csbpzicidrh7vmfyrsgft53qvm-prod"
  "VerificationComment-not-exists"
  "Verification-csbpzicidrh7vmfyrsgft53qvm-prod"
  "Wallet-csbpzicidrh7vmfyrsgft53qvm-prod"
)

# Checkeo si los arrays tienen el mismo tamaño
if [ ${#TABLES_FROM[@]} -ne ${#TABLES_TO[@]} ]; then
  echo "Error: The number of source and destination tables does not match."
  exit 1
fi

# Itero para hacer la migración
for ((i=0; i<${#TABLES_FROM[@]}; i++)); do
  TABLE_FROM="${TABLES_FROM[$i]}"
  TABLE_TO="${TABLES_TO[$i]}"

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
done