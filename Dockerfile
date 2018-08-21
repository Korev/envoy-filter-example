FROM bazel:latest
MAINTAINER Georgy Korev <korev.georgy@gmail.com>

COPY . /envoy-filter-example
ADD https://github.com/maxmind/libmaxminddb/releases/download/1.3.2/libmaxminddb-1.3.2.tar.gz .
RUN tar -xzvf libmaxminddb-1.3.2.tar.gz && rm libmaxminddb-1.3.2.tar.gz
RUN apt-get update && apt-get -y install clang \
                                         make \
                                         libfindbin-libs-perl \
                                         golang-go \
                                         git \
                                         libtool \
                                         cmake \
                                         realpath \
                                         clang-format-6.0 \
                                         automake \
                                         ninja-build \
                                         curl
RUN cd libmaxminddb-1.3.2 && ./configure && make && make check && make install && ldconfig

WORKDIR /envoy-filter-example/envoy
RUN bazel build //source/exe:envoy-static
