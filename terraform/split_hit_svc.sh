#!/bin/bash
# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

. $(dirname ${BASH_SOURCE})/../util.sh

IP=$(kubectl --namespace=terraform-demo get svc web-server \
        -o go-template='{{.spec.clusterIP}}')

desc "Fire some requests at the service"

run "kubectl --namespace=terraform-demo run --generator=run-pod/v1 -it busybox-tf --rm --image=busybox -- sh -c \"while true; do wget -O- -q $IP; sleep 1; done\""