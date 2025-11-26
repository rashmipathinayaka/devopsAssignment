#!/bin/bash
set -e

MODEL_IMAGE="ocrmodel"
GATEWAY_IMAGE="apigateway"
TAG="v1"

echo "🚀 Running model server container..."
MODEL_ID=$(docker run -d -p 8080:8080 $MODEL_IMAGE:$TAG)

echo "🚀 Running gateway container..."
GATEWAY_ID=$(docker run -d -p 8000:8000 $GATEWAY_IMAGE:$TAG)

sleep 5

echo "🔍 Testing Model Server..."
curl -I http://localhost:8080 | head -1

echo "🔍 Testing Gateway..."
curl -I http://localhost:8000 | head -1

echo "🛑 Stopping containers..."
docker stop $MODEL_ID
docker stop $GATEWAY_ID

echo "🎉 Tests completed!"
