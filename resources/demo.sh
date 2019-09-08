#!/bin/bash

. ../util.sh

desc "show a pod with no resource requests or limits"
run "cat pod-kuard-no-resources.yaml"

run "./run-no-limits.sh"

run "watch kubectl get pods"

desc "tearing down pods"
. ./teardown.sh > /dev/null

desc "show a pod with resource requests and limits"
run "cat pod-kuard-resources.yaml"

run "./run-limits.sh"

run "watch kubectl get pods"

desc "tearing down pods"
. ./teardown.sh > /dev/null
