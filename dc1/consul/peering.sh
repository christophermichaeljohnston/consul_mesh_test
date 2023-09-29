#!/bin/bash

CONTEXT="setme"

kubectl config use-context $CONTEXT
kubectl config set-context --current --namespace=consul

kubectl apply --filename yaml/peering-acceptor.yaml
kubectl get secret peering-token --output yaml > ../../dc2/consul/yaml/peering-token.yaml
