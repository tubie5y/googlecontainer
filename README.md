### v1.16.3


### shell 
- master
    1. kubeadm config images list
        - reference: https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/#running-kubeadm-without-an-internet-connection
        - example:
            - k8s.gcr.io/kube-apiserver:v1.16.3
            - k8s.gcr.io/kube-controller-manager:v1.16.3
            - k8s.gcr.io/kube-scheduler:v1.16.3
            - k8s.gcr.io/kube-proxy:v1.16.3
            - k8s.gcr.io/pause:3.1
            - k8s.gcr.io/etcd:3.3.15-0
            - k8s.gcr.io/coredns:1.6.2
