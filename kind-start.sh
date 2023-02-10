#!/usr/bin/env bash

set -eou pipefail

KIND_IMAGE="docker.io/kindest/node@sha256:3264cbae4b80c241743d12644b2506fff13dce07fcadf29079c1d06a47b399dd"
kind create cluster \
    --image $KIND_IMAGE \
    --wait 5m