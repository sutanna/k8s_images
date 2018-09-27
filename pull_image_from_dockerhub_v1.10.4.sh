#!/bin/bash

gcr_name=k8s.gcr.io
myhub_name=zhaojiedi1992
# define images 
images=(
	kube-apiserver-amd64:v1.10.4
 kube-controller-manager-amd64:v1.10.4
 kube-scheduler-amd64:v1.10.4
 kube-proxy-amd64:v1.10.4
 pause:3.1
 etcd-amd64:3.1.12
 coredns:1.1.3
)

for image in ${images[@]}; do 
	docker pull $myhub_name/$image
	docker tag  $myhub_name/$image $gcr_name/$image
	#docer rmi $myhub_name/$image
done