#!/bin/bash

. ../util.sh

run 'clear'

desc "Show the constraint template"
run 'cat constraint-template.yaml'
run 'kubectl create -f constraint-template.yaml'

desc "Show the constraint"
run 'cat constraint.yaml'
run 'kubectl create -f constraint.yaml'

desc "Reject a request"
run 'kubectl create namespace test -o yaml'

desc "Create a compliant namespace"
run "cat namespace-with-labels.yaml"
run "kubectl create -f namespace-with-labels.yaml"

echo "Cleaning up..."

# Teardown
kubectl delete -f namespace-with-labels.yaml > /dev/null
kubectl delete -f constraint.yaml > /dev/null
kubectl delete -f constraint-template.yaml > /dev/null