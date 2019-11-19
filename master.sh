#!/bin/bash

set -e

# Check version in https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/
# Search "Running kubeadm without an internet connection"
# For running kubeadm without an internet connection you have to pre-pull the required master images for the version of choice:
KUBE_VERSION=v1.16.3
KUBE_PAUSE_VERSION=3.1
ETCD_VERSION=3.3.15-0
CORE_DNS_VERSION=1.6.2

GCR_URL=k8s.gcr.io
ALIYUN_URL=registry.cn-shanghai.aliyuncs.com/llion-k8s-gcr-io

images=(
    kube-apiserver:$KUBE_VERSION
    kube-controller-manager:$KUBE_VERSION
    kube-scheduler:$KUBE_VERSION
    kube-proxy:$KUBE_VERSION
    pause:$KUBE_PAUSE_VERSION
    etcd:$ETCD_VERSION
    coredns:$CORE_DNS_VERSION
)

for imageName in ${images[@]} ; do
  docker pull $ALIYUN_URL/$imageName
  docker tag  $ALIYUN_URL/$imageName $GCR_URL/$imageName
  docker rmi  $ALIYUN_URL/$imageName
done

docker images