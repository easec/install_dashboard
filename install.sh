#!/bin/bash
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo list

helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
export POD_NAME=$(kubectl get pods -n kubernetes-dashboard -l "app.kubernetes.io/name=kubernetes-dashboard,app.kubernetes.io/instance=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
kubectl -n kubernetes-dashboard port-forward $POD_NAME 8443:8443


