#!/bin/bash

. ../util.sh

run "kubectl apply -f nginx.yaml"

run "kubectl exec nginx -- su -c 'kill 1'"

run "watch kubectl get pods"

kubectl delete -f nginx.yaml --wait=false >> /dev/null

run "kubectl create -f kuard.yaml"

run "kubectl port-forward kuard 8080 8080"

kubectl delete -f kuard.yaml --wait=false >> /dev/null
