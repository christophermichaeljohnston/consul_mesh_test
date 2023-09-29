#!/bin/bash

CONTEXT="setme"

kubectl config use-context $CONTEXT
kubectl delete crd --selector app=consul
kubectl config set-context --current --namespace=consul
helm uninstall dc2
kubectl delete pvc --selector="chart=consul-helm"
kubectl get secrets --field-selector="type=Opaque" | egrep "consul|peering-token" | awk '{print $1}' | xargs kubectl delete secret
kubectl delete serviceaccount consul-tls-init
kubectl delete serviceaccount consul-gossip-encryption-autogenerate
