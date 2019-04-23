#!/bin/bash

. ../util.sh

run "clear"

run "helm init"

run "helm search mysql"

run "helm install stable/mysql"

run "kubectl get pv"

run "kubectl get pods"

run "kubectl get services"
