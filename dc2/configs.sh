#!/bin/bash

CONTEXT="setme"

#!/bin/bash

kubectl config use-context $CONTEXT
kubectl config set-context --current --namespace=consul

kubectl apply --filename yaml/service-intentions.yaml
kubectl apply --filename yaml/ingress-gateway.yaml
kubectl apply --filename yaml/proxy-defaults.yaml
kubectl apply --filename yaml/mesh.yaml
kubectl apply --filename yaml/exported-services.yaml
