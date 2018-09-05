FROM bazel:latest
MAINTAINER Georgy Korev <korev.georgy@gmail.com>

ADD https://github.com/maxmind/libmaxminddb/releases/download/1.3.2/libmaxminddb-1.3.2.tar.gz .
RUN tar -xzvf libmaxminddb-1.3.2.tar.gz && rm libmaxminddb-1.3.2.tar.gz
RUN apt-get update && apt-get -y install make \
                                         libfindbin-libs-perl \
                                         libtool \
                                         cmake \
                                         realpath \
                                         clang-format-6.0 \
                                         automake \
                                         ninja-build \
                                         curl
RUN cd libmaxminddb-1.3.2 && ./configure && make && make check && make install && ldconfig

COPY . /envoy-filter-example
WORKDIR /envoy-filter-example

RUN bazel build --verbose_failures=true //:envoy
RUN bazel build --verbose_failures=true //http-filter-example:envoy
