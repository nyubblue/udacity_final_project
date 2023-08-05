#!/bin/bash
output=$(aws cloudformation update-stack --stack-name $1 --template-body file://$2  --parameters file://$3 --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM 2>&1)
RESULT=$?

if [ $RESULT -eq 0 ]; then
  echo "$output"
  #waiting for updating vpc resources
  aws cloudformation wait stack-update-complete --stack-name $1
else
  if [[ "$output" == *"No updates are to be performed"* ]]; then
    echo "No cloudformation updates are to be performed."
    exit 0
  else
    echo "$output"
    exit 1
  fi
fi