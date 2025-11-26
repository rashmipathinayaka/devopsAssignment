#!/bin/bash

echo "[INFO] Starting Minikube with Docker driver..."

minikube start --driver=docker --cpus=4 --memory=8192 --disk-size=20g

echo "[INFO] Minikube status:"
minikube status
