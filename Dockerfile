FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    zip \
    tar \
    g++ \
    cmake \
    git \
    libasio-dev \
    libboost-all-dev

RUN git clone https://github.com/microsoft/vcpkg.git vcpkg && \
    cd /vcpkg && \
    ./bootstrap-vcpkg.sh

RUN /vcpkg/vcpkg install asio

ENV CMAKE_TOOLCHAIN_FILE=/vcpkg/scripts/buildsystems/vcpkg.cmake

RUN git clone https://github.com/shnepsel/TextDoc-Access-Manager-.git /app
WORKDIR /app

RUN mkdir build && \
    cd build && \
    cmake .. && \
    make

RUN cp /app/build/server /usr/local/bin/server
RUN cp /app/build/client /usr/local/bin/client

WORKDIR /usr/local/bin

EXPOSE 8080

CMD ["./server"]
