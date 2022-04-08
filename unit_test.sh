#!/bin/sh
set -e
api_host=$(kubectl get svc hello-k8s -o json | jq -c '.status.loadBalancer.ingress' | jq -c '.[] | select(.hostname).hostname')
curl -m 2 $api_host