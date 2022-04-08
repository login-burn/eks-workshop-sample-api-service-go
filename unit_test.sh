#!/bin/sh
set -e

ingress_str=$(kubectl get svc hello-k8s -o json | jq -c '.status.loadBalancer.ingress')
echo $ingress_str
api_host=$(kubectl get svc hello-k8s -o json | jq -c '.status.loadBalancer.ingress' | jq -c '.[] | select(.).ip' | tr '"') 
echo "http://$api_host"
curl -m 2 $api_host