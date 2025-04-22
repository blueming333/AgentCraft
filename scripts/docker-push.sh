#!/bin/bash

set -e

if [ $# -gt 1 ]; then
    echo "Usage: $0 [version]"
    echo "Example: $0 1.0.0"
    exit 1
fi

VERSION=${1}
CORE_IMAGE="blueming3/aicraft-core:${VERSION}"
WEB_IMAGE="blueming3/aicraft-web:${VERSION}"
ALIYUN_REGISTRY="crpi-appxm8pdgvw49jw2.cn-hangzhou.personal.cr.aliyuncs.com/blueming3/aicraft"

# Print push information
echo "=============================================="
echo "Starting to push Docker images..."
echo "Core service image: ${CORE_IMAGE}"
echo "Web service image: ${WEB_IMAGE}"
echo "Version: ${VERSION}"
echo "=============================================="

# Login to Aliyun registry
echo "=============================================="
echo "Logging in to Aliyun registry..."
echo "=============================================="
docker login --username=铅笔头科技 crpi-appxm8pdgvw49jw2.cn-hangzhou.personal.cr.aliyuncs.com

# Push to Aliyun registry
echo "=============================================="
echo "Pushing to Aliyun registry..."
echo "=============================================="
docker tag ${CORE_IMAGE} ${ALIYUN_REGISTRY}-core:${VERSION}
docker tag ${WEB_IMAGE} ${ALIYUN_REGISTRY}-web:${VERSION}
docker push ${ALIYUN_REGISTRY}-core:${VERSION}
docker push ${ALIYUN_REGISTRY}-web:${VERSION}

# Check push result
if [ $? -eq 0 ]; then
    echo "=============================================="
    echo "Push successful!"
    echo "Aliyun registry images:"
    echo "- ${ALIYUN_REGISTRY}-core:${VERSION}"
    echo "- ${ALIYUN_REGISTRY}-web:${VERSION}"
    echo "Version: ${VERSION}"
    echo "=============================================="
else
    echo "=============================================="
    echo "Push failed!"
    echo "=============================================="
    exit 1
fi
