#!/bin/bash

. ../util.sh

run "vi service/variables.tf"

run "terraform apply -state service/terraform.tfstate service"

run "kubectl --namespace=terraform-demo get pods"

run "terraform destroy -state simple/terraform.tfstate simple"


