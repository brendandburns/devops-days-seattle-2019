#!/bin/bash

. ../util.sh

run 'clear'

desc "Create a resource group to house the cluster"
run 'az group create --name my-aks --location westus2'

desc "Create the cluster [takes about 5 minutes]"
run 'az aks create -g my-aks -n my-cluster --no-wait --generate-ssh-keys'

desc "See all clusters..."
run 'az aks list -o table'

desc "Let's get credentials for another cluster while we're waiting"
run "az aks get-credentials -g aad-bburns -n bburns-aad --file=${PWD}/kubeconfig"

export KUBECONFIG=${PWD}/kubeconfig

desc "Access that cluster"
run "kubectl get nodes"

echo "Cleaning up"
# az aks delete -g my-aks -n my-cluster --no-wait
rm kubeconfig