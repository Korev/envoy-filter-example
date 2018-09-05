#!/usr/bin/env bash
set -ex

bazel build --verbose_failures=true //http-filter-example:envoy
