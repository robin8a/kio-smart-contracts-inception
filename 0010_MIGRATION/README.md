# ref
https://stackoverflow.com/questions/12241161/copying-one-table-to-another-in-dynamodb


# PartiQL editor
```sql
SELECT *
FROM "Document-d6sfnut2zrdljfaz3ysbjfhvke-dev"
WHERE (productFeatureID != '6c558549_c6a0_42dd_a393_60b389b8f2cf' 
AND productFeatureID != 'a93839e5_5f6f_409e_b04a_5f103fd16417'
AND productFeatureID != '59022eed_0ed0_4f32_9956_170daed3c2d2')
```
# commands

```sh
nano ~/.aws/credentials
aws s3 ls --profile suan-blockchain
export AWS_PROFILE=suan-blockchain



```