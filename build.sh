#!/bin/bash
set -e

MODEL_IMAGE="ocrmodel"
GATEWAY_IMAGE="apigateway"
TAG="v1"

echo "🔧 Building OCR Model image..."
docker build -t $MODEL_IMAGE:$TAG ./ocr-model

echo "🔧 Building API Gateway image..."
docker build -t $GATEWAY_IMAGE:$TAG ./api-gateway

echo "✅ Build complete!"
docker images | grep "$TAG"

