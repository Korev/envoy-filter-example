#!/usr/bin/env bash
set -ex

docker build -t bazel bazel/
docker build -t envoy-filter .

docker run -it -v ${PWD}/:/envoy-filter-example/ envoy-filter ./entrypoint.sh
