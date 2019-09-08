#!/bin/bash

for x in 0 1 2 3 4; do
  perl -p -e "s/NAME/kuard-${x}/" pod-kuard-no-resources.yaml | kubectl create -f -
done
