#!/bin/bash

CONTEXT="setme"

kubectl config use-context $CONTEXT
helm install dc1 hashicorp/consul --create-namespace --namespace consul --values values.yaml
