#!/bin/bash
#登陆阿里云镜像服务与github关联，构建镜像并下载打标签
gcr_name=k8s.gcr.io
myhub_name=registry.cn-beijing.aliyuncs.com/mengqingjie
# define images
images=(
    kube-apiserver:v1.14.1
    kube-controller-manager:v1.14.1
    kube-scheduler:v1.14.1
    kube-proxy:v1.14.1
    pause:3.1
    etcd:3.3.10
    coredns:1.3.1
)
for image in ${images[@]}; do
    docker pull $myhub_name/$image
    docker tag $myhub_name/$image $gcr_name/$image
    docker rmi $myhub_name/$image
done
