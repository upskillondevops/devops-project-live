#!/bin/bash

args=($1)
AWS_REGION=us-east-1
SWAGGER_FILE=/builds/upskillondevops/upskillndevops/IaaC/AWS/files/swagger.yaml
SWAGGER_BUCKET=appmod-appcont-dev-swagger-bucket
echo -n "Copying file $SWAGGER_FILE to S3 bucket $SWAGGER_BUCKET"
#/builds/upskillondevops/upskillndevops

aws s3 cp $SWAGGER_FILE s3://$SWAGGER_BUCKET --region $AWS_REGION