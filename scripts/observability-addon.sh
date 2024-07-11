#!/bin/bash
response="$(aws eks describe-addon --cluster-name usps-cluster --region eu-west-2 --addon-name amazon-cloudwatch-observability| grep -i observability 2>&1)" 
if [[ $? -eq 0 ]]; then
    echo "Deploying observerbility addon in usps cluster"
    aws iam attach-role-policy \
    --role-name node-group-01-eks-node-group-20240707011720868300000003 \
    --policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy 

     aws iam attach-role-policy \
    --role-name node-group-02-eks-node-group-20240707011720865200000002 \
    --policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy

    aws eks create-addon --cluster-name usps-cluster --addon-name amazon-cloudwatch-observability

else
    echo "Error: usps-cluster does not exist"
fi
