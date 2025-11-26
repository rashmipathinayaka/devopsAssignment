#!/bin/bash

echo "===== 🚀 Starting full cluster setup ====="

./setup-minikube.sh
./install-argocd.sh
./install-monitoring.sh

echo "===== ✅ Cluster setup complete! ====="
