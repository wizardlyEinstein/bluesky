#!/bin/bash
set -e
if [ ! -f ./bluesky.yaml ]; then
  helm repo add nerkho https://charts.nerkho.ch
  helm repo update nerkho
  helm template bluesky-pds nerkho/bluesky-pds --version 0.1.1  -f values.yaml > bluesky.yaml
fi
kustomize build . --enable-alpha-plugins > rendered.yaml
