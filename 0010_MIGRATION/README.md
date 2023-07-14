# ref
https://stackoverflow.com/questions/12241161/copying-one-table-to-another-in-dynamodb


# Tables

TABLE_FROM=Category-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Category-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Document-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Document-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Feature-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Feature-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=FeatureType-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=FeatureType-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Formula-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Formula-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Image-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Image-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Order-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Order-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=ProductFeatureResult-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=ProductFeatureResult-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=ProductFeature-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=ProductFeature-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Product-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Product-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Result-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Result-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Transactions-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Transactions-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=UnitOfMeasure-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=UnitOfMeasure-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=UserProduct-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=UserProduct-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=User-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=User-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Verification-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Verification-csbpzicidrh7vmfyrsgft53qvm-prod
TABLE_FROM=Wallet-d6sfnut2zrdljfaz3ysbjfhvke-dev
TABLE_TO=Wallet-csbpzicidrh7vmfyrsgft53qvm-prod


# PartiQL editor
## Selects
```sql
SELECT *
FROM "Document-d6sfnut2zrdljfaz3ysbjfhvke-dev"
WHERE (productFeatureID != '6c558549_c6a0_42dd_a393_60b389b8f2cf' 
AND productFeatureID != 'a93839e5_5f6f_409e_b04a_5f103fd16417'
AND productFeatureID != '59022eed_0ed0_4f32_9956_170daed3c2d2')



SELECT * FROM "Category-d6sfnut2zrdljfaz3ysbjfhvke-dev"

aws dynamodb execute-statement --statement "SELECT * FROM \"Category-d6sfnut2zrdljfaz3ysbjfhvke-dev\""

```

## Deletes

```sh
aws dynamodb execute-statement --statement "DELETE  FROM Music  \
    WHERE Artist='Acme Band' AND SongTitle='PartiQL Rocks'"


aws dynamodb execute-statement --statement "DELETE FROM \"Category-d6sfnut2zrdljfaz3ysbjfhvke-dev\" WHERE id = 'PROYECTO_PLANTACIONES'"
aws dynamodb execute-statement --statement "DELETE FROM \"FeatureType-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"Formula-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"Image-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"Order-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"ProductFeatureResult-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"ProductFeature-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"Product-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"Result-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"Transactions-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"UnitOfMeasure-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"UserProduct-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"User-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"Verification-d6sfnut2zrdljfaz3ysbjfhvke-dev\""
aws dynamodb execute-statement --statement "DELETE FROM \"Wallet-d6sfnut2zrdljfaz3ysbjfhvke-dev\""



```

## Insert

```sh

aws dynamodb execute-statement --statement "SELECT * FROM \"Feature-d6sfnut2zrdljfaz3ysbjfhvke-dev\""

aws dynamodb execute-statement --statement "DELETE  FROM \"Feature-d6sfnut2zrdljfaz3ysbjfhvke-dev\"  \
    WHERE id='A_postulante_name'"

aws dynamodb execute-statement --statement "INSERT INTO \"Feature-d6sfnut2zrdljfaz3ysbjfhvke-dev\"  \
					    VALUE  \
					    {'id':'A_postulante_doctype','name':'A_postulante_doctype','description':'A_postulante_doctype','defaultValue':'1','isVerifable':false,'isTemplate':false,'featureTypeID':'no_unit'}"

aws dynamodb execute-statement --statement "INSERT INTO \"Feature-d6sfnut2zrdljfaz3ysbjfhvke-dev\" VALUE {'id':'A_postulante_id','name':'A_postulante_id'}"


aws dynamodb execute-statement --statement "INSERT INTO \"Feature-d6sfnut2zrdljfaz3ysbjfhvke-dev\" VALUE {'id':'A_postulante_id','name':'A_postulante_id'','description':'A_postulante_id'}"
```

# commands

```sh
nano ~/.aws/credentials
aws s3 ls --profile suan-blockchain
export AWS_PROFILE=suan-blockchain



```

