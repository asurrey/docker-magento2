#!/bin/bash

################################################################################
# Ensure our environment variables are set
################################################################################
if [ "$IMAGE" == "" ]; then
  echo "You must define a \$IMAGE environment variable"
  exit 1
fi

################################################################################
# Kick off with some debug
################################################################################
echo ""
echo "Test Runner Configuration:"
echo ""
echo "Image: $IMAGE"
echo "Test: Docker Builod"

################################################################################
# Build our images
################################################################################
echo ""
echo "Building image.."
echo ""

cd $IMAGE && docker build -t $IMAGE . || exit 1
