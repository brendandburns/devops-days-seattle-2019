#!/bin/bash

. ../util.sh

run "clear"

desc "Part #1: Create a simple namespace"
statefile=simple/terraform.tfstate

rm -f simple/terraform.tfstate

run "kubectl get namespaces"

run "cat simple/namespace.tf"

run "terraform init simple"

run "terraform apply -state ${statefile} simple"

run "kubectl get namespaces"

desc "Part #2: Create a simple service"
statefile=service/terraform.tfstate
name=service

rm -f service/terraform.tfstate

run "cat service/service.tf"

run "terraform init ${name}"

run "terraform apply -state ${statefile} ${name}"

run "kubectl --namespace terraform-demo get rc"

run "kubectl --namespace terraform-demo get pods"

run "kubectl --namespace terraform-demo get services"

tmux new -d -s my-session-tf \
    "$(dirname $BASH_SOURCE)/split_hit_svc.sh" \; \
    split-window -v -p 66 "$(dirname ${BASH_SOURCE})/split_update_svc.sh" \; \
    attach
