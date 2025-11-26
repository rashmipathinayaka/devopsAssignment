#!/bin/bash

echo "[INFO] Adding ArgoCD Helm repo..."
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

echo "[INFO] Creating namespace 'argocd'..."
kubectl create namespace argocd || echo "Namespace exists"

echo "[INFO] Installing ArgoCD..."
helm install argocd argo/argo-cd -n argocd

echo "[INFO] Waiting for ArgoCD pods..."
kubectl get pods -n argocd
