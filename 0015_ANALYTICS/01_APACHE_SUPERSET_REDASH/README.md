# Apache SuperSet on AWS EC2 Amazon Linux 2

## 1

- <https://docs.google.com/document/d/1vQ4LejpG3JXEWQGXov31KFiLc8o4BCiVc4YDiqr0pek/edit?usp=sharing>
- Install pip: <https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-linux.html>
- <https://superset.apache.org/docs/installation/pypi>
- <https://gist.github.com/philippkeller/dedd0ee8221f4b155592149d08a26248>

## 2

<https://superset.apache.org/docs/configuration/configuring-superset/>

```sh
export SUPERSET_CONFIG_PATH=/home/ec2-user/app/superset_config.py

openssl rand -base64 42

# SECRET_KEY = 'YOUR_OWN_RANDOM_GENERATED_SECRET_KEY'
# SQLALCHEMY_DATABASE_URI = 'sqlite:////home/ec2-user/superset.db?check_same_thread=false'


```

## 3. Security group

<https://medium.com/@hms262/production-deployment-of-apache-superset-on-an-aws-ec2-instance-85aa2f0be515>
