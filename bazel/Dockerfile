FROM ubuntu:xenial
MAINTAINER Georgy Korev <korev.georgy@gmail.com>

ARG version=0.16.1

RUN apt-get update && \
    apt-get install -y software-properties-common \
                        python-software-properties \
                        pkg-config \
                        zip \
                        g++ \
                        zlib1g-dev \
                        unzip \
                        python \
                        wget \
                        git
RUN apt-get update && apt-get install -y golang-1.10-go

RUN wget https://github.com/bazelbuild/bazel/releases/download/${version}/bazel-${version}-installer-linux-x86_64.sh
RUN chmod +x bazel-${version}-installer-linux-x86_64.sh
RUN ./bazel-${version}-installer-linux-x86_64.sh

# Go setup
RUN mkdir /go
ENV GOPATH=/go
ENV GOROOT=/usr/lib/go-1.10/
ENV PATH="/usr/lib/go-1.10/bin:${PATH}"
RUN go get github.com/bazelbuild/buildtools/buildifier
