#!/bin/bash

CONTEXT="setme"

kubectl config use-context $CONTEXT
kubectl config set-context --current --namespace=consul

kubectl apply --filename yaml/peering-token.yaml
kubectl apply --filename yaml/peering-dialer.yaml
