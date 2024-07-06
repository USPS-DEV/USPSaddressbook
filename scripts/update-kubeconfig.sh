#!/bin/bash
response="$(aws eks list-clusters --region eu-west-2 --output text | grep -i usps-cluster 2>&1)" 
if [[ $? -eq 0 ]]; then
    echo "Success: Usps-cluster exist"
    aws eks --region eu-west-2 update-kubeconfig --name usps-cluster && export KUBE_CONFIG_PATH=~/.kube/config

else
    echo "Error: Usps-cluster does not exist"
fi