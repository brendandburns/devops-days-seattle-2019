#!/bin/bash

for x in 0 1 2 3 4; do
  kubectl delete pods/kuard-${x} --wait=false
done
