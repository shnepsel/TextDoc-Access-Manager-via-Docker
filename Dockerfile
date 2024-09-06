# Use an official C++ build image as a parent image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
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

# Install vcpkg
RUN git clone https://github.com/microsoft/vcpkg.git /vcpkg && \
    cd /vcpkg && \
    ./bootstrap-vcpkg.sh

# Install Asio library via vcpkg
RUN /vcpkg/vcpkg install asio

# Set vcpkg environment variables
ENV CMAKE_TOOLCHAIN_FILE=/vcpkg/scripts/buildsystems/vcpkg.cmake

# Clone the repository
RUN git clone https://github.com/raufkhalilov/TextDoc-Access-Manager-.git /app
WORKDIR /app

# Build the project
RUN mkdir build && \
    cd build && \
    cmake .. && \
    make

# Expose port for the server
EXPOSE 8080

# Define the entrypoint
CMD ["./server"]
