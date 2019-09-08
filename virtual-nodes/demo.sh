#!/bin/bash

. ../util.sh

run 'clear'

run 'kubectl create -f virtual-pods.yaml'

run 'watch kubectl get pods -o wide'

podip=$(kubectl get pods -o 'jsonpath={.items[0].status.podIP}')

run "echo podip=${podip}"

run 'kubectl run -it --generator=run-pod/v1 --image=busybox busybox'