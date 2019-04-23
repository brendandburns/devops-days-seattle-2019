#!/bin/bash

. ../util.sh

run "clear"

run "helm search mongodb"

run "cat values-production.yaml"

run "helm install --name my-mongo -f ./values-production.yaml stable/mongodb"

run "kubectl get pv"

run "kubectl get statefulsets"

run "kubectl get pods"

run "kubectl get services"
