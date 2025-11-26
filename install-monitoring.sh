#!/bin/bash

echo "[INFO] Adding Helm repo..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "[INFO] Creating namespace 'monitoring'..."
kubectl create namespace monitoring || echo "Namespace exists"

echo "[INFO] Installing Prometheus + Grafana with Minikube-friendly values..."
helm install k8s-monitoring prometheus-community/kube-prometheus-stack \
  -n monitoring \
  -f monitoring-values.yaml

echo "[INFO] Monitoring stack installed!"
kubectl get pods -n monitoring
